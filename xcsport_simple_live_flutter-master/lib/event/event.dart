import 'package:event_bus/event_bus.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_user_win_model.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/anchor_share/anchor_bet_share_follow_model.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/game_notify_message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/live_player/live_player_config.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/match_view_choose/match_view_choose_model.dart';
import 'package:fast_ai/pages/detail/gift/gift_info_model.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';

///1.生产消息
///   Event.eventBus.fire(SortEvent(1));
///2.订阅消息
///   Event.eventBus.on<SortEvent>().listen((event) {
///     print(event.sort);
///   });
class Event {
  static EventBus eventBus = EventBus();
}

class FastAiSdkEvent {
  Map<String, dynamic> data;
  FastAiSdkEvent({this.data});
}

class FollowAnchorEvent extends BaseEvent {
  final String anchorId;
  FollowAnchorEvent({this.anchorId});
}

class OpenedRedBagEvent extends BaseEvent {
  final bool isError; //抢红包异常
  final bool isTimeout;
  final String packetId;
  final int systemTime;
  OpenedRedBagEvent(
      {this.isError = false,
      this.packetId,
      this.systemTime,
      this.isTimeout = false});
}

class RedBagDisposeEvent extends BaseEvent {
  RedBagDisposeEvent();
}

// 版式偏好变化事件
class PageStyleEvent extends BaseEvent {
  int pageStyle;
  PageStyleEvent(this.pageStyle);
}

//盘口设置变化事件
class HandicapEvent extends BaseEvent {
  int handicap;
  HandicapEvent(this.handicap);
}

//联赛搜索页，是否显示居中提示文字
class CheckShowHintText {}

//排序方式变化事件
class SortEvent extends BaseEvent {
  int sort;
  SortEvent(this.sort);
}

class VMSportConfigLoadedEvent {
  VMSportConfigLoadedEvent();
}

bool isVirtualGidm(String gidm) {
  return string(gidm).startsWith('vi');
}

class NetworkStateEvent extends BaseEvent {
  XCNetworkState state;
  NetworkStateEvent(this.state);
}

//登录消息
class ReloginedEvent extends BaseEvent {
  ReloginedEvent();
}

// sdk 需要登录
class HooksSdkEvent extends BaseEvent {
  bool loginSuccess;
  HooksSdkEvent({this.loginSuccess});
}

//登出消息
class UnloginEvent extends BaseEvent {
  UnloginEvent();
}

//选择体育项通知
class SportTypeEvent extends BaseEvent {
  String sportType;
  SportTypeEvent(this.sportType);
}

//详情
class DetailEvent extends BaseEvent {
  String gidm;
  DetailEvent(this.gidm);
}

//详情扩展
class ExtendEvent extends BaseEvent {
  ExtendModel extendModel;
  ExtendEvent(this.extendModel);
}

//详情头部视图
class DetailViewEvent extends BaseEvent {
  MatchViewChooseModel matchViewChooseModel;
  DetailViewEvent(this.matchViewChooseModel);
}

//class HorizontalPlayEvent extends BaseEvent {
//  HorizontalPlayListModel horizontalPlayListModel;
//  HorizontalPlayEvent(this.horizontalPlayListModel);
//}

class WifiEvent {
  AiFluxMode mode = AiFluxMode.OnlyWifi;
  WifiEvent(this.mode);
}

class LiveChatMessageEvent extends BaseEvent {
  List<Message> messages;
  LiveChatMessageEvent(this.messages);
}

class ChatMessageEvent extends BaseEvent {
  String comeFrom;
  Map<String, dynamic> data;
  ChatMessageEvent(this.data,{this.comeFrom});
}

class ChatOwnMessageEvent extends BaseEvent {
  String data;
  ChatOwnMessageEvent(this.data);
}

class ChatOwnGiftMessageEvent extends BaseEvent {
  GiftInfoModel giftInfoModel;
  ChatOwnGiftMessageEvent(this.giftInfoModel);
}

// 比赛/联赛收藏
class CollectGameEvent extends BaseEvent {
  bool isCollect = false;
  String gidm = '';
  CollectGameEvent({this.isCollect, this.gidm});
}

// 联赛收藏
class CollectLeagueEvent extends BaseEvent {
  bool isCollect = false;
  CollectLeagueEvent({this.isCollect});
}

//切换主播
class AnchorChooseEvent extends BaseEvent {
  LiveVideoInfo liveVideoInfo;
  AnchorChooseEvent(this.liveVideoInfo);
}

class ChatRoomChooseEvent extends BaseEvent {
  String anchorId;
  ChatRoomChooseEvent(this.anchorId);
}

// 游戏通知
class GameNotifyEvent extends BaseEvent {
  GameNotifyMessage message;
  GameNotifyEvent(this.message);
}

class DetailHeadHideOrShowEvent extends BaseEvent {
  bool hideStuff;
  DetailHeadHideOrShowEvent(this.hideStuff);
}

//详情收藏玩法
class CollectPlayTypeEvent {
  String newPlayType; // newPlayType = playType + session + suffix;
  CollectPlayTypeEvent(this.newPlayType);
}

//详情点击支持
class OnSupportEvent {
  int createTime = DateTime.now().millisecondsSinceEpoch;
}

//详情头部固定
class DetailHeadFixedEvent {
  int createTime;
  int fixedDetailHeadType = 0; //默认0， 0,1表示未固定； 2：手动固定，3：滑动固定
  //bool isShowFixedIcon = true; //是否显示固定按钮
  DetailHeadFixedEvent(this.fixedDetailHeadType, this.createTime);
}

//详情头部隐藏等
class HeadFixedHideEvent {
  int fixedDetailHeadType = 0; //默认0， 0,1表示未固定； 2：手动固定，3：滑动固定
  bool isShowFixedIcon = true; //是否显示固定按钮
  HeadFixedHideEvent(this.fixedDetailHeadType, this.isShowFixedIcon);
}

//详情视频时 横屏/竖屏
class DetailOrientationEvent {
  Orientation orientation; //是否显示固定按钮  landscape：横屏，portrait：竖屏
  DetailOrientationEvent(this.orientation);
}

//详情列表直播
class DetailLiveEvent {
  bool isShowLive;
}

class SwitchAnchorEvent {
  String anchorId;
}

class BaseEvent {
  static int seq = 0;
  //消息流水号
  int createTime = ++seq;
  //int createTime = DateTime.now().millisecondsSinceEpoch;
}

//公共消息， 具体事件类型通过 type is DetailViewEvnet 来判断是哪种消息
class GlobalEvent extends BaseEvent {
  BaseEvent _type;
  String menu_key;
  BaseEvent get type => _type;
  GlobalEvent(this._type, {this.menu_key});
}

class OnGoPage {
  final String name;
  final String leagueId;
  OnGoPage({this.name: 'home', this.leagueId = ''});
}

//聊天室开放状态
class ChatRoomOpenStatus {
  bool isOpen = false;
  ChatRoomOpenStatus({this.isOpen});
}

//
class HideInput {
  HideInput();
}

//未读消息
class UnReadNum {
  num count;
  UnReadNum({this.count = 0});
}

//
class DismissLaunchPage {
  DismissLaunchPage();
}

class NeedUpdateHomePage {
  NeedUpdateHomePage();
}

class UpdateSDKTile {
  final title;
  UpdateSDKTile(this.title);
}

//比赛数据加载完毕
class GameListLoadFinished {}

class ChangeConstellation {
  String constellation;

  ChangeConstellation(this.constellation);
}

class RankingListParamsChange {
  String sportType;
  RankingListParamsChange({this.sportType});
}

class HitOptionCount {
  int count;
  HitOptionCount({this.count});
}

class UpdateBettingBet {
  UpdateBettingBet();
}

// 切换底部栏到投注单
class SelectBetTabbarItem {
  bool isActivePage = false;
  SelectBetTabbarItem(this.isActivePage);
}

class AttentionFriend {
  String playerId;
  AttentionFriend({this.playerId});
}

class BetFilterEvent {
  int index;
  BetFilterEvent({this.index});
}

class AnchorLiveEvent {
  AnchorLiveEvent();
}

// 详情预约直播
class AnchorReserveEvent {
  // bool isReserve = false;
  // String anchorId ='';
  AnchorReserveEvent();
}

// 比赛关注列表刷新
class MatchAttentionEvent {
  MatchAttentionEvent();
}

class ShowComboSwitchEvent {
  bool show;
  ShowComboSwitchEvent(this.show);
}

class ModuleSwitchChangeEvent {
  List<String> moduleCodes;
  ModuleSwitchChangeEvent({this.moduleCodes});
}

class LiveChangeEvent {
  bool isShowLivePanel = false;
  LiveChangeEvent({this.isShowLivePanel});
}

//体育数据源切换事件
class SportPlatformChangeEvent {
  int platformId;
  SportPlatformChangeEvent({this.platformId});
}

// 手动点水事件
class ManualPwMoreEvent {
  ManualPwMoreEvent();
}

// sdk切换频道刷新
class ChannelLeagueEvent {
  ChannelLeagueEvent();
}

// 比赛详情底部按钮栏，显示比赛指标信息：赛况、阵容、历史战绩
class MatchGlobalInfoEvent {
  MatchGlobalInfoEvent();
}

// 比赛详情底部按钮栏，显示更多直播视频列表
class MoreVideoEvent {
  MoreVideoEvent();
}

// 比赛详情底部按钮栏，显示更多功能
class DetailMoreFunctionEvent {
  DetailMoreFunctionEvent();
}

// 购物车显示与隐藏状态事件
class ShoppingCarStatusEvent {
  bool show;
  ShoppingCarStatusEvent({this.show});
}

// 活动-翻牌显示与隐藏状态事件
class ActivityDrawStatusEvent {
  bool show;
  bool isDetail;
  ActivityDrawStatusEvent({this.show,this.isDetail = false});
}
// 活动-用户中奖推送
class ActivityDrawWinPrizeEvent {
  WinPrizeUserModel winPrizeUserModel;
  ActivityDrawWinPrizeEvent({this.winPrizeUserModel});
}

// 查看悬浮窗
class LookCollectMatchEvent {
  LookCollectMatchEvent();
}

// tabSDK注单刷新
class TabSDKBetRefreshEvent {
  int selectIndex;
  TabSDKBetRefreshEvent({this.selectIndex = 2});
}

// 关闭详情页通知
class CloseDetailPageEvent {
  CloseDetailPageEvent();
}

// 关闭详情页通知
class MerchantInfoUpdateEvent {
  MerchantInfoUpdateEvent();
}

// 登录成功
class LoginSuccess {
  LoginSuccess();
}

//
class PageTabIndexEvent {
  int index;
  PageTabIndexEvent({this.index});
}

//
class ShowFloatVideo {
  ShowFloatVideo();
}

//
class HasNewBetShareEvent {
  HasNewBetShareEvent();
}

//
class UpdateFlyEndPointEvent {
  double offsetX;
  double offsetY;
  UpdateFlyEndPointEvent({@required this.offsetX, @required this.offsetY});
}

class RetryLoadAssetsEvent {
  RetryLoadAssetsEvent();
}

class EmptyHandicapEvent {
  EmptyHandicapEvent();
}

class AnchorBetShareFollowEvent {
  AnchorBetShareFollowModel model;
  AnchorBetShareFollowEvent({this.model});
}

///更新注播注单分享跟投投行榜
class UpdateAnchorShareFollowBetRankEvent {
  String sid;
  UpdateAnchorShareFollowBetRankEvent({this.sid});
}

///更新投注默认金额
class UpdateBetDefaultGoldEvent {
  bool isUpdate;
  UpdateBetDefaultGoldEvent({this.isUpdate = false});
}

///在投注页显示禁用提示图文
class ShowBetPageForbidEvent {
  String errorCode;
  String errorMsg;
  ShowBetPageForbidEvent({this.errorCode, this.errorMsg});
}

///在投注页顶部显示提示消息
class OnBetPageTopShowMsgEvent {
  String errorCode;
  String errorMsg;
  OnBetPageTopShowMsgEvent({this.errorCode, this.errorMsg});
}

///详情页左右切换
class DetailSwiperChangeEvent {
  int index;
  DetailSwiperChangeEvent({this.index});
}

/// 投注
class BettingContainer2P0DisposeEvent {
  BettingContainer2P0DisposeEvent();
}

/// 投注成功
class BettingSuccessEvent {
  num allBetGold = 0;
  BettingSuccessEvent({this.allBetGold}) {
    if (!isStrNullOrEmpty(this.allBetGold)) {
      config.userInfo.currLaunchAllBetGold += this.allBetGold;
      config.userInfo.videoCurrAllBetGold += this.allBetGold;
    }
  }
}

class DetailPageSwiperTo0Event {
  DetailPageSwiperTo0Event();
}

/// 红包数量已变化
class RedPacketChangedEvent extends BaseEvent {
  RedPacketChangedEvent();
}

/// 聊天室注单分享点赞功能
class ChatRoomBetShareLikeEvent {
  final String orderNo;
  ChatRoomBetShareLikeEvent({this.orderNo});
}

class UserCardFollowStatusChangedEvent {
  UserCardFollowStatusChangedEvent();
}

class AnchorLiveSubscribeChangedEvent {
  AnchorLiveSubscribeChangedEvent();
}

//刷新余额
class RefreshBalanceEvent {
  RefreshBalanceEvent();
}

//刷新所有钱包余额
class RefreshWalletEvent {
  RefreshWalletEvent();
}

//详情视频状态事件发送
class DetailVideoEvent {
  String state; //playing,stop
  DetailVideoEvent({this.state});
}

//关闭小视频
class VlogCloseEvent {
  VlogCloseEvent();
}

//关闭详情视频
class CloseDetailLiveEvent {
  CloseDetailLiveEvent();
}

// 用户信息更新通知
class UserAccountDidUpdateEvent {
  UserAccountDidUpdateEvent();
}

//详情玩法分组选中，用于处理玩法默认展开或收缩
class NavSelectGroupEvent {
  NavSelectGroupEvent();
}

class AiCacheInitCompleteEvent {
  AiCacheInitCompleteEvent();
}

/// 新体育
class NewSportUpdateCheckEvent {
  BuildContext context;
  NewSportUpdateCheckEvent(this.context);
}

// 首页初始化完成事件
class HomeReadyEvent {
  BuildContext context;
  HomeReadyEvent(this.context);
}

class SDKWillExitEvent {
  SDKWillExitEvent();
}

//显示礼物弹窗
class ShowGiftEvent {
  bool isDelay = true;
  ShowGiftEvent({this.isDelay = true});
}

//详情底部栏更多切换视频
class DetailMoreChangeVideoEvent {
  VideoType videoType;
  DetailMoreChangeVideoEvent({this.videoType});
}

//比赛结束
class MatchFinishEvent {
  MatchFinishEvent();
}

//投注比赛返回gidm集合
class BetedMatchEvent {
  List<String> gidms = [];
  BetedMatchEvent({this.gidms});
}

//跳转到投注结果页时，通知隐藏投注页的tabbar
class BettingPageTabBarShowHideEvent {
  bool hide;
  BettingPageTabBarShowHideEvent({this.hide});
}

//CI切换玩法
class CISelectPlayTypeEvent {
  String playType;
  CISelectPlayTypeEvent({this.playType});
}

//多语言切换
class LanguageChangeEvent {
  String langCode;
  LanguageChangeEvent({this.langCode});
}

//BI更新玩法筛选
class UpdatePlayTypeEvent {
  String menuKey;
  UpdatePlayTypeEvent({this.menuKey});
}

class DefaultWalletChangeEvent {
  DefaultWalletChangeEvent();
}

//精选赛事配置名称
class RefinedEvent {
  RefinedEvent();
}

//获取精选赛事
class RefinedMatchEvent {
  RefinedMatchEvent();
}

//精选赛事详情
class RefinedDetailEvent {
  bool isShowRefinedDetail;
  RefinedDetailEvent({this.isShowRefinedDetail = false});
}

//精选赛事详情通知滚动到聊天室
class RefinedChatRoomEvent {
  RefinedChatRoomEvent();
}

//精选赛事赛果详情
class RefinedFinishGameEvent {
  RefinedFinishGameEvent();
}

//精选列表上滑加载赛果详情时通知赛果详情更新数据
class RefinedFinishGameParamEvent {
  String gidm;
  RefinedFinishGameParamEvent({this.gidm = ''});
}

// 精选页赛果视频状态事件发送
class LiveGameVideoEvent {
  String state; //playing,stop
  LiveGameVideoEvent({this.state});
}

// Webview相关事件
class WebViewEvent {
  String title;
  WebViewEvent({this.title});
}

// 详情页玩法列表切换玩法组，让列表滚动到顶部
class PlayTypeListScroll2TopEvent{
  PlayTypeListScroll2TopEvent();
}

// 长时间没有投注观看视频
class WatchLiveTimeEvent{
  bool isCloseLive = false;
  WatchLiveTimeEvent({this.isCloseLive = false});
}

// 打开网页(论坛里面隐藏悬浮)
class EntryWebEvent{
  bool isShow;
  EntryWebEvent({this.isShow = true});
}

// 列表精选页背景图片
class RefinedBgEvent{
  String leagueColor;   // 联赛颜色
  String netLeagueBg;   // 联赛背景图
  String gameType;
  RefinedBgEvent({this.netLeagueBg, this.gameType, this.leagueColor});
}

// 注单列表多语言切换
class RecordLangEvent {
  RecordLangEvent();
}

// 早盘详情比赛头部背景视频
class HeadVideoEvent {
  HeadVideoEvent();
}

// 主播列表进详情
class FreeAnchorEntryDetailEvent {
  bool isExitDetail = false;
  FreeAnchorEntryDetailEvent({this.isExitDetail = false});
}

// 自由主播列表视频
class FreeAnchorVideoEvent {
  bool isPlayVideo = false;
  FreeAnchorVideoEvent({this.isPlayVideo = false});
}

// 自由主播关闭视频
class FreeAnchorCloseVideoEvent {
  FreeAnchorCloseVideoEvent();
}

// 主播列表刷新
class RefreshFreeAnchorEvent {
  String gidm = '';
  String anchorId = '';
  RefreshFreeAnchorEvent({this.gidm = '', this.anchorId = ''});
}

// 自由主播列表进入二级页面
class FreeAnchorEntryOtherPageEvent {
  bool isEntryOtherPage = false;
  bool isExitApp = false;
  FreeAnchorEntryOtherPageEvent({this.isEntryOtherPage = false, this.isExitApp = false});
}

// 刷新我要爆料列表
class RefreshShareOrderListEvent {
  String selectType; // 1 我要爆料列表 2晒单
  String orderState;
  RefreshShareOrderListEvent({this.selectType = '1',this.orderState});
}

// 打开游戏
class OpenGameEvent {
  bool isUpdateGame = false;
  OpenGameEvent({this.isUpdateGame = false});
}

// 体育-游戏主播来回切
class AnchorTypeChangedEvent {
  AnchorTypeChangedEvent();
}

// 详情页自由播列表关闭
class FreeAnchorCloseDetailEvent {
  FreeAnchorCloseDetailEvent();
}

// 详情视频状态事件发送
class CloseVideoEvent {
  String state; //playing,stop
  CloseVideoEvent({this.state});
}

// 显示游戏(自由播游戏弹窗显示大幕-竖屏)
class ShowGameEvent {
  bool isShowGame = false;
  ShowGameEvent({this.isShowGame = false});
}

// 显示点击游戏动画
class ShowGameAnimatedEvent {
  Offset offset;
  AiGameCellModel gameModel;
  ShowGameAnimatedEvent({this.offset, this.gameModel});
}

// 切换底部栏
class ChangeBottomBarEvent {
  bool isPlayVideo;
  ChangeBottomBarEvent({this.isPlayVideo = false});
}
