import 'dart:async';
import 'dart:convert';
import 'package:common_component/mvvm/model/service/service.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/util/listeners/value_listener.dart';
import 'package:fast_ai/api/net.dart';
//import 'package:fast_ai/api/protocols/attention/casting_protolcol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/flutter_sdk/fast_ai_sdk.dart';
//import 'package:fast_ai/models/common_topmenu.dart';
import 'package:fast_ai/models/platform_counts.dart';
import 'package:fast_ai/models/player_account_model.dart';
import 'package:fast_ai/models/player_balance_model.dart';
//import 'package:fast_ai/models/player_hobbyList_model.dart';
//import 'package:fast_ai/models/ranking_list/competition_season.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/wallet/config/flutter_wallet_centerconfig.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_widget.dart';
import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor_match_page_view_model.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/server/net_index_listener_server.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/handicap_refresh.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
//import 'package:fast_ai/widgets/push_dialog/logic/push_dialog_bloc.dart';
import 'package:flutter/cupertino.dart';
//import 'package:fast_ai/widgets/float_widget.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
//import 'package:fast_ai/models/wallet/wallet_data_model.dart';
import 'package:fast_ai/config/sport_platform_config.dart';
import 'dart:convert' as _convert;

// 独赢玩法
const List<String> capotPlay = ["RM", "M"];

class UserInfo extends IService {
  DateTime _loadTime = DateTime.now();
  //是否为第一次进入应用
  bool isFirstTimeEntryApp = true;

  @override
  Future<void> init() async {
    await super.init();
    var userInfoJson = ccCache.getString('fastai_userinfo', null);
    if (null != userInfoJson) {
      try {
        account = PlayerAccountModel.fromMap(jsonDecode(userInfoJson));
      } catch (e) {}
    }
  }

  //刷新用户信息和余额
  Future<void> freshUserInfoAndBalance() {
    return Future.wait([loadUserInfo(), tryLoadBalance()]);
  }

  //用户信息更新
  ValueListener onPlayAcountChanged = new ValueListener();
  //余额
  ValueListener onBalanceChanged = new ValueListener();

//  void initSeason() {
//    if (season.code != 200 || _loadTime.day != DateTime.now().day) {
//      Net.getSeasonInfo().then((v) {
//        if (v.code == 200) {
//          season = v;
//          _loadTime = DateTime.now();
//        }
//      });
//    }
//  }

  //用户头像列表 -> 新体育传过来的数据
  List<dynamic> headimgs = [];

  //已经比赛gidm
  List<String> betedMatchGidm = [];

  //详情广告小弹窗
  bool isActiveBannerShow = true;

  // 观看视频APP所的所有投注额，解决用于投注状态后聊天室开放延迟问题
  num videoCurrAllBetGold = 0;
  // 观看视频获得聊天还需投注金额，解决用于投注状态后聊天室开放延迟问题
  num videoBettingTotal = 0;
  //当前启动APP所的所有投注额，解决用于投注状态后聊天室开放延迟问题
  num currLaunchAllBetGold = 0;
  //保存第一次获得聊天还需投注金额，解决用于投注状态后聊天室开放延迟问题
  num roomFirstBettingTotal = 0;
  //比赛详情是否显示投注额不够页
  bool isAlreadyShowBetHint = false;
  //获取投注额接口是否报错
  bool isBetMoneyApiError = false;
  //长时间不投注视频可以观看的时长
  int watchLiveTime = -1; // -1：表示没有限制可以看视频(后端接口定义的-1)
  //记录进详情观看时间是否太短
  bool isWatchLiveTimeShort = true;
  //是否是主页列表跳转
  bool isJumpToOtherPage = false;
  //是否不允许观看视频
//  bool get isNoAllowWatchLive =>
//      (roomFirstBettingTotal > currLaunchAllBetGold ||
//          watchLiveTime >= 0 ||
//          isWatchLiveTimeShort);
  bool get isNoAllowWatchLive => (videoBettingTotal > videoCurrAllBetGold ||
      watchLiveTime >= 0 ||
      isWatchLiveTimeShort);

  //赛季
//  CompetitionSeason season = CompetitionSeason();
//  String get currentSeasonId => season?.currentSeason?.seasonId ?? '';

//  Future<CompetitionSeason> tryGetSeason() async {
//    if (null == config.userInfo.season.currentSeason?.seasonId) {
//      season = await Net.getSeasonInfo();
//    }
//    return season;
//  }

  PlayerAccountModel _account = PlayerAccountModel();
  PlayerAccountModel get account => _account;
  set account(PlayerAccountModel acc) {
    _account = acc;
    if (acc.isSuccess) {
      Event.eventBus.fire(UserAccountDidUpdateEvent());
    }
  }

//  PlayerHobbyListModel hobbyList = PlayerHobbyListModel();

  PlayBalance get balance => _balance ??= PlayBalance();

  PlayBalance _balance = PlayBalance();

  set balance(value) {
    _balance = value;
    if (config.isGbet) {
      walletCenterConfig.balanceConfig.saveBalance(myBalance);
    }
  }

  String get myBalance => string(balance?.data?.balance);

  Future<String> tryLoadBalance({bool isUpdate = false}) async {
    var preBalance = myBalance;
    int count = 0;
    while (myBalance.isEmpty || isUpdate) {
      if (count++ > 10) break;
      isUpdate = false;
      var balance = await Net.getBalance(walletId: _walletId);
      print('tryLoadBalance =>>>>${balance.data.balance}');
      if (balance.isSuccess || balance.isUnRecharge) {
        this.balance = balance;
        if (myBalance.isEmpty) {
          this.balance.data.balance = "0.00";
        }
        break;
      }
      if (myBalance.isEmpty) {
        await sleep(1000);
      }
    }
    if (myBalance.isEmpty && !config.isNotConnect) {
      this.balance.data.balance = "0.00";
    }
    if (preBalance != myBalance && !config.userInfo.isAnonymousToken) {
      onBalanceChanged.fire(myBalance);
      if (config.isFastAiSdk) {
        FastAiSdk.sdkCallback.balanceChanged(myBalance);
      } else {
        XcSdkApi.onBalanceChanged(myBalance);
      }
    }
//    var walletData = merchantWalletConfig?.firstWhere(
//        (walletData) => walletData.walletId == _walletId,
//        orElse: () => null);
//    if (walletData != null) {
//      walletData.balance = this.balance.data.balance;
//      Event.eventBus.fire(DefaultWalletChangeEvent()); //更新个人页默认钱包资金
//    }
    return myBalance;
  }

//  List<WalletData> merchantAllWalletConfig = [];

  // 商户配置钱包
//  List<WalletData> _merchantWalletConfig = [];
  //保存商户钱包配置，并选择用户默认钱包
//  void saveMerchantWalletConfig(List<WalletData> data, String widOnServer) {
//    if (data == null || data.length == 0) {
//      return;
//    }
//
//    setMerchantWalletConfigCache(data);
//    _merchantWalletConfig = data;
//    String defaultWalletId;
//    if (!isNullOrEmpty(widOnServer)) {
//      defaultWalletId = widOnServer;
//      AiCache.get()
//          .setString('userWalletId_${config.userInfo.playerId}', widOnServer);
//    } else {
//      defaultWalletId =
//          AiCache.get().getString('userWalletId_${config.userInfo.playerId}');
//    }
//    if (isNullOrEmpty(defaultWalletId)) {
//      var walletData = data.first;
//      setDefaultWallet(walletId: walletData.walletId);
//    } else {
//      var walletData = _merchantWalletConfig.firstWhere(
//          (walletData) => walletData.walletId == defaultWalletId,
//          orElse: () => null);
//      setDefaultWallet(walletId: walletData.walletId);
//    }
//  }

  //
//  void setMerchantWalletConfigCache(List<WalletData> data, {String path}) {
//    AiCache.get().setString('merchantWalletConfig_${config.userInfo.playerId}',
//        _convert.jsonEncode(data));
//  }

//  //
//  List<WalletData> get merchantWalletConfig {
//    if (_walletIdPlayer != config.userInfo.playerId) {
//      _merchantWalletConfig?.clear();
//      _walletId = null;
//      _walletCoinName = null;
//    }
//    if (_merchantWalletConfig == null || _merchantWalletConfig.length == 0) {
//      String walletConfigCache = AiCache.get()
//          .getString('merchantWalletConfig_${config.userInfo.playerId}');
//      if (!isNullOrEmpty(walletConfigCache)) {
//        var walletConfigList = _convert.jsonDecode(walletConfigCache);
//        if (walletConfigList is List && walletConfigList.length > 0) {
//          walletConfigList?.forEach((cache) {
////            WalletData walletData = WalletData.fromMapCache(cache);
////            CurrencyName currencyName = CurrencyName.fromMapCache(cache['currencyName']);
//            walletData.currencyName = currencyName;
//            _merchantWalletConfig?.add(walletData);
//          });
//        }
//      }
//    }
//    if (_walletId == null && _walletIdPlayer != config.userInfo.playerId) {
//      _walletId =
//          AiCache.get().getString('userWalletId_${config.userInfo.playerId}');
//      _walletIdPlayer = config.userInfo.playerId;
//    }
//    if (_walletCoinName == null &&
//        _walletIdPlayer != config.userInfo.playerId) {
//      _walletCoinName = AiCache.get()
//          .getString('userWalletCoinName_${config.userInfo.playerId}');
//    }
//    return _merchantWalletConfig;
//  }

  //
//  List<String> get currencies {
//    if (_merchantWalletConfig.isEmpty) return [];
//    return _merchantWalletConfig.map((e) => e.currency).toList();
//  }

  // 用户当前选择的钱包id
  String _walletId;
  String _walletIdPlayer;
  // 用户当前选择的钱包name
  String _walletCoinName;

  String get walletCoinName => _walletCoinName ?? 'CNY';
  String get walletId => _walletId ?? '1'; // 4: 越南币
  // 用户当前选择的钱包id所在List的index
//  int get walletIndex {
//    if (_merchantWalletConfig == null || _merchantWalletConfig.isEmpty) {
//      return 0;
//    }
//    return _merchantWalletConfig?.indexOf(w) ?? 0;
//  }

//  // 设置默认钱包
//  bool setDefaultWallet(
//      {@required String walletId, String successToast, String failToast}) {
//    var walletData = merchantWalletConfig.firstWhere(
//        (walletData) => walletData.walletId == walletId,
//        orElse: () => null);
//    if (walletData == null ||
//        isNullOrEmpty(walletData.walletId) ||
//        isNullOrEmpty(walletData.currency)) {
//      if (!isNullOrEmpty(failToast)) {
//        showToas(failToast);
//      }
//      return false;
//    }
//    this._walletId = walletData.walletId;
//    _walletIdPlayer = config.userInfo.playerId;
//    this._walletCoinName = walletData.currency;
//    AiCache.get()
//        .setString('userWalletId_${config.userInfo.playerId}', _walletId);
//    AiCache.get().setString(
//        'userWalletCoinName_${config.userInfo.playerId}', _walletCoinName);
//    if (isNullOrEmpty(walletData.balance)) {
//      this.balance?.data?.balance = '0.00';
//    } else {
//      this.balance?.data?.balance = walletData.balance;
//    }
//    if (!isNullOrEmpty(successToast)) {
//      showToas(successToast);
//    }
//    return true;
//  }

  ///////////////////////////wallet/////////////////////////////////////////////

  //投注框是否需要弹出
  bool isBettingExpanded = true;

  //投注最后发送的消息
  BaseEvent lastBettingEvent = BaseEvent();
  String _token = '';

  //竞彩倍率
  int guessMultiple = 0;

  //当前是否竞猜模式. 判断当前竞彩的Widget是否在View的Tree中. 是否属于active状态
  bool isGuessing = false;
  bool isVirtual = false;
  bool isInplay = false; //是否滚球页面
  bool isHotPage = false; // 内嵌SDK用热门页
  bool isMatchDetail = false; // 比赛详情页
  //是否转到直播
  bool isGoHomeToLive = false;
  //是否选中已投
  bool isGoHomeToBet = false;
  //关注的球队比赛
  List<String> followGames = [];
  //关注的球队
  List<String> followTeams = [];
  //关注的联赛
  List<String> followLeagues = [];
  //选择当前TabbarItem(体育-比赛-竞彩-关注-我的)
  int selectCurrentTabbarIndex = 0;
  //体育滚球是否有数据
  bool isInplayHaveData = false;
  //体育直播是否有数据
  bool isLiveHaveData = false;
  //体育今日是否有数据
  bool isTodayHaveData = false;
  //体育早盘是否有数据
  bool isEarlyHaveData = false;
  //直播是否隐藏相同
  bool isHiddenSameLive = false;
  //滚球直播是否隐藏相同
  bool isHiddenRBSameLive = true;
  //主播和视频默认图
  Map<String, dynamic> anchorDefaultIconMap = {};

  //sdk用户头像
  String sdkHeadImg;
  //sdk用户昵称
  String sdkNickName;
  //sdk用户简介
  String sdkProfiles;
  //是否播放小视频
  bool isPlayVlog;
  //是否播放小视频
  bool isFoundAttention;
  //单注投注默认金额
  String singleBetDefaultGold = '';
  //串关投注默认金额
  String comboBetDefaultGold = '';
  //是否开启单注投注默认金额
  bool isOpenSingleBetDefaultGold = false;
  //是否开启串关投注默认金额
  bool isOpenComboBetDefaultGold = false;
  //多盘刷新
  Timer handicapTimer;
  //是否有开启多盘口
  bool isOpenMoreHandicap = false;
  //新体育SDK的版本号
  String fastAIVersion = '2.0.5';
  //埋点点水成功标识
  bool isOddsSuccess = false;
  //埋点点水失败标识
  bool isOddsFailure = false;
  //埋点启动App记录数据源AI/BI
  bool isRecordSportPlatform = false;
  //埋点时长字典
  Map<String, dynamic> statisticsTimeMap = {};
  //新体育iOS下载链接弹框
  bool showDialoging = false;
  //BI玩法选择默认独赢
  List<String> playTypes = capotPlay;
  //强制下线的主播
  List<String> offlineAnchorIds = [];
  //列表Cell版式
  int cellThemeStyle = ThemeType.VeteranAI;
  //数据源
  int newPlatformType = NewPlatformType.AI;
  //是否显示精选赛事详情(欧洲杯)
  bool isShowRefinedDetail = false;
  //是否显示精选赛果详情
  bool isShowRefinedFinishGameDetail = false;
  //主播是否停播(用在比赛详情进主播页手动关停)
  bool anchorIsLiving = true;
  //tabSDK投注页是否显示中(控制tabbar的显示BettingContainer2P0)
  bool isShowBettingContainer2P0 = false;
  //早盘详情比赛背景视频(防止重复加载videoPlayer,导致安卓播放失败)
  bool isShowHeadVideo = false;
  // 自由主播列表关闭视频
  bool isCloseFreeAnchor = false;
  // 当前切换的主播的页面
  FreeAnchorPosition freeAnchorPosition = FreeAnchorPosition.none;
  // 自由播详情页记录游戏浮窗点击
  bool isClickGameFloat = false;
  String recordVideoStatus; // 记录视频状态 暂定:"stop" 播放:"playing"
  List<AiGameCellModel> gameModels = []; // 游戏数据


  void setSdkIsFirstOpenStatus(bool isFirst) {
    AiCache.get().setBool(AiCache.tabSdk_first_open, isFirst ?? false);
  }

  // sdk是否第一次安装
  bool sdkIsFirstOpen() {
    return AiCache.get().getBool(AiCache.tabSdk_first_open) ?? true;
  }

  bool isFollowTeam(String teamId) {
    if (isNullOrEmpty(teamId)) return false;
    if (followTeams == null) return false;
    return followTeams.contains(teamId);
  }

  bool isFollowLeague(String leagueId) {
    if (isNullOrEmpty(leagueId)) return false;
    if (followLeagues == null) return false;
    return followLeagues.contains(leagueId);
  }

  // 是否接收消息 为false消息列表没有红点与数字提示
  get receiveMsg {
    return AiCache.get().getBool('receiveMsg') ?? true;
  }

  /// 是否展示动态消息
  get dynamicPush {
    return AiCache.get().getBool('dynamicPush') ?? true;
  }

  //玩法
  var _playNameData = {};
  get getPlayNameData {
    if (_playNameData.keys.length == 0) {
      String data = AiCache.get().getString('playNameData') ?? '';
      if (!isStrNullOrEmpty(data)) {
        _playNameData = jsonDecode(data);
      } else {
        _playNameData = {};
      }
    }
    return _playNameData;
  }

  setPlayNameData(String val) {
    _playNameData = {};
    AiCache.get().setString('playNameData', val);
  }

  //双线玩法 ibo
  var _iboDoubleLine = [];
  List<String> get iboDoubleLine {
    if (_iboDoubleLine.length == 0) {
      List<String> list = AiCache.get().getStringList('iboDoubleLine') ?? [];
      _iboDoubleLine = list;
    }
    return _iboDoubleLine;
  }

  //双线玩法 sd
  var _sdDoubleLine = [];
  List<String> get sdDoubleLine {
    if (_sdDoubleLine.length == 0) {
      List<String> list = AiCache.get().getStringList('sdDoubleLine') ?? [];

      _sdDoubleLine = list;
    }
    return _sdDoubleLine;
  }

  //双线玩法 sd
  var _btiDoubleLine = [];
  List<String> get btiDoubleLine {
    if (_btiDoubleLine.length == 0) {
      List<String> list = AiCache.get().getStringList('btiDoubleLine') ?? [];

      _btiDoubleLine = list;
    }
    return _btiDoubleLine;
  }

  //双线玩法 halfR
  var _halfRDoubleLine = [];
  List<String> get halfRDoubleLine {
    if (_halfRDoubleLine.length == 0) {
      List<String> list = ccCache.getStrings('halfRDoubleLine', []);
      _halfRDoubleLine = list;
    }
    return _halfRDoubleLine;
  }

  //双线玩法 r
  var _rDoubleLine = [];
  List<String> get rDoubleLine {
    if (_rDoubleLine.length == 0) {
      List<String> list = ccCache.getStrings('rDoubleLine', []);
      _rDoubleLine = list;
    }
    return _rDoubleLine;
  }

  //设置双线玩法
  setDoubleLinePlayType(String type, List<String> val) {
    String cacheKey = '';
    List<String> list = val ?? [];
    if (type == 'ibo') {
      _iboDoubleLine = [];
      cacheKey = 'iboDoubleLine';
      if (list.length == 0) {
        list = config.fiexd.iboOddsTypeChangeArray;
      }
    } else if (type == 'sd') {
      _sdDoubleLine = [];
      cacheKey = 'sdDoubleLine';
      if (list.length == 0) {
        list = config.fiexd.sdOddsTypeChangeArray;
      }
    } else if (type == 'bti') {
      _btiDoubleLine = [];
      cacheKey = 'btiDoubleLine';
      if (list.length == 0) {
        list = config.fiexd.btiOddsTypeChangeArray;
      }
    } else if (type == 'halfR') {
      _halfRDoubleLine = [];
      cacheKey = 'halfRDoubleLine';
      if (list.length == 0) {
        list = config.fiexd.halfROddsTypeChangeArray;
      }
    } else if (type == 'r') {
      _rDoubleLine = [];
      cacheKey = 'rDoubleLine';
      if (list.length == 0) {
        list = config.fiexd.rOddsTypeChangeArray;
      }
    } else {}
    AiCache.get().setStringList(cacheKey, list);
  }

  //开启比赛通知声音
  get isOpenRedCardVoice {
    return AiCache.get().getBool(AiCache.pushMsg_redCardVoice) ?? true;
  }

  //开启比赛通知震动
  get isOpenRedCardVibration {
    return AiCache.get().getBool(AiCache.pushMsg_redCardvibration) ?? true;
  }

  //开启直播通知声音
  get isOpenLiveVoice {
    return AiCache.get().getBool(AiCache.pushMsg_liveVoice) ?? true;
  }

  //开启直播通知震动
  get isOpenLiveVibration {
    return AiCache.get().getBool(AiCache.pushMsg_liveVibration) ?? true;
  }

  //用户信息
  get nickName {
    // if(config.isTabSDK){
    //   return sdkNickName ?? '';
    // }
    String name = account?.data?.nickName ?? '';
    if (name.length <= 0) {
      String key = playerId ?? '' + 'nickName';
      name = AiCache.get().getString(key) ?? '';
    }
    return name;
  }

  get loginName {
    String name = account?.data?.loginName ?? '';
    if (name.length <= 0) {
      String key = playerId ?? '' + 'loginName';
      name = AiCache.get().getString(key) ?? '';
    }
    return name;
  }

  get headImg {
    // if(config.isTabSDK){
    //   return sdkHeadImg ?? '';
    // }
    String imageUrl = account?.data?.headImg ?? '';
    if (imageUrl.length <= 0) {
      String key = playerId ?? '' + 'headImg';
      imageUrl = AiCache.get().getString(key) ?? '';
    }
    return imageUrl;
  }

  get profiles {
    // if(config.isTabSDK){
    //   return sdkProfiles ?? '';
    // }
    String profile = account?.data?.profiles ?? '';
    if (profile.length <= 0) {
      String key = playerId ?? '' + 'profiles';
      profile = AiCache.get().getString(key) ?? '';
    }
    return profile;
  }

  get playerId {
    String playerIdStr = account?.data?.playerId ?? '';
    if (playerIdStr.length <= 0) {
      playerIdStr = AiCache.get().getString('playerId') ?? '';
    }
    return playerIdStr;
  }

  get uid {
    String uidStr = account?.data?.uid ?? '';
    if (uidStr.length <= 0) {
      uidStr = AiCache.get().getString('uid') ?? '';
    }
    return uidStr;
  }

  get privacy {
    String privacyStr = account?.data?.privacy ?? '';
    if (privacyStr.length <= 0) {
      privacyStr = AiCache.get().getString('privacy') ?? '';
    }
    return privacyStr;
  }

  //当前是否显示详情页
  bool get showIsDetailPage {
    return AiCache.get().getBool(AiCache.show_DetailPage);
  }

  set showIsDetailPage(bool isShowDetail) {
    AiCache.get().setBool(AiCache.show_DetailPage, isShowDetail);
  }

  num _unReadNum = 0;

  set unReadNum(num val) {
    _unReadNum = val;
  }

  //获取未读小
  num get unReadNum {
    return _unReadNum;
  }

  Future<PlayerAccountModel> loadUserInfo() async {
    print('loadUserInfo---');
    var playaccount = await Net.playAccount();
    if (playaccount.isSuccess) {
      if (this._account == null ||
          this._account.data == null ||
          this._account.data.data == null) {
        this._account = playaccount;
        this.onPlayAcountChanged.fire(playaccount);
      } else {
        try {
          String data = jsonEncode(playaccount.data.data);
          if (jsonEncode(this._account.data.data) != data) {
            ccCache.setString('fastai_userinfo', data);
            this.onPlayAcountChanged.fire(playaccount);
          }
        } catch (e) {
          this.onPlayAcountChanged.fire(playaccount);
        }
      }
    }
    return playaccount;
  }

  bool hasFollowAnchor(String id) {
    return (config.userInfo.account?.data?.followPlayerIds ?? [])
            .contains(id) ??
        false;
  }

  void followAnchor(String id) {
    List<String> followPlayerIds =
        (config.userInfo.account?.data?.followPlayerIds ?? []);
    followPlayerIds.removeWhere((e) => e == id);
    followPlayerIds.add(id);
  }

  void unfollowAnchor(String id) {
    List<String> followPlayerIds =
        (config.userInfo.account?.data?.followPlayerIds ?? []);
    followPlayerIds.removeWhere((e) => e == id);
  }

//  //更新关注主播信息
//  Future<void> updateFollowAnchorId() async {
//    List<String> followPlayerIds =
//        (config.userInfo.account?.data?.followPlayerIds ?? []);
//
//    try {
//      var rsp =
//          await FollowAnchorListReqProtocol(page: 1, pageSize: 200).request();
//      if (rsp.isSuccess && rsp?.model?.list != null) {
//        rsp?.model?.list?.forEach((f) {
//          if (!followPlayerIds.contains(f.playerId)) {
//            followPlayerIds.add(f.playerId);
//          }
//        });
//      }
//    } catch (_) {}
//  }

  //是否收藏了game比赛
  bool hasFollowGame(String gidm) {
    return followGames.contains(gidm);
  }

  //是否切换过新手版，用来标识未切换过红点
  bool get hasSwitchNewBird {
    bool hasSwitchNewBird = false;
    try {
      hasSwitchNewBird = AiCache.get().getBool("hasSwitchNewBird");
    } catch (e) {}
    return hasSwitchNewBird ?? false;
  }

  set hasSwitchNewBird(bool value) {
    AiCache.get().setBool("hasSwitchNewBird", value);
  }

  String get token {
    if (null == _token || _token.isEmpty) {
      try {
        _token = AiCache.get().getString("user_token");
      } catch (e) {
        _token = '';
      }
    }
    return _token ?? '';
  }

  Future logout() async {
    print('00-logout');
    config.userInfo.roomFirstBettingTotal = 0;
    config.userInfo.currLaunchAllBetGold = 0;
    config.userInfo.videoBettingTotal = 0;
    config.userInfo.videoCurrAllBetGold = 0;
    isAnonymousToken = false;
    if (config.isApp) await Net.logout();
    if (!config.isFastAiSdk) token = '';
    _walletId = null;
    _walletIdPlayer = null;
//    _merchantWalletConfig?.clear();
    Event.eventBus.fire(UnloginEvent());
    Net.close();
    balance = PlayBalance();
    account = PlayerAccountModel();
    ModuleSwitch?.getInstance()?.close();
    config.userInfo.followGames.clear();
    config.userInfo.followLeagues.clear();
    config.userInfo.followTeams.clear();
    config.userInfo.handicap = 0;
    await XCStompClient.ins.stop();
    NetIndexListenerServer.ins.stop();

    if (config.isAi || config.isTabSDK) {
      if (ccRoute.hasShowOverlay( FastAiRouteTableName.ActivityDrawFloat)) {
        FloatActivityDrawCarHelper.activityDrawUnregister();
        FloatActivityDrawCarHelper.hideActivityDraw();
      }
    }
    print('11-logout');
  }

  bool isLogout() {
    if (config.isAi || config.isVs || config.is365) return isEmpty(token ?? '');
    return isEmpty(cmPackageConfig.live188tokenConfig.token);
  }

  //是否为匿名登录
  bool isAnonymousToken = false;
  String _anonymousToken = '';

  /// 匿名token全站都用同一个，仅在服务器重启的时候更新
  String get anonymousToken => _anonymousToken ?? '';
  set anonymousToken(String token) {
    _anonymousToken = token;
    print('00000----更新匿名token=$token');
  }

  set token(String value) {
    isAnonymousToken = false;
    _token = value ?? '';
    if (null == _token || _token.isEmpty) {
      AiCache.get().remove("user_token");
    } else {
      AiCache.get().setString("user_token", _token);
    }
  }

  //香港盘
  static const HandicapHongKong = 0;
  //标准盘
  static const HandicapStandard = 1;

  /// 盘口选择，0=香港盘，1=标准盘
  int _handicap = HandicapHongKong;

  get handicap => ccCache.getNum("HANDICAP", HandicapHongKong);

  //0为感
  OddsType getOddsType(bool isCombo, int handicap) {
    return isCombo || handicap == HandicapStandard
        ? OddsType.Erou
        : OddsType.HongKong;
  }

  set handicap(int paramHandICap) {
    if (this.handicap == paramHandICap) return;
    ccCache.setInt("HANDICAP", paramHandICap, needNotify: true);
    this._handicap = paramHandICap;
    Event.eventBus.fire(GlobalEvent(HandicapEvent(this._handicap)));
  }

  /// 版式偏好，0=小白版，1=老鸟版，2=清爽版
  int _themeStyle = 1;

  // 是否小白版
  bool get isXiaoBaiStyle =>
      (config.userInfo.cellThemeStyle == ThemeType.XiaoBai);
  // 是否AI老鸟版
  bool get isAIVeteranStyle =>
      (config.userInfo.cellThemeStyle == ThemeType.VeteranAI);
  // 是否AI清爽版
  bool get isAIConciseStyle =>
      (config.userInfo.cellThemeStyle == ThemeType.ConciseAI);
  // 是否BI老鸟版
  bool get isBIVeteranStyle =>
      (config.userInfo.cellThemeStyle == ThemeType.VeteranBI);
  // 是否BI清爽版
  bool get isBIConciseStyle =>
      (config.userInfo.cellThemeStyle == ThemeType.ConciseBI);
  // 是否CI老鸟版
  bool get isCIVeteranStyle =>
      (config.userInfo.cellThemeStyle == ThemeType.VeteranCI);
  // 是否CI清爽版
  bool get isCIConciseStyle =>
      (config.userInfo.cellThemeStyle == ThemeType.ConciseCI);
  // 是否AI版式
  bool get isAIStyle => (isAIVeteranStyle || isAIConciseStyle);
  // 是否BI版式
  bool get isBIStyle => (isBIVeteranStyle || isBIConciseStyle);
  // 是否CI版式
  bool get isCIStyle => (isCIVeteranStyle || isCIConciseStyle);

  get themeStyle {
    var tstyle = AiCache.get().getInt('THEMESTYLE');
    if (config.isInternational) {
      return 2; // 海外版则默认为清爽版
    } else {
      return tstyle ?? _themeStyle;
    }
  }

  //还没设置过themeStyle
  bool isThemeStyleUnset() {
    return null == AiCache.get().getInt('THEMESTYLE');
  }

  set themeStyle(int _themeStyle) {
    if (this.themeStyle == _themeStyle) return;
    AiCache.get().setInt('THEMESTYLE', _themeStyle);
    this._themeStyle = _themeStyle;
    Event.eventBus.fire(GlobalEvent(PageStyleEvent(themeStyle)));
  }

  //赔率格式
  OddsType get oddsType {
    if (_handicap == HandicapHongKong) return OddsType.HongKong;
    if (_handicap == HandicapStandard) return OddsType.Erou;
    return OddsType.HongKong;
  }

  //服务器赔率格式
  String get oddfType {
    switch (oddsType) {
      case OddsType.HongKong:
        return 'H';
      case OddsType.Erou:
        return 'E';
    }
    return 'H';
  }

  //排序，0=智能，1=时间，2=联赛
  int _sort = 0;

  get sort => AiCache.get().getInt('SORT') ?? this._sort;

  set sort(int paramSort) {
    if (this.sort == paramSort) return;
    AiCache.get().setInt("SORT", paramSort, needNotify: true);
    this._sort = paramSort;
    Event.eventBus.fire(GlobalEvent(SortEvent(this.sort)));
  }

  //排序，中文=zh-cn，繁體中文=zh-tw，English=en-us
  String _lang = 'zh-cn';

  get lang => AiCache.get().getString('LANG') ?? this._lang;

  set lang(String paramLang) {
    if (this.lang == paramLang) return;
    AiCache.get().setString("LANG", paramLang);
    this._lang = paramLang;
  }

  //点水赔率设置（自动接受高赔率变化，自动全收),0 不接受，1 接受更高赔率变化， 2 接受所有赔率变化（变高或变低）
  final String _autoOddIndex = "AUTO_ODD_INDEX";

  get autoOddIndex => AiCache.get().getInt(_autoOddIndex);

  set autoOddIndex(int index) {
    int storeIndex = AiCache.get().getInt(_autoOddIndex);
    if (storeIndex == index) return;
    AiCache.get().setInt(_autoOddIndex, index);
  }

  // 显示系统维护页面
  bool showSystemRepairPage = false;
  // 403显示系统维护页面
  bool show403SystemRepairPage = false;
  // 新体育503显示系统维护页面
  bool showMXSystemRepairPage = false;
  // 新体育是否显示主页
  bool showMXMainPage = false;

  // 体育数据源 AI体育：sportPlatformId为1   BI体育：sportPlatformId为2
  final String _sportPlatformId = "SPORT_PLATFORM_ID";

  int get sportPlatformId {
    if (!config.userInfo.showSportPlatformSwitch) {
      try {
        var ls = SportPlatform.ins.getPlatformInfos();
        if (ls == null || ls.isEmpty) {
          throw '';
        }
        return int.tryParse(ls[0]?.id ?? 1);
        //return int.tryParse(config.merchantAppConfig?.platformId ?? '1');
      } catch (_) {
        return AiCache.get().getInt(_sportPlatformId) ?? 1;
      }
    }
    return AiCache.get().getInt(_sportPlatformId) ?? 1;
  }

  set sportPlatformId(int id) {
    if (!config.userInfo.showSportPlatformSwitch) {
      var ls = SportPlatform.ins.getPlatformInfos();
      if (ls == null || ls.isEmpty) {
        return;
      }
      int parsePlatformId = int.tryParse(ls[0]?.id ?? 1);
      // 更新列表Cell样式
      config.userInfo.configPlatform(PlatformModel.from(parsePlatformId));
      AiCache.get().setInt(_sportPlatformId, parsePlatformId);
      return;
    }

    int platformId = AiCache.get().getInt(_sportPlatformId);
    // 更新列表Cell样式
    config.userInfo.configPlatform(PlatformModel.from(id));
    if (platformId == id) return;
    AiCache.get().setInt(_sportPlatformId, id);
  }



  // 根据商户配置的体育数据源数量确定是否需要显示体育平台切换开关，大于等于2个显示切换开关，与相关数据源标签
  final String _showSportPlatformSwitch = 'SHOW_SPORT_PLATFORM_SWITCH';

  get showSportPlatformSwitch =>
      AiCache.get().getBool(_showSportPlatformSwitch) ?? false;

  set showSportPlatformSwitch(bool show) {
    bool showSwitch = AiCache.get().getBool(_showSportPlatformSwitch);
    if (showSwitch == show) return;
    AiCache.get().setBool(_showSportPlatformSwitch, show);
  }

  //
  int getDefaultSingleBet(String walletId) {
    return AiCache.get().getInt('wallet_${walletId}_single_default_bet_gold');
  }

  //
  void setDefaultSingleBet(String walletId, int defaultGold) {
    AiCache.get()
        .setInt('wallet_${walletId}_single_default_bet_gold', defaultGold);
  }

  int getDefaultComboBet(String walletId) {
    return AiCache.get().getInt('wallet_${walletId}_combo_default_bet_gold');
  }

  void setDefaultComboBet(String walletId, int defaultGold) {
    AiCache.get()
        .setInt('wallet_${walletId}_combo_default_bet_gold', defaultGold);
  }

  ////1:智能 2:联赛 3:时间
  int get serverGameSort {
    if (sort == 0) return 1;
    if (sort == 1) return 3;
    if (sort == 2) return 2;
    return 3;
  }

  Future<String> loadMerchantId() async {
    String id = (account?.data?.merchantId ?? '').isEmpty
        ? AiCache.get().get("merchantId") ?? ''
        : '';
    if (id.isEmpty) {
      var account = await loadAccount();
      return account.data?.merchantId ?? '';
    }
    return id;
  }

  //加载z
  Future<PlayerAccountModel> loadAccount() async {
    print('00-loadAccount-start');
    if ((config.userInfo?.account?.data?.merchantId ?? '').isNotEmpty)
      return config.userInfo.account;
    var playAccount = await Net.playAccount();
    config.userInfo.account = playAccount;
    print('11-loadAccount-end');
    AiCache.get().setString("merchantId", playAccount.data?.merchantId);
    return playAccount;
  }

  get isHideRecommendMatch =>
      AiCache.get().get(AiCache.hot_match_no_remind) ?? false;

  bool _isShowBalance = true;

  get isShowBalance {
    var showBalance = AiCache.get().getBool('SHOWBALANCE');
    return showBalance ?? _isShowBalance;
  }

  set isShowBalance(bool _isShowBalance) {
    if (this.isShowBalance == _isShowBalance) return;
    AiCache.get().setBool('SHOWBALANCE', _isShowBalance);
    this._isShowBalance = _isShowBalance;
  }

  DetailSet detailSet = DetailSet();
//  PushDialogBloc pushDialogBloc;
//  void shareInstancePushDialogBloc(BuildContext context) {
//    if (pushDialogBloc == null) {
//      pushDialogBloc = PushDialogBloc(context: context);
//      pushDialogBloc?.init();
//    } else {
//      pushDialogBloc.updateContext(context);
//    }
//  }

  //判断不同网络状态下视频是否播放
  bool isNetworkVideoPalying = true;

  BetUserType get userType {
    if (config.userInfo.themeStyle == 0) return BetUserType.newbie;
    return BetUserType.old_bird;
  }

  //当前进入的聊天室房间号
  String chatRoomNo;


  /// 版式偏好，0=小白版，1=老鸟版，2=清爽版
  void configPlatform(PlatformModel model) {
    if (model == null) return;
    if (themeStyle == 1) {
      cellThemeStyle = model.veteran;
    }
    if (themeStyle == 2) {
      cellThemeStyle = model.concise;
    }
    if (themeStyle == 0) {
      cellThemeStyle = model.xiaobai;
    }
    newPlatformType = model.platformType;
    print('');
  }

  ///////////////////////////接受盘口变化规则/////////////////////////////////////
  String _rLimit;
  String _ouLimit;

  String get rLimit => _rLimit ?? 1;
  String get ouLimit => _ouLimit ?? 3;

  set rLimit(String value) => _rLimit = value;
  set ouLimit(String value) => _ouLimit = value;

  //商户直播logo信息
  Map<String, String> merchantLiveInfo = {};

  @override
  String get name => 'fastai_config';

//////////////////////////////////////////////////////////////////////////////

}

class DetailSet {
  DetailSet();
  bool isFirstLoading = true;
  bool showLoading = true;
  String selectViewType = 'default'; //
  bool isChangeViewType = false; //是否手动改变过视图
  int fixedDetailHeadType = 2; //默认0， 0,1表示未固定； 2：手动固定，3：滑动固定
  bool isShowFixedIcon = false; //是否显示固定按钮
  DetailParams detailParams;
}

enum OddsType { HongKong, Erou }

OddsType formatOddType(String oddType) {
  if ('H' == oddType) return OddsType.HongKong;
  if ('E' == oddType) return OddsType.Erou;
  return OddsType.Erou;
}

//投注用户类型
enum BetUserType {
  newbie, //新手
  old_bird, //老鸟
}

class SportPlatform {
  static int AI = 1;
  static int BI = 2;
  static const int CI = 3;

  static SportPlatform ins = SportPlatform._();

  SportPlatform._();

  var _platformInfos = <PlatformInfoBean>[];

  //保存更新平台列表信息
  void setPlatformInfos(List<dynamic> platformInfos) {
    print("platformInfos:$platformInfos");

    _platformInfos.clear();
    config.userInfo.showSportPlatformSwitch = false;
    if (platformInfos == null || platformInfos.isEmpty) return;
    platformInfos.forEach((platformInfo) {
      if (platformInfo == null && !(platformInfo is Map)) return;

      String platformId = platformInfo['platformId'];
      String platformName = platformInfo['platformName'];
      Map manyName = platformInfo['manyName'];
      List<String> sourceCompany =
          platformInfo['sourceCompany'].toLowerCase().split(',');

      PlatformInfoBean infoBean = PlatformInfoBean(
        id: '$platformId',
        name: '$platformName',
        sourceCompany: sourceCompany,
        manyName: manyName,
      );

      if (config.isDeleteInternationalAppointModule) {
        if (platformId == '1') {
          _platformInfos.add(infoBean);
        }
      } else {
        _platformInfos.add(infoBean);
      }
    });
    config.userInfo.showSportPlatformSwitch = showSportPlatFormSwitch();
    Event.eventBus.fire(MerchantInfoUpdateEvent());
  }

  void setPlatformCounts(List<PlatformCount> list) {
    var data = _platformInfos;
    list.forEach((element) {
      for (var i = 0; i < data.length; i++) {
        if (element.platformId == _platformInfos[i].id) {
          data[i].count = element.count;
          data[i].liveCount = element.liveCount;
        }
      }
    });
    _platformInfos = data;
  }

  //获取平台列表信息
  List<PlatformInfoBean> getPlatformInfos() {
    return _platformInfos;
  }

  //获取平台信息
  PlatformInfoBean getPlatform(String platformId) {
    return _platformInfos.firstWhere(
        (platformInfo) => platformInfo.id == platformId,
        orElse: () => null);
  }

  //获取对应平台ID的平台名称
  String getPlatformName(String platformId) {
    String platformName = "";
    PlatformInfoBean platformInfo;
    try {
      platformInfo = _platformInfos.firstWhere(
          (platformInfo) => platformInfo.id == platformId,
          orElse: () => null);
      if (platformInfo != null) {
        String lang = Translations.langCode; // th-th
        if (platformInfo.manyName != null) {
          platformName = platformInfo.manyName[lang] ?? platformInfo.name;
        } else {
          platformName = platformInfo.name;
        }
      } else {
        platformName = SportPlatformConfig.getDefaultName(platformId);
      }
    } catch (e) {}
    return platformName;
  }

  //是否显示平台切换开关
  bool showSportPlatFormSwitch() {
    return getPlatformCount() > 1;
  }

  int getPlatformCount() {
    return _platformInfos?.length ?? 0;
  }

  //切换到下一个平台
  int getNextPlatformId(String currentSportPlatformId) {
    if (_platformInfos.length <= 1) {
      return int.tryParse('$currentSportPlatformId');
    }
    int position = 0;
    for (int i = 0; i < _platformInfos.length; i++) {
      if (_platformInfos[i].id == currentSportPlatformId) {
        position = i;
        break;
      }
    }
    if (position == _platformInfos.length - 1) {
      position = 0;
    } else {
      position++;
    }
    return int.tryParse('${_platformInfos[position].id}');
  }

  bool hasPlatformId(String platformId) {
    return _platformInfos?.firstWhere((info) => info.id == platformId,
            orElse: () => null) !=
        null;
  }
}

class PlatformInfoBean {
  String id;
  String name;
  int count;
  int liveCount;
  List<String> sourceCompany;
  Map manyName; // 多語言，例如： {'zh-ch' : '旗舰厅'}

  PlatformInfoBean({
    @required this.id,
    @required this.name,
    this.count = 0,
    this.liveCount = 0,
    @required this.sourceCompany,
    this.manyName,
  });
}
