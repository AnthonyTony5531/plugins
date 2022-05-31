import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/api/net_host_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/locales/en-us/en-us.dart';

/*
 * 持久化缓存
 * 使用： AiCahe.preferences.setInt();
 */

_Cache _cache = _Cache();

class AiCache {
  ///选择体育项目
  static const sports_type = 'sports_type';
  static const sports_icon = 'sports_icon';
  static const constellation_name = 'constellation_name';
  static const constellation_id = 'constellation_id';
  static const constellation_wealthIndex = 'constellation_wealthIndex';
  static const constellation_fortuneIndex = 'constellation_fortuneIndex';
  static const constellation_fortuneNum = 'constellation_fortuneNum';
  static const constellation_fortuneColor = 'constellation_fortuneColor';
  static const vibrate_setting = 'vibrate_setting';
  static const pushMsg_redCardNotice = 'pushMsg_redCardNotice';
  static const pushMsg_redCardVoice = 'pushMsg_redCardVoice';
  static const pushMsg_redCardvibration = 'pushMsg_redCardvibration';
  static const pushMsg_liveNotice = 'pushMsg_liveNotice';
  static const pushMsg_liveVoice = 'pushMsg_liveVoice';
  static const pushMsg_liveVibration = 'pushMsg_liveVibration';
  static const pushMsg_systemNotice = 'receiveMsg';
  static const pushMsg_settlementNotice = 'pushMsg_settlementNotice';
  static const pushMsg_settlementResultNotice =
      'pushMsg_settlementResultNotice';
  static const show_recommend_time = 'show_recommend_time';
  static const show_detail_banner_time = 'show_detail_banner_time';
  static const sdk_assets_version = 'sdk_assets_version';
  static const sdk_version = 'sdk_version';
  static const force_modify_pwd = 'force_modify_pwd';
  static const sdk_menus = 'sdk_menus';
  static const show_DetailPage = 'show_DetailPage';
  static const tabSdk_first_open = 'tabSdk_first_open';
  static const hot_match_no_remind = 'hot_match_no_remind';
  static const NEED_SHOW_HOT_PAGE_GUIDE = 'need_show_hot_page_guide';
  static const NEED_SHOW_MATCH_PAGE_GUIDE = 'need_show_match_page_guide';
  static const NEED_SHOW_DETAIL_PAGE_GUIDE = 'need_show_detail_page_guide';
  static const version_statistics = 'version_statistics';
  static const play_type = 'BIPlay_type';
  static const play_type_list = 'play_type_list';


  /// 全局红包开关(用于设置中显示和控制是否接收全局红包)
  static const pushMsg_globalRedPacket = 'pushMsg_globalRedPacket';

  /// 详情页 - 底部小游戏通知弹框
  static const pushMsg_gameNotify = 'pushMsg_gameNotify';
  static const pushMsg_gameNotify_date = 'pushMsg_gameNotify_date';

  /// 用于判断是否展示完引导页
  static const app_version = 'appVersion';

  /// 用于保存启动页URL
  static const sdk_launch_url = 'lanchLog';

  static const sdk_assets_download_size = 'sdk_assets_download_size';
  static const Accept_All_Ratio_Change = 'accept_all_ratio_change';

  /// 启动标题
  static const sdk_launch_title = 'sdk_launch_title';

  /// 启动子标题
  static const sdk_launch_subtitles = 'sdk_launch_subtitles';

  /// 启动标题-默认值
  static const sdk_launch_title_default_value = ' ';

  /// 启动子标题-默认值
  static get sdk_launch_subtitles_default_value => <String>[
        config.baseLang['sdkAPI']['titleValue1'],
        config.baseLang['sdkAPI']['titleValue2'],
        config.baseLang['sdkAPI']['titleValue3'],
        config.baseLang['sdkAPI']['titleValue4'],
        config.baseLang['sdkAPI']['titleValue5'],
        config.baseLang['sdkAPI']['titleValue6'],
        config.baseLang['sdkAPI']['titleValue7'],
        config.baseLang['sdkAPI']['titleValue8'],
        config.baseLang['sdkAPI']['titleValue9'],
//    "添加喜爱的比赛，不错过每一次的精彩！",
//    "冰淇淋化了就回不来了，喜爱的比赛也是",
//    "努力爬上排行榜，让大家见证你的荣光吧！",
//    "独乐乐不如众乐乐，呼朋唤友一起来玩！",
//    "给自己一个小目标，先赢他一个亿！",
//    "比赛详情页右滑进入聊天室，大神陪你一起看球！",
//    "你还记得儿时的梦想吗？",
//    "适度游戏益脑，沉迷游戏伤身",
//    "比赛详情页上下滑可以切换比赛"
      ];

  static get sdk_launch_subtitles_default_value_en => <String>[
        enUs['baseLang']['sdkAPI']['titleValue1'],
        enUs['baseLang']['sdkAPI']['titleValue2'],
        enUs['baseLang']['sdkAPI']['titleValue3'],
        enUs['baseLang']['sdkAPI']['titleValue4'],
        enUs['baseLang']['sdkAPI']['titleValue5'],
        enUs['baseLang']['sdkAPI']['titleValue6'],
        enUs['baseLang']['sdkAPI']['titleValue7'],
        enUs['baseLang']['sdkAPI']['titleValue8'],
        enUs['baseLang']['sdkAPI']['titleValue9'],
      ];

  static const gift_play_mode_config = 'gift_play_mode_config';

  ///礼物接口返回礼物列表数据
  static const GIFT_REQ_DATA = 'gift_req_data';

  /// 投注时接受所有盘口变化
  static const Jie_Shou_All_Option_Change_Ok_Order =
      'jie_shou_all_option_change_ok_order';

  /// 默认投注金额开关状态
  static const Set_For_Default_Bet_Gold = 'set_for_default_bet_gold';

  /// 多语言(修复BUG22105-切换域名导致文字显示不对)
  static var app_language = 'app_language_${NetHostService.ins.currentMainUrl}';
  static const app_is_international = 'app_is_international'; // 国际版 国内版
  static const isVmSport = 'is_vm_sport';
  static const vmSportType = 'vm_sport_type';

  //废弃了不需要了
  @deprecated
  static Future<void> init() async {
    await ccCache.init();
  }

  static _Cache get() {
    return _cache;
  }
}

class _Cache {
  /// 该方法不建议使用，建议用 [ccCache]
  /// Reads a value from persistent storage, throwing an exception if it's not a
  /// bool.
  @deprecated
  bool getBool(String key) => ccCache.getBool(key, null);

  /// 该方法不建议使用，建议用 [ccCache]

  @deprecated
  dynamic get(String key) => ccCache.getValue(key);

  /// 该方法不建议使用，建议用 [ccCache]
  /// Reads a value from persistent storage, throwing an exception if it's not
  @deprecated
  int getInt(String key) => ccCache.getNum(key, null);

  /// 该方法不建议使用，建议用 [ccCache]
  /// Reads a value from persistent storage, throwing an exception if it's not a
  @deprecated
  double getDouble(String key) => ccCache.getDouble(key, null);

  /// 该方法不建议使用，建议用 [ccCache]
  /// Reads a value from persistent storage, throwing an exception if it's not a
  @deprecated
  String getString(String key) => ccCache.getString(key, null);

  /// 该方法不建议使用，建议用 [ccCache]
  /// Reads a set of string values from persistent storage, throwing an
  @deprecated
  List<String> getStringList(String key) {
    return ccCache.getStrings(
      key,
      null,
    );
  }

  /// 该方法不建议使用，建议用 [ccCache]
  @deprecated
  void setBool(String key, bool value, {bool needNotify = false}) =>
      ccCache.setBool(key, value, needNotify: needNotify);

  /// 该方法不建议使用，建议用 [ccCache]
  @deprecated
  void setInt(String key, int value, {bool needNotify = false}) =>
      ccCache.setInt(key, value, needNotify: needNotify);

  /// 该方法不建议使用，建议用 [ccCache]
  @deprecated
  void setDouble(String key, double value, {bool needNotify = false}) =>
      ccCache.setDouble(key, value, needNotify: needNotify);

  /// 该方法不建议使用，建议用 [ccCache]
  @deprecated
  void setString(String key, String value, {bool needNotify = false}) =>
      ccCache.setString(key, value, needNotify: needNotify);

  /// 该方法不建议使用，建议用 [ccCache]
  @deprecated
  void setStringList(String key, List<String> value,
          {bool needNotify = false}) =>
      ccCache.setStrings(key, value, needNotify: needNotify);

  /// 该方法不建议使用，建议用 [ccCache]
  @deprecated
  void remove(String key) => ccCache.remove(key);

  bool containsKey(String key) {
    return ccCache.containsKey(key);
  }

  @deprecated
  void clear() async {
    ccCache.clear();
  }
}
