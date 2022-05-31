#!/bin/bash

source ../../../sdk_package_utls.sh

:<<EOF
App打包使用说明：./package_app.sh sdk_director_path demo_type
参数版：./package_app.sh $desktop_path 'ai'
旗舰版：./package_app.sh $desktop_path 'qj'
国际版：./package_app.sh $desktop_path 'gj'
国际版TF签名：./package_app.sh $desktop_path 'gj-tf'
CN2版：./package_app.sh $desktop_path 'cn2'
Gbet旗舰版：./package_app.sh $desktop_path 'gbet'
EOF

# 打包计时
SECONDS=0

# ipa保存文件夹，不传参 默认保存在桌面
ipaSaveDir=$1
[[ -z $ipaSaveDir ]] && ipaSaveDir="$HOME/Desktop"

# ipa类型
ipaType=$2
[[ -z $ipaType ]] && ipaType='ai' #默认打参数版
ipaType=$(echo $ipaType | tr '[:lower:]' '[:upper:]') # 转大写
echo "ios sdk demo 包类型: ${ipaType}, 包保存路径: $ipaSaveDir"

# 修改App名，最新flutterSDK在iOS14时，工程配置Product Name如为中文会导致crash，因为多Scheme原因现通过修改Info.plist中CFBundleDisplayName字段来修改ipa名字
# 在Target-General-Identity-Display Name修改过App名后，Info.plist才有CFBundleDisplayName字段，否则只有CFBundleName

# flutter1.22.6SDK不支持DisplayName设置中文，用Product name替代
showAppName="AI参数版"
case $ipaType in
  "AI" | "ai" )
    showAppName="AI参数版"
    ;;
  "QJ" | "qj" )
    showAppName="AI旗舰版"
    ;;
  "GJ" | "gj" )
    showAppName="AI国际版"
    ;;
  "GJTF" | "gjtf" )
    showAppName="AI国际版TF签"
    ;;
  "CN2" | "cn2" )
    showAppName="AI体育-CN2"
    ;;
  "GBET" | "Gbet" | "gbet" )
    showAppName="Gbet旗舰版"
    ;;
  *)
    echo "iOS SDK没有符合的打包类型"
    exit -1
    ;;
esac
echo "ipaType=$ipaType, showAppName=$showAppName"

infoPlistFilePath=iOSSDKSample/Info.plist
line=`sed -n '/>CFBundleDisplayName</=' $infoPlistFilePath | head -1` # 获取行数
sed -i -e $(($line+1))'d' $infoPlistFilePath
sed -i '' $(($line+1))'i\
  <string>'$showAppName'</string>
' $infoPlistFilePath
removeTempFile $infoPlistFilePath
echo "showAppName line=$line line++=$(($line+1))"

cur_date=$(date +"%Y%m%d%H%M%S")
projName="iOSSDKSample"
schemeName="iOSSDKSample"
defaultBundleId='com.allinoneapp.AISDK.inner'
bundleId=$defaultBundleId

echo " ****************** 替换启动图 ******************  "
# ICON图可通过多target在工程和配置
if [[ $ipaType != "AI" ]];then
  schemeName="iOSSDKSample-$ipaType" 
  bundleId="$defaultBundleId.$ipaType" 
  launchPath="iOSSDKSample/replace_assets/$ipaType"
  if [[ $ipaType != "GJTF" ]]; then
    # 替换签名id
    sed -in-place -e 's/>'$defaultBundleId'</>'$bundleId'</g' package_app/package_app.plist 
    removeTempFile package_app/package_app.plist
  fi
  
  # 替换启动图
  portraitPath=iOSSDKSample/Assets.xcassets/LaunchImagePortrait.imageset
  landscapePath=iOSSDKSample/Assets.xcassets/LaunchImageLandscape.imageset
  rm -rf $portraitPath
  rm -rf $landscapePath
  cp -rf "$launchPath/LaunchImagePortrait.imageset" $portraitPath
  cp -rf "$launchPath/LaunchImageLandscape.imageset" $landscapePath
fi
echo "projName=$projName, schemeName=$schemeName bundleId=$bundleId" 

# 安装依赖
pod install

echo " ****************** iOS打包开始 ******************  "
plistFilePath=$(pwd)/package_app/package_app.plist
if [[ $ipaType = "GJTF" ]]; then
  echo "00-GJTF-package_app_dist.plist"
  plistFilePath=$(pwd)/package_app/package_app_dist.plist
fi
xcarchiveFilePath=$(pwd)/package_app/"$projName.xcarchive "
productFilePath=$(pwd)/package_app
echo "00-plistFilePath=$plistFilePath, productFilePath=$productFilePath"
# clean工程
xcodebuild clean -workspace "$projName.xcworkspace" -scheme $schemeName -configuration Release

# 构建
sdkName=`rpm -qa | xcodebuild -showsdks | grep iphoneos` # 执行xcodebuild -showsdks耗时2秒左右
sdkName=${sdkName##* }
echo "sdkName=$sdkName"
xcodebuild archive -archivePath $xcarchiveFilePath -workspace "$projName.xcworkspace" -scheme $schemeName -configuration Release -sdk $sdkName

# 签名、导出ipa
xcodebuild  -exportArchive -archivePath $xcarchiveFilePath -exportPath $productFilePath -exportOptionsPlist $plistFilePath

# 获取App版本号和编译版本号
appVer=`rpm -qa | cat $projName.xcodeproj/project.pbxproj | grep MARKETING_VERSION`
projVer=`rpm -qa | cat $projName.xcodeproj/project.pbxproj | grep CURRENT_PROJECT_VERSION`
echo "appVer=${appVer##* } projVer=${projVer##* }"
appVer="${appVer##* }"
appVer="${appVer%;*}"
projVer="${projVer##* }"
projVer="${projVer%;*}"
echo "appVer=$appVer, projVer=$projVer"

# 获取App名称 	PRODUCT_NAME = "AI旗舰版";
# appName=`rpm -qa | cat $projName.xcodeproj/project.pbxproj | grep PRODUCT_NAME`
# appName="${appName##*= }" # 去掉= 前的字符串
# appName="${appName%;*}" # 去掉;后的字符串
# appName=$(echo $appName | sed 's/"//g') # 替换双引号
# 获取App名称

# Xcode12+ IPA的名字会直接取Display Name，Xcode12之前取schemeName，取xcarchive/Info.plist里的Applications可兼容
# Xcode12前是：工程名.ipa，之后是：(info.plist中的CFBundleName).ipa
appName=`rpm -qa | cat package_app/$projName.xcarchive/Info.plist | grep Applications`
appName="${appName##*s/}" # 去掉/ 前的字符串
appName="${appName%.app*}" # 去掉;后的字符串

# 重命名 IPA文件移到桌面
ipaName="$schemeName.ipa"; # 打包后的IPA名
[[ -f "$productFilePath/$appName.ipa" ]] && ipaName="$appName.ipa"

echo "appName=$appName, ipaName=$ipaName, schemeName=$schemeName"

ipaFilePath0="$productFilePath/$ipaName"
ipaFilePath1="$ipaSaveDir/$ipaName"
ipaFilePath2="$ipaSaveDir/${appName}_${appVer}_${projVer}_$cur_date.ipa"
echo "ipaFilePath0=$ipaFilePath0, ipaFilePath1=$ipaFilePath1, ipaFilePath2=$ipaFilePath2"
mv $ipaFilePath0 $ipaFilePath1
mv $ipaFilePath1 $ipaFilePath2

echo " ****************** 打包结束ipa路径：$ipaFilePath2 打包耗时：${SECONDS}s ******************  "

git checkout package_app/ iOSSDKSample/Assets.xcassets/ iOSSDKSample/Info.plist
rm -rf package_app/iOSSDKSample.xcarchive
# ipa 打包成功 最后输出日志如下，否则为打包失败
# ** ARCHIVE SUCCEEDED **