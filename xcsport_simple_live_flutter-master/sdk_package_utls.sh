#!/bin/bash

function isContain() {
  # $1 数组
  # $2 需要查找的内容
  local arr=$1
  for e in ${arr[@]}; do
    if [[ $e = $2 ]]; then
      return 1
    fi
  done
}

# 移除因执行sed命令产生的中间文件
function removeTempFile() {
  # 删除以n-place结尾的临时文件
  add="n-place"
  path="$1$add"	
  [[ -f $path ]] && rm $path

  # 删除以-e结尾的临时文件
  append="-e"
  path=$1$append
  [[ -f $path ]] && rm $path
}

# 撤销文件修改
function checkoutChanges() {
  # $1 ios-ios端  all-两端 非ios/all-安卓
  # $2 sdk-sdk包  非sdk-app打包
  if [[ $2 = 'sdk' ]]; then
    # SDK 
    if [[ $1 = 'ios' ]]; then
      echo "iOS SDK打包文件修改撤销操作"
      git checkout out_sdk/iOSSDK/XCSDKBuild/XCSDK/XCSDKManager.m out_sdk/iOSSDK/iOSSDK/iOSSDK.podspec out_sdk/iOSSDK/iOSSDKDemo-Inner/
      #git checkout fast_ai/pubspec.yaml out_sdk/iOSSDK/XCSDKBuild/XCSDK/XCSDKManager.m out_sdk/iOSSDK/iOSSDK/iOSSDK.podspec out_sdk/iOSSDK/iOSSDKDemo-Inner/
    else
      echo "非iOS SDK打包文件修改撤销操作"
    fi
  else
    # App
    if [[ $1 = 'ios' ]]; then
      git checkout assets/images/launch pubspec.yaml lib/api/api.dart ios/Runner/Assets.xcassets ios/Runner/Info.plist ios/package_app/Runner.plist ios/Runner.xcodeproj/project.pbxproj lib/api/net_host.dart lib/api/net_proxy.dart
    elif [[ $1 = 'all' ]]; then
      git checkout assets/images/launch pubspec.yaml lib/api/api.dart ios/Runner/Assets.xcassets ios/Runner/Info.plist ios/package_app/Runner.plist ios/Runner.xcodeproj/project.pbxproj assets/images/launch pubspec.yaml lib/api/api.dart android/app/src/main/res lib/api/net_host.dart lib/api/net_proxy.dart
    else
      git checkout assets/images/launch pubspec.yaml lib/api/api.dart android/app/src/main/res lib/api/net_host.dart lib/api/net_proxy.dart
    fi
    git checkout android/app/src/main/res/values/strings.xml
    [[ -f ios/Runner/Assets.xcassets/AppIcon.appiconset/icon_40pt.png ]] && rm -f ios/Runner/Assets.xcassets/AppIcon.appiconset/icon_40pt.png
    [[ -f ios/Runner/Assets.xcassets/AppIcon.appiconset/icon_60pt@2x.png ]] && rm -f ios/Runner/Assets.xcassets/AppIcon.appiconset/icon_60pt@2x.png
  fi
}

# 复制编辑pubspec.yaml
function modifyPubspec() {
  # $1 主工程中的 pubspec.yaml路径 如：../pubspec.yaml
  # $2 当前package工程 pubspec.yaml路径如：./pubspec.yaml，安卓忽略此字段
  # $3 平台：ios/android
  # $4 是否到处资源包 true/yes：导出，非true/yes：不导出
  echo "path1=$1, path2=$2, platform=$3, export_assets=$4"
  if [[ $3 != 'ios' ]]; then
    # Android
    editPubspec $1 $3 "../xcsports-sdk-flutter/sdk_module_mixin.yaml" $4
  else
    # iOS
    [[ -f $2 ]] && rm -f $2
    cp $1 $2

    editPubspec $2 $3 "../sdk_module_mixin.yaml" $4
  fi
}

# 内部调用
function editPubspec() {
  # $1 pubspec.yaml路径
  # $2 平台 空-安卓 ios/其他字符-iOS
  # $3 追加文件路径：安卓：../xcsports-sdk-flutter/sdk_module_mixin.yaml，iOS：../sdk_module_mixin.yaml
  # $4 是否到处资源包 true/yes：导出，非true/yes：不导出
  echo "pubspec.yaml=$1, platform=$2, appendFilePath=$3， export_assets=$4"

  if [[ $4 = 'true' || $4 = 'yes' ]]; then
    # 导出资源
    local startLine=`sed -n '/#startLine/=' $1 | head -1` # 获取startLine所在行数
    local endLine=$startLine
    if [[ $2 = 'ios' ]];then
      endLine=`sed -n '/#endLine for ios/=' $1 | head -1` # 获取endLine所在行数
    else
      endLine=`sed -n '/#endLine for android/=' $1 | head -1` # 获取endLine所在行数
    fi
    sed -i -e $startLine','$endLine's/^/#/' $1 # 注释多余图片与字体申明，要不然会编译失败
    echo "" >> $1
    [[ $2 = "ios" ]] && echo "  fonts:" >> $1 # 不导出资源，安卓使用本地字体，这里不需要fonts:
  else
    # 不导出资源，需要注释188字体
    local startLine=`sed -n '/#188Font/=' $1 | head -1` # 获取#188Font所在行数
    local endLine=`sed -n '/#endLine for ios/=' $1 | head -1` # 获取endLine所在行数
    sed -i -e $startLine','$endLine's/^/#/' $1 # 注释188字体
  fi
  echo "" >> $1 # 添加空行
  cat $3 >> $1
# 188的资源较少全部放本地.............
  # fonts:
  #   - family: ior188
  #     fonts:
  #       - asset: assets188/fonts/DIN_Alternate_Bold.ttf
  # echo "" >> $1 # 添加空行
  # echo "  fonts:" >> $1
  # echo "    - family: ior188" >> $1
  # echo "      fonts:" >> $1
  # echo "        - asset: assets188/fonts/DIN_Alternate_Bold.ttf" >> $1
  # echo "" >> $1 # 添加空行
  # echo "  module:" >> $1
  # echo "    androidX: true" >> $1
  # echo "    androidPackage: com.xc.module.fast_ai" >> $1
  # echo "    iosBundleIdentifier: com.xc.module.fastAi" >> $1

  removeTempFile $1
}


# 修改Podfile
function modifyPodfile() {
  # $1 .ios/Podfile
  if [[ -f $1 ]]; then
    echo "检查 $1文件状态"
    if [[ $(cat $1) == use* ]]; then
      echo '已经添加use_frameworks, 不再添加'
    else
      sed -i '' '1i\
      use_frameworks!
      ' $1
      removeTempFile $1
    fi
  fi
}


# 修改版本号
function modifyVersion() {
  # $1 SDK版本号
  # ------ 修改SDK版本号 ------
  local f1=../out_sdk/iOSSDK/XCSDKBuild/XCSDK/XCSDKManager.m
  local line=`sed -n '/#define kXCSDKVersion /=' $f1 | head -1` # 获取行数
  #sed -i -e $line's/^/\/\//' $f1 # 注释
  sed -i -e $line'd' $f1
  sed -i '' $line'i\
    #define kXCSDKVersion @\"'$1'\"
  ' $f1

  # ------ 修改podspec中的版本号 ------
  local f2=../out_sdk/iOSSDK/iOSSDK/iOSSDK.podspec  
  line=`sed -n '/s.version /=' $f2 | head -1` # 获取行数
  sed -i -e $line'd' $f2
  sed -i '' $line'i\
      s.version          = \"'$1'\"
  ' $f2
  removeTempFile $f1
  removeTempFile $f2
}

# 移动SDK资源
function moveAssetsFile() {
  # $1 # 源路径 
  # $2 # 目标路径 递归尽量少用变量
  # $3 # 保留文件名 
  # $4 # 废弃或SDK不需要的资源名或文件夹
  [[ ! -e $2 ]] && mkdir $2
  for f in `ls $1`; do
    if [[ -f $1/$f ]]; then
      if [[ $f = "remote_assets_dirs.json" ]]; then
        cp $1/$f $2/$f #remote_assets_dirs.json两边都保留
      elif [[ $4 =~ $f ]]; then
        [[ -f $1/$f ]] && rm $1/$f # 废弃或SDK不需要的资源
        echo "delete path=$1/$f"
      elif [[ ! $3 =~ $f ]]; then
        mv $1/$f $2/$f
      fi
    else
      local arr=("icon_home_betlist_selected" "icon_home_find_selected" "icon_home_match_selected" "icon_home_mine_selected" "icon_home_find_white")
      isContain "${arr[*]}" $f # 是否包含指定文件，包含返回1
      local ret=$? #返回值要在函数调用下一行接收要不然会被丢弃
      if [[ $ret -eq 1 ]]; then
        rm -rf $1/$f # 废弃或SDK不需要的资源
        echo "delete dir=$1/$f"
      else
        moveAssetsFile $1/$f $2/$f $3 $4
      fi
    fi
  done
}


# 资源准备
function prepareSDKAsset() {
  echo "======================= SDK assets resource prepare start ======================="
  # $1 SDK版本
  # $2 ios/android 废弃资源或SDK中用不到的资源
  deleteItems=('img_live_test_normal.png' 'login-bg.jpg' 'img_vlog_empty.png' 'LaunchImagePortrait~iphone.png' 'shoumi_detail_bg.png' 'icon_guide1.png' 'icon_guide2.png' 'icon_guide3.png' 'icon_guide4.png' 'img_bg_constellation_large.png' 'login.mp4')
  delete="" 
  for n in ${deleteItems[@]} 
  do 
    delete="$delete,$n"
  done
  echo "delete=$delete"

  exclude=""
  # 保留的文件名
  local excludeIcons=()
  # 一级页面底部动画
  local homeIcons=("icon_home_betlist_selected.gif" "icon_home_find_selected.gif" "icon_home_match_selected.gif" "icon_home_mine_selected.gif" "icon_home_find_white.gif")
  # mp3
  local mp3List=("getMoney.mp3" "punish.mp3" "start.mp3")
   # 系统维护页
  local systemRepairIcons=("img_default_503_normal.png" "icon_sdk_back_normal.svg")
   # 资源下载页
  local assetsDownloadIcons=("icon_loading_soccer_yellow.svg" "sdk_loading_default6.png")
  # 收藏动画，详情聊天室跟投动画，红包彩蛋动画，红包来袭动画
  local gifIcons=("BrowserPreview_tmp.gif" "chat_room_follow_bet.gif" "chat_room_follow_bet_en-us.gif" "redbag_detail_gain.gif" "global_redbag.gif")
  excludeIcons+=${homeIcons[@]}
  excludeIcons+=${mp3List[@]}
  excludeIcons+=${systemRepairIcons[@]}
  excludeIcons+=${assetsDownloadIcons[@]}
  excludeIcons+=${gifIcons[@]}
  # 因FlutterSDK的bug，动态字体在安卓上失效，因此需要保留
  [[ -z $2 || $2 != 'ios' ]] && excludeIcons+=("HYYakuHei-HEW.ttf" "kabm.ttf" "HYYakuHei-HEW.ttf" "Ratio_Black.otf" "Score_Bold.ttf" "VisbyCF_Bold.otf" "YouSheBiaoTiHei.ttf")
  #[[ -z $2 ]] && excludeIcons+=("HYYakuHei-HEW.ttf" "PingFang_Medium.ttf" "HYYakuHei-HEW.ttf" "Ratio_Black.otf" "Score_Bold.ttf" "VisbyCF_Bold.otf" "YouSheBiaoTiHei.ttf")

  for name in ${excludeIcons[@]} 
  do
    exclude="$exclude,$name"
  done
  echo "平台=$2, \nexclude=$exclude \ndelete=$delete"
  moveAssetsFile "$(pwd)/assets" "$(pwd)/assets$1" $exclude $delete
  echo "======================= SDK assets resource prepare completed ======================="
}


# 修改资源获展示
function exchangeAssetsShowMethod() {
  # $1 # 源路径 ./lib
  for f in `ls $1`; do
    if [[ -f $1/$f ]]; then
      if [[ ! "sdk_assets.dart,sdk_asset_download_page.dart,collect_animiation_widget.dart,system_repair_page.dart,global_redpacket_view.dart" =~ $f ]]; then
        local content=$(cat $1/$f)
        if [[ $content =~ "AiImage.assetImage(" || $content =~ "AiSvgPicture.asset(" || $content =~ "AiImage.asset(" ]]; then
          # echo "000000-file=$1/$f"
          # 替换资源展示方法
          sed -in-place -e 's/AiImage.assetImage(/gAssetImage(/g' $1/$f
          sed -in-place -e 's/AiSvgPicture.asset(/GSvgPicture.asset(/g' $1/$f
          sed -in-place -e 's/AiImage.asset(/GImage.asset(/g' $1/$f

          # 导入class
          sed -i '' '1i\
          import "package:fast_ai/sdk_api/sdk_assets.dart";
          ' $1/$f # 在第一个行钱插入文字和回车，单引号会被自动删除因此用双引号
          #echo "当前修改文件：$1/$f"
          removeTempFile $1/$f
        # else
          #echo "111111-file=$1/$f"
        fi
      fi
    else
      exchangeAssetsShowMethod $1/$f
    fi
  done
}

function remote_ios_prj_files() {
  # $1 工程路径(绝对路径)
  # $2 工程名
  [[ -z $2 ]] && prjName="iOSSDKSample"

  if [[ ! -d $1 ]]; then
    echo '工程路径：$1不存在'
  else
    [[ -d "$1/$prjName.xcworkspace" ]] && rm -rf "$1/$prjName.xcworkspace"
    [[ -d "$1/package_app" ]] && rm -rf "$1/package_app"
    [[ -d "$1/Pods" ]] && rm -rf "$1/Pods"
    [[ -f "$1/package_app.sh" ]] && rm "$1/package_app.sh"
    [[ -f "$1/Podfile.lock" ]] && rm "$1/Podfile.lock"
  fi
}

# 构建iOS SDK demo包
function build_ios_sdk_demo_app() {
  # $1 包放置位置，默认放在桌面iOSSDKDemoApp文件夹
  # $2 打包个数 yes/true-全部, params-仅参数版app
  app_dir=$1
  echo " ======================= 开始 构建 iOS SDK Demo包 当前耗时${SECONDS}秒 ======================= "
  [[ -z $app_dir ]] && app_dir="$HOME/Desktop/iOSSDKDemoApp"
  [[ ! -d $app_dir ]] && mkdir $app_dir

  # $2 是否删除原文件夹里文件，默认不删除
  #[[ -n $2 ]] && rm -rf $app_dir

  cd out_sdk/iOSSDK/iOSSDKDemo-Inner
  echo "====== 构建iOS SDK demo包 当前路径：$(pwd) ======"
  echo "====== 构建参数版ipa包 ======"
  ./package_app.sh $app_dir 'ai'

  if [[ $2 = "true" || $2 = "yes" ]]; then
    echo "====== 构建演示/旗舰版ipa包 ======"
    ./package_app.sh $app_dir 'qj'

#    echo "====== 构建国际版-cn2环境 ipa包 ======"
#    ./package_app.sh $app_dir 'cn2'

    echo "====== 构建国际版ipa包 ======"
    ./package_app.sh $app_dir 'gj'

#    echo "====== 构建国际版TF签名包 ======"
#    ./package_app.sh $app_dir 'gjtf'

    echo "====== 构建旗舰版Gbet包 ======"
    ./package_app.sh $app_dir 'gbet'
  fi
  echo " ======================= iOS SDK Demo包构建结束 结束耗时${SECONDS}秒 ======================= "
}


# 安卓配置修改
function modifyAndroidSettings() {
  # 当前所在路径为:xcsports-sdk-flutter文件夹下，AiSportSDKSample_Android工程与fast_ai文件夹在上层文件创建
  # $1 samele_dir_name='AiSportSDKSample_Android'
  # $2 flutter_name='fast_ai'
  # $3 sdk_name='fastailib'
  # $4 sdk_version

  echo "================= modify Android Settings start ================="
  # moduleBuildGradle=../$2/.android/app/build.gradle
  demoGradle=../$1/$3/build.gradle
  sdkInfo=../$1/$3/src/main/java/com/xc/sdk/fastailib/sdk_info.kt
  moduleYaml=../$2/pubspec.yaml

  echo "moduleBuildGradle=$moduleGradle, demoGradle=$demoGradle, sdkInfo=$sdkInfo, moduleYaml=$moduleYaml"
  # echo "================= 设置Android系统SDK最小编译版本号 ================="
  # #sed -in-place -e 's/16/17/g' $moduleBuildGradle # ok
  # local line=`sed -n '/minSdkVersion /=' $moduleBuildGradle | head -1`
  # sed -i -e $line','$(($line+1))'d' $moduleBuildGradle
  # sed -i '' $line'i\
  #   minSdkVersion 17\
  #   targetSdkVersion 29
  # ' $moduleBuildGradle

  echo "================= 设置SDK versionCode和versionName ================="
  # sed -in-place -e 's/versionCode 9/versionCode 18/g' $demoGradle # ok
  #sed -in-place -e 's/versionName "1.0"/versionName \"'$4'\"/g' $demoGradle # ok
  line=`sed -n '/versionCode /=' $demoGradle | head -1`
  sed -i -e $line','$(($line+1))'d' $demoGradle
  sed -i '' $line'i\
    versionCode 18\
    versionName \"'$4'\"
  ' $demoGradle

  echo "================= 设置SDK版本号 ================="
  #sed  -in-place -e  's/VERSION = "3.4.0"/VERSION = "'$4'";/g' $sdkInfo # ok
  line=`sed -n '/val VERSION/=' $sdkInfo | head -1` # 获取行数
  # sed -i -e $line's/^/\/\//' $sdkInfo # 注释
  sed -i -e $line'd' $sdkInfo
  sed -i '' ${line}'i\
    val VERSION = \"'$4'\"
  ' $sdkInfo

  echo "================= 注释掉flutter_inappwebview插件 ================="
  sed  -in-place -e  's/flutter_inappwebview/#flutter_inappwebview/g' $moduleYaml # ok

  echo "================= 清空in_app_localhost_server.dart ================="
  echo "" > ../$2/lib/widgets/xc_inappwebview/src/in_app_localhost_server.dart

  echo "================= 删除中间文件 ================="
  # removeTempFile $moduleBuildGradle
  removeTempFile $demoGradle
  removeTempFile $sdkInfo
  removeTempFile $moduleYaml
  echo "================= modify Android Settings complete ================="
}

# 是否开启flutter log
function openSDKLog(){
  # $1 是否打开log
  # $2 是否需要到处资源包
  local value=$1
  local export_assets=$2
  local logFile=lib/services/sys_service.dart

  if [[ $value = 'true' || $value = 'yes' ]]; then
    value='true'
  else
    value='false'
  fi

  if [[ $export_assets = 'true' || $export_assets = 'yes' ]]; then
    export_assets='true'
  else
    export_assets='false'
  fi
  if [[ -f $logFile ]]; then
    local line=`sed -n '/bool gReleaseShowLog/=' $logFile | head -1`
    sed -i -e $line'd' $logFile
    sed -i '' $line'i\
const bool gReleaseShowLog = '$value';
    ' $logFile

    line=`sed -n '/bool gExportAssets/=' $logFile | head -1`
    sed -i -e $line'd' $logFile
    sed -i '' $line'i\
const bool gExportAssets = '$export_assets';
    ' $logFile
  fi
  removeTempFile $logFile
}

# 修改公共代码
function commonCodeModify(){
  # $1 true/yes-开启， 其他字符串-不开启
  local open=$1
  if [[ $open = 'true' || $open = 'yes' ]]; then
    open='true'
  else
    open='false'
  fi

  local aipPath=lib/api/api.dart
  #local mainPath=lib/main.dart
  local mainPath=lib/ai_app.dart
  sed -in-place -e 's/gLaunchImage(context, false)/gLaunchImage(context, true)/g' $mainPath
  # sed -in-place -e 's/static const IS_OPEN_KEYWORD = true;/static const IS_OPEN_KEYWORD = false;/g' $aipPath # 关闭关键词
  # local startLine=`rpm -qa | sed -n '/IS_OPEN_KEYWORD/=' $aipPath` # 获取行
  # sed -i -e $startLine's/^/\/\//' $aipPath # 注释
  local startLine=`sed -n '/static const IS_OPEN_KEYWORD/=' $aipPath | head -1`
  sed -i -e $startLine'd' $aipPath
  sed -i '' $startLine'i\
    static const IS_OPEN_KEYWORD = '$open';
  ' $aipPath

  removeTempFile $mainPath
  removeTempFile $aipPath
}


function openNetProxy() {
  echo "00-openNetProxy, proxyEnable=$1 proxyPort=$2 proxyIp=$3 pwd=$(pwd)"
  if [[ $1 = 'true' ]]; then
    local proxyFilePath=lib/api/net_proxy.dart
    local httpFilePath=lib/api/http.dart


    # 查找void configProxy所在行
    local line=`sed -n '/void configProxy/=' $httpFilePath | head -1`
    echo "00-configProxy-line=$line"
    sed -i -e $(($line+1))','$(($line+6))'s/^/\/\//' $httpFilePath # 注释
    echo "11-configProxy-line=$line"

    echo "00-set enable"
    local line=`sed -n '/static bool enable/=' $proxyFilePath | head -1`
    sed -i -e $line'd' $proxyFilePath
    sed -i '' $line'i\
      static bool enable = '$1';
    ' $proxyFilePath
    echo "11-set enable-line=$line"

    echo "00-set port"
    line=`sed -n '/static String port/=' $proxyFilePath | head -1`
    sed -i -e $line'd' $proxyFilePath
    sed -i '' $line'i\
      static String port = \"'$2'\";
    ' $proxyFilePath
    echo "11-set port-line=$line"

    echo "00-set ip"
    line=`sed -n '/static String ip/=' $proxyFilePath | head -1`
    sed -i -e $line'd' $proxyFilePath
    sed -i '' $line'i\
      static String ip = \"'$3'\";
    ' $proxyFilePath
    echo "11-set ip-line=$line"

    removeTempFile $proxyFilePath
    removeTempFile $httpFilePath
  fi
  echo "11-openNetProxy, proxyEnable=$1 proxyPort=$2 proxyIp=$3 pwd=$(pwd)"
}


# 安装mobileprovision文件
# 入参$1：mobileprovision文件夹路径
function installMobileprovision() {
  # ~/Library == /Users/username/Library
  # ~/Library == /Users/admin/Library
  # ************ 自动安装mobileprovision start ************
  if [[ -d $1 ]]; then
    for fp in `find $1 -maxdepth 1 -iname "*.mobileprovision"`; do
      uuid=`rpm -qa | grep UUID -A1 -a $fp | grep -io '[-A-F0-9]\{36\}'`
      echo "uuid=$uuid, USER=$USER"
      echo "/Users/$USER/Library/MobileDevice/Provisioning Profiles/$uuid.mobileprovision"
      cp $fp "/Users/$USER/Library/MobileDevice/Provisioning Profiles/$uuid.mobileprovision"
    done
  else
    echo 'mobileprovision文件夹路径:$1 不存在'
  fi
  # ************ 自动安装mobileprovision end ************
}


# 自动安装证书
# 入参$1：证书所在文件夹路径
# 入参$2：证书密码：最好统一为：123456
# 入参$3：Mac开机密码
function installCertificate() {
  local unlocked='0'
  if [[ -d $1 ]]; then
    for p12FilePath in `find $1 -maxdepth 1 -iname "*.p12"`; do
      if [[ $unlocked = '0' ]]; then
        unlocked='1'
        security default-keychain -s "/Users/$USER/Library/Keychains/login.keychain"
        security unlock-keychain -p $3 "/Users/$USER/Library/Keychains/login.keychain"
      fi
      security import $p12FilePath -k "/Users/$USER/Library/Keychains/login.keychain" -P $2
    done
  else
    echo 'Certificate文件夹路径:$1 不存在'
  fi
}

# 安装证书和描述文件
function certAutoInstall() {
  echo "empty function"
  local certDir=$(pwd)/cert_ios
  # local certPwd='123456'
  # local macPwd=''
  installMobileprovision $certDir
  # installCertificate $certDir $certPwd $macPwd
}

function copyIJKMediaFramework() {
  # $1 destination file path

  # flutter sdk bin file path
  local ffp=`rpm -qa | which flutter`
  # flutter sdk file path
  ffp=${ffp%*/bin/flutter}
  # flutter git plugin file path 
  ffp="$ffp/.pub-cache/git"
  echo "ffp=${ffp}"
  fp=""
  for f in $ffp/* ; do
    #echo "fp=$f"
    if [[ $f =~ 'flutter_ijkplayer' ]]; then
      fp=$f
      break;
    fi
  done
  if [[ -d $fp ]]; then
    cp -r "$fp/ios/IJKMediaFramework.framework" $1
    echo "flutter_ijkplayer插件文件夹存在"
  fi
  echo "flutter_ijkplayer file path=$fp"
}


function copyNewIJKMediaFramework() {
  # BIJKPlayer 本地引用 IJKMediaPlayer.framework
  # module build 不会将本地依赖的framework build到文件夹，需要自己用脚本复制过去
  local fp=/Users/${USER}/Library/Caches/CocoaPods/Pods/Release/BIJKPlayer/0.7.10-6727b/IJKMediaPlayer.framework
  if [[ -d $fp ]]; then
    cp -r "$fp/ios/IJKMediaFramework.framework" $1
    echo "flutter_ijkplayer插件文件夹存在"
  fi
  echo "flutter_ijkplayer file path=$fp"
}


# 根据入参或当前代码分支自动切FlutterSDK版本你
function autoSwitchFlutterSdk() {
  # Flutter2.8.0  cf44000065 cf4400006550b70f28e4b4af815151d1e74846c6
  # Flutter2.5.3  18116933e7 18116933e77adc82f80866c928266a5b4f1ed645
  # Flutter1.22.6 9b2d32b605 9b2d32b605630f28625709ebd9d78ab3016b2bf6

  # 获取当前flutter版本
  local curSdkVer=`flutter --version | grep Flutter`
  curSdkVer="${curSdkVer##*Flutter }"
  curSdkVer="${curSdkVer% • c*}"
  echo "flutter currentVer：$curSdkVer" # flutter版本号 2.5.3
  curSdkVer=`echo $curSdkVer | awk '{print int($0)}'`
  echo $curSdkVer # 2

  local packageSdkVer="1"
  [[ `git branch -a | grep '* '` =~ "_f2" || $1 = "2" || $1 = "2.0" ]] && packageSdkVer="2"

  if [[ $packageSdkVer != $curSdkVer ]]; then

    local flutterSdkPath=`flutter doctor -v | grep 'Flutter version '`
    echo $flutterSdkPath
    flutterSdkPath="${flutterSdkPath##*at }"
    local saveCurrentPath="$(pwd)"
    echo "保存当前路径：$saveCurrentPath"

    cd $flutterSdkPath
    echo "已cd到flutterSDK文件夹：$(pwd)"
    git checkout stable # 切到稳定分支
    git pull # 拉取flutterSDK源码，第一次地本版切高版本不拉代码会切不过去

    # 切flutterSDK版本
    if [[ $packageSdkVer = "1" ]]; then
      git checkout 1.22.6
    else
      git checkout 2.5.3 #2.8.0太高，安卓会有问题
    fi

    cd $saveCurrentPath
    echo "已cd回原路径：$(pwd)"

    echo "--- flutter prepare ---"
    flutter doctor # 检测环境，确保相应缓存存在
    echo "--- flutter doctor finish ---"
    flutter precache
    echo "--- flutter precache finish ---"
  fi
  echo "---FlutterSDK版本切换结束---"
}