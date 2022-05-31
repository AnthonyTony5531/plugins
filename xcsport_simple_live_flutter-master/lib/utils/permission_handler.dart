import 'dart:io';

import 'package:fast_ai/config/config.dart';
import 'package:permission_handler/permission_handler.dart';

/// ********************************************************************
/// author:Sam
/// date:2020-01-08
///*********************************************************************

class PermissionHandlerManager{


  //存储权限
  static Future<bool> tryInitStoragePermission()async{
    if(!Platform.isAndroid)
      return true;
    final status = await Permission.storage.request();
    return status.isGranted;
    /*
    if(PermissionStatus.granted != await PermissionHandler().checkPermissionStatus(PermissionGroup.storage)){
      var map =  await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      return map[PermissionGroup.storage] == PermissionStatus.granted;
    }
    return true;
     */
  }


  static Future<PermissionStatus> tryInitStoragePermissionStatus()async{
    print("Permission tryInitStoragePermissionStatus  1");
    if(!Platform.isAndroid) return PermissionStatus.granted;
    final status = await Permission.storage.request();
    print("Permission tryInitStoragePermissionStatus  2 ps=${status?.toString()}");
    return status;
    /*
    print("Permission tryInitStoragePermissionStatus  2");
    if(PermissionStatus.granted != await PermissionHandler().checkPermissionStatus(PermissionGroup.storage)){
      print("Permission tryInitStoragePermissionStatus  3");
      var map =  await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      print("Permission tryInitStoragePermissionStatus  $map    ${map[PermissionGroup.storage]}");
      return map[PermissionGroup.storage];
    }
    print("Permission tryInitStoragePermissionStatus  4");
    print("Permission tryInitStoragePermissionStatus  ${PermissionStatus.granted}");
    return PermissionStatus.granted;
     */
  }

  static Future<PermissionStatus> tryInitStoragePermissionStatusForTab()async{
    print("Permission tryInitStoragePermissionStatusForTab  1");
    if(!Platform.isAndroid) return PermissionStatus.granted;
    print("Permission tryInitStoragePermissionStatusForTab  2");
    if(PermissionStatus.granted != await checkPermissionStatusForTab(Permission.storage)){
      print("Permission tryInitStoragePermissionStatusForTab  3");
      var map =  await requestPermissionsForTab([Permission.storage]);
      print("Permission tryInitStoragePermissionStatusForTab  $map    ${map[Permission.storage]}");
      return map[Permission.storage];
    }
    print("Permission tryInitStoragePermissionStatusForTab  4");
    print("Permission tryInitStoragePermissionStatusForTab  ${PermissionStatus.granted}");
    return PermissionStatus.granted;
  }




  static Future<PermissionStatus> checkPermissionStatusForTab(Permission permission) async {
    final int status = await config.tabPermissionChannel.invokeMethod("checkPermissionStatus", permission.value);

    return decodePermissionStatus(status);
  }

  static Future<Map<Permission, PermissionStatus>> requestPermissionsForTab(
      List<Permission> permissions) async {
    final List<int> data = encodePermissionGroups(permissions);
    final Map<dynamic, dynamic> status =
    await config.tabPermissionChannel.invokeMethod("requestPermissions", data);

    return decodePermissionRequestResult(Map<int, int>.from(status));
  }

  static Map<Permission, PermissionStatus> decodePermissionRequestResult(Map<int, int> value) {
    print('decodePermissionRequestResult called with: value:[$value]');
    return value.map((int key, int value) =>
        MapEntry<Permission, PermissionStatus>(Permission.values[key], PermissionStatus.values[value]));
  }

  static List<int> encodePermissionGroups(List<Permission> permissions) {
    return permissions.map((Permission it) => it.value).toList();
  }

  static PermissionStatus decodePermissionStatus(int value) {
    return PermissionStatus.values[value];
  }

  static ServiceStatus decodeServiceStatus(int value) {
    return ServiceStatus.values[value];
  }





  //照相权限
  static Future<bool> tryInitCameraPermission()async{
    var ps = await Permission.camera.request();
    return ps.isGranted;
    /*
    if(PermissionStatus.granted != await PermissionHandler().checkPermissionStatus(PermissionGroup.camera)){
      var map =  await PermissionHandler().requestPermissions([PermissionGroup.camera]);
      return map[PermissionGroup.camera] == PermissionStatus.granted;
    }
    return true;
     */
  }

  //相册权限
  static Future<bool> tryInitPhotosPermission()async{
    var ps = await Permission.photos.request();
    return ps.isGranted;
    /*
    if(PermissionStatus.granted != await PermissionHandler().checkPermissionStatus(PermissionGroup.photos)){
      var map =  await PermissionHandler().requestPermissions([PermissionGroup.photos]);
      return map[PermissionGroup.photos] == PermissionStatus.granted;
    }
    return true;
     */
  }

  // 补充webview中缺失的权限
  static Future<bool> tryWebviewPermission() async {
    if(Platform.isAndroid) {
      Map<Permission, PermissionStatus> map = await [Permission.photos, Permission.camera, Permission.storage].request();
      return map[Permission.photos].isGranted && map[Permission.photos].isGranted && map[Permission.storage].isGranted;
    }
    return true;
    /*
    if(Platform.isAndroid) {
      List<PermissionGroup> permissions = [PermissionGroup.photos, PermissionGroup.camera, PermissionGroup.storage];
      if(
        PermissionStatus.granted != await PermissionHandler().checkPermissionStatus(permissions[0])
        || PermissionStatus.granted != await PermissionHandler().checkPermissionStatus(permissions[1])
        || PermissionStatus.granted != await PermissionHandler().checkPermissionStatus(permissions[2])
      ){
        var map =  await PermissionHandler().requestPermissions(permissions);
        return map[permissions[0]] == PermissionStatus.granted && map[permissions[1]] == PermissionStatus.granted && map[permissions[2]] == PermissionStatus.granted;
      }
    }
    return true;
     */
  }

}