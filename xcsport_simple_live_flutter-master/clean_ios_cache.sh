#!/bin/bash
rm -rf ios/Flutter/App.framework
rm -rf ios/Flutter/Flutter.framework/*
rm -rf ios/Flutter/Flutter.framework
rm -rf ios/Flutter/flutter_export_environment.sh
rm -rf ios/Flutter/Generated.xcconfig

rm -rf ios/Podfile.lock
rm -rf ios/Pods
rm -rf ios/.symlinks
rm -rf ios/Runner.xcworkspace/xcuserdata/*
rm -rf ios/Runner.xcworkspace/xcuserdata
flutter clean .
flutter pub get
cd ios
pod install


