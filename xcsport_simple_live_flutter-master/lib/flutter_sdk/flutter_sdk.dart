
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/api/net_host_service.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/flutter_sdk/fast_ai_sdk.dart';
import 'package:fast_ai/services/sys_service.dart';
import 'package:fast_ai/utils/model_controller_builder.dart';

class FlutterSdk {
  //
  //FlutterSdk入口, 用于Sdk的初始化工作
  //
  static Future init() async {
    Config.ccPackage = 'fast_ai'; // sdk 插件页面
    //Config.kPackage = 'ld_classic_flutter'; // kvien团队插件页面

    config.isFlutterSdk = true;
    config.enableAnonymous = true;
    await SysService.ins.init();
    await Net.loginAnonymous();
  }

  static initHostType(HostType hostType){
    NetHostService.ins.currentType = hostType;
  }

  //更新用户token信息
  static Future updateUserToken(String token) async {
    config.userInfo.token = token;
  }

  //是否为匿名账号在工作
  static bool get isAnonymousToken{
    return config.userInfo.isAnonymousToken;
  }

  //是否用户账已经的工作
  static bool get isLogined{
    if(isAnonymousToken)return false;
    return !config.userInfo.isLogout();
  }

  //注销用户
  static Future logout() async {
    await Net.loginAnonymous();
  }

  static VoidListener tokenVaildEvent = new VoidListener();
  //tooken失败处理
  static Future tokenVaildProc(String reqTooken)async{
    if(config.userInfo.token != reqTooken)return;
    //token无效后，先使用匿名账号先工作
    await config.userInfo.logout();
    await Net.loginAnonymous();
    //通知Sdk使用方需要更新用户的token信息
    FastAiSdk.sdkCallback.tokenExpire();
    tokenVaildEvent.fire();
  }
}


