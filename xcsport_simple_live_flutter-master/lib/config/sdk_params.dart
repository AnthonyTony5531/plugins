import 'dart:convert';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/api/net_host.dart';
import 'package:fast_ai/api/net_host_service.dart';
import 'package:fast_ai/config/api_config.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';

/*
 *********************************************************************
 * author:Sam
 * date:2019-12-27
 **********************************************************************
 */

class TabSdkPage {
  /// 主页
  static const main = 'mainPage';

  /// 投注列表
  static const betList = 'memberBettingPage';
}

class SdkParams {
  /// TAB SDK
  static const SDKTypeInline = 'sdk_Inline';

  /// ICON SDK
  static const SDKTypeDefault = 'sdk_default';

  String baseIMUrl;
  String baseMainUrl;
  String baseImgUrl;
  String videoUrl;
  String token;

  /// App类型：AI，Gbet，VS，356...
  String appType = AppType.Ai;

  /// 列表样式：0/不传/空-手动设置 1 小白 2 老鸟 -3 清爽，
  int listStyle = 0;

  /// tab版页面id
  String page;
  String sdkType;
  String merchantId;

  String gidm;
  String anchorId;
  String sportPlatform;

  /// 初始化中使用，用于强制设置数据源类型
  int sportPlatformId = 1;

  String _launchTitle = '';

  String get launchTitle {
    if (isStrNullOrEmpty(_launchTitle) || config.isInternational) {
      return 'AISports';
    }
    return _launchTitle;
  }

  List<String> _launchSubTitles = [];

  List<String> get launchSubTitles {
    if (config.isInternational) {
      if (_launchSubTitles == null || _launchSubTitles.isEmpty) {
        return AiCache.sdk_launch_subtitles_default_value_en;
      }
    }
    if (_launchSubTitles != null && _launchSubTitles.isNotEmpty) {
      return _launchSubTitles;
    }
    if (_launchSubTitles == null) {
      var subTitles =
          AiCache?.get()?.getStringList(AiCache.sdk_launch_subtitles);
      if (subTitles != null) {
        _launchSubTitles = subTitles;
        return _launchSubTitles;
      }
    }
    String appLang = AiCache.get()?.getString(AiCache.app_language);
    if (isNullOrEmpty(appLang)) {
      return AiCache.sdk_launch_subtitles_default_value_en;
    }
    return AiCache.sdk_launch_subtitles_default_value;
  }

  bool showRecharge = false, showCash = false, showTransfer = false;
  bool showEnter = false;
  bool handledSysRepair = false;
  bool handledTimeout = false;
  bool showTabBarOnLoading = false;
  bool useSdkPermissionCtrl = false;

  /// 友盟AppKey由宿主App传入，内部SDK Demo App使用
  String umAppKey;
  String umChannel;

  /// 默认使用宿主App里的AppKey
  bool useInnerUmAppKey = false;


  DetailParams get detailParams => isNotEmpty(anchorId)
      ? DetailParams(
          gidm: gidm,
          anchorId: anchorId,
          playPriority: PlayPriority.anchor,
          type: '1')
      : DetailParams(gidm: gidm);
  bool get needShowDetailPage => isNotEmpty(gidm);
  SdkParams();
  SdkParams.parse(String json) {
    print('sdk-input-params:$json');

    try {
      var aiJson = AiJson(jsonDecode(json));
      listStyle = aiJson.getNum("listStyle", defaultValue: 0);
      appType = aiJson.getString("appType", defaultValue: AppType.Ai);
      if (!AppType.allAppTypes.contains(appType))
        appType = AppType.Ai; // 异常appType
      if (appType == AppType.Live188) {
        appType = AppType.Gbet;
      }
      config.appType = appType;
      baseIMUrl = aiJson.getString("imUrl");
      baseImgUrl = aiJson.getString("imgUrl");
      baseMainUrl = aiJson.getString("mainUrl");
      videoUrl = aiJson.getString('videoUrl');
      sdkType = aiJson.getString("sdkType");
      token = aiJson.getString("token");
      merchantId = aiJson.getString("merchantId");
      showRecharge = aiJson.getBool('showRecharge');
      showCash = aiJson.getBool('showCash');
      page = aiJson.getString('page');
      showTransfer = aiJson.getBool('showTransfer');
      handledSysRepair = aiJson.getBool('handledSysRepair');
      handledTimeout = aiJson.getBool('handledTimeout');
      showTabBarOnLoading = aiJson.getBool('showTabbarOnLoading');
      useSdkPermissionCtrl =
          aiJson.getBool('useSdkPermissionCtrl', defaultValue: false);
      sportPlatform = aiJson.getString('sportPlatform');
      gidm = aiJson.getString('gidm'); // AI：ib_4483685  BI：sd_4483685
      anchorId = aiJson.getString('anchorId');
      umAppKey = aiJson.getString('umAppKey');
      umChannel = aiJson.getString('umChannel');
      useInnerUmAppKey = aiJson.getBool('useInnerUmAppKey') ?? false;

      if (needShowDetailPage) {
        sdkType = SDKTypeDefault; // 直接跳详情主播使用icon版UI，以便返回到商户页面
      }
      if (isNotEmpty(sportPlatform)) {
        try {
          sportPlatformId = int.parse(sportPlatform);
          sportPlatformId = sportPlatformId == 1 ? 1 : 2;
        } catch (e) {
          print('sportPlatform=$sportPlatform 解析异常 e=$e');
        }
      } else {
        if (isNotEmpty(gidm)) sportPlatformId = gidm.startsWith('ib') ? 1 : 2;
      }

      showEnter = showRecharge || showCash || showTransfer;

      if (baseIMUrl != null) NetHost.BASE_IM_URL = baseIMUrl;
      if (baseImgUrl != null) NetHost.BASE_IMG_URL = baseImgUrl;
      if (baseMainUrl != null) NetHost.BASE_MAIN_URL = baseMainUrl;

      _launchTitle = aiJson.getString("launchTitle");
      if (isNotEmpty(_launchTitle)) {
        AiCache.get().setString(AiCache.sdk_launch_title, _launchTitle);
      } else {
        _launchTitle = AiCache.sdk_launch_title_default_value;
      }

      print("sdk launchSubTitles parse start");
      try {
        _launchSubTitles = aiJson
            .getArray('launchSubTitles')
            .map((s) => s.toString())
            .toList();
      } catch (e) {
        _launchSubTitles = null;
        print("sdk launchSubTitles parse error:$e");
      }
      if (_launchSubTitles != null && isNotEmpty(_launchSubTitles)) {
        AiCache.get()
            .setStringList(AiCache.sdk_launch_subtitles, _launchSubTitles);
      }
      //else {
      //  _launchSubTitles = AiCache.sdk_launch_subtitles_default_value;
      //}
      print("sdk launchSubTitles parse end");

      print('sdk-showRecharge=$showRecharge');
      print('sdk-showCash=$showCash');
      print('sdk-showTransfer=$showTransfer');
      print('sdk-showEnter=$showEnter');
      print('sdk-token=$token');
      print('sdk-BASE_IM_URL=$baseIMUrl');
      print('sdk-BASE_IMG_URL=$baseImgUrl');
      print('sdk-BASE_MAIN_URL=$baseMainUrl');
      print('sdk-gidm=$gidm');
      print('sdk-anchorId=$anchorId');
      print('sdk-sportPlatform=$sportPlatform');
      print('sdk-launchTitle=$_launchTitle');
      print('sdk-launchSubTitles=${_launchSubTitles?.toString()}');

      config.userInfo.token = token;
      print('sdk-token=$token token正常赋值');
    } catch (e) {
      print("_test sdk 入参出错！$e");
    }
  }

  SdkParams.sport(){
    baseMainUrl = NetHostService.ins.current.BASE_MAIN_URL;
    baseImgUrl = NetHostService.ins.current.BASE_IMG_URL;
    baseIMUrl = NetHostService.ins.current.BASE_IM_URL;
    token = '';

  }

  SdkParams.simulate(String token,
      {HostType hostType = HostType.Dev,
      String sdkVersion = '3.7.0',
      sdkType = SDKTypeDefault}) {
    try {
      this.token = token;
      this.sdkType = sdkType;
      NetHostService.ins.currentType = hostType;

      baseMainUrl = NetHostService.ins.current.BASE_MAIN_URL;
      baseImgUrl = NetHostService.ins.current.BASE_IMG_URL;
      baseIMUrl = NetHostService.ins.current.BASE_IM_URL;
      merchantId = ApiConfig.MerchantId;

      NetHost.BASE_MAIN_URL = baseMainUrl;
      NetHost.BASE_IM_URL = baseIMUrl;
      NetHost.BASE_IMG_URL = baseImgUrl;

      sportPlatform = '1';
      sportPlatformId = 1;
      _launchTitle = 'AI体育';
      _launchSubTitles = [
        "添加喜爱的比赛，不错过每一次的精彩！",
        "冰淇淋化了就回不来了，喜爱的比赛也是",
        "努力爬上排行榜，让大家见证你的荣光吧！",
        "独乐乐不如众乐乐，呼朋唤友一起来玩！",
        "给自己一个小目标，先赢他一个亿！",
        "比赛详情页右滑进入聊天室，大神陪你一起看球！",
        "你还记得儿时的梦想吗？",
        "适度游戏益脑，沉迷游戏伤身",
        "比赛详情页上下滑可以切换比赛"
      ];

      print(
          'baseMainUrl=$baseMainUrl, baseImgUrl=$baseImgUrl, baseIMUrl=$baseIMUrl');
      config.userInfo.token = token;
      print('SdkParams.simulate end');
    } catch (e) {
      print('SdkParams.simulate error=$e');
    }
  }
}

///
/// sdk向外暴露设置ui主题的类型
///
class UiThemeStyle {
  /// [ 'laoniao','concise','xiaobai']
  static const int laoniao = 2;
  static const int concise = 3;
  static const int xiaobai = 1;
  static const int none = 0;

  /// 检验指定主题是否支持
  static bool isValidThemeStyle(int themeStyle) {
    if ([laoniao, concise, xiaobai].contains(themeStyle)) {
      return true;
    } else {
      return false;
    }
  }

  static int  getThemeStyle(){
    if(config.isInternational){
       return  concise -1; 
    }
    if(config.sdkParams.listStyle == 0 ){
      return laoniao -1;
    }
    return config.sdkParams.listStyle -1;
  }

  static int change2Int(String themeStyle) {
    if ('laoniao' == themeStyle?.toLowerCase()) {
      return laoniao;
    } else if ('concise' == themeStyle?.toLowerCase()) {
      return concise;
    } else if ('xiaobai' == themeStyle?.toLowerCase()) {
      return xiaobai;
    } else {
      return none;
    }
  }
}
