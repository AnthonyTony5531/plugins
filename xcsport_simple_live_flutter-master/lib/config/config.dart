/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-21
 * 说明：
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'dart:ui';

import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/protocols/chatroom/redbag_protocol.dart';
//import 'package:fast_ai/api/protocols/chatroom/redbag_protocol.dart';
import 'package:fast_ai/config/device.dart';
import 'package:fast_ai/config/game_date.dart';
import 'package:fast_ai/config/lang_config/lang_config.dart';
import 'package:fast_ai/config/logo_config.dart';
import 'package:fast_ai/config/nodata_config.dart';
import 'package:fast_ai/config/sdk_params.dart';
import 'package:fast_ai/config/skins/custom_style.dart';
import 'package:fast_ai/config/skins/skin.dart';
import 'package:fast_ai/config/vm_sport_config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/flutter_sdk/fast_ai_sdk_params.dart';
import 'package:fast_ai/locales/zh-cn/zh-cn.dart';
import 'package:fast_ai/models/MerchantAppConfigModel.dart';
import 'package:fast_ai/models/currency_exchange_model.dart';
import 'package:fast_ai/models/many_name/lang_type.dart';
import 'package:fast_ai/models/virtual_sport_type_model.dart';
import 'package:fast_ai/pages/container_page_scroll_status_manager.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/sdk_api/sdk_assets_model.dart';
import 'package:fast_ai/services/asset_service.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'api_config.dart';
import 'app_info.dart';
import 'fiexd_config.dart';
import 'sqlite_config.dart';
import 'user_info.dart';
import 'user_session.dart';

enum XCNetworkState { wifi, mobile, none }

enum SecondMenuTheme { light, dark }



class AppType {
  static const String Ai = 'ai';
  @deprecated
  static const String Live188 = 'live188'; // live188和Gbet为同一个App类型，仅仅是前期和后期叫法不统一
  static const String Gbet = 'Gbet'; // live188和Gbet为同一个App类型，仅仅是前期和后期叫法不统一
  static const String VMSports = 'vmSports';
  /// 小游戏
  static const String miniGame = 'miniGame';
  static const String Bet365 = 'bet365';
  static List<String> get allAppTypes => [Ai, Gbet, VMSports, miniGame, Bet365, Live188];
}

class Config {

  String get freeAnchorGame => '小游戏';

  bool sdkWillExit = false;

  //投注时使用
  String get orderSource => isGbet ? 'NXJ' : 'AI';
  //是否打开時區功能
  bool openTimeZoneOffset = false;

  /// App类型，打包脚本会检索并修改此行，请不要编辑修改或删除！！！
  String appType = AppType.Ai;

  /// 是Gbet原名Live188
  bool get isGbet => appType == AppType.Gbet || appType == AppType.Live188;

  /// 是虚拟体育
  bool get isVs => appType == AppType.VMSports;

  /// 是Bet65
  bool get is365 => appType == AppType.Bet365;

  /// 是AI体育
  bool get isAi => appType == AppType.Ai;

  double _aiBuildVersion;
  //AI 的发布版本
  double get aiBuildVersion{
    if(_aiBuildVersion != null){
      return _aiBuildVersion;
    }
    List<String> versondata = config.appInfo.appVersion.split('.');
    _aiBuildVersion  =  double.tryParse("${versondata[0]}.${versondata[1]}");
    return _aiBuildVersion;
  }

  static final String appName = Api.packageType ? config.langMap['baseLang']['config']['appName'][0] : config.langMap['baseLang']['config']['appName'][1];
  static String ccPackage; // App与SDK默认为null，cc项目修改为：fast_ai
  static String kPackage; // App与SDK默认为null，cc项目修改为：ld_classic_flutter  (kvien)


  final appInfo = AppInfo();

  final platformChannel = MethodChannel("xc.channal/main_page");
  final methodChannel = MethodChannel('xc_sdk_api/method');
  final eventChannel = EventChannel('xc_sdk_api/event');
  final tabPermissionChannel = MethodChannel('xc_sdk_api/permission');

  /// 详情界面当前主播类型
  AnchorType anchorType = AnchorType.none;
  bool get isGameAnchor => anchorType == AnchorType.game;
  bool get isFreeAnchor => anchorType == AnchorType.free;

  // 临时使用-临时方法，有时间再优化
  bool quickTap = false;

  //刷新页面
  final freshPageChannel = BasicMessageChannel('xc_sdk_api/fresh_page', StandardMessageCodec());
  XcSdkApi sdkApi;

  //原生sdk
  SdkParams sdkParams = SdkParams();

  //flutter sdk
  FastAiSdkParams fastAiSdkParams = FastAiSdkParams();

  /// 是否是新体育
  bool get isNSports => isFastAiSdk || ccPackage == 'fast_ai';
  bool isFastAiSdk = false;

  // 收藏视频浮窗
  static OverlayEntry overlayEntry;

  /// 爆料列表-选择器
  //static OverlayEntry selectorOverlayEntry;

  //商户类型，1=AI-SDK，2=AI-新体育,3=188新体育，4=188SDK
  String merchantType = '1';
  int merchantChannel = 1; // 频道类型：1.世界频道、2商户频道
  //用户信息配置
  var userInfo = UserInfo();

  /// 语言包，如不支持多语言，默认加载简体中文json
  Map get langMap {
    return Translations.current?.langMap ?? zhCn;
  }

  /// 获取多语言文案
  /// 之前：config.langMap['baseLang']['page']['tapRefresh']
  /// 现在：config.textByPath('page.tapRefresh')
  String textByPath(String path, [String defaultValue='']) {
    return AiJson(baseLang).getString(path, defaultValue: defaultValue);
  }

  Map get baseLang => langMap['baseLang'];

  bool get isCnLang => ((Translations.langCode ?? AiLangType.cn) == AiLangType.cn); // 是否配置多语言，为中文时则不请求多语言接口
  bool get isVnLang => ((Translations.langCode ?? AiLangType.vn) == AiLangType.vn); // 越南语
  bool get isThLang => ((Translations.langCode ?? AiLangType.th) == AiLangType.th); // 泰语
  bool get isEnLang => ((Translations.langCode ?? AiLangType.en) == AiLangType.en); // 英语
  bool get isTwLang => ((Translations.langCode ?? AiLangType.tw) == AiLangType.tw); // 繁体
  bool get isCnTwLang => isCnLang || isTwLang;
  bool get isNotCnTwLang => !isCnLang && !isTwLang;

  // 是否,需要判断多语言图片
  bool get isNeedInternationalImg {
    // 中文都不使用国际化
    if (!(AiLangType.cn == Translations.langCode) || (AiLangType.tw == Translations.langCode) && isInternational) {
      return true;
    }
    return false;
  }

  //存储配置
  var db = SqliteConfig.ins;

  //本地支持的体育数据
  List<String> localSupportSports = ['FT', 'BK', 'TN'];

  //用户话信息
  var session = UserSession();

  //固定配置
  final fiexd = FiexdConfig();


  //比赛时间存储
  final gameDate = GameDate();


  //无数据
  final nodata = NodataConfig();

  /// 设备信息
  final device = Device();

  //跑马灯的Timer控制开关. 因为tabview中的widget在切换的并不会dispose
  bool isHorseTimer = true;

  /// App标记
  bool get isApp => (window?.defaultRouteName == '/' || isEmpty(window?.defaultRouteName)) && isEmpty(config?.sdkParams?.token) || (isNotEmpty(Config.ccPackage) && config.isFastAiSdk);

  /// TAB版SDK
  bool get isTabSDK => config.sdkParams?.sdkType == SdkParams.SDKTypeInline || (window?.defaultRouteName?.contains(SdkParams.SDKTypeInline) ?? false);

  /// ICON版SDK
  bool get isIconSDK => config.sdkParams?.sdkType == SdkParams.SDKTypeDefault || (window?.defaultRouteName?.contains(SdkParams.SDKTypeDefault) ?? false);

  /// flutter sdk
  bool isFlutterSdk = false;

  /// 启动匿名登录
  bool enableAnonymous = false;

//  bool get isInlineApp => false;
  // 当前是否显示购物车
  //bool showShoppingCar = true;
  // 全局购物车
  OverlayEntry shoppingCarOverlayEntry;


  /// CC全局红包
  OverlayEntry redPacketOverlayEntry;

  /// SDK全局红包
  OverlayEntry globalRedPacketOverlayEntry;

  //安卓设备信息
  AndroidDeviceInfo androidDeviceInfo;

  //苹果设备信息
  IosDeviceInfo iOSDeviceInfo;

  SdkAssetsModel sdkAssetsModel = SdkAssetsModel();

  /// 是否在首页
  bool isHomePage = true;
  bool _enableEdgePopGesture = true;

  set edgePopGesture(bool canPop) {
    bool enable = !canPop && isHomePage;

    if (_enableEdgePopGesture != enable) {
      _enableEdgePopGesture = enable;

      XcSdkApi.setEdgePopGesture(enable);
    }
  }

  String _androidAppKey = /*'60506db76ee47d382b85aec3'*/ '606691cbde41b946ab3b2868';
  String _iosAppKey = '615facacac9567566e8b6cb8';

  String _live188AndroidAppKey = "6163f06eac9567566e91a6df";
  String _live188aIosAppKey = "61646a2a14e22b6a4f1ccf17";

  String get androidAppKey {
    if (config.isGbet) {
      return _live188AndroidAppKey;
    } else {
      return _androidAppKey;
    }
  }

  String get iosAppKey {
    if (config.isGbet) {
      return _live188aIosAppKey;
    } else {
      return _iosAppKey;
    }
  }

  set androidAppKey(String key) {
    _androidAppKey = key;
    _live188aIosAppKey = key;
  }

  set iosAppKey(String key) {
    _iosAppKey = key;
    _live188aIosAppKey = key;
  }

  String umChannel = 'umeng';

  /// 联赛最多收藏数
  int get leagueCollectMaxCount => 20;

  /// 球队最多收藏数
  int get teamCollectMaxCount => 20;

  /// 大咖最多关注数
  int get playerCollectMaxCount => 99999999999999;

  //皮肤配置
  Skin _skin;

  Skin get skin {
    if (_skin == null) _skin = Skin();
    return _skin;
  }

  //FastAiSdk 传入的样式
  CustomStyle customStyle = CustomStyle();

  //硬编码常量定义。example: if(xxx == 1). 不推荐
  final one = 1;
  final add = "ADD";
  final sub = "SUB";
  final zero = 0;

  //竞彩的每注投注单元
  final int guessBetGold = 2;

  //竞彩的最大投注倍数
  int guessMaxMultiple = 50;
  int guessMinMultiple = 1;

  load() {
    logError("global config loading start ...");
    db.open(1);
  }

  //网络状态
  XCNetworkState _state = XCNetworkState.mobile;

  XCNetworkState get netConnectStatus => _state;

  bool get isConnectMobile => _state == XCNetworkState.mobile;

  bool get isConnectWiFi => _state == XCNetworkState.wifi;

  bool get isNotConnect => _state == XCNetworkState.none;

  startMonitorNetwork() async {
    var result = await Connectivity().checkConnectivity();
    _updateNetworkState(result);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _updateNetworkState(result);
      Event.eventBus.fire(NetworkStateEvent(_state));
    });
  }

  void _updateNetworkState(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi) {
      _state = XCNetworkState.wifi;
      print('0000-连接WIFI');
    } else if (result == ConnectivityResult.mobile) {
      print('0000-手机信号');
      _state = XCNetworkState.mobile;
    } else if (result == ConnectivityResult.none) {
      print('0000-无网络');
      _state = XCNetworkState.none;
    }
  }

  ///二级菜单主题
  SecondMenuTheme secondMenuTheme = SecondMenuTheme.light;

  /// 紀錄 比分 第二菜單的所在位置
  int scoreSecondMenuPage = 0;

  final apiConfig = ApiConfig();

  final containerPageScrollStatus = ContainerPageScrollStatusMgr();

  LogoConfig logoConfig;

  //MerchantConfigDetailModel merchantConfigDetail = MerchantConfigDetailModel();
  MerchantAppConfigModel merchantAppConfig = MerchantAppConfigModel();

  LangConfig langConfig = LangConfig();

  bool get isInternational => langConfig.versionType == 2; // 是否是国际版

  bool get isDeleteInternationalAppointModule => isInternational; // 国际版删除指定模块

  ///红包列表
  List<RedPacketModel> redPackets = [];

  /// 同步红包服务器系统时间
  void syncRedPacketSystemTime(int time) {
    if ((redPackets?.length ?? 0) == 0 || (time ?? 0) == 0) return;

    for (int i = 0; i < redPackets.length; i++) {
      RedPacketModel model = redPackets[i];
      if (time > model.systemTime) model.systemTime = time;
    }
    print('00-syncRedPacketSystemTime=$time, count=${(redPackets.first.startTime - redPackets.first.systemTime) ~/ 1000}');
  }


  var defaultPlatformConfig = {
    /// 数据源，1=AI/旗舰厅，2=BI/亚洲厅，3=CI/欧洲厅
    /// 版式偏好，1=AI/老鸟，2=AI/清爽，3=BI/老鸟，4=BI/清爽，5=CI/老鸟，6=CI/清爽，7=小白
    '1': {
      'platformType': NewPlatformType.AI, // 数据源
      'veteran': ThemeType.VeteranAI, // 老鸟
      'concise': ThemeType.ConciseAI, // 清爽
      'xiaobai': ThemeType.XiaoBai, // 小白
    },
    '2': {
      'platformType': NewPlatformType.BI,
      'veteran': ThemeType.VeteranBI,
      'concise': ThemeType.ConciseBI,
      'xiaobai': ThemeType.XiaoBai,
    },
    '3': {
      'platformType': NewPlatformType.CI,
      'veteran': ThemeType.VeteranCI,
      'concise': ThemeType.ConciseCI,
      'xiaobai': ThemeType.XiaoBai,
    }
  };

  /// 启动标题动画页面动画时间
  int launchTitleAnimationDuration = 500;

  Size deviceSize;

  EdgeInsets devicePadding;

  bool currentBottomBarStatus = true; //true:默认显示

  bool needRecoveryBottomBarStatus = false; //注单进比赛详情时标记，退出使用

  bool fromBetRecordToDetail = false;

  bool showBettingContainerView = false;

  /////////////////////////////////////////////////////////////////////////////
  VmSportApiConfig vmApiConfig;
  List<VirtualSportType> virtualSportTypeList = [];
  bool isVMSport = false;
  String vmSportType = "";

  //////////////////////////////////////////////////////////////////////////////
  // 详情当前是否支持横屏
  bool detailPageCurrentScreenSupportLandscape = false;

  ///////////////////////////////////////
  AssetService assetService = AssetService();

  //钱包汇率
  List<CurrencyExchange> currencyExchange;
}

//全局配置
final Config config = Config();

///全局配置 应用需要显示比赛推荐
bool needShowRecommendPage = true;

class ThemeType {
  static const int VeteranAI = 1;
  static const int ConciseAI = 2;
  static const int VeteranBI = 3;
  static const int ConciseBI = 4;
  static const int VeteranCI = 5;
  static const int ConciseCI = 6;
  static const int XiaoBai = 7;
}

class NewPlatformType {
  static const int AI = 1;
  static const int BI = 2;
  static const int CI = 3;
}

class PlatformModel {
  int platformType;
  int veteran;
  int concise;
  int xiaobai;

  PlatformModel({
    this.platformType,
    this.veteran,
    this.concise,
    this.xiaobai,
  });

  PlatformModel.from(int platformType) {
    if (platformType == null) return;
    Map<String, dynamic> platform = AiJson(config.defaultPlatformConfig).getMap('$platformType');
    this.platformType = AiJson(platform).getNum('platformType');
    this.veteran = AiJson(platform).getNum('veteran');
    this.concise = AiJson(platform).getNum('concise');
    this.xiaobai = AiJson(platform).getNum('xiaobai');
  }
}
