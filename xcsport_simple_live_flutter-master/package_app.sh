#!/bin/bash

source ./sdk_package_utls.sh

:<<EOF
App打包使用说明
准备工作：
脚本添加权限命令：chmod 777 package_app.sh
Android：打包前需要至少需要跑一次安卓工程，否则gradlew将找不到
iOS：1、Signing&Capabilities选项卡Signing(Debug and Profile)配置AnyApp，Signing(Release)配置AppHoc；2、如果打包失败用Xcode执行Product->Build(Command+B)一次

入参说明：
$1：打包平台(现在支持入参：ios,all,其他非空字符，不区分大小写)，ios-只输出iOS包，all-输出iOS和Android包，其他非空字符只输出Android包
$2：打包环境(现在支持入参：见case语句，不区分大小写)，需要新增环境自行在case语句中添加
$3：App名称(字符包含ai应用名字为'AI体育'，不包含ai应用名字为'极智体育 beta')
$4：是否开启关键字：true-开启，false-不开启 默认false
$5：抓包开关：true-开启，false-不开启，默认false
$6：抓包端口：默认8866
$7：抓包IP：默认David电脑IP：192.168.20.16

Android打包命令示例：
极智体育 Beta：./package_app.sh android cn2 beta true 或 ./package_app.sh aaa cn2 beta true
AI体育：./package_app.sh android cn2 ai true 或 ./package_app.sh aaa cn2 ai true

iOS打包命令示例：
极智体育 Beta：./package_app.sh ios cn2 beta true
AI体育：./package_app.sh ios cn2 ai true

双平台打包命令示例：
极智体育 Beta：./package_app.sh all cn2 beta true
AI体育：./package_app.sh all cn2 ai true
EOF

# 打包计时
SECONDS=0
cur_date=$(date +"%Y%m%d%H%M%S")

# ************************************ 检测入参 ************************************
platform=$1 # 平台 默认android
platform=$(echo $platform | tr '[:upper:]' '[:lower:]')
[[ -z $platform ]] && platform="android"

env=$2 # 环境 默认cn2
env=$(echo $env | tr '[:upper:]' '[:lower:]')
[[ -z $env ]] && env="cn2"

appName=$3
if [[ $appName =~ "ai" || $appName =~ "AI" ]];then
	appName="AI体育"
elif [[ $appName =~ "jz" || $appName =~ "beta" || $appName =~ "Beta" ]]; then
	appName="极智体育Beta" # 有空格传参的时候会被当做两个入参
elif [[ $appName =~ "188" || $appName =~ "Gbet" ]]; then
	appName="Gbet"
else
	appName="虚拟体育"
fi

openKeyword=$4
[[ -z $openKeyword ]] && openKeyword="false"

proxyEnable=$5
[[ -z $proxyEnable ]] && proxyEnable="false"

proxyPort=$6
[[ -z $proxyPort ]] && proxyPort="8866"

proxyIp=$7
[[ -z $proxyIp ]] && proxyIp="192.168.20.16"

echo "待打包平台：$platform, 待打包环境：$env, 应用名：$appName, 是否打开关键词：$openKeyword"
echo " ****************** 检测入参完成 ******************  "

autoSwitchFlutterSdk

# ************************************ 拉取最新代码 ************************************
git pull
echo " ****************** 已拉取最新代码 ******************  "


# ************************************ 修改打包环境 ************************************
function configPackageEnv() {
	local netHostPath="./lib/api/net_host.dart"
  if [[ -f $netHostPath ]];then
    echo "环境配置相对(ios文件夹)路径为：$netHostPath"
  else
    echo '$myPath文件不存在请检查代码是否正确'
    exit -1;
  fi

  local imUrl=''
  local imgUrl=''
  local mainUrl=''
  local videoUrl=''
	case $env in
	'yc365d')
		imUrl='ws://dev.m.yc365d.com'
    imgUrl='http://dev.img.yc365d.com'
    mainUrl='http://dev.m.yc365d.com'
    videoUrl='http://dev.video.xc.com:10080'
		;;
	'dev')
		imUrl='ws://dev.m.xc.com'
    imgUrl='http://dev.img.xc.com'
    mainUrl='http://dev.m.xc.com'
    videoUrl='http://dev.video.xc.com:10080'
		;;
	'bet')
		imUrl='ws://bet.m.xc.com'
    imgUrl='http://bet.img.xc.com'
    mainUrl='http://bet.m.xc.com'
		;;
	'fat')
		imUrl='ws://fat.m.xc.com'
    imgUrl='http://fat.img.xc.com'
    mainUrl='http://fat.m.xc.com'
    videoUrl='http://fat.video.xc.com:10080'
		;;
	'pre')
		imUrl='ws://m.aisports.io'
    imgUrl='http://cn2.img.aisports.io'
    mainUrl='http://m.aisports.io'
		;;
	'cn2')
		imUrl='ws://cn2.m.aisports.io'
    imgUrl='http://cn2.img.aisports.io'
    mainUrl='http://cn2.m.aisports.io'
		;;
	'cn3')
		imUrl='ws://cn3.m.aisport.io'
    imgUrl='http://cn3.img.aisport.io'
    mainUrl='http://cn3.m.aisport.io'
		;;
	'beta')
    imUrl='ws://beta.m.xc.com'
    imgUrl='http://beta.img.xc.com'
    mainUrl='http://beta.m.xc.com'
		;;
	'beta-fat')
		imUrl='ws://beta-fat.m.xc.com'
		imgUrl='http://beta-fat.img.xc.com'
		mainUrl='http://beta-fat.m.xc.com'
		;;
	'nc') # 和cn3一样
		imUrl='ws://nc.m.aisport.io'
		imgUrl='http://nc.img.aisport.io'
		mainUrl='http://nc.m.aisport.io'
		;;
	'ld')
		imUrl='ws://m.juxiangbaojie.com'
		imgUrl='https://img.juxiangbaojie.com'
		mainUrl='https://m.juxiangbaojie.com'
		;;
	'lt') # 和cn2一样
		imUrl='ws://m.lt3389.com'
		imgUrl='http://img.lt3389.com'
		mainUrl='http://m.lt3389.com'
		;;
	'cc') # 和cn2一样
		imUrl='ws://cn2.m.coco-h5.com'
		imgUrl='http://cn2.img.coco-h5.com'
		mainUrl='http://cn2.m.coco-h5.com'
		;;
	'xz')
		imUrl='ws://dev.m.xz.com'
		imgUrl='http://dev.img.xz.com'
		mainUrl='http://dev.m.xz.com'
		;;
	'ty') # 泰语版
		imUrl='ws://cn2.m30.xcspt.com'
		imgUrl='https://img.aisports.com'
		mainUrl='http://cn2.m30.xcspt.com'
		;;
	'yn') # 越南版
		imUrl='ws://cn2.m31.xcspt.com'
		imgUrl='https://img.aisports.com'
		mainUrl='http://cn2.m31.xcspt.com'
		;;
	'zw') # 中文版
		imUrl='ws://cn2.m32.xcspt.com'
		imgUrl='https://img.aisports.com'
		mainUrl='http://cn2.m32.xcspt.com'
		;;
	'ip')
		imUrl='ws://120.78.238.3'
		imgUrl='http://120.78.196.187'
		mainUrl='http://120.78.212.55'
		;;
	*)
		echo "没有符合的打包环境"
		exit -1
		;;
	esac
	echo "" > $netHostPath
	echo "class NetHost {  static String BASE_IM_URL = '$imUrl';  static String BASE_IMG_URL = '$imgUrl';  static String BASE_MAIN_URL = '$mainUrl'; static String BASE_VIDEO_URL = '$videoUrl';}" >> $netHostPath
	echo " ****************** 修改环境完成 ******************  "

	echo "mainUrl=$mainUrl"
}


# ************************************ 修改代码与打包相关配置 ************************************
function modifyCode() {
	# $1 App名
	# $2 是否开启关键词
	echo "00-modifyCode name=$appName, open=$openKeyword"
	#echo "配置App证书，环境，icon，名字  pwd=$(pwd)"
	
	local iosPath=./replace_assets/ai/Assets.xcassets
	local androidPath=./replace_assets/ai/res
	local infoPlist=ios/Runner/Info.plist
	local aipPath=lib/api/api.dart
	local projectPath=ios/Runner.xcodeproj/project.pbxproj
	local packagePlistPath=ios/package_app/Runner.plist
	local androidStringsPath=android/app/src/main/res/values/strings.xml
  local configFilePath=lib/config/config.dart

	local packageType='false';
	local bundlerId='com.allinoneapp.foriOS';
	local flag='ai'
	local appType='ai'
	if [[ $appName = 'AI体育' || $appName =~ 'AI' || $appName =~ 'ai' ]]; then
		echo '00-modifyCode-AI体育'
	elif [[ $appName = '极智体育-Beta' || $appName =~ 'jz' ]]; then
		echo '00-modifyCode-极智体育-Beta'
		packageType='true'
		flag='jz'

	elif [[ $appName =~ 'Gbet' || $appName =~ '188' ]]; then
		echo '00-modifyCode-188'
		flag='188'
    appType='Gbet'

	elif [[ $appName =~ '365' ]]; then
		echo '00-modifyCode-bet365'
		flag='365'
    appType='bet365'

	else
		echo '00-modifyCode-虚拟体育'
		flag='vs'
		appType='vmSports'
	fi

	bundlerId="$bundlerId.$flag"
	iosPath="./replace_assets/$flag/Assets.xcassets"
	androidPath="./replace_assets/$flag/res"
	
	# 修改iOS打包配置
	sed -in-place -e 's/com.allinoneapp.foriOS</'$bundlerId'</g' $packagePlistPath
	
	# 修改iOS 证书描述文件配置
	sed -in-place -e 's/PRODUCT_BUNDLE_IDENTIFIER = com.allinoneapp.foriOS;/PRODUCT_BUNDLE_IDENTIFIER = '$bundlerId';/g' $projectPath

	# 应用里App名显示(仅ai有效，188/虚拟体育/365无效)
	local line=`sed -n '/static const packageType/=' $aipPath | head -1`
  sed -i -e $line'd' $aipPath
  sed -i '' $line'i\
  static const packageType = '$packageType';
  ' $aipPath

  # 修改桌面App名
  # <key>CFBundleDisplayName</key>
  # <string>Runner</string>
  line=`sed -n '/>CFBundleDisplayName</=' $infoPlist | head -1`
  sed -i -e $(($line+1))'d' $infoPlist
  sed -i '' $(($line+1))'i\  
    <string>'$appName'</string>
  ' $infoPlist

  # 是否开启关键词
	line=`sed -n '/static const IS_OPEN_KEYWORD/=' $aipPath | head -1`
  sed -i -e $line'd' $aipPath
  sed -i '' $line'i\
  static const IS_OPEN_KEYWORD = '$openKeyword';
  ' $aipPath

  # 指定App类型
	line=`sed -n '/String appType =/=' $configFilePath | head -1`
  sed -i -e $line'd' $configFilePath
  sed -i '' $line'i\
  String appType = \"'$appType'\";
  ' $configFilePath

	# 替换启动图和icon
	[[ -d android/app/src/main/res ]] && rm -rf android/app/src/main/res
	[[ -d ios/Runner/Assets.xcassets ]] && rm -rf ios/Runner/Assets.xcassets
	[[ -d $androidPath ]] && cp -rf $androidPath android/app/src/main/res
	[[ -d $iosPath ]] && cp -rf $iosPath ios/Runner/Assets.xcassets

	# flutter 启动图
	[[ -f assets/images/launch/LaunchImagePortrait~iphone.png ]] && rm assets/images/launch/LaunchImagePortrait~iphone.png
	cp ios/Runner/Assets.xcassets/LaunchImagePortrait.imageset/LaunchImagePortrait~iphone.png assets/images/launch/LaunchImagePortrait~iphone.png

	# sed -in-place -e命令修改后会产生一个fileName+n-place的文件，现在脚本删除，不删除多一个strings.xmln-place文件安卓打包不成功
	local files=($infoPlist $androidStringsPath $packagePlistPath $projectPath $aipPath $configFilePath)
	for f in ${files[@]}; do
		removeTempFile $f
		#[[ -f "${f}n-place" ]] && rm "${f}n-place"
	done
}


# ************************************ 清理&更新flutter环境 ************************************
function init_flutter(){
	echo " ****************** 清理&更新flutter环境 ******************  "
	flutter clean
	flutter pub upgrade
}

function package_android(){
	echo " ****************** 安卓打包开始 ******************  "
	cd android

	./gradlew assembleRelease
	local apkFilePath="$HOME/Desktop/app-release.apk"
	# 获取App版本号和工程版本号
	local appVer=`cat ./gradle.properties | grep flutter.versionName= | head -1`
	local projVer=`cat ./gradle.properties | grep flutter.versionCode= | head -1`
	appVer="${appVer#*=}"
	projVer="${projVer#*=}"

	local apkOutPath="$HOME/Desktop/${appName}.${appVer}.${projVer}-${env}_${cur_date}.apk"
	cp ../build/app/outputs/apk/release/app-release.apk $apkFilePath
	mv $apkFilePath $apkOutPath # rename

	echo " ****************** 打包结束apk路径：$apkOutPath ******************  "
}

function package_ios() {
	certAutoInstall

	cd ios

  # 高版本FlutterSDK兼容低版本Xcode
  # 打包 xcodebuild -showsdks
  local sdkName=`rpm -qa | xcodebuild -showsdks | grep iphoneos` # 兼容模式 执行xcodebuild -showsdks耗时2秒左右
  echo "00-sdkName=$sdkName, sdk=${sdkName##* }"
  sdkName="${sdkName##* }"
  echo "11-sdkName=$sdkName"
  sdkVer="${sdkName: 8}" #iphoneos14.2
  echo "22-sdkName=$sdkName, sdkVer=$sdkVer"
  # if [ `echo "$sdkVer < 14.1" | bc` -eq 1 ];then
  #   echo "Xcode版本低于14.1"
  #   local path=./Podfile
  #   line=`sed -n '/use_frameworks!/=' $path | head -1`
  #   sed -i -e $line's/^/#/' $path # 注释 use_frameworks!
  #   removeTempFile $path
  # fi

	pod install
	
	echo " ****************** iOS打包开始 ******************  "
	#需要绝对地址不能用相对地址：/package_app/Runner.xcarchive
	local xcarchiveFilePath=$(pwd)/package_app/Runner.xcarchive
	local plistFilePath=$(pwd)/package_app/Runner.plist
	local productFilePath=$(pwd)/package_app
	# # 打包 xcodebuild -showsdks
	# # 兼容模式
	# local sdkName=`xcodebuild -showsdks | grep iphoneos | head -1` # 执行xcodebuild -showsdks耗时2秒左右
	# echo "sdkName=$sdkName, sdk=${sdkName##* }"
	# sdkName="${sdkName##* }"
	xcodebuild archive -archivePath $xcarchiveFilePath -workspace Runner.xcworkspace -scheme Runner -configuration Release -sdk $sdkName
	# 签名、导出ipa
	xcodebuild  -exportArchive -archivePath $xcarchiveFilePath -exportPath $productFilePath -exportOptionsPlist $plistFilePath
	# 获取App版本号和工程版本号
	local appVer=`cat ./Runner.xcodeproj/project.pbxproj | grep MARKETING_VERSION | head -1`
	local projVer=`cat ./Runner.xcodeproj/project.pbxproj | grep CURRENT_PROJECT_VERSION | head -1`
	appVer="${appVer##* }"
	appVer="${appVer%;*}"
	projVer="${projVer##* }"
	projVer="${projVer%;*}"
	echo "appVer=$appVer, projVer=$projVer, appName=$appName"

	ipaName="Runner.ipa"; # Xcode12前是Runner.ipa，之后是$appName.ipa(或info.plist中的CFBundleName)
	[[ -f "$productFilePath/$appName.ipa" ]] && ipaName="$appName.ipa" # 打包后的IPA名

  local ipaFilePath="$HOME/Desktop/${appName}_${appVer}.${projVer}_${env}_${signType}_${cur_date}.ipa"
	mv "$productFilePath/$ipaName" "$HOME/Desktop/$ipaName"
  mv "$HOME/Desktop/$ipaName" $ipaFilePath

	# local ipaFilePath="$HOME/Desktop/${appName}${appVer}.${projVer}_${env}_${cur_date}.ipa"
	# mv "$productFilePath/Runner.ipa" "$HOME/Desktop/Runner.ipa"
	# mv "$HOME/Desktop/Runner.ipa" $ipaFilePath
	echo " ****************** 打包结束ipa路径：$ipaFilePath ******************  "
}

configPackageEnv # 配置打包环境
modifyCode
#modifyCode ${appName} ${openKeyword} # 修改flutter代码与native配置
openNetProxy $proxyEnable $proxyPort $proxyIp
init_flutter # 初始化flutter环境
# 开始打包
if [[ $platform = 'ios' ]]; then
	package_ios
elif [[ $platform = 'all' ]]; then
	package_android
	cd ../
	package_ios
else
	package_android
fi

# 还原文件修改
cd ../
checkoutChanges $platform

echo " ****************** App打包耗时：${SECONDS}秒 ****************** "