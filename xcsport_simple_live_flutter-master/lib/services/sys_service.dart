import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:fast_ai/config/app_info.dart';
import 'package:common_component/util/listeners/value_listener.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/api/net_proxy.dart';
import 'package:fast_ai/api/protocols/common/beted_match_gidm.dart';
import 'package:fast_ai/api/protocols/common/merchant_channel.dart';
import 'package:fast_ai/api/protocols/common/merchant_live_info.dart';
import 'package:fast_ai/api/protocols/common/play_type_double_line.dart';
import 'package:fast_ai/api/protocols/common/player_version_protocl.dart';
import 'package:fast_ai/api/protocols/merchantType/get_merchant_type_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/logo_config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/config/play_type_local.dart';
import 'package:fast_ai/config/sdk_params.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/flutter_sdk/fast_ai_sdk.dart';
import 'package:fast_ai/locales/en-us/en-us.dart';
import 'package:fast_ai/locales/th-th/th-th.dart';
import 'package:fast_ai/locales/vi-vn/vi-vn.dart';
import 'package:fast_ai/locales/zh-cn/zh-cn.dart';
import 'package:fast_ai/locales/zh-tw/zh-tw.dart';
import 'package:fast_ai/models/MerchantAppConfigModel.dart';
import 'package:fast_ai/models/many_name/lang_type.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/package/fastai_package.dart';
import 'package:fast_ai/performance/manager/logger_kit_manager.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/sdk_api/sdk_assets.dart';
import 'package:fast_ai/server/net_index_listener_server.dart';
import 'package:fast_ai/services/play_type_server.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image_manager.dart';
import 'package:fast_ai/utils/app_util.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter_sdk_games/config/game_sdk_config.dart';
import 'package:xc_package_info/xc_package_info.dart';

/* ------ 以下两个变量不要随便移动或编辑 ------ */
/// true-导出资源，商户进SDK需要下载资源，false-资源随SDK，商户进SDK不需要下载资源
const bool gExportAssets = true;
/// true-release模式打印log，false-不打印
const bool gReleaseShowLog = false;
/* ------ 以上两个变量不要随便移动或编辑 ------ */

class SysService {
  StreamSubscription<UserAccountDidUpdateEvent> _userAccountDidUpdateEvent;
  static SysService ins = new SysService();

  Future init() async {
    int sysInitStart = DateTime.now().millisecondsSinceEpoch;
    print('000-SysService init');
    NetProxySetting.netProxyConfig();
    await cmPackage.init();
    await aiPackage.init();
    // SDK参数获取路由要第一时间解析，不要随意修改
    if(isEmpty(config.sdkParams.token)&&!config.isApp){
       FastAiSdk.ins.hookProc();
       await Net.loginAnonymous();
    }

    if (AiCache.get() == null) await AiCache.init();
    config.userInfo.showIsDetailPage = false;

    //android默认不开启震动触感
    if (Platform.isAndroid &&
        AiCache.get()?.getBool(AiCache.vibrate_setting) == null) {
      AiCache.get()?.setBool(AiCache.vibrate_setting, false);
    }

    Event.eventBus.fire(AiCacheInitCompleteEvent());
    initMonitorNetwork();

    await initUserInfo();
    await SDKAsset.getAppDocsDirPath();
    await initVersionInfo();
    await initDeviceInfo();
    print('111-SysService init');
    print('555-SysService init');
    AiImageManager.init();
    // tab版没有引导页，首次进来需要自动同意高赔率与赔率改变
    await getMerchantAppConfig();

    print('666-SysService init');
    if (config.isApp) {
      if (AiCache.get().getBool(AiCache.force_modify_pwd) ?? false) {
        AiCache.get().setString("user_token", '');
        config.userInfo.token = '';
      }
    }

    if (isRelease()) {
      _userAccountDidUpdateEvent =
          Event.eventBus.on<UserAccountDidUpdateEvent>().listen((event) {
        if (NetIndexListenerServer.ins.didStart) return;
        NetIndexListenerServer.ins.start(); // 网络服务情况检测上传
      });
    }
    Net.getCurrencyExchange().then((value) {
      if (value.isSuccess) {
        config.currencyExchange = value.data;
      }
    });

    // init GAMESDK
    String _sdkType;
    String _appType;

    if (config.isApp) {
      _appType = config.appType;
    } else {
      _sdkType = config.sdkParams.sdkType;
      _appType = config.sdkParams.appType;
    }
    GameSDkConfig.ins.initGameSDK(
        sdkType: _sdkType,
        appType: _appType,
        onLogCallBack: (log) =>aiLog(tag: LogTag.gameSdkMsg, message: log ?? ''));

    print('777-SysService init 耗时：${DateTime.now().millisecondsSinceEpoch - sysInitStart}毫秒');
  }

//  Timer _merchantAppConfigTimer;
//  Timer _vmApiConfigTimer;
//  int repeatCount = 10;
  // 三合一接口
  Future<void> getMerchantAppConfig() async {
    //if (config.userInfo.isLogout()) return;//单体育：修复商户配置的平台id与用户设置的平台id不同时以商户为准

    var model = await Net.queryMerchantAppConfig();
    config.merchantAppConfig = model;
//    print('00-merchantAppConfig=${model?.toString()}');
//    if (model.isSuccess) {
//      // 加载logo配置
//      config.logoConfig = LogoConfig(
//          betFont: model.betFont,
//          loadingImage: model.loadingImage,
//          topLogo: model.topLogo);
//      String url = model?.loadingImage?.ai;
//      if (isNullOrEmpty(url)) {
//        AiCache.get().setString(AiCache.sdk_launch_url, '');
//      } else {
//        if (!url.startsWith("http")) {
//          if (url.startsWith('/'))
//            url = "${Api.baseImgUrl}$url";
//          else
//            url = "${Api.baseImgUrl}/$url";
//        }
//        config.merchantAppConfig.sdkLaunchUrl = url;
//        AiCache.get().setString(AiCache.sdk_launch_url, url);
//      }
//      print('00-sdk_launch_url=$url');
//      //加载商户平台数据源配置信息
//      reloadMerchantAppConfig(model);
//    }
//    else{
//      //BUG23008：获取厅的接口弱网后网络恢复，SDK没有加载出厅数据
//      reloadMerchantAppConfig(model);
//    }
    var resp = await Net.getBalance(walletId: config.userInfo.walletId);
    if (resp != null && resp.isSuccess) {
      config.userInfo.balance = resp;
    }
  }

//  void reloadMerchantAppConfig(MerchantAppConfigModel model){
//    //加载商户平台数据源配置信息
//    if (model.platformInfo == null || model.platformInfo.length <= 0) {
//      if (_merchantAppConfigTimer == null) {
//        _merchantAppConfigTimer?.cancel();
//        _merchantAppConfigTimer = Timer.periodic(Duration(seconds: 10), regetMerchantAppConfig);
//      }
//    } else {
//      _merchantAppConfigTimer?.cancel();
//      _merchantAppConfigTimer = null;
//      SportPlatform.ins.setPlatformInfos(model.platformInfo);
//    }
//  }

//  void regetMerchantAppConfig(timer) {
//    getMerchantAppConfig();
//  }

  /// 资源下载完成后 tab版初始化完后要移除原生全屏广告(广告页面有下载SDK资源的逻辑)
  Future<void> tabSDKInitFinish() async {
    print('00-tabSDKInitFinish, sdkAssetsQuery=${config.sdkAssetsModel.sdkAssetsQuery}');
    if (!config.isTabSDK) return;

    await sleep(1000);
    if (!config.sdkAssetsModel.sdkAssetsQuery || config.isGbet || config.is365 || config.isVs) { // 188不需要下载资源
      print('11-tabSDKInitFinish');
      // 资源已下载或无需下载资源，通知原生移除下载页，展示flutter页面
      config.sdkParams.showTabBarOnLoading = false;
      XcSdkApi.downloadAssets(progress: '1.0', isDownloadEnd: 'true', tag: '${config.sdkParams.page}');
    }
  }

  Future getLangJson() async {
    String lang = Translations.langCode; // zh-cn

    //本地先存一份玩法
    zhCn['baseLang']['wf'] = playTypeLocal;
    zhTw['baseLang']['wf'] = playTypeLocal;
    enUs['baseLang']['wf'] = playTypeLocal;
    viVn['baseLang']['wf'] = playTypeLocal;
    thTh['baseLang']['wf'] = playTypeLocal;
    zhCn['baseLang']['wf'] = playTypeLocal;

    final appInfo = AppInfo();
    String version = appInfo.versionName;
    //语言包路径
    String newJsonUrl = '/app/lang/lang-$lang-min-$version.json';

    String ranDom = '?r=' + Random().nextInt(10000).toString();
    String urlPre = Api.baseImgUrl + newJsonUrl + ranDom;
    Response response;
    try {
      response = await Dio().get(urlPre);
    } catch (e) {
       //加载玩法
        PlayTypeServer.ins.init();
        //加载ratioType配置
        getRatioType();
    }

    if (!isStrNullOrEmpty(response?.data) && response.data.length > 3) {
      if (lang == AiLangType.cn) {
        zhCn= response.data;
      } else if (lang == AiLangType.th) {
        thTh = response.data;
      } else if (lang == AiLangType.vn) {
        viVn = response.data;
      } else if (lang == AiLangType.tw) {
        zhTw = response.data;
      } else if (lang == AiLangType.en) {
        enUs = response.data;
      } else {
        zhCn = response.data;
      }
       //加载玩法
        PlayTypeServer.ins.init();
    }
    //重新加载与语言
    reloadLang();
  }

  Future getRatioType() async {
    String lang = Translations.langCode; // zh-cn
    String newJsonUrl = '/app/lang/ratiotype-$lang-min.json';

    String ranDom = '?r=' + Random().nextInt(10000).toString();
    String urlPre = Api.baseImgUrl + newJsonUrl + ranDom;
    Response response;
    try {
      response = await Dio().get(urlPre);
    } catch (e) {}

    if (!isStrNullOrEmpty(response?.data) && response.data.length > 1000) {
      if (lang == AiLangType.cn) {
        zhCn['radioTypeLang'] = response.data;
      } else if (lang == AiLangType.th) {
        thTh['radioTypeLang'] = response.data;
      } else if (lang == AiLangType.vn) {
        viVn['radioTypeLang'] = response.data;
      } else if (lang == AiLangType.tw) {
        zhTw['radioTypeLang'] = response.data;
      } else if (lang == AiLangType.en) {
        enUs['radioTypeLang'] = response.data;
      } else {
        zhCn['radioTypeLang'] = response.data;
      }
    }
  }

  void reloadLang(){
    String appLang = AiCache.get().getString(AiCache.app_language);
    if(isEmpty(appLang)){
      Translations.load(Translations.current.locale);
    }else{
      if(appLang.contains('-')){
        var appLangs =  appLang.split('-');
        if(appLangs.length > 1){
          Translations.load(Locale.fromSubtags(languageCode: appLangs[0],countryCode: appLangs[1]));
        }else{
          Translations.load(Locale.fromSubtags(languageCode: appLang));
        }
      }else{
        Translations.load(Locale.fromSubtags(languageCode: appLang));
      }
    }
    if(cmPackageConfig.timeZoneConfig.useDefault){
      cmPackageConfig.timeZoneConfig.selectTimeZoneWithLang(Translations.langCode);
    }

  }


  /* --------------------------- SDK相关 --------------------------- */
  void initSdkInfo() {
    if (config?.sdkApi != null) return;
    print('00-initSdkInfo');

    print('window.defaultRouteName=${window.defaultRouteName}');
    if (window.defaultRouteName != '/') {
      config.sdkParams = SdkParams.parse(window.defaultRouteName);
      print('app config = ${window.defaultRouteName}');
      config.sdkApi = XcSdkApi();
    }
  }

//  Future queryMerchantType() async {
//    if(config.isApp && !config.userInfo.isLogout()) return;
//
//    var time = DateTime.now().millisecondsSinceEpoch;
//    print('00-queryMerchantType, time=$time');
//    try{ // SDK判断是否是小金商户，小金商户只能展示188页面
//      var resp = await GetMerchantTypeProtocol().request();
//      print('00-GetMerchantTypeProtocol-sourceType=${resp?.sourceType}');
//      //商户接入类型：ai-1、小金-3
//      if((resp?.isSuccess ?? false) && resp.sourceType == 3) { // 只展示Gbet/188
//        config.appType = AppType.Gbet;
//        config.sdkParams.appType = AppType.Gbet;
//      }
//    }
//    catch(e) {
//      config.appType = AppType.Ai;
//      config.sdkParams.appType = AppType.Ai;
//      print('00-GetMerchantTypeProtocol-error=${e.toString()}');
//    }
//    print('11-queryMerchantType, time=${DateTime.now().millisecondsSinceEpoch-time}');
//  }

  Future initMonitorNetwork() async {
    await config.startMonitorNetwork();
  }

  Future initVersionInfo() async {
    var info = await XcPackageInfo.fromPlatform();
    config.appInfo.versionName = info.version;
    config.appInfo.versionCode = int.tryParse(info.buildNumber);
    config.appInfo.androidPackage = info.packageName;

    config.appInfo.iosBunleId = info.packageName;
    config.appInfo.iosVersion = info.version;
    config.appInfo.iosBundleVersion = info.buildNumber;
    config.appInfo.userInterfaceIdiom = info.userInterfaceIdiom;
  }

  Future versionStatistics() async {
    PlayerVersionReqProtocol req = PlayerVersionReqProtocol();
    await req.request();
  }

  Future initDeviceInfo() async {
    print('000-initDeviceInfo');
    if (Platform.isAndroid) {
      config.androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
    } else {
      config.iOSDeviceInfo = await DeviceInfoPlugin().iosInfo;
    }
    print('111-initDeviceInfo');
  }

//  GetConfigNewReqProtocol getBetSettingReq = GetConfigNewReqProtocol();
//  CollectListReqProtocol collectListReq = CollectListReqProtocol();
  PlayTypeDoubleLineReqProtocol playTypeDoubleLineReq =
      PlayTypeDoubleLineReqProtocol();

  BetedMatchGidmReqProtocol betedMatchGidmReq = BetedMatchGidmReqProtocol();
  MerchantLiveInfoReqProtocol merchantLiveInfoReq =
      MerchantLiveInfoReqProtocol();

  ValueListener onDoubleLinePlayType = new ValueListener(); // 双线。。。

  Future initUserInfo({bool isInitBaseInfo = true}) async {
    if (isInitBaseInfo) {
      //匿名状态也需要加载玩法名称，需要切换的双线玩法
      if (!config.userInfo.isLogout() ||
          config.userInfo.isAnonymousToken ||
          config.isFastAiSdk ||
          config.isFlutterSdk) {
        //加载语言包
        getLangJson();
        //模块控制
        getModuleConfig();
      }
    }
    if (!config.userInfo.isLogout()) {
      try {
        // 商户主播logo信息
        merchantLiveInfoReq.request().then((model) {
          config.userInfo.merchantLiveInfo['liveName'] = model.liveName;
          config.userInfo.merchantLiveInfo['liveLogo'] = model.liveLogo;
        });
      } catch (e) {
        print(e);
      }
    }
  }

  // 模块配置开关
  void getModuleConfig() {
    ModuleSwitch.getInstance().startTimerModuleConfig();
  }

//  //频道类型：1.世界频道、2商户频道
//  Future loadMerchantChannel() async {
//    try {
//      var rsp = await MerchantChannelReqProtocol().request();
//      if(rsp.isSuccess){
//        config.merchantChannel = rsp.channelType;
//        print('');
//      }
//      else{
//       Future.delayed(Duration(seconds: 10),(){
//         loadMerchantChannel();
//       });
//      }
//    } catch (e,s){
//      print('loadMerchantChannel---失败');
//    }
//  }

}
