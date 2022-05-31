import 'dart:io';

import 'package:common_component/util/listeners/void_listener.dart';
import 'package:fast_ai/api/net_host.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/skins/custom_style.dart';
import 'package:fast_ai/flutter_sdk/fast_ai_sdk.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';

class FastAiSdkParams {
  String merchantType;
  String baseIMUrl;
  String baseMainUrl;
  String baseImgUrl;
  String videoUrl;
  String token;
  // 友盟统计AppKey
  String androidAppKey;
  String iosAppKey;
  String channel;
  String cloudCustomerService;
  Map<String, Widget> widgets;
  String appType;
  bool hideMineNav;
  bool get showCloudCustomerService => cloudCustomerService == '1';
  /// 新体育用户头像
  String avatar;
  /// 188-余额/头像改变通知
  VoidListener userInfoChanged = VoidListener();

  FastAiSdkParams();
  FastAiSdkParams.parse(Map<String, dynamic> params) {
    if (params == null || params == {}) return;
    try {
      var aiJson = AiJson(params);

      var themeStyle = aiJson.getNum(ThemeColor188.themeStyleKey);
      var themeColor = aiJson.getString(ThemeColor188.themeColorKey);
      var auxiliaryColor = aiJson.getString(ThemeColor188.auxiliaryColorKey);
      var fontColor = aiJson.getString(ThemeColor188.fontColorKey);
      if(isNotEmpty(themeColor) || isNotEmpty(auxiliaryColor) || isNotEmpty(fontColor)) {
        ThemeColor188.update(theme: {
          ThemeColor188.themeStyleKey : themeStyle, // 1,
          ThemeColor188.themeColorKey : themeColor,//'#FF8446',
          ThemeColor188.auxiliaryColorKey : auxiliaryColor,//'#505050',
          ThemeColor188.fontColorKey : fontColor,//'#FFCC00',
        });
      }

      avatar = aiJson.getString('avatar');
      merchantType = aiJson.getString("merchantType");
      appType = aiJson.getString("appType", defaultValue: AppType.Ai);
      if(!AppType.allAppTypes.contains(appType)) appType = AppType.Ai;
      if(appType == AppType.Live188) {
        appType = AppType.Gbet;
      }
      config.appType = appType;
      hideMineNav = aiJson.getBool("hideMineNav", defaultValue: false);
//      baseIMUrl = aiJson.getString("imUrl");
//      baseImgUrl = aiJson.getString("imgUrl");
//      baseMainUrl = aiJson.getString("mainUrl");
      baseIMUrl = aiJson.getString("merchantAppPushPath");
      baseImgUrl = aiJson.getString("merchantAppImgPath");
      baseMainUrl = aiJson.getString("webHomePagePath");
      videoUrl = aiJson.getString('videoUrl');
      token = aiJson.getString("token");
      androidAppKey = aiJson.getString("androidAppKey");
      iosAppKey = aiJson.getString("iosAppKey");
      channel = aiJson.getString("channel");
      config.sdkParams.umAppKey = Platform.isIOS ? iosAppKey : androidAppKey;
      config.sdkParams.umChannel = channel;
      cloudCustomerService = aiJson.getString("cloudCustomerService");
      if (isNotEmpty(androidAppKey) && isNotEmpty(iosAppKey)) {
        config.iosAppKey = iosAppKey;
        config.androidAppKey = androidAppKey;
        config.umChannel = isNotEmpty(channel) ? channel : 'umengNewSport';
        print(
            '00-FastAiSdkParams-parse-iosAppkey=$iosAppKey, androidAppkey=$androidAppKey');
      }
      if (!isNullOrEmpty(merchantType)) {
        config.merchantType = merchantType;
      }
      widgets = aiJson.getMap('widgets');

      config.customStyle = CustomStyle.parse(aiJson.getMap('style'));

      if (baseIMUrl != null) NetHost.BASE_IM_URL = baseIMUrl;
      if (baseImgUrl != null) NetHost.BASE_IMG_URL = baseImgUrl;
      if (baseMainUrl != null) NetHost.BASE_MAIN_URL = baseMainUrl;

      config.userInfo.token = token;
      print('sdk-token=$token token正常赋值');
    } catch (e) {
      print("_test sdk 入参出错！$e");
    }
  }

  void updateDomainUrls(Map<String, dynamic> params) {
    var aiJson = AiJson(params);
    baseIMUrl = aiJson.getString("imUrl");
    baseImgUrl = aiJson.getString("imgUrl");
    baseMainUrl = aiJson.getString("mainUrl");
    NetHost.BASE_IM_URL = baseIMUrl;
    NetHost.BASE_IMG_URL = baseImgUrl;
    NetHost.BASE_MAIN_URL = baseMainUrl;
    print('00-updateDomainUrls');
  }

  var _blockedLock;
  bool canRetry = true;
  int get retryTimeCount => 60 * 1000;
  // 域名异常 通知新体育重新拉取JSON配置
  void onDomainBlocked() async {
    if (!config.isFastAiSdk) return;

    if (_blockedLock == null) _blockedLock = Lock();
    print('00-onDomainBlocked');
    _blockedLock.synchronized(() async {
      print('11-onDomainBlocked');
      if (!canRetry) return;
      canRetry = false;

      FastAiSdk.sdkCallback.onDomainBlocked();
      await sleep(retryTimeCount);

      canRetry = true;
    });
    print('22-onDomainBlocked');
  }
}
