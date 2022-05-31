import 'dart:io';
import 'package:device_info/device_info.dart';

class DeviceUtil {
  // '/ai/mobile/track/saveUserResponse'
//  /// 会员账号ID
//  String userAccountId;
//  /// 会员账号
//  String userAccount;
//  /// 商户ID
//  String merchantId;
//  /// 商户名称
//  String merchantName;
//  /// 域名：dev.m.xc.com
//  String domainName;
//  /// 设备：iPhoneX
//  String device;
//  /// 服务器响应IP：220.181.38.148
//  String remoteIp;
//  /// 归属地：广东 电信
//  String address;
//  /// 记录时间：2020-12-23 19:23:59
//  String recordTimes;
//  /// 响应时长：20ms
//  int responseTimes;
//  /// dns解析时长：20ms
//  int dnsTimes;
//  /// tcp打开时长：20ms
//  int tcpTimes;
//  /// 设备网络时长
//  int networkTimes;
//  /// 设备信号强度：-40~-140db, -40~-80信号较强
//  int signalStrength;
//
//  /// 客户端版本号
//  String clientVersion;
//
//  /// 设备信号强度：设备版本号
//  String deviceSysVersion;

  static Future<Map<String, String>> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(Platform.isIOS || Platform.isMacOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      var deviceName = iosDeviceName(iosInfo.utsname.machine);
      var sysVersion = iosInfo?.systemVersion ?? '';
      var sysName = iosInfo?.systemName ?? '';
      print('Running on model=${iosInfo?.model}, machine=${iosInfo?.utsname?.machine}, systemVersion=${iosInfo?.systemVersion}, systemName=${iosInfo?.systemName}');
      return {
        'deviceName': deviceName,
        'sysVersion': sysVersion,
        'sysName': sysName
      };
    }
    else {
     return {};
    }
  }

  static String iosDeviceName(String machineName) {
    String deviceName;
    switch(machineName) {
    // iPhone
      case "iPhone1,1":
        deviceName =  "iPhone 2G";
        break;
      case "iPhone1,2":
        deviceName =  "iPhone 3G";
        break;
      case "iPhone2,1":
        deviceName =  "iPhone 3GS";
        break;
      case "iPhone3,1":
      case "iPhone3,2":
      case "iPhone3,3":
        deviceName =  "iPhone 4";
        break;
      case "iPhone4,1":
        deviceName =  "iPhone 4s";
        break;
      case "iPhone5,1":
      case "iPhone5,2":
        deviceName =  "iPhone 5";
        break;
      case "iPhone5,3":
      case "iPhone5,4":
        deviceName =  "iPhone 5c";
        break;
      case "iPhone6,1":
      case "iPhone6,2":
        deviceName =  "iPhone 5s";
        break;
      case "iPhone7,1":
        deviceName =  "iPhone 6 Plus";
        break;
      case "iPhone7,2":
        deviceName =  "iPhone 6";
        break;
      case "iPhone8,1":
        deviceName =  "iPhone 6s";
        break;
      case "iPhone8,2":
        deviceName =  "iPhone 6 Plus";
        break;
      case "iPhone8,4":
        deviceName =  "iPhone SE";
        break;
      case "iPhone9,1":
        deviceName =  "iPhone 7";
        break;
      case "iPhone9,2":
        deviceName =  "iPhone 7 Plus";
        break;
      case "iPhone10,1":
      case "iPhone10,4":
        deviceName =  "iPhone 8";
        break;
      case "iPhone10,2":
      case "iPhone10,5":
        deviceName =  "iPhone 8 Plus";
        break;
      case "iPhone10,3":
      case "iPhone10,6":
        deviceName =  "iPhone X";
        break;
      case "iPhone11,2":
        deviceName =  "iPhone XS";
        break;
      case "iPhone11,6":
        deviceName =  "iPhone XS MAX";
        break;
      case "iPhone11,8":
        deviceName =  "iPhone XR";
        break;
      case "iPhone12,1":
        deviceName =  "iPhone 11";
        break;
      case "iPhone12,3":
        deviceName =  "iPhone 11 Pro";
        break;
      case "iPhone12,5":
        deviceName =  "iPhone 11 Pro Max";
        break;
      case "iPhone12,8":
        deviceName =  "iPhone SE2";
        break;
      case "iPhone13,1":
        deviceName =  "iPhone 12 mini";
        break;
      case "iPhone13,2":
        deviceName =  "iPhone 12";
        break;
      case "iPhone13,3":
        deviceName =  "iPhone 12 Pro";
        break;
      case "iPhone13,4":
        deviceName =  "iPhone 12 Pro Max";
        break;

    // iPad
      case "iPad1,1":
        deviceName =  "iPad 1";
        break;
      case "iPad2,1":
      case "iPad2,2":
      case "iPad2,3":
      case "iPad2,4":
        deviceName =  "iPad 2";
        break;
      case "iPad3,1":
      case "iPad3,2":
      case "iPad3,3":
        deviceName =  "iPad 3";
        break;
      case "iPad3,4":
      case "iPad3,5":
      case "iPad3,6":
        deviceName =  "iPad 4";
        break;
      case "iPad6,11":
      case "iPad6,12":
        deviceName =  "iPad 5";
        break;
      case "iPad7,5":
      case "iPad7,6":
        deviceName =  "iPad 6";
        break;
      case "iPad7,11":
      case "iPad7,12":
        deviceName =  "iPad 7";
        break;
      case "iPad11,6":
      case "iPad11,7":
        deviceName =  "iPad 8";
        break;
      case "iPad4,1":
      case "iPad4,2":
      case "iPad4,3":
        deviceName =  "iPad Air";
        break;
      case "iPad5,3":
      case "iPad5,4":
        deviceName =  "iPad Air 2";
        break;
      case "iPad11,3":
      case "iPad11,4":
        deviceName =  "iPad Air 3";
        break;
      case "iPad13,1":
      case "iPad13,2":
        deviceName =  "iPad Air 4";
        break;
      case "iPad6,7":
      case "iPad6,8":
        deviceName =  "iPad Pro (12.9-inch)";
        break;
      case "iPad6,3":
      case "iPad6,4":
        deviceName =  "iPad Pro (9.7-inch)";
        break;
      case "iPad7,1":
      case "iPad7,2":
        deviceName =  "iPad Pro 2(12.9-inch)";
        break;
      case "iPad7,3":
      case "iPad7,4":
        deviceName =  "iPad Pro (10.5-inch)";
        break;
      case "iPad8,1":
      case "iPad8,2":
      case "iPad8,3":
      case "iPad8,4":
        deviceName =  "iPad Pro (11-inch)";
        break;
      case "iPad8,5":
      case "iPad8,6":
      case "iPad8,7":
      case "iPad8,8":
        deviceName =  "iPad Pro 3(12.9-inch)";
        break;
      case "iPad8,9":
      case "iPad8,10":
        deviceName =  "iPad Pro 2(11-inch)";
        break;
      case "iPad8,11":
      case "iPad8,12":
        deviceName =  "iPad Pro 4(12.9-inch)";
        break;

    // iPad mini
      case "iPad2,5":
      case "iPad2,6":
      case "iPad2,7":
        deviceName =  "iPad Mini 1";
        break;
      case "iPad4,4":
      case "iPad4,5":
      case "iPad4,6":
        deviceName =  "iPad Mini 2";
        break;
      case "iPad4,7":
      case "iPad4,8":
      case "iPad4,9":
        deviceName =  "iPad Mini 3";
        break;
      case "iPad5,1":
      case "iPad5,2":
        deviceName =  "iPad Mini 4";
        break;
      case "iPad11,1":
      case "iPad11,2":
        deviceName =  "iPad Mini 5";
        break;

    // iPod
      case "iPod1,1":
        deviceName =  "iPod Touch 1";
        break;
      case "iPod2,1":
        deviceName =  "iPod Touch 2";
        break;
      case "iPod3,1":
        deviceName =  "iPod Touch 3";
        break;
      case "iPod4,1":
        deviceName =  "iPod Touch 4";
        break;
      case "iPod5,1":
        deviceName =  "iPod Touch 5";
        break;
      case "iPod7,1":
        deviceName =  "iPod Touch 6";
        break;
      case "iPod9,1":
        deviceName =  "iPod Touch 7";
        break;

    // 模拟器
      case "i386":
        deviceName =  "iPhone Simulator";
        break;
      case "x86_64":
        deviceName =  "iPhone Simulator";
        break;
      default:
        deviceName = machineName;
        break;
    }
    return deviceName;
  }
}





