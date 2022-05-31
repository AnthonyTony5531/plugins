#!/bin/bash
source ./sdk_package_utls.sh

:<<EOF
# 1、cd 到主工程目录
# 2、在终端执行命令：./build_AndroidSDK.sh 3.18.0 params true false false
# 3、打包完后SDK、文档，sample工程、SDKDemo安装包一起压缩放到桌面
#
# 入参说明
# $1 版本号 必传
# $2 是否构建App 非必传,如需打开log该入参必传 true/yes-构建，false/no-不构建，params-仅构建参数版
# $3 是否打开log true或yes-打开log，非true或yes字符串关闭log
# $4 是否开启新关键词 true或yes-开启，非true或yes字符串不开启
# $5 是否到处资源包：true或yes-导出，非true或yes字符串-不导出
EOF

# 打包计时
SECONDS=0

sdk_version=$1
[[ -z $sdk_version ]] && sdk_version="3.16.0"

build_app=$2
[[ -z $build_app ]] && build_app="true"

open_log=$3
[[ -z $open_log ]] && open_log="false"

open_keyword=$4
[[ -z $open_keyword ]] && open_keyword="false"

export_assets=$5
[[ -z $export_assets ]] && export_assets="true"
echo "android sdk version=$sdk_version, build_app=$build_app, open_log=$open_log, open_keyword=$open_keyword"

autoSwitchFlutterSdk

SDK_ZIP="Sports_AndroidSDK_V$sdk_version.zip" # sdk压缩文件名
DEMO_ZIP="Sports_AndroidSDKSample_V$sdk_version.zip" # demo压缩文件名
GBET_DEMO_ZIP="Sports_GBETAndroidSDKSample_V$sdk_version.zip" # demo压缩文件名
DOCS_ZIP="Sports_AndroidSDK接入文档_V$sdk_version.zip" # 文档压缩文件名
DOCS188_ZIP="188Sports_AndroidSDK接入文档_V$sdk_version.zip" # 文档压缩文件名

#demo git 地址
sample_git='http://192.168.20.27/sam/AiSportSDKSample_Android.git'
gbet_sample_git='http://192.168.20.27/wilson/gbet_sdk_android_sample.git'
#demo 目录名字
samele_dir_name='AiSportSDKSample_Android'
gbet_samele_dir_name='gbet_sdk_android_sample'
#库的名
sdk_name='fastailib'
#临时编译文件
flutter_name='fast_ai'
#flutter moudle路径
flutter_module=../$flutter_name
echo "flutter_module=$flutter_module"

flutter_test=${flutter_module}'/test'
flutter_lib=${flutter_module}'/lib'
flutter_assets=${flutter_module}'/assets'
assets188=${flutter_module}'/assets188'
flutter_pubspec_yaml=${flutter_module}'/pubspec.yaml'
flutter_inappwebview_dart=${flutter_module}'/lib/widgets/xc_inappwebview/src/in_app_localhost_server.dart'

cd ../
echo "======================= 下载gbet_sdk_android_sample目录 ======================="
[[ ! -d $gbet_samele_dir_name ]] && git clone $gbet_sample_git
cd $gbet_samele_dir_name
git checkout .
git checkout master
git pull
cd ../

echo "======================= 下载Sample目录 ======================="
[[ ! -d $samele_dir_name ]] && git clone ${sample_git} -b master_v2
cd $samele_dir_name
git checkout .
git checkout master_v2
git pull
echo "======================= 下载Sample目录完毕 ======================="

cd ../xcsports-sdk-flutter
ls -a
echo "======================= 下载Sample目录 ======================="
cp -r  out_sdk/AndroidSDK/AI体育SDK_Android接入文档.zip ../
cp -r  out_sdk/AndroidSDK/Gbet_SDK_Android接入文档.zip ../
mv '../AI体育SDK_Android接入文档.zip' '../'$DOCS_ZIP
mv '../Gbet_SDK_Android接入文档.zip' '../'$DOCS188_ZIP

echo "======================= 创建flutter module  ======================="
rm -rf ${flutter_module}
flutter create --org com.xc.module -t module --offline ${flutter_module}
echo "======================= 复制新代码  ======================="
cp -rf './pubspec.yaml' ${flutter_pubspec_yaml}
cp -rf './lib/' $flutter_lib
cp -rf './assets/' $flutter_assets
cp -rf './assets188/' $assets188
rm -rf $flutter_module/output
rm -rf $flutter_module/shell
mkdir $flutter_module/output
mkdir $flutter_module/shell
cp -rf  './output_aar.dart' $flutter_module/shell
rm -rf ${flutter_test}

# echo "000-当前路径：$(pwd)"
modifyAndroidSettings $samele_dir_name $flutter_name $sdk_name $sdk_version
modifyAndroidSettings $gbet_samele_dir_name $flutter_name $sdk_name $sdk_version
cd $flutter_module
# echo "111-当前路径：$(pwd)"

openSDKLog $open_log $export_assets
commonCodeModify $open_keyword
modifyPubspec ./pubspec.yaml ./pubspec.yaml 'android' $export_assets
sleep 1 # 以免修改yaml文件的时候同时在执行flutter pub upgrade或flutter pub get
#exchangeAssetsShowMethod "$(pwd)/lib"
[[ $export_assets = 'true' || $export_assets = 'yes' ]] && prepareSDKAsset $sdk_version
[[ -f pubspec.lock ]] && rm pubspec.lock
flutter pub upgrade
#flutter pub get --offline

moduleBuildGradle=.android/app/build.gradle # flutter pub upgrade后.android和.ios会重新创建
echo "================= 设置Android系统SDK最小编译版本号 ================="
#sed -in-place -e 's/16/17/g' $moduleGradle # ok
line=`sed -n '/minSdkVersion /=' $moduleBuildGradle | head -1`
sed -i -e $line','$(($line+1))'d' $moduleBuildGradle
sed -i '' $line'i\
  minSdkVersion 19\
  targetSdkVersion 29
' $moduleBuildGradle
removeTempFile $moduleBuildGradle

echo "======================= 打包项目AAR  ======================="
flutter --no-color build aar
cd shell
echo "=======================  输出AAR 当前目录：$(pwd) ======================="
chmod +x output_aar.dart
dart output_aar.dart
#回到flutter_name目录
cd ../
#退出到flutter_name外面
cd ../
#拷贝库出来
rm -rf ${sdk_name}
cp -r $samele_dir_name'/'$sdk_name  $sdk_name
cp -r $gbet_samele_dir_name'/'$sdk_name  $sdk_name
#压缩输出东西
zip -r $DEMO_ZIP $samele_dir_name
zip -r $GBET_DEMO_ZIP $gbet_samele_dir_name
zip -r $SDK_ZIP $sdk_name

echo "当前文件位置：$(pwd)"
echo "======================= 开始打Android sdk demo包 ======================="
# 打sdk demo包
if [[ $build_app = 'true' || $build_app = 'yes' || $build_app = 'params' ]]; then
  echo '开始构建demo App'
  cd $samele_dir_name
  if [[ $build_app = "params" ]]; then
    gradlePath=app/build.gradle
    startLine=`sed -n '/start-only-params-app/=' $gradlePath | head -1` # 获取start所在行数
    endLine=`sed -n '/end-only-params-app/=' $gradlePath | head -1` # 获取end所在行数
    sed -i -e $startLine","$endLine"s/^/\/\//" $gradlePath
    removeTempFile $gradlePath
    echo "仅构建参数版sdk demo App"
  fi
  echo "当前文件位置：$(pwd)"
  ./gradlew assembleRelease --stacktrace --info
  cd ../

  echo '开始构建gbet demo App'
  cd $gbet_samele_dir_name
  echo "当前文件位置：$(pwd)"
  ./gradlew assembleRelease --stacktrace --info
  cd ../
else
  echo '无需构建demo App'
fi


echo "======================= 开始移动SDK、文档、SDKDemo工程，SDKDemo APK包  ======================="
# 移动到桌面
sdkDir="AndroidSDK_V${sdk_version}_$(date +"%Y%m%d%H%M%S")"
desktop_dir="$HOME/Desktop/$sdkDir"
mkdir $desktop_dir
mv $SDK_ZIP "$desktop_dir/$SDK_ZIP"
mv $DOCS_ZIP "$desktop_dir/$DOCS_ZIP"
mv $DOCS188_ZIP "$desktop_dir/$DOCS188_ZIP"
mv $DEMO_ZIP "$desktop_dir/$DEMO_ZIP"
mv $GBET_DEMO_ZIP "$desktop_dir/$GBET_DEMO_ZIP"
mv $samele_dir_name/app/apk/release/*.apk $desktop_dir
mv $gbet_samele_dir_name/app/apk/release/*.apk $desktop_dir

cd ~/Desktop
zip -r "$sdkDir.zip" $sdkDir
rm -rf $sdkDir
echo " ======================= Android SDK构建结束 总耗时${SECONDS}秒 ======================= "