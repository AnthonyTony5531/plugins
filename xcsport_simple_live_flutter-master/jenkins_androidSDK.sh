#!/bin/bash

:<<EOF
# 入参说明
# $1 版本号 必传 如：1.13.1
# $2 是否构建App 必传 如：params-仅构建参数版，true/yes-构建，false/no-不构建
# $3 代码分支 必传 如：dev，dev-lang，beta
# $4 打开log true-打开，false-不打开，默认false
# $5 是否到处资源包：true或yes-导出，非true或yes字符串-不导出
#
# 示例
# ./buildSDK.sh 3.13.1 true dev
# ./buildSDK.sh 3.13.1 params dev-lang
#
# 不导出资源包：./buildSDK.sh 3.15.2 true beta false false 或 ./buildSDK.sh 3.15.2 params dev false false
# 导出资源包：./buildSDK.sh 3.15.2 true beta false 或 ./buildSDK.sh 3.15.2 true beta false true
EOF

sdk_version=$1
[[ -z $sdk_version ]] && sdk_version="3.13.1"
build_app=$2
[[ -z $build_app ]] && build_app="true"
branch=$3
[[ -z $branch ]] && branch="beta"
open_log=$4
[[ -z $open_log ]] && open_log="false"
export_assets=$5
[[ -z $export_assets ]] && export_assets="true"

echo "build android sdk version=$sdk_version, build_app=$build_app, branch=$branch, open_log=$open_log, export_assets=$export_assets"

cd xcsports-sdk-flutter
git checkout $branch
git pull

./build_AndroidSDK.sh $sdk_version $build_app $open_log false $export_assets

# amazon network ftp
scp -p $HOME/Desktop/*.zip ec2-user@192.168.20.26:/var/ftp/pub/app/sdk-android/
echo "delete android sdk zip file in Desktop"
for f in `find $HOME/Desktop -maxdepth 1 -iname "*.zip"`; do
  echo "delete android sdk zip file path =$f"
  [[ -f $f ]] && rm $f
done

cd $HOME/Desktop
#[[ -d $HOME/Desktop/AiSportSDKSample_Android ]] && rm -rf $HOME/Desktop/AiSportSDKSample_Android
[[ -d $HOME/Desktop/fastailib ]] && rm -rf $HOME/Desktop/fastailib
[[ -d $HOME/Desktop/fast_ai ]] && rm -rf $HOME/Desktop/fast_ai