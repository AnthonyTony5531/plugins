#!/bin/bash
source ./sdk_package_utls.sh

:<<EOF
# 1、cd 到主工程目录
# 2、在终端执行命令：./build_iOSSDK.sh 3.19.2 false true false false yes
# 3、打包完后SDK、文档，sample工程、SDKDemo安装包一起压缩放到桌面 
#
# 入参说明
# $1 SDK版本号：必传
# $2 是否构建App：非必传,如需打开log该入参必传 true/yes-构建，false/no-不构建，params-仅构建参数版
# $3 是否打开log：true或yes-打开log，非true或yes字符串关闭log
# $4 是否开启新关键词：true或yes-开启，非true或yes字符串不开启
# $5 是否到处资源包：true或yes-导出，非true或yes字符串-不导出
# $6 attach：非必传 默认不开启，false-不开启，true-开启
EOF

# 打包计时
SECONDS=0

sdk_version=$1
[[ -z $sdk_version ]] && sdk_version="3.13.1"

build_app=$2
[[ -z $build_app ]] && build_app="true"

open_log=$3
[[ -z $open_log ]] && open_log="false"

open_keyword=$4
[[ -z $open_keyword ]] && open_keyword="false"

export_assets=$5
[[ -z $export_assets ]] && export_assets="true"

flutter_attach=$6
[[ -z $flutter_attach ]] && flutter_attach="false"

echo "ios sdk version=$sdk_version, build_app=$build_app, open_log=$open_log, open_keyword=$open_keyword, flutter_attach=$flutter_attach, export_assets=$export_assets"

autoSwitchFlutterSdk

# 拉取最新代码
git pull

echo "======================= 创建flutter module ======================="
flutter_module="fast_ai"
flutter create --org com.xc.module -t module --offline $flutter_module # 创建Module不支持swift，需要先创建，再添加swift桥接
echo "======================= 创建flutter module 完成 ======================="

currentPath=$(pwd)
result=$(echo "$currentPath" | grep $flutter_module)
if [[ "$result" = "" ]]; then
  cd $flutter_module # 进入flutter module文件夹
else
  echo "$flutter_module flutter module 创建失败"
  exit -1
fi
echo " flutter_module路径为：$(pwd) "

echo "======================= 移除旧/无效代码 ======================="
out_sdk='../out_sdk/iOSSDK/iOSSDK/frameworks/'
flutter_code='lib'
flutter_assets='assets'
flutter_assets188='assets188'

[[ -d $out_sdk ]] && rm -rf $out_sdk
mkdir $out_sdk
	
[[ -d $flutter_code  ]] && rm -rf $flutter_code
mkdir $flutter_code

[[ -d $flutter_assets ]] && rm -rf $flutter_assets
mkdir $flutter_assets

[[ -d $flutter_assets188 ]] && rm -rf $flutter_assets188
mkdir $flutter_assets188

echo "======================= 复制新代码  ======================="
cp -rf "../$flutter_code/" $flutter_code
cp -rf "../$flutter_assets/" $flutter_assets
cp -rf "../$flutter_assets188/" $flutter_assets188 # 188资源

echo "======================= 复制并编辑pubspec.yaml  ======================="
modifyPubspec ../pubspec.yaml ./pubspec.yaml 'ios' $export_assets

echo "======================= 移除编译文件/更新依赖库 ======================="
openSDKLog $open_log $export_assets
modifyVersion $sdk_version
commonCodeModify $open_keyword
# exchangeAssetsShowMethod $(pwd)/$flutter_code
[[ $export_assets = 'true' || $export_assets = 'yes' ]] && prepareSDKAsset $sdk_version "ios"
if [[ $flutter_attach = "true" || $flutter_attach = "yes" ]]; then
  cd ../
  # 移除老文件
  [[ -d ./out_sdk/iOSSDK/Debug/fast_ai ]] && rm -rf ./out_sdk/iOSSDK/Debug/fast_ai
  # 移除上传资源文件
  [[ -d "./$flutter_module/assets$sdk_version" ]] && rm -rf "./$flutter_module/assets$sdk_version"

  testPath="./$flutter_module/test/widget_test.dart"
  sed -i -e '1,31s/^/\/\//' $testPath # 注释
  removeTempFile $testPath

  # 移动到指定位置
  cp -rf "./$flutter_module" ./out_sdk/iOSSDK/Debug/
  # 移除$flutter_module
  rm -rf "./$flutter_module"
  git checkout out_sdk/iOSSDK/XCSDKBuild/XCSDK/XCSDKManager.m out_sdk/iOSSDK/iOSSDK/iOSSDK.podspec
  echo "ios flutter attach generate success"
  exit -1
fi
flutter clean #clean会把.ios文件夹删掉，手动添加的桥接也没了
[[ -f pubspec.lock ]] && rm pubspec.lock
echo "======================= 开始拉取依赖 ======================="
flutter pub upgrade
#flutter pub get --offline
echo "111-当前路径：$(pwd)"
modifyPodfile .ios/Podfile
if [[ ! -d .ios ]]; then 
  echo "请先运行主工程，生成.ios .android文件夹"
  exit -1
fi

cd .ios && pod install
cd ../

echo "======================= flutter开始打包 ======================="
flutter build ios --release --no-codesign
# module 可以用以下方式获取debug,profile,release的framework，但时间太长
# flutter build ios-framework --release
echo "======================= flutter打包成功 ======================="

echo "======================= 开始复制framework ======================="
#rm -rf .ios/Flutter/engine/Flutter.framework/_CodeSignature
#cp -r .ios/Flutter/engine/Flutter.framework $out_sdk
#cp -r .ios/Flutter/App.framework $out_sdk
rm -rf .ios/Flutter/engine/Flutter.xcframework/ios-arm64_armv7/Flutter.framework/_CodeSignature
cp -r .ios/Flutter/engine/Flutter.xcframework/ios-arm64_armv7/Flutter.framework $out_sdk
cp -r build/ios/Release-iphoneos/*/*.framework $out_sdk
cp -r build/ios/Release-iphoneos/App.framework $out_sdk
#copyIJKMediaFramework $out_sdk
echo "======================= framework复制成功 ======================="

echo "======================= 开始移除复制代码、插件、资源、编译缓存 ======================="
# 重命名 压缩资源
rm -rf $flutter_assets
if [[ $export_assets = 'true' || $export_assets = 'yes' ]]; then
  mv "$flutter_assets$sdk_version" $flutter_assets
  zip -r "$HOME/Desktop/$flutter_assets$sdk_version.zip" $flutter_assets
fi
rm -rf ../$flutter_module # 移除flutter module
# [[ -d $flutter_assets ]] && rm -rf ./$flutter_code
# [[ -d $flutter_assets ]] && rm -rf ./$flutter_assets

echo "======================= 移除复制代码、插件、资源、编译缓存结束 ======================="
echo "》》》》》》"
echo "Flutter Module打包结束"
echo "》》》》》》"

echo "======================= 开始Build SDK 原生壳 ======================="
cd ../out_sdk/iOSSDK/XCSDKBuild
# 修改SDK版本号
# sdkName=`rpm -qa | xcodebuild -showsdks | grep iphoneos` # 执行xcodebuild -showsdks耗时2秒左右
sdkName=`xcodebuild -showsdks | grep iphoneos | head -1` # 执行xcodebuild -showsdks耗时2秒左右
echo "sdkName=$sdkName, sdk=${sdkName##* }"
sdkName="${sdkName##* }"

pod install
# 生成bundle XCSDK.framework
xcodebuild clean -workspace XCSDK.xcworkspace -scheme XCSDK -configuration Release
xcodebuild build -workspace XCSDK.xcworkspace -scheme XCSDK -configuration Release -sdk $sdkName
echo "======================= SDK原生壳Build完成 ======================="

echo "======================= 开始Build XCAssets.bundle包 ======================="
# 生成bundle包
xcodebuild clean -workspace XCSDK.xcworkspace -scheme XCAssets -configuration Release
xcodebuild build -workspace XCSDK.xcworkspace -scheme XCAssets -configuration Release -sdk $sdkName
echo "======================= 删除中间文件XCAssets.bundle.dSYM XCAssets ======================="
[[ -d ../iOSSDK/frameworks/XCAssets.bundle.dSYM ]] && rm -rf ../iOSSDK/frameworks/XCAssets.bundle.dSYM
[[ -f ../iOSSDK/frameworks/XCAssets.bundle/XCAssets ]] && rm -f ../iOSSDK/frameworks/XCAssets.bundle/XCAssets
# xcodebuild -target XCAssets -configuration Release -sdk $sdkName  
echo "======================= XCAssets.bundle包Build完成 ======================="

echo "======================= 开始压缩SDK、Sample工程、Docs接入文档======================="
cd ../

SDK_ZIP="Sports_iOSSDK_V$sdk_version.zip" # sdk压缩文件名
DEMO_ZIP="Sports_iOSSDKSample_V$sdk_version.zip" # demo压缩文件名
DOCS_ZIP="Sports_iOSSDK接入文档_V$sdk_version.zip" # 文档压缩文件名
DOCS188_ZIP="Gbet_iOSSDK接入文档_V$sdk_version.zip" # 文档压缩文件名

cur_date=$(date +"%Y%m%d%H%M%S")
sdkDir="iOSSDK_V${sdk_version}_$cur_date"
desktop_dir="$HOME/Desktop/$sdkDir"
mkdir $desktop_dir
echo "桌面文件夹路径：$desktop_dir"
[[ -f iOSSDKDemo-Inner/Podfile.lock ]] && rm -f iOSSDKSample/Podfile.lock
[[ -d iOSSDKDemo-Inner/iOSSDKSample.xcworkspace ]] && rm -rf iOSSDKSample/iOSSDKSample.xcworkspace
[[ -d iOSSDKDemo-Inner/Pods ]] && rm -rf iOSSDKDemo-Inner/Pods
zip -r "$desktop_dir/$DOCS_ZIP" Docs
zip -r "$desktop_dir/$DOCS188_ZIP" Docs-Gbet
zip -r "$desktop_dir/$SDK_ZIP" iOSSDK

# 移除商户无用工程文件 后 压缩
remote_ios_prj_files $(pwd)/iOSSDKDemo-Inner
zip -r "$desktop_dir/$DEMO_ZIP" iOSSDKDemo-Inner

if [[ $export_assets = 'true' || $export_assets = 'yes' ]]; then
  mv "$HOME/Desktop/assets$sdk_version.zip" "${desktop_dir}/assets$sdk_version.zip"
fi
echo "======================= 压缩SDK、Sample工程、Docs接入文档 完成 ======================="

cd ../
cd ../
checkoutChanges 'ios' 'sdk'

certAutoInstall

# 构建 SDK Demo包
if [[ $build_app = 'true' || $build_app = 'yes' || $build_app = 'params' ]]; then
  echo '开始构建demo App'
  build_ios_sdk_demo_app $desktop_dir $build_app
else
  echo '无需构建demo App'
fi

echo " ======================= iOS SDK与SDK Demo App整体压缩 ======================= "
cd ~/Desktop
zip -r "$sdkDir.zip" "$sdkDir"
rm -rf $sdkDir

echo " ======================= iOS SDK与SDK Demo App包构建结束 总耗时${SECONDS}秒 ======================= "