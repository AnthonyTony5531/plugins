import 'dart:io';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'config.dart';


//网络请求参数配置
class ApiConfig {
  static String MerchantId = "038f3e1d118e41c9a248f045701a37b4";
  static const String Password = "0b6e845fefdbe3434d47ba789e6e548b";
  static const num apiVer = 4.04;

  //公共请求头部部分
  var _header = Map<String, String>();

  Map<String, String> get headers {
    if (_header.isEmpty) {
      _header['Referer'] = Api.baseUrl;
      _header['Content-Type'] = 'application/json';
      //1:pc、2:h5、3:ios、4:android、5:Gbet-h5、6:Gbet-ios、7Gbet-安卓、8Gbet-pc、9虚拟体育pc、10虚拟体育h5、11虚拟体育ios、12虚拟体育安卓
      String terType = Platform.isAndroid ? (config.isVs ? '12' : config.isGbet ? '7' : '4') : (config.isVs ? '11' : config.isGbet ? '6' : '3');
      _header['terType'] = terType;
      _header['User-Agent'] =
          'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.25 Mobile Safari/537.36';
    }
    if (!config.userInfo.isLogout()) {
      _header['token'] = config.userInfo.token;
    }
    _header['lang'] = Translations.langCode;
    _header['apiVer'] = '$apiVer';
    _header['groupId'] = '${config.userInfo.sportPlatformId}';
    _header['wid'] = '${config.userInfo.walletId}';
    String merchantId = config?.merchantAppConfig?.merchantId ?? '';
    // BUG:25722 前端标头传参merchantId  去除 ，有安全隐患 （后端已经调整逻辑，无需改字段了）
//    _header['merchantId'] = merchantId.isNotEmpty ? merchantId : '${(config?.userInfo?.account?.data?.merchantId ?? '')}';
    String version = config?.appInfo?.appVersion ?? '';
    if(version.isNotEmpty && version != '1.1.0'){
      if(config.isFastAiSdk){
        _header['version'] = config.appInfo.appVersion + '|' + config.userInfo.fastAIVersion;
      }
      else{
        _header['version'] = config.appInfo.appVersion;
      }
    }
    _header['sdkVer'] = config?.sdkAssetsModel?.sdkVersion ?? '';
    if(kDebugMode){
       _header['sdkVer'] = '3.19.2';
       _header['version'] =  _header['sdkVer'];
    }
    String randomStr = XCStompUtils.randomNumber(len: 16);
    DateTime dateTime = DateTime.now();
    var fmt = DateFormat("yyyyMMddHHmmss");
    String dateStr = randomStr.substring(1, 6) +
        fmt.format(dateTime) +
        dateTime.millisecondsSinceEpoch.toString() +
        randomStr.substring(1, 8);
    String guid = dateStr.substring(0, 36);
    _header['reqId'] = guid;
    return _header;
  }
}
