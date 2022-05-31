import 'package:permission_handler/permission_handler.dart';

/// @author grey
/// Function :

class PermissionTool {
  static Future<bool> requestFilePermission() async {
    PermissionStatus ps = await Permission.storage.request();
    return ps.isGranted;
    // Map<PermissionGroup, PermissionStatus> permissions =
    //     await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    // if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
    //   return true;
    // }
    // return false;
  }
}
