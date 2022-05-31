import 'package:fast_ai/api/net_host.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/app_util.dart';

class Api {
  //是否开启自动选择最快线路
  static bool get autoSelectDomain => isRelease();
  static const LANG = 'zh_cn';
  static const IS_OPEN_KEYWORD = false;
  static const packageType = false; // true-App名字为极智体育 beta false-App名为AI体育

//dev
  static const int IM_PORT = 80;

  static String get baseImUrl => config.isApp? (config.isFastAiSdk ? config.fastAiSdkParams.baseIMUrl : NetHost.BASE_IM_URL) : config.sdkParams.baseIMUrl;
  static String get baseImgUrl => config.isApp ? (config.isFastAiSdk ? config.fastAiSdkParams.baseImgUrl : NetHost.BASE_IMG_URL) : config.sdkParams.baseImgUrl;
  static String get baseMainUrl => config.isApp ? (config.isFastAiSdk ? config.fastAiSdkParams.baseMainUrl : NetHost.BASE_MAIN_URL) : config.sdkParams.baseMainUrl;

  static String baseUrlManualSet;//app内部手动切换环境
  static String get baseUrl{
    //print("config.isApp:${config.isApp}  NetHost.BASE_MAIN_URL:${NetHost.BASE_MAIN_URL} config.sdkParams.baseMainUrl:${config.sdkParams.baseMainUrl}， baseUrlManualSet=$baseUrlManualSet");
    if(baseUrlManualSet == null || baseUrlManualSet == ""){
      return '$baseMainUrl/ai/mobile/';
    }
    return baseUrlManualSet;
  }

  //客服聊天地址
  static String customerServiceManualSet;//app内部手动切换环境
  static String get customerService{
    if(customerServiceManualSet == null || customerServiceManualSet == ""){
      return '$baseMainUrl/ai-service/?token=';
    }
    return customerServiceManualSet;
  }

  //赛果详情查看地址:注单记录中使用
  static String matchResultManualSet;//app内部手动切换环境
  static String get matchResult{
    if(matchResultManualSet == null || matchResultManualSet == ""){
      return '$baseMainUrl/gameOver/';
    }
    return matchResultManualSet;
  }


  // static const BASE_URL = 'http://cn2.m.aisports.io/ai/mobile/';
  //dev环境 http://dev.pc.xc.com
  //fat环境 http://fat.pc.xc.com

  static const RB_CONDITION = 'matches/getRBCondition';
  static const LOGIN = 'login';
  static const LOGOUT = 'player/logout';
  static const AnonyToken = 'anonyToken';
  static const AnonymousToken = 'anonymousToken'; //CC用
  static const AnonymousToken2 = 'anonymousToken2'; //新体育用
  static const PLAYERACCOUNT = 'new/player/playerAccount';
  static const GETBALANCE = 'player/getBalance';
  static const MATH_RESULTS = 'match/resultDetail';

  //玩法名称
  static const PlayGroupVersionFile = 'detail/playGroupVersionFile';

  //详情相关接口
  static const DETAIL_MATCHES = 'detail/matches';
  static const PLAY_GROUP = 'detail/playGroup';
  static const EXTEND = 'detail/extend';
  static const CHATROOM_FREE_FUN = 'anchor/getLivePopularity';
  static const SUPPORT = 'detail/support';
  static const RATIORATEINFO = 'detail/ratioRateInfo';
  static const DETAIL_BETRECORD = 'detail/betRecord';
  static const DETAIL_BETRECORD_ALL = 'detail/betRecordAll';

  static const DYNAMICLIST = 'player/dynamicList';
  static const MESSAGELIST = 'player/messageList';
  static const BetWinNotice = 'player/betWinNotice';
  static const BetWinDetailRank = 'player/betWinDetailRank';

  static const READMSG = 'player/readMsg';

  /// 玩家通知-消息全部标记已读
  static const ALLREADMSG = 'player/setAllRead';

  /// 我的钱包-资金明细
  static const GETCAPITALRECORDS = 'player/capitalRecords';

  /// 我的钱包-交易类型摘要
  static const GET_TRADE_TYPE_ENUMS = 'player/getTradeTypeEnums';

  /// 获取已有的喜好联赛与球队
  static const PLAYERHOBBYLIST = 'player/hobbyList';

  /// 更新我的喜好
  static const PLAYERUPDATEHOBBY = 'player/updateHobby';

  /// 我的注单里的记录列表-将废弃
  static const BETRECORDTAB = 'order/betRecordTab';
  /// 我的注单里的记录列表-新接口
  static const ALLBETRECORDTAB = 'order/all/betRecordTab';

  /// 注单提前结算
  static const CONFIRMCASHOUT = 'bet/order/confirmCashout';

  /// 刷新提前结算
  static const REFRESSCASHOUTORDER = 'bet/order/refressCashoutOrder';

  /// 可分享的注单列表
  static const ALLOWSHAREORDERLIST = 'order/allowShareOrderList';

  /// 根据订单ID获取订单是否可以提前结算
  static const GETCASHOUTSTATUS = 'bet/order/getCashoutStatus';

  /// 根据订单ID获取订单是否可以提前结算
  static const GETCASHOUTINFO = 'bet/order/getCashoutInfo';

  /// 我的注单里的游戏记录列表
  static const GAME_BET_RECORD_TAB = 'game/betRecord';

  /// 我的注单里的游戏记录详情
  static const GAME_BET_RECORD_DETAIL = 'game/betRecordDetails';

  /// 体育钱包-根据订单号查询订单详情
  static const BYORDERID = 'order/byOrderId';

  /// 体育钱包-根据订单号查询订单详情
  static const BYORDERIDNEW = 'order/byOrderIdNew';
  static const BY_TRADE_No = 'order/getOrderByTradeNo';
  static const GETBETTOKEN = 'bet/order/getToken';
  static const BETMOREPW = 'bet/order/morePW';
  static const MOREBETTING = 'bet/order/moreBetting';
  static const BETCOMBOORDER = 'bet/order/betComboOrder';
  static const COMBOBETTING = 'bet/order/comboBetting';
  static const GETORDERSTATE = 'order/getOrderState';
  static const TOPMENU = 'common/topMenu';

  //上传头像
  static const UPLOADHEAD = 'uploadHead';

  //意见反馈
  static const SUBMITQUESTION = 'player/submitQuestion';

  //更新用户信息
  static const UPDATEPLAYERINFO = 'player/updatePlayerInfo';

  //隐身模式
  static const PRIVACY = 'setPrivacy';

  //关注/取消关注
  static const PLAYERFOLLOW = 'player/playerFollow';

  //收藏/取消收藏-比赛
  static const DETAILCOLLECT = 'detail/collect';

  //喜好—更新我的喜好
  static const UPDATEHOBBY = 'player/updateHobby';

  //APP应用更新上线历史记录
  static const APPHISTORY = 'app/version/onlineHistoryList';

  //搜索
  static const SEARCH = 'hot/search';
  //static const SEARCH = 'es/search';

  static const TOP5 = '/v1/top5';

  //获取所有赛季
  static const GetSeasonInfo = '/ai/season/getSeasonInfo';

  //获取所有赛季及赛季分类项
  static const SeasonItems = '/ai/top/competition/season/items';

  //获取赛季分类项对应排行数据
  static const SeasonTopTypeInfo = '/ai/top/competition/season/topTypeInfo';

  //获取当前赛季个人排行、胜率，盈利率曲线图
  static const SeasonWinStatistic = '/ai/season/winStatistic';

  //获取当前赛季个人擅长投注联赛、投注项
  static const SeasonBetLove = '/ai/season/betLove';

  //获取个人信息
  static const MobilePlayerInfo = '/ai/mobile/playerInfo';

  //跟投
  static const PlayerFollowBetRecord = '/ai/mobile/player/followBetRecord';

  //个人注单分享记录
  static const FindShareByPlayer = '/ai/mobile/game/findShareByPlayer';

  //获取最近20单(旧接口丢弃)
  static const MobilePlayerBet = '/ai/mobile/playerBet';

  //获取最近20单
  static const MobileNewPlayerBet = '/ai/mobile/new/playerBet';

  //主播最近20单
  static const MobileAnchorPlayerBet = '/ai/mobile/anchor/playerBet';

  //关注&取消关注
  static const PlayerFollow = 'player/playerFollow';

  //广告数据
  static const HOTADVERTS = "hot/adverts";

  //关注-豪门比赛接口
  static const GiantsMatchsList = "game/giantsMatchs";

  //关注--喜好球队/联赛
  static const AttentionHobbyMatchs = "attention/leagueMatchs";

  //我的关注---主播列表(旧接口)
  static const AttentionAnchorList = "player/anchorList";

  //我的关注---主播列表
  static const FollowAnchorList = "follow/followAnchorList";

  //我的关注&指定玩家关注列表---大咖
  // static const AttentionStarList = "player/starList";
  static const AttentionStarPage = "player/starPage";
  //我的关注的主播大咖
  static const AttentionAnchorStarList = "player/anchorStarList";

  //玩家通知---消息动态
  static const AttentionDynamicList = "player/dynamicList";

  //虚拟联赛查询
  static const VirtualLeagues = "virtual/leagues";

  //虚拟联赛查询
  static const VirtualCommonMatches= "virtual/matches/commonMatches";

  //热门比赛
  static const HotMatches= "hot/matches";

  //商户模块列表
  static const ModuleConfig= "merchant/moduleConfig";

  //修改密码
  static const ModifyPassword= "player/modifyPassword";

  //获取商户信息(3.10之后版本废弃该接口)
  static const QueryMerchantInfo = "queryMerchantInfo";

  //获取商户信息(3.10之后版本使用该接口)
  static const QueryMerchantInfoNew = "queryMerchantInfoNew";

  static const MerchantConfigDetail = "app/download/merchantConfigDetail";

  //获取聊天室红包列表
  static const RedPackList = "redPack/redPackList";

  //获取聊天室红包列表
  static const RedPackListNew = "redPack/redPackListNew";

  //获取红包详情
  static const RedPackInfo = "redPack/redPackInfo";

  //抢红包详情
  static const OpenRedPack = "redPack/openRedPack";

  static const ShareToChatRoom = "order/shareToChatRoom";

  // 玩家分享的注单列表
  static const BetShareList = "order/shareList";

  // 主播分享的注单列表
  static const AnchorBetShareList = "anchor/order/shareList";

  // 主播注单分享用户跟投列表
  static const AnchorShareRankList = "anchor/share/rankList";

  // 注单点赞
  static const LikeBetOrder = "order/like";

  // 用户响应时长记录
  static const SaveUserResponse = "track/api/saveUserResponse";

  // 三合一接口(common/businessConfig、queryMerchantInfo、app/download/merchantConfigDetail)
  static const MerchantAppConfig = "common/merchantAppConfig";

  // 获取所有平台的滚球数量
  static const QueryGameCount = "game/queryGameCount";

  static const QueryConditionLeagueAll = "queryCond/queryConditionLeagueAll";
  // 查询关注 动态 是否已读(关注红点状态)
  static const QueryDynamicFlag = "player/getDynamicFlag";

  /// 联赛选择（全体育项 && 热门/滚球 && 全部/重要）
  static const QueryLeagueList = "queryLeagueList";

  /// 联赛选择-赛果
  static const LeagueNames2App = "match/leagueNames2App";

  /// 订单不同状态数量统计
  static const betListNum = "order/betListNum";

  /// 订单滚球比赛动态信息
  static const getRBGameDynamicInfo = "game/getGameListByGidms";

  /// 订单滚球比赛动态信息
  static const walletList = "merchantAccountServer/api/c/getCMerAccessWallet";

  // 全部钱包列表
  static const walletAllList = "walletmanager/api/c/getWalletAll";

  ///
  static const playLimit = "bet/playLimit";

  /// 本场lottery money
  static const HomeCourseLotteryMoney = 'orderQueryServer/api/c/anchor/anchorOrderGameList';
  /// 用户信息
  static const PlayerAccountList = 'playerAccountServer/api/c/player/getPlayerAccountList';
  /// 用户标签信息获取req
  static const AnchorOrderGameList = 'orderQueryServer/api/c/anchor/nowplayerRank';
  /// banner、首屏推送、排行版 点击统计
  static const ClickStatistics = 'dataConfig/api/c/clicks/config';
  /// 排行榜
  static const AnchorOrderRank = "gift/userContributeRank";
  /// 本场豪气榜提示
  static const RankOddsMessage = "dataConfig/api/c/player/level/getPlayerLevel";

  /// 虚拟体育入口
  static const vmSportEntry = "/ai/rgs/mobile/getRGSRedirectUrl";
  /// 汇率接口
  static const selectCurrencyExchange = "dataConfig/api/c/selectCurrencyExchange";
  /// BTI订单确认
  static const orderConfirm = "bet/order/confirm";

  /// 爆料列表24小时内的数据
  static const shareBetOrderList = "userShare24OrderList";

  /// 爆料详情
  static const shareBetOrderDetail = "userShareDetail";

  /// 爆料历史
  static const myBrokeOrder = "myBrokeOrder";

  /// 游戏过滤类型
  static const getGameType = "game/info";
}
