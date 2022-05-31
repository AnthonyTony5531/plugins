import 'dart:io';

/*
*********************************************************************
 * author:Sam
 * date:2020-01-08
 **********************************************************************
 */

  // import 'package:xc_utils_plugin/xc_utils_plugin.dart';
class AppInfo{
  /// App版本号
  String get appVersion => Platform.isIOS ? iosVersion : versionName;
  String get appVersionCode => '${Platform.isIOS ? iosBundleVersion : versionCode}';

  // android 版本号
  String versionName = "3.19.2";
  // android 版本code
  int versionCode  = 1;
  // android 包名
  String androidPackage = '';

  /// iOS 包id
  String iosBunleId = '';
  /// ios 版本号
  String iosVersion = '3.19.2';
  /// ios 包版本对应安卓versionCode
  String iosBundleVersion = '1';
  /// -1：未知设备， 0：phone；1：pad
  int userInterfaceIdiom = 0;

  //Gbet版本号
  String gBetVersion = '1.1.0';
}