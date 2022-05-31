#!/usr/bin/env bash

#cd ./android
#./gradlew assembleRelease
##cd ..
#创建apk解压产物临时目录

rm -rf ./build/app/outputs/apk/release/.temp
mkdir ./build/app/outputs/apk/release/.temp
#解压apk
unzip -o ./build/app/outputs/apk/release/app-release.apk -d ./build/app/outputs/apk/release/.temp/
rm -rf ./build/app/outputs/apk/release/.patch
#创建补丁临时存放目录patch
mkdir ./build/app/outputs/apk/release/.patch
mkdir ./build/app/outputs/apk/release/.patch/dexs
mkdir ./build/app/outputs/apk/release/.patch/lib
#dex
mv ./build/app/outputs/apk/release/.temp/*.dex ./build/app/outputs/apk/release/.patch/dexs
#assets
mv ./build/app/outputs/apk/release/.temp/assets ./build/app/outputs/apk/release/.patch/
#lib
mv ./build/app/outputs/apk/release/.temp/lib/armeabi-v7a/libapp.so ./build/app/outputs/apk/release/.patch/lib/
mv ./build/app/outputs/apk/release/.temp/lib/arm64-v8a/libapp.so ./build/app/outputs/apk/release/.patch/lib/

cd ./build/app/outputs/apk/release/.patch
rm $HOME/Desktop/app-patch.zip
zip  -r $HOME/Desktop/app-patch.zip  *
cd ..
#删除补丁临时存放目录patch
rm -rf .patch
#删除apk解压产物临时目录
rm -rf .temp

