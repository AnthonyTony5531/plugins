import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:common_component/mvvm/view/view_observer.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/widget/sc_refresh_view/sc_refresh_view.dart';
import 'package:dio/dio.dart';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/api/protocols/aigames/ai_game_select_by_game_key.dart';
import 'package:fast_ai/api/protocols/chatroom/redbag_protocol.dart';
import 'package:fast_ai/api/protocols/chatroom/room_info_protocol.dart';
import 'package:fast_ai/api/protocols/detail/live_room_info_protocol.dart';
import 'package:fast_ai/api/protocols/detail/slide_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/migrate_plugins/xcpageslider/page_slider.dart';
import 'package:fast_ai/migrate_plugins/xcpageslider/page_slider_container.dart';
import 'package:fast_ai/models/detail_rate_model.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/models/play_group_model.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_widget.dart';
import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor_match_page.dart';
import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor_match_page_view_model.dart';
import 'package:fast_ai/pages/detail/active_banner/active_banner.dart';
import 'package:fast_ai/pages/detail/bottom_nav/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function_slide.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/anchor_share/anchor_bet_share_follow_model.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/anchor_game_service.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/anchor_share_service.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
import 'package:fast_ai/pages/detail/bottom_nav/video/video_live_view.dart';
import 'package:fast_ai/pages/detail/chatroom/chatroom_game/game_animated_view.dart';
import 'package:fast_ai/pages/detail/chatroom/free_anchor_chatroom.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/game_notify_message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/chatroom_bloc.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/chatroom_widget.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/float_red_packet_helper.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/float_red_packet_portrait.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/input_chat_room_barrage_manager.dart';
import 'package:fast_ai/pages/detail/chatroom/redbag/redbag_window.dart';
import 'package:fast_ai/pages/detail/detail_container/finish_match_detail_container.dart';
import 'package:fast_ai/pages/detail/detail_cover/detail_cover.dart';
import 'package:fast_ai/pages/detail/emtpy/finish_game_empty/finish_game_empty.dart';
import 'package:fast_ai/pages/detail/free_anchor/free_anchor_rank/free_anchor_rank_view.dart';
import 'package:fast_ai/pages/detail/game/game_notify_widget.dart';
import 'package:fast_ai/pages/detail/game/live_game.dart';
import 'package:fast_ai/pages/detail/gift/preload/gift_res_preload_server.dart';
import 'package:fast_ai/pages/detail/head/head.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_anchor.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_anchor_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_default.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/play_group_nav/play_group_nav_ping_controller.dart';
import 'package:fast_ai/pages/detail/selected_viewtype.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/performance/manager/logger_kit_manager.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_image_helper.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/ai_navigator_observer.dart';
import 'package:fast_ai/utils/container_timer_manager.dart';
import 'package:fast_ai/utils/init_timer_tool.dart';
import 'package:fast_ai/utils/keyboard_utils.dart';
import 'package:fast_ai/utils/model_controller_builder.dart';
import 'package:fast_ai/utils/refined_match.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'package:fast_ai/utils/xcstomp/xc_subcribecallback.dart';
import 'package:fast_ai/widgets/ai_drag_refresh.dart';
import 'package:fast_ai/widgets/alert/text_explain_alert.dart';
import 'package:fast_ai/widgets/barrage/barrage_manager.dart';
import 'package:fast_ai/widgets/default_views/match_empty.dart';
import 'package:fast_ai/widgets/default_views/match_loading.dart';
import 'package:fast_ai/widgets/float_widget.dart';
import 'package:fast_ai/widgets/loading_dialog.dart';
import 'package:fast_ai/widgets/loading_widget/ai_page_loading.dart';
import 'package:fast_ai/widgets/pinwheel/pinwheel_helper.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/popup_slider_page.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:fast_ai/widgets/ui_helper.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:fast_ai/widgets/xc_slide.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:wakelock/wakelock.dart';
import 'bottom_nav/bottom_navigation_bar/bottom_navigation_bar_model.dart';
import 'chatroom/chatroom.dart';
import 'chatroom/common/message_helper.dart';
import 'chatroom/message/bean/chat_user.dart';
import 'chatroom/message/bean/message.dart';
import 'detail_container/match_detail_background.dart';
import 'detail_container/match_detail_container.dart';
import 'detail_page_data_widget.dart';
import 'detail_page_model.dart';
import 'free_anchor/free_anchor_rank/free_anchor_rank_view.dart';
import 'head/anchor_detail_head.dart';
import 'live_player/live_player_page.dart';
import 'live_player/video_player_view/common_video_player_controller.dart';
import 'live_player/video_player_view/common_video_player_view.dart';
import 'live_player/video_player_view/common_video_player_view_model.dart';
import 'match_view_choose/match_view_choose_model.dart';

final int _firstLoadTimeOutSecond = 15; //???????????????????????????15???

// ????????? - ???????????????????????????
class DetailPageRefreshManager {
  factory DetailPageRefreshManager() => _getInstance();

  static DetailPageRefreshManager get instance => _getInstance();

  static DetailPageRefreshManager _instance;

  static DetailPageRefreshManager _getInstance() {
    if (_instance == null) _instance = new DetailPageRefreshManager._internal();
    return _instance;
  }

  DetailPageRefreshManager._internal();

  VoidListener _comeBackRefreshListener = VoidListener();

  // ????????????????????????
  int _currentShowPage = 0;

  // ???????????????????????????
  int _recoverShowPage = 0;

  bool _isHasDispose = false; //  ??????,???????????????????????????
  bool _isComeBack = false; // ?????????,??????????????????,??????_isHasDispose:ture

  final Map<int, bool> _hashCodeMap = {};

  set currentShowPage(int hashCode) {
    _currentShowPage = hashCode;
  }

  set recoverShowPage(int hashCode) {
    _recoverShowPage = hashCode;
    _isComeBack = true;
    if(_isHasDispose){
      _comeBackRefreshListener.fire();
    }else{
      _isComeBack = false;
    }
  }

  void addComeBackRefresh(VoidCallback callBack){
    _comeBackRefreshListener?.addListener(callBack);
  }

  void removeComeBackRefresh(VoidCallback callBack){
    _comeBackRefreshListener?.removeListener(callBack);
  }

  // ?????????????????????????????????
  // ???????????????????????????????????????????????????????????????
  void initPageCode(int hashCode) {
    print('detailPage initPageCode ======> $hashCode');
    _currentShowPage = hashCode;
    _hashCodeMap[hashCode] = false;
  }

  // ?????? ---- recoverShowPage ???dispose?????????
  void disposePageCode(int hashCode) {
    config.anchorType = AnchorType.none;

    print('dispose =========> $hashCode');
    _hashCodeMap.remove(hashCode);
    if(_hashCodeMap.length != 0){
      _isHasDispose = true;
      _hashCodeMap.forEach((key, value) => _hashCodeMap[key] = true);
    }else{
      _isHasDispose = false;
    }
  }

  // ????????????reload
  bool get isComeBackReload => _isComeBack;

  // ??????????????????
  bool isNeedReloadRefresh(int hashCode) {
    bool isA = _recoverShowPage == hashCode;
    bool isB = _isHasDispose;
    if(isA && isB){
      // ????????????????????????????????????????????????
      this.currentShowPage = hashCode;
      _isHasDispose = false;
      _isComeBack = false;
      return true;
    }
    return false;
  }
}

class DetailPage extends StatefulWidget {
  dynamic params;
  final bool isVirtual;
  static bool currentPageIsDetailPage = false;
  static bool reshow = false;

  DetailPage({Key key, this.params, this.isVirtual}) : super(key: key) {
    config.userInfo.detailSet = DetailSet();
  }

  @override
  _DetailPage createState() => _DetailPage();

  static Future<dynamic> show(BuildContext context, DetailPage detailPage,
      {bool isUpdateDetail = false, bool currentPageIsDetailPage = false, VoidCallback goBack, bool isPushRoute = false, bool isShowFloat = true}) {
    updateFloatContext(context);
    // ????????????????????????????????????
    final pageHashCode = detailPage.hashCode;
    DetailPageRefreshManager.instance.initPageCode(pageHashCode);
    RouteSettings settings = RouteSettings(name: AiRouter.AiDetailPage,arguments: {'pageHashCode':pageHashCode});
    var onComplete = (){
      goBack?.call();
      DetailPageRefreshManager.instance.disposePageCode(pageHashCode);
    };
//    Event.eventBus.fire(MatchCollectionSelectedOverlayNotication(mode: OperatorMode.hide));
//    new MatchCollectionInfoService().saveOrUpdateCurrentMatchUserWatching(MatchCollectionInfoModel(
//      gidm: detailPage.params is String ? detailPage.params : (detailPage.params as DetailParams).gidm,
//    ));
    if (DetailPage.currentPageIsDetailPage || currentPageIsDetailPage) {
      // ??????detailPage?????????????????????currentPageIsDetailPage
      sleep(600, () => DetailPage.currentPageIsDetailPage = true);
      // ??????????????????????????????
      if (isUpdateDetail) {
        showFloatPageUpdateDetail(
          context,
          detailPage,
          false,
          FloatOverlay.MatchesCollectedOverlay,
          settings,
        ).whenComplete(onComplete);
      } else {
        if (isPushRoute) {
          showFloatPage2(
            context,
            detailPage,
            false,
            FloatOverlay.MatchesCollectedOverlay,
                () {},
            settings,
          ).whenComplete(onComplete);
        } else {
          showFloatPage3(
            context,
            detailPage,
            false,
            FloatOverlay.MatchesCollectedOverlay,
            settings,
          ).whenComplete(onComplete);
        }
      }
    } else {
      DetailPage.currentPageIsDetailPage = true;
      //BUG???25075??????????????????A????????????????????????????????????????????????????????????B????????????????????????A?????????
      FloatStatus floatStatus = getFloatStatus();
      if (floatStatus == FloatStatus.ShowFloat) {
        clearFloatMatchDetail();
        closeFloatPage(context);
      }
      showFloatPage2(
        context,
        detailPage,
        false,
        FloatOverlay.MatchesCollectedOverlay,
            (){
              // ?????????????????????????????????????????????????????????
              if(!isShowFloat) return;
              changeFloatWidget(context);
            }, // ????????????,???????????????
        settings,
      ).whenComplete(onComplete);
    }
    return null;
  }
}

class _DetailPage extends State<DetailPage>
    with WidgetsBindingObserver, TickerProviderStateMixin, ViewObserver {
//  final MatchCollectionInfoService matchCollectionInfoService =
//      new MatchCollectionInfoService();

//  final GlobalKey<DetailBetWidgetState> detailBetKey =
//      GlobalKey<DetailBetWidgetState>();
  final GlobalKey<DetailPageDataWidgetState> detailDataKey =
      GlobalKey<DetailPageDataWidgetState>();
  final GlobalKey<ActiveBannerState> activeBannerKey1 =
      GlobalKey<ActiveBannerState>();
  final GlobalKey<ActiveBannerState> activeBannerKey2 =
      GlobalKey<ActiveBannerState>();
  final GlobalKey<GameAnimatedViewState> gameAnimatedKey =
  GlobalKey<GameAnimatedViewState>();

//  final AutoUploadPlayListService _autoOddsService =
//      AutoUploadPlayListService();

  AnimationController slideAnimationController;

  PlayGroupModel playGroupModel;
  DetailRateModel detailRateModel;
  MatchesDetailModel matchesDetailModel = MatchesDetailModel();
  ExtendModel extendModel;
  DPageModel dPageModel;
  dynamic _selectGroupId = "";
  String gidm;
  String homeId;
  String awayId;
  DetailSet detailSet =
      config.userInfo.detailSet; // = config.userInfo.detailSet;
  double headHeight = 0;
  double animationHeadHeight = 0; //202
  double videoHeadHeight = 0; //212
  int leagueCount;
  Map<String, double> varietyIorMap = {};
  double offsetX = 0;
  bool isStartActiveBannerTimer = false;
  Map<String, HandicapModel> handicapMap = {};
  MoreFunctionSlide moreFunctionSlide;
  VideoLive currentVideoLive;
  num watchTotal = 0;
  String liveId; // ??????????????????
  Size gameType1Size = Size(640.0, 960.0); // ?????????????????????
  Size gameType2Size = Size(375.0, 482.0); // ?????????????????????

  StreamSubscription<NetworkStateEvent> networkStateEventNetworkStateEvent;
  StreamSubscription<LiveGameVideoEvent> _liveGameVideoEvent;
  StreamSubscription<DetailParams> detailParamsEvent;
  StreamSubscription<ChatRoomOpenStatus> chatRoomCloseStreamSubscription;
  StreamSubscription<DetailViewEvent> detailMatchViewEvent;
  StreamSubscription<ModuleSwitchChangeEvent> moduleChangeEvent;
  StreamSubscription<MatchGlobalInfoEvent> showMatchGlobalInfoEvent;
  StreamSubscription<MoreVideoEvent> showMoreVideoEvent;
  StreamSubscription<DetailMoreFunctionEvent> detailMoreFunctionEvent;
  StreamSubscription<CloseDetailLiveEvent> closeDetailLiveEvent;
  StreamSubscription<RefinedDetailEvent> refinedDetailEvent;
  StreamSubscription<RefinedChatRoomEvent> refinedChatRoomEvent;
  StreamSubscription<CloseDetailPageEvent> closeDetailPageEvent;
  StreamSubscription<DetailLiveEvent> detailLiveListEvent;
  StreamSubscription<CollectPlayTypeEvent> collectPlayTypeEvent;
  StreamSubscription<AnchorChooseEvent> anchorChooseEvent;
  StreamSubscription<ChatRoomChooseEvent> chatRoomEvent;
  StreamSubscription<ExtendEvent> extendEvent;
  StreamSubscription<DetailEvent> detailEvent;
  StreamSubscription<DetailOrientationEvent> detailOrientationEvent;
  StreamSubscription<ShowGameAnimatedEvent> showGameAnimatedEvent;


  Orientation _oldOrientation = Orientation.portrait;
  final BottomNavBarModel bottomNavBarModel = new BottomNavBarModel();

  bool isVirtual = false;
  bool isInitAnchorLive = false;

  bool isListDetail = false; // ??????????????????(???????????????)

  bool isExpanded = true;

  // ???????????????????????????SystemId
  String _scoreDynamicSystemId;

  //??????????????????????????????
  bool allLoadFinished = false;

//  //????????????????????????config.userInfo.currentSaveHitOptionType???????????????
//  HitOptionType outSideHitOptionType;
//  HitMode outSideHitMode;

  int code = 0;
  bool isMatchClose = false;
  bool showBottomNav = false;
  bool isBettingBottom = true;

  DecorationImage headBgImg;
  String a = '';

  int channelType = 1;

  String _topicLang;
  String _topic;
  String _giftTopic;
  String _overallGiftTopic;
  String _intoChatRoomTopic;
  String _chatRoomLikeTopic;
  String _anchorTopic;
  String roomNo;
  bool isFromAnchor = false;
  String _betShareTopic;
  String _anchorBetShareTopic;
  String _anchorBetShareFollowTopic;
  String _detailHandicapTopic;
  String _anchorOfflineTopic;
  String _freeAnchorGameTopic;
  String _gameNotifyTopic;
  bool followSwitchStatus;
  bool chatRoomSwitchStatus;
  bool isConnectNetwork = false;
  bool isBlackShowHead = false; //??????????????????
  bool isShowGameView = true;
  Offset gameBtnOffset = Offset.zero;
  AiGameCellModel gameModel;
  double gameTopMargin = 0.0;

  //?????????????????????
  ChatRoomOpenStatus chatRoomOpenStatus = ChatRoomOpenStatus();

  ScRefreshViewController playListRefreshController =
      new ScRefreshViewController();
  ScRefreshViewController pushOrderRefreshController =
      new ScRefreshViewController();
  ScRefreshViewController followOrderRefreshController =
      new ScRefreshViewController();

  String selectAnchorId;
  String chatroomAnchorId;
  bool isInited = false;

  bool _didLoadRedPacketList = false;
  FloatRedPacketHelper redPacketHelper;
  final ValueNotifier<bool> chatRoomSliderBottom =
      new ValueNotifier<bool>(false);
  final ValueNotifier<bool> chatRoomSliderTop = new ValueNotifier<bool>(false);
  bool hasMatchStation = false; //???????????????
  bool isFirstLoad = true;
  bool hasVideoOrAnchor = false;
  bool didNotifyAutorotate = false;
//  PushOrderViewModel pushOrderViewModel;
//  FollowOrderViewModel followOrderViewModel;
//  AnchorOrderShareBodyViewModel anchorOrderShareBodyViewModel;
  Timer timer;
  Timer watchLiveTimer;
  Timer giftResPreloadDelayTimer;
  Timer liveRefreshTimer; // ?????????????????????????????????????????????????????????
  Timer gameTimer;        // 5???????????????????????????????????????
  bool isReload = true;
  bool isFreeAnchor = false; //???????????????
  bool isFreeAnchorListEntry = false; //??????????????????
  bool isFreeLiveGameAnchor; // ????????????????????????
  CancelToken _firstLoadCancelToken = CancelToken();
  Timer _firstLoadTimeOutTimer; //???????????????????????????
  bool _firstLoadTimeOut = false; //????????????????????????????????????
  bool _isFreeReload = false;
  bool _isListenerCancel = false; // ?????????????????????


//  MatchCollectionInfoService serivce = MatchCollectionInfoService();
  CommonVideoPlayerViewModel _videoPlayerVM = CommonVideoPlayerViewModel.create();
  CommonVideoPlayerController get playerController => _videoPlayerVM.controller;
  PlayGroupNavPingController playGroupNavPingController =
      PlayGroupNavPingController();
  MatchDetailController swiperController;
  ChatroomController chatRoomController = ChatroomController();
  UpdateRoomInfoController updateInfoController = UpdateRoomInfoController();

  bool get isVirtualMatchOver =>
      playerController.isVirtual && playerController.isVirtualMatchOver;

  var livePlayerKey = GlobalKey<LivePlayerPageState>();

  final _timerTool = InitTimerTool();

  // ???????????????
  bool _isShowGameDialog = false;
  StreamController<GameNotifyMessage> _gameNotifyStream = StreamController<GameNotifyMessage>.broadcast();
  StreamController<bool> _gameAnimatedNotifyStream = StreamController<bool>.broadcast();

  _DetailPage(
      {this.playGroupModel,
//      this.matchesDetailModel,
      this.extendModel,
      this.detailRateModel}) {
    if (this.detailRateModel == null) this.detailRateModel = DetailRateModel();
    if (this.playGroupModel == null) this.playGroupModel = PlayGroupModel();
//    if (this.matchesDetailModel == null) this.matchesDetailModel = MatchesDetailModel();
//    if (this.extendModel == null) this.extendModel = ExtendModel();
  }

  final AiDragRefreshController aiDragRefreshController =
      new AiDragRefreshController();
  var pageSliderController = PageSliderController();

  bool isFirstIntoDetail = true;

  @override
  Widget build(BuildContext context) {
    if (_firstLoadTimeOut) return _buildTimeOutLoadingView();
    animationHeadHeight = AiMeasure.animationPortraitHeight(context);
    //videoHeadHeight = 220 + headBottomHeight;
    videoHeadHeight = AiMeasure.videoPortraitHeight(context);
    if (this.playerController.toolPanel.bottomBar.model.videoType ==
        VideoType.Animation) {
      videoHeadHeight = animationHeadHeight;
    }
    setHeightAndBg();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
//    final arguments = ModalRoute.of(context).settings.arguments;

    bool isShowRefinedFinishGameDetail =
        config.userInfo.isShowRefinedFinishGameDetail ?? false;

    double topOffset = AiMeasure.topOffset(context);
//    getParams(arguments: arguments);

    Widget contentWidget = Container();
    if (detailSet.showLoading) {
//      if (isListDetail) {
//        contentWidget = PageSlider(
//            controller: pageSliderController,
//            enablePullUpSwitchPage: !isFreeAnchor && enablePullUpSwitchPage,
//            enablePullDownSwitchPage: !isFreeAnchor && enablePullDownSwitchPage,
//            onPageStatusChanged: onSwitchMatch,
//            child: loading());
//      } else {
        contentWidget = loading();
//      }
    } else {
      contentWidget = _resumeView(screenWidth, topOffset);
      // if(!isListDetail){
      //   if (AiCache.get().getBool(AiCache.NEED_SHOW_DETAIL_PAGE_GUIDE) ?? true) {
      //     FloatGuideViewHelper.showGuideView(GuidePageKey.DetailPage);
      //   }
      // }
    }
    // ???????????????
    if(isFreeAnchor){
      String liveStatus = detailSet.detailParams?.freeLiveRoomInfo?.liveStatus ?? '';
      if(!isStrNullOrEmpty(liveStatus) && liveStatus == '0'){
        contentWidget = FreeAnchorMatchPage(
          freeAnchorPosition: FreeAnchorPosition.detail,
          detailSet: detailSet,
        );
      }
    }

    // ???????
    if (isListDetail && RefinedMatch.isFinishGame ||
        isShowRefinedFinishGameDetail) {
      contentWidget = PageSlider(
          controller: pageSliderController,
          enablePullUpSwitchPage: !isFreeAnchor || isShowRefinedFinishGameDetail
              ? false
              : enablePullUpSwitchPage,
          enablePullDownSwitchPage:
              !isFreeAnchor || isShowRefinedFinishGameDetail
                  ? false
                  : enablePullDownSwitchPage,
          onPageStatusChanged: onSwitchMatch,
          child: FinishMatchDetailContainer(
            gidm: RefinedMatch?.refinedMatchModel?.systemId ?? '',
            isListDetail: isListDetail,
            isLoading: detailSet.showLoading,
            onEndRefresh: () {
              detailSet.showLoading = false;
              if (mounted) setState(() {});
            },
          ));
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Material(
        color: isListDetail
            ? Colors.transparent
            : Color(0xFF101119).withOpacity(0.85),
        child: PageSliderContainer(
          controller: pageSliderController,
          topChild: _buildPageSliderTopView(isShowRefinedFinishGameDetail),
          bottomChild:
          _buildPageSliderBottomView(isShowRefinedFinishGameDetail),
          body: Stack(
            children: <Widget>[
              if (!isListDetail)
                Container(
                  color: Color(0xFF0A2536),
                  width: screenWidth,
                  height: screenHeight,
                  child: background(isBlur: false),
                ),
              contentWidget,
              Positioned(
                  right: 10,
                  bottom: 250.0 + (config.devicePadding?.bottom ?? 0),
                  child: Visibility( // ????????????
                    visible: !isListDetail && (ModuleSwitch.getInstance().redPacket()) && MediaQuery.of(context).orientation == Orientation.portrait,
                    child: FloatRedPacketPortrait(
                      isListDetail: isListDetail,
//                      systemId: matchesDetailModel?.data?.systemId,
                      systemId: "",
                      liveId: '$liveId',
                      key: redPacketHelper?.floatRedPacketKey,
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loading({bool isBlur = false, bool showLoading = true}) {


    return Stack(
      children: [
        Container(
          color: isListDetail
              ? Colors.transparent
              : Color(0xFF101119).withOpacity(0.85),
        ),
        background(isBlur: isBlur),
        Show(
          isShow: showLoading,
          child: AiPageLoading(
              isListDetail: isListDetail,
              isHiddenClose: isListDetail ||
                  config.userInfo.isShowRefinedDetail ||
                  isFreeAnchor),
        ),
      ],
    );
  }

  // ??????loading??????
  Widget _buildTimeOutLoadingView() {
    pageSliderController = PageSliderController();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Color(0xFF0A2536),
        body: Stack(
          children: <Widget>[
            Positioned.fill(child: netError()),
            Positioned(
                top: MediaQuery.of(context).viewPadding.top + 14,
                right: 10,
                child: Offstage(
                  offstage: config.userInfo.isShowRefinedFinishGameDetail ||
                      isListDetail,
                  child: InkWell(
                      onTap: () {
                        AiRouter.pop(context);
                      },
                      child: Container(
                        child: AiSvgPicture.asset(
                            'assets/images/detail/head/icon_detail_x_white.svg',
                            width: 22,
                            height: 22,
                            fit: BoxFit.cover),
                      )),
                )),
          ],
        ),
      ),
    );
  }

  Widget background({bool isBlur = false}) {
    return MatchDetailBackGround(
      detailSet: detailSet,
      dPageModel: dPageModel,
      isListDetail: isListDetail,
      isBlur: isBlur,
    );
  }

  // PageSlider ??????
  Widget _buildPageSliderTopView(bool isShow) {
    if (isShow) return SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isListDetail
                ? Colors.transparent
                : Color(0xFF101119).withOpacity(0.85),
            isListDetail ? Colors.transparent : Color(0xFF4C4C52),
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          loading(showLoading: false),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextHelper.buildContentTitle(getPageSliderTopStatusText(),
                  textColor: Colors.white.withOpacity(0.7).value),
            ),
          ),
        ],
      ),
    );
  }

  String getPageSliderTopStatusText() {
    if (isFreeAnchor) {
      return '';
    }
    String text = "";
    switch (pageSliderStatus) {
      case PageSliderStatus.Done:
      case PageSliderStatus.DraggDown:
        text = "";
        break;
      case PageSliderStatus.Dragging:
        text = pullDownSwitchPagePrompt;
        break;
      case PageSliderStatus.EnableRelease:
        text = releaseDownToLastMatchPrompt;
        break;
      case PageSliderStatus.Release:
        text = "";
        break;
      case PageSliderStatus.Refreshing:
        text = "";
        break;
    }
    return text;
  }

  String getPageSliderDownStatusText() {
    if (isFreeAnchor) {
      return '';
    }
    String text = "";
    switch (pageSliderStatus) {
      case PageSliderStatus.Done:
      case PageSliderStatus.DraggDown:
        text = "";
        break;
      case PageSliderStatus.Dragging:
        text = pullUpSwitchPagePrompt;
        break;
      case PageSliderStatus.EnableRelease:
        text = releaseUpToNextMatchPrompt;
        break;
      case PageSliderStatus.Release:
        text = "";
        break;
      case PageSliderStatus.Refreshing:
        text = "";
        break;
    }
    return text;
  }

//  PushOrderButtonModel pushOrderButtonModel;

  // PageSlider ??????
  Widget _buildPageSliderBottomView(bool isShow) {
    if (isShow) return SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isListDetail
                ? Colors.transparent
                : Color(0xFF101119).withOpacity(0.85),
            isListDetail ? Colors.transparent : Color(0xFF4C4C52),
          ],
        ),
      ),
      child: Stack(
        children: [
          loading(showLoading: false),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextHelper.buildContentTitle(getPageSliderDownStatusText(),
                  textColor: Colors.white.withOpacity(0.7).value),
            ),
          ),
        ],
      ),
    );
  }

  Orientation orientation = Orientation.portrait;

  GlobalKey bottomNavKey = new GlobalKey();
  Offset offset = Offset.zero;

  // the part of view , which is trust and visible
  Widget _resumeView(double screenWidth, double topOffset) {
    if (isNotEmpty(chatroomAnchorId)) {
      final url = this.playerController.toolPanel?.anchorSelectorRight?.model?.currentAnchor?.headImg ?? "";
//      if (pushOrderButtonModel == null) {
//        pushOrderButtonModel = PushOrderButtonModel.create(anchorUrl: url);
//      } else {
//        pushOrderButtonModel.update(anchorUrl: url);
//      }
    }
    if (!(detailSet?.showLoading ?? false) &&
        showBottomNav &&
        orientation == Orientation.portrait) {
      if (offset.dy == 0) {
        offset = UiHelper.localToGlobal(bottomNavKey);
      }
//      print("localToGlobal>> ${offset.dy}");
    }
    num liveStatus = detailSet.detailParams?.liveStatus;
    bool isShowBottomNavBarView = (isFreeAnchor && liveStatus != null) || !isFreeAnchor;
    return Stack(
      children: [
        Scaffold(
          appBar: detailSet.showLoading
              ? PreferredSize(preferredSize: Size(0, 0), child: SizedBox())
              : null,
//      backgroundColor: config.skin.list.backgroundColor,
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: OrientationBuilder(
            builder: (context, orientation) {
              this.orientation = orientation;
              if (isListDetail) return SizedBox();
              return !(detailSet?.showLoading ?? false) &&
                      showBottomNav &&
                      orientation == Orientation.portrait
                  ? Show(
                      isShow: isShowBottomNavBarView,
                      child: BottomNavBarView(
                        detailSet: detailSet,
                        key: bottomNavKey,
//                        gameType: matchesDetailModel?.data?.gameType,
//                        showType: matchesDetailModel?.data?.showtype,
                        swiperController: swiperController,
                        chatRoomController: chatRoomController,
                        gidm: gidm,
//                        systemId: matchesDetailModel?.data?.systemId,
                        anchorId: chatroomAnchorId,
                        roomNo: roomNo,
                        isFreeAnchor: this.isFreeAnchor,
                        model: this.bottomNavBarModel,
                        roomInfoController: updateInfoController,
                        liveId: liveId,
                        announcement: detailSet?.detailParams?.announcement,
                        onGoBack: onGoBack,
                      ),
                    )
                  : SizedBox();
            },
          ),
          body: GestureDetector(
            onTap: () {
              //?????????????????????????????????,
              Event.eventBus.fire(HideInput());
            },
            child: Stack(
              children: <Widget>[
                _bodyContext(screenWidth, topOffset),
//                Show(
//                  isShow: !isFreeAnchor,
//                  child: Transform.translate(
//                    //???????????????????????????7 top+??????????????????????????????
//                    offset: Offset(AiMeasure.screenWidth(context) - 34 - 10,
//                        offset.dy - 64 + 7 + 34 + 10),
//                    child: Visibility(
//                        visible: pushOrderButtonModel != null &&
//                            bottomNavBarModel.hasSharedRecordBtn &&
//                            orientation == Orientation.portrait &&
//                            isNotEmpty(chatroomAnchorId) &&
//                            !detailSet.showLoading &&
//                            ModuleSwitch.getInstance().videoAndAnchor(),
//                        child: GestureDetector(
//                            onTap: () {
//                               ModuleStatistics.ins
//                                    .statisticsEvent(StatisticsType.StatisticsDetailFollowStar);
//                                PopupShareService.ins.pause('_showSharedRecord');
//                                showModalBottomSheetRoute(context,
//                                    child: AllSharedRecordView(
//                                      gidm: gidm,
//                                      anchorId: chatroomAnchorId,
//                                      systemId: matchesDetailModel?.data?.systemId,
//                                      roomNo: roomNo,
//                                      gameType: matchesDetailModel?.data?.gameType,
//                                      isFreeAnchor: isFreeAnchor,
//                                    )).then((v) {
//                                  PopupShareService.ins.resume('_showSharedRecord');
//                                });
//                            },
//                            child: PushOrderButtonView(
//                              model: pushOrderButtonModel,
//                            ))),
//                  ),
//                ),
                // Visibility(
                //     visible: !detailSet.showLoading,
                //     child: _chatRoomInputBar()),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: StreamBuilder<GameNotifyMessage>(
            initialData: null,
            stream: _gameNotifyStream.stream,
            builder: (cxt, span) {
              if (!span.hasData) return const SizedBox();
              return GameNotifyWidget(
                title: span.data.title,
                tableInfo: span.data.tableName,
                webUrl: span.data.webUrl,
                onPlayTap: (value) {
                  try{
                    if (value) AiCache.get().setInt(AiCache.pushMsg_gameNotify_date,DateTime.now().millisecondsSinceEpoch);
                    _isShowGameDialog = false;
                    _gameNotifyStream.add(null);
                    String anchorId;
                    if (detailSet != null && detailSet.detailParams != null) {
                      anchorId = detailSet.detailParams.anchorId;
                    }
                    if (anchorId == null || anchorId.isEmpty) {
                      anchorId = !isStrNullOrEmpty(selectAnchorId) ? selectAnchorId : chatroomAnchorId;
                    }
                    AiGameCellModel cellModel = AiGameCellModel(
                      gameKey: span.data.gameKey,
                      supplierId: span.data.supplierId,
                      roomNo: roomNo,
                      anchorId: anchorId,
                      tableId: span.data.tableId,
                    );
                    double dy = MediaQuery.of(context).size.height;
                    Offset offset = Offset(30.0, dy - 20.0);
                    Event.eventBus.fire(ShowGameAnimatedEvent(offset: offset, gameModel: cellModel));
//                    LiveGame.openGamePan(
//                        context: context,
//                        supplierId: span.data.supplierId,
//                        gameKey: span.data.gameKey,
//                        roomNo: roomNo,
//                        anchorId: anchorId,
//                        tableId: span.data.tableId,
//                        callBack: (isSuccess){}
//                    );
                  }catch(e){
                    _isShowGameDialog = false;
                    _gameNotifyStream.add(null);
                  }
                },
                onDismissTap: (value) {
                  if (value)  AiCache.get().setInt(AiCache.pushMsg_gameNotify_date,DateTime.now().millisecondsSinceEpoch);
                  _isShowGameDialog = false;
                  _gameNotifyStream.add(null);
                },
              );
            },
          ),
        ),
//        Overlay(key: PinwheelHelper.overlayKey),
        // ??????
        Show(
          isShow: isShowGameView,
//          isShow: true,
          child: StreamBuilder(
            initialData: null,
              stream: _gameAnimatedNotifyStream.stream,
              builder: (ctx, span) {
                if (!span.hasData) return const SizedBox();
                Size size = MediaQuery.of(context).size;
                double screenH = size.height;
                double topMargin = gamePanTopMargin;
                double height = gamePanHeight;
                return Container(
                  child: Stack(
                    children: [
                      Positioned(
                          left: 0.0,
                          right: 0.0,
                          bottom: 0.0,
                          top: gameTopMargin,
                          child: GameAnimatedView(
                              topMargin: topMargin,
                              height: height,
                              key: gameAnimatedKey,
                              isUseWaterWaveAnimated: true,
                              circleCenter: Offset(gameBtnOffset.dx, gameBtnOffset.dy - topMargin),
                              gameModel: gameModel,
                              onAnimatedStatus: (bool isEndAnimated) {
                                if(isEndAnimated){
                                  gameTopMargin = -screenH;
                                  _gameAnimatedNotifyStream.add(true);
                                }
                              },
                          )
                      )
                    ],
                  ),
                );
              }
          )
        ),
        Overlay(key: PinwheelHelper.overlayKey),
      ],
    );
  }

  // ????????????
  Widget _bodyContext(double screenWidth, double topOffset) {
    Widget context = Container();
//    if (matchesDetailModel?.data != null) {
//      context = _body(screenWidth, topOffset, isClose: 200 != code, code: code);
//    } else {
//      showBottomNav = false;
//      context = _buildTimeOutLoadingView();
//    }
    context = _body(screenWidth, topOffset, isClose: 200 != code, code: code);
    return context;
  }

  // ?????????
  // Widget _chatRoomInputBar() {
  //   return GestureDetector(
  //     onTap: () {
  //       FocusScope.of(context).requestFocus(FocusNode());
  //       chatRoomController?.notifyInputBarChange(InputBarStatus.hide);
  //     },
  //     child: Container(
  //       color: Colors.transparent,
  //       child: Column(
  //         children: <Widget>[
  //           Expanded(child: SizedBox()),
  //           if (chatRoomController != null)
  //             ChatRoomInput(controller: chatRoomController),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // ????????????
  void getParams({dynamic arguments}) {
    if (gidm == null) {
      dynamic params = widget.params ?? arguments;
      if (params is String) {
        gidm = params;
      } else if (params is DetailParams) {
        gidm = params.gidm;
        initFreeAnchor(params);
        if (isListDetail) {
          detailSet.detailParams.anchorIcon = '';
        }
        // ????????????????????????
        if (detailSet.detailParams.showtype == 'RB' &&
            !isStrNullOrEmpty(detailSet.detailParams.anchorId)) {
//          ModuleStatistics.ins
//              .statisticsEvent(StatisticsType.StatisticsDetailAnchorLive);
        }
        if (params.type == '1') {
          isFromAnchor = true;
          chatroomAnchorId = params?.anchorId;
        }
        // ????????????????????????
        if (params.playPriority == PlayPriority.anchor) {
          isInitAnchorLive = true;
        }
//        // ??????????????
//        if (detailSet.detailParams?.intoDetailPath ==
//            IntoDetailPath.betRecordSingle) {
//          config.userInfo.currentSaveHitOptionType = HitOptionType.single;
//          AiHitService.currentMode = HitMode.mix;
//        } else if (detailSet.detailParams?.intoDetailPath ==
//            IntoDetailPath.betRecordCombo) {
//          config.userInfo.currentSaveHitOptionType = HitOptionType.combo;
//          AiHitService.currentMode = HitMode.combo;
//        }
      }
    }
    isVirtual = widget.isVirtual ?? isVirtualGidm(gidm);
  }

  void initFreeAnchor(DetailParams params){
    isFreeAnchor = params.isFreeAnchor;
    isFreeAnchorListEntry = params.isFreeAnchorListEntry;
    isFreeLiveGameAnchor = params.isFreeLiveGameAnchor;
    liveId = params?.liveId;
    if(isFreeAnchor){
      roomNo = liveId;
    }
    moreFunctionSlide.isFreeAnchor = isFreeAnchor;
    watchTotal = params.watchTotal;
    // ??????????????????(?????????)
    isListDetail = params.isListDetail;
    moreFunctionSlide.isListDetail = isListDetail;
    // gidm = 'bt_sr:match:1586351889720';//detailParams.gidm;
    detailSet.detailParams = params;
    config.userInfo.detailSet.detailParams = params;

    _updateAnchorType(params.anchorId);
  }

  // ????????????????
  void jump2ChatRoom() {
//    if (isFromAnchor &&
//        (matchesDetailModel.data?.showtype == 'RB' || (isFreeAnchor  && detailSet.detailParams.anchorLiveStatus ==1 )) &&
//        ModuleSwitch.getInstance().chatRoom()) {
//      Future.delayed(Duration(milliseconds: 100), () {
//        if(isListDetail){
//          swiperController?.move(1);
//        }
//      });
//      isFromAnchor = false;
//    }
  }

  // ???????????????????
  void _showRedPacket() {
    if (!ModuleSwitch.getInstance().redPacket()) {
      return;
    }
    _timerTool.delayer(Duration(seconds: 2), () {
      PopupShareService.ins.pause('_redPaketOpen');
      showRedBagWindow(context,
              redPacket: RedPacketModel(
                packetId: widget.params.packetId,
                startTime: widget.params.startTime,
                systemTime: widget.params.systemTime,
                anchorId: widget.params.anchorId,
                gidm: widget.params.gidm,
              ),
              systemId: widget.params.systemId)
          .then((value) {
        PopupShareService.ins.resume('_redPaketOpen');
      });
      widget?.params?.packetId = null;
      widget?.params?.systemId = null;
    });
  }

  ///--------------------------------------- ?????????????????????-----------------------------------------
  bool isCloseMatch() {
//    //matchesDetailModel.data?.status ???2 ?????????????????????
//    bool isSubMatchFinsh = true; //?????????????????????
//    if (matchesDetailModel?.data?.subGameDetails != null &&
//        matchesDetailModel.data.subGameDetails.length > 0) {
//      int finshSubMatchNum =
//          matchesDetailModel?.data?.subGameDetails?.where((item) {
//        return item.status == 2;
//      })?.length;
//      if (finshSubMatchNum !=
//          matchesDetailModel?.data?.subGameDetails?.length) {
//        isSubMatchFinsh = false;
//      }
//    }
//    bool result = code == 404 ||
//        ((matchesDetailModel?.data?.status ?? 1) == 2 && isSubMatchFinsh);
//    print('detailPage ========> initDataFirstLoad 555  result ==> $result');
//    return result;
    return false;
  }

  Widget empty(String title, String content) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Center(
        child: Container(
          // margin: EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextHelper.buildContentTitle(title,
                  textColor: Colors.white.value),
              h(10),
              TextHelper.buildNormal(content,
                  textColor: Colors.white.withOpacity(0.7).value),
            ],
          ),
        ),
      ),
    );
  }

  bool get isError {
    return (code != 200 && code != 502) || (isCloseMatch() && !isFreeAnchor);
  }

  Widget createEmtpy() {
    String emtpyName = 'closeBet';
    if (isFreeAnchor) {
      return netError();
    } else {
      if (isCloseMatch()) {
        emtpyName =
            playerController.isVirtual ? 'virtual_closeMatch' : 'closeMatch';
        Event.eventBus.fire(MatchFinishEvent());
      } else if (code == 427) {
        emtpyName = 'FT_to_RB_Match';
      }
//      else if (matchesDetailModel?.data?.getGame?.gameInfo?.runningTime == config.langMap['baseLang']['models']['RBFTTime']['halfTime']) {
//        emtpyName = 'match_halfTime';
//      }
    }

    var disp = config.nodata.discription(emtpyName) ??
        config.nodata.discription('other');

    return empty(disp.title, disp.content);
  }

  Widget netError() {
    double navHeight =
        window.padding.top / MediaQuery.of(context).devicePixelRatio;
    double topMargin = navHeight;
    return InkWell(
      onTap: () async {
        isInited = false;
        var load = LoadingDialog.create(
            config.langMap['baseLang']['detail']['waiting']);
        load.show(context);
        allLoadFinished = false;
        startFirstLoadTimeOutTimer();
        //??????????????????
        await initDataFirstLoad();
        load.dismiss();
        await initDataSecondStepLoad();
      },
      child: Opacity(
        opacity: 0.5,
        child: Container(
          child: Stack(
            children: [
              MatchEmtpy(
                textColor: Colors.white,
                alignment: Alignment.center,
                name: 'net',
                onTap: () {
                  detailSet.showLoading = true;
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body(double screenWidth, double topOffset,
      {bool isClose = false, int code}) {
//    if (null == dPageModel) {
//      dPageModel = DPageModel.create(
//          matchesDetailModel: matchesDetailModel,
//          playGroupModel: playGroupModel,
//          detailRateModel: detailRateModel,
//          varietyIorMap: varietyIorMap,
//          observer: this)
//        ..update(
//            handicapRatioData: handicapMap,
////            pushOrderViewModel: pushOrderViewModel,
////            followOrderViewModel: followOrderViewModel
//        )
//        ..initData(
//            selectGroupId: this._selectGroupId,
//            isVirtualBetOver: isVirtualMatchOver,
//            handicapRatioData: handicapMap);
//    }

    double topHeadHeight = 50;
    double topFreeAnchorHeight = 34.0;
    String anchorId = !isStrNullOrEmpty(selectAnchorId) ? selectAnchorId : chatroomAnchorId;
    if(isStrNullOrEmpty(anchorId)){
      anchorId = detailSet.detailParams.anchorId;
    }
    Widget leagueHeadWidget = isListDetail
        ? Container()
        : NewHeadDefault(
            anchorId: anchorId,
            controller: chatRoomController,
            headHeight: topHeadHeight,
            topOffset: topOffset,
//            leagueId: matchesDetailModel?.data?.leagueId,
//            leagueName: matchesDetailModel?.data?.leagueShortName ??
//                matchesDetailModel?.data?.leagueName,
//            leagueLogo: matchesDetailModel?.data?.leagueLogo,
            leagueCount: leagueCount,
            showShoppingCar: false,
          );

    Widget anchorHeadWidget;
    int livePopularity = detailSet.detailParams?.livePopularity ?? 0;
    if (isFreeAnchor) {
      anchorHeadWidget = NewHeadAnchor(
        isFreeLiveGameAnchor: isFreeLiveGameAnchor,
        controller: chatRoomController,
        dPageModel: dPageModel,
        topOffset: topOffset,
//        matchesDetailModel: matchesDetailModel,
        extendModel: extendModel,
        headHeight: topHeadHeight,
        detailSet: detailSet,
        anchorId: anchorId,
//        leagueId: matchesDetailModel?.data?.leagueId,
//        leagueName: matchesDetailModel?.data?.leagueShortName ?? matchesDetailModel?.data?.leagueName,
//        leagueLogo: matchesDetailModel?.data?.leagueLogo,
        leagueCount: leagueCount,
        playerController: playerController,
        roomNo: roomNo,
        watchTotal: watchTotal,
        livePopularity: livePopularity,
      );
    } else {
      anchorHeadWidget = (!isNullOrEmpty(chatroomAnchorId) &&
                  currentVideoLive != null &&
                  currentVideoLive?.status == true)
          ? isListDetail
              ? Container()
              : NewHeadAnchor(
                  livePopularity: livePopularity,
                  isFreeLiveGameAnchor: isFreeLiveGameAnchor,
                  controller: chatRoomController,
                  dPageModel: dPageModel,
                  topOffset: topOffset,
//                  matchesDetailModel: matchesDetailModel,
                  extendModel: extendModel,
                  headHeight: topHeadHeight,
                  detailSet: detailSet,
                  anchorId: anchorId,
//                  leagueId: matchesDetailModel?.data?.leagueId,
//                  leagueName: matchesDetailModel?.data?.leagueShortName ?? matchesDetailModel?.data?.leagueName,
//                  leagueLogo: matchesDetailModel?.data?.leagueLogo,
                  leagueCount: leagueCount,
                  playerController: playerController,
                  roomNo: roomNo,
                  watchTotal: watchTotal,
                )
          : leagueHeadWidget;
    }

    NewHeadAnchorModel newHeadAnchorModel = NewHeadAnchorModel(
      extendModel,
      anchorId,
    );
    newHeadAnchorModel.initData();

    //??????????????????????????????,???????????????????????????
    Widget loadingWithNativeHeaderBody() {
      return Column(
        children: [
          Show(
            isShow: !isFreeAnchor,
            replacement: Row(
              children: [
                sh(topHeadHeight + AiMeasure.topOffset(context)),
                Expanded(
                    child: sh(topHeadHeight + AiMeasure.topOffset(context))),
                GestureDetector(
                  onTap: () {
                    ccRoute.pop();
                  },
                  child: Column(
                    children: [
                      safeTop(),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(9),
                        child: AiSvgPicture.asset(
                            'assets/images/detail/head/icon_detail_x_white.svg',
                            width: 22,
                            height: 22,
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            child: NewHeadDefault(
              controller: chatRoomController,
              headHeight: topHeadHeight,
              topOffset: topOffset,
//              leagueId: matchesDetailModel?.data?.leagueId,
//              leagueName: matchesDetailModel?.data?.leagueShortName ?? matchesDetailModel?.data?.leagueName,
//              leagueLogo: matchesDetailModel?.data?.leagueLogo,
              leagueCount: leagueCount,
              showShoppingCar: false,
            ),
          ),
//          Show(
//            isShow: !isFreeAnchor,
//            child: NewScore(
//              dPageModel: dPageModel,
//              matchesDetailModel: matchesDetailModel,
//              extendModel: extendModel,
//              onShowMatchInfo: onShowMatchInfo,
//            ),
//          ),
          SizedBox(
            height: headHeight,
            child: Show(
              isShow: !isFreeAnchor,
              replacement: AnchorDetailHead(
                detailParams: detailSet.detailParams,
              ),
              child: headDetail(
                screenWidth,
                topOffset,
              ),
            ),
          ),
          Expanded(
            child: MatchLoading(
              isArrowStyle: true,
              count: 2,
            ),
          )
        ],
      );
    }

    // if (isNotEmpty(anchorId)) {
    //   if (anchorOrderShareBodyViewModel == null) {
    //     anchorOrderShareBodyViewModel = AnchorOrderShareBodyViewModel.create(
    //       roomNo: this.roomNo,
    //       anchorId: anchorId,
    //       systemId: null,
    //       anchorLiveStatus: detailSet.detailParams.anchorLiveStatus ?? 0,
    //     );
    //   } else {
    //     anchorOrderShareBodyViewModel.update(
    //         roomNo: roomNo,
    //         anchorId: anchorId,
    //         systemId: matchesDetailModel?.data?.systemId,
    //         anchorLiveStatus: detailSet.detailParams.anchorLiveStatus ?? 0);
    //   }
    // }
//    if(!matchesDetailModel.isDataFromNative) {
//      _videoPlayerVM.update(
//        swiperController: swiperController,
//        isListDetail: isListDetail,
//        showType: matchesDetailModel?.data?.showtype,
//        controller: playerController,
//        padding: EdgeInsets.zero,
//        defaultHeader: headDetail(
//          screenWidth,
//          topOffset,
//        ),
//        canRotate: isExpanded,
//        isFreeAnchor: isFreeAnchor,
//        onMoreVideo: onMoreVideo,
//        horizontalDragCallBack: horizontalDragCallBack,
//        activeBannerKey: activeBannerKey2,
//        matchesDetailModel: matchesDetailModel,
//        extendModel: extendModel,
//        newHeadAnchorModel: newHeadAnchorModel,
//        detailSet: detailSet,
//        onShowMatchInfo: onShowMatchInfo,
//        orientation: orientation,
//      );
//    }

    //bool isShowLoading = matchesDetailModel.isDataFromNative && !isFreeAnchor;
    bool isShowLoading = false;
    if(isFreeAnchor){
      isShowLoading = _isFreeReload || playerController == null;
    }else{
//      isShowLoading = matchesDetailModel.isDataFromNative;
    }
    num liveStatus = detailSet.detailParams?.liveStatus;
    bool isFreeAnchorNoStart = isFreeAnchor && liveStatus != null && liveStatus == 0;

    if(!isShowLoading) {
      _videoPlayerVM.update(
        isFreeLiveGameAnchor: isFreeLiveGameAnchor ?? false,
        swiperController: swiperController,
        isListDetail: isListDetail,
//        showType: matchesDetailModel?.data?.showtype,
        controller: playerController,
        padding: EdgeInsets.zero,
        defaultHeader: headDetail(
          screenWidth,
          topOffset,
        ),
        canRotate: isExpanded,
        isFreeAnchor: isFreeAnchor,
        onMoreVideo: onMoreVideo,
        horizontalDragCallBack: horizontalDragCallBack,
        activeBannerKey: activeBannerKey2,
//        matchesDetailModel: matchesDetailModel,
        extendModel: extendModel,
        newHeadAnchorModel: newHeadAnchorModel,
        detailSet: detailSet,
        onShowMatchInfo: onShowMatchInfo,
        orientation: orientation,
        liveStatus: liveStatus,
      );
      print('detail_page-videoPlayerVM url=${_videoPlayerVM?.url} type=${_videoPlayerVM.type}');
    }

    return Scaffold(
      appBar:  detailSet.showLoading
          ? PreferredSize(preferredSize: Size(0, 0), child: SizedBox())
          : null,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          // chatRoomController.notifyInputBarChange(InputBarStatus.hide);
        },
        child: isShowLoading
            ? loadingWithNativeHeaderBody()
            : MatchDetailContainer(
                isFreeLiveGameAnchor: isFreeLiveGameAnchor,
                roomNo: roomNo,
                detailSet: detailSet,
                isListDetail: isListDetail,
                isMatchClose: isMatchClose,
                playGroupNavPingController: playGroupNavPingController,
                swiperController: swiperController,
                topBarHeight: isListDetail ? 0.0 : (topHeadHeight + topOffset),
                topFreeAnchorHeight: isFreeAnchor ? topFreeAnchorHeight : 0.0,
                playerController: playerController,
                chatroomTopBar: anchorHeadWidget,
                chatroomTopFreeAnchor: FreeAnchorRankView(
                  anchorId: anchorId,
                  liveId: liveId,
                  wishGiftSwitch: detailSet?.detailParams?.wishGiftSwitch,
                  onMoreVideo: onMoreVideo,
                  isFreeLiveGameAnchor: isFreeLiveGameAnchor,
                  isFreeAnchor: isFreeAnchor,
                ),
                isFreeAnchor: isFreeAnchor,
                chatRoom: isFreeAnchorNoStart
                  ? FreeAnchorChatroom(
                      detailSet: detailSet,
                    )
                  : ChatRoom(
                      detailSet: detailSet,
                      onGoBackRefreshDetail: onGoBack,
                      liveId: liveId,
                      gidm: gidm,
//                      systemId: matchesDetailModel?.data?.systemId,
                      systemId: "",
                      controller: chatRoomController,
                      anchorId: anchorId,
                      matchAnchorId: playerController?.toolPanel?.anchorSelectorFull?.model?.currentAnchor?.vid,
//                      showType: matchesDetailModel?.data?.showtype,
                      swiperController: swiperController,
                      horizontalDragCallBack: horizontalDragCallBack,
                      isListDetail: isListDetail,
//                      matchesDetailModel: matchesDetailModel,
                      roomNo: roomNo,
                      isFreeAnchor: isFreeAnchor,
                      announcement: detailSet?.detailParams?.announcement,
    //            onOverWatchLiveTime: onOverWatchLiveTime,
                    ),
//                betList: isError
//                    ? createEmtpy()
//                    : DetailBetWidget(
//                        detailBetKey,
//                        dPageModel: dPageModel,
//                        isVirtual: this.isVirtual,
//                        playListRefreshController: playListRefreshController,
//                        pushOrderRefreshController: pushOrderRefreshController,
//                        isFreeAnchor: isFreeAnchor,
//                        followOrderRefreshController:
//                            followOrderRefreshController,
//                        isBlackShowHead: isBlackShowHead,
//                        playGroupModel: playGroupModel,
//                        matchesDetailModel: matchesDetailModel,
//                        gidm: gidm,
//                        detailSet: detailSet,
//                        onRefresh: onRefresh,
//                        groupId: "${config.userInfo.sportPlatformId}",
//                        systemId: matchesDetailModel?.data?.systemId,
//                        anchorId: chatroomAnchorId,
//                        matchDisplayHeight: videoHeadHeight,
//                        topBarHeight: topHeadHeight + topOffset,
//                        anchorOrderShareBodyViewModel:
//                            anchorOrderShareBodyViewModel,
//                        bottomBarHeight: isFreeAnchor &&
//                                detailSet.detailParams.anchorLiveStatus != 1
//                            ? 0
//                            : 60.0 + MediaQuery.of(context).padding.bottom / 2,
//                        playerController: playerController,
//                        playGroupNavPingController: playGroupNavPingController,
//                        onPlayListScroll: onPlayListScroll,
//                        onSelectGroup: navSelectGroup,
//                      ),
                betListTopBar: leagueHeadWidget,
                matchDisplay: PageSlider(
                  controller: pageSliderController,
                  enablePullUpSwitchPage:
                      !isFreeAnchor && enablePullUpSwitchPage,
                  enablePullDownSwitchPage:
                      !isFreeAnchor && enablePullDownSwitchPage,
                  onPageStatusChanged: onSwitchMatch,
                  child: CommonVideoPlayerView(model: _videoPlayerVM),
                ),
                matchDisplayHeight: videoHeadHeight,
                gameInfoHeight: isFreeAnchor ? 0 : 52.0,
                gameInfo: Show(
                  isShow: !isFreeAnchor,
                  child: PageSlider(
                    controller: pageSliderController,
                    onPageStatusChanged: onSwitchMatch,
                    enablePullDownSwitchPage: !isFreeAnchor,
                    enablePullUpSwitchPage: !isFreeAnchor,
//                    child: NewScore(
//                      dPageModel: dPageModel,
//                      matchesDetailModel: matchesDetailModel,
//                      extendModel: extendModel,
//                      onShowMatchInfo: onShowMatchInfo,
//                    ),
                  ),
                ),
                topCover: PageSlider(
                    controller: pageSliderController,
                    enablePullUpSwitchPage:
                        !isFreeAnchor && enablePullUpSwitchPage,
                    enablePullDownSwitchPage:
                        !isFreeAnchor && enablePullUpSwitchPage,
                    onPageStatusChanged: onSwitchMatch,
                    child: Container(
                      color: Colors.transparent,
                      child: DetailCover(
//                        matchesDetailModel: matchesDetailModel,
                        showType: RefinedMatch?.refinedMatchModel?.showType ?? '',
                        isFinishGame: RefinedMatch?.refinedMatchModel?.isFinish ?? '',
                      ),
                    )),
                chatRoomSliderTop: chatRoomSliderTop,
                dPageModel: dPageModel,
                chatRoomSliderBottom: chatRoomSliderBottom,
                pageSliderContainer: pageSliderController,
                isDing: playGroupNavPingController.getPingStatus(),
                onPSDirectionRefresh: onSwitchMatch,
                onPingCallback: () {
                  if (mounted) {
                    setState(() {});
                  }
                },
                onPull2FreshCallback: (bool isIntercept) {
                  playListRefreshController.isParentIntercept = isIntercept;
                  pushOrderRefreshController.isParentIntercept = isIntercept;
                  followOrderRefreshController.isParentIntercept = isIntercept;
//            print("isIntercept>>>>$isIntercept");
                }, anchorLiveStatus: detailSet.detailParams.anchorLiveStatus,
              ),
      ),
    );
  }

  void navSelectGroup(selectGroupId) {
    if (0 == swiperController.index) {
      chatRoomSliderTop.value = false;
    }
    this._selectGroupId = selectGroupId;
  }

  void onEnable2Release(PageSliderDirection direction) {}
  SlideStatus status = SlideStatus.none;
  PageSliderStatus pageSliderStatus = PageSliderStatus.Done;
  PageSliderDirection pageDirection = PageSliderDirection.Unknow;

  //?????????????????????
  Future<void> onSwitchMatch(PageSliderDirection pageDirection,
      PageSliderStatus pageSliderStatus) async {
    this.pageSliderStatus = pageSliderStatus;
    this.pageDirection = pageDirection;
//    setState(() {});

    // ????????????????????????
//    Event.eventBus.fire(DetailParams(
//      gidm: gidm,
//      gameType: strings([detailSet.detailParams?.gameType, config.userInfo.sportType], defaultVal: 'FT'),
//    ));

    if (pageSliderStatus == PageSliderStatus.Refreshing) {
      if (isListDetail) {
//        if (mounted) {
//          setState(() {
        detailSet.showLoading = true;
//          });
//        }
      }
      if (PageSliderDirection.Down == pageDirection) {
//        ModuleStatistics.ins
//            .statisticsEvent(StatisticsType.StatisticsDetailChangeGame);
        status = SlideStatus.pull_down;
      } else {
        status = SlideStatus.pull_up;
      }
      DetailParams params = DetailParams(
        gidm: gidm,
//        gameType: strings(
//            [detailSet.detailParams?.gameType, config.userInfo.sportType],
//            defaultVal: 'FT'),
      );
      await reload(params);
    }
  }

  Future onRefresh() async {
    await startTimer(isRefresh: true);
  }

  String gameType;

  //??????????????????????????????
  Future loadSwitchGameData(String gidm, String gameType) async {
    // ????????????
//    GetLeagueInfoByIdReqProtocol reqProtocol = GetLeagueInfoByIdReqProtocol();
//    reqProtocol.leagueIds = matchesDetailModel?.data?.leagueId;
//    var rspProtocol = await reqProtocol.request();
//    if (rspProtocol != null &&
//        rspProtocol.leagues != null &&
//        rspProtocol.leagues.length > 0) {
//      var dataMap = rspProtocol.leagues[0];
//      AiJson aiJson = AiJson(dataMap);
//      leagueCount = aiJson.getNum('gameCount');
//    }

    // ????????????
    // GetGamesByLeagueIdsReqProtocol leagueListReq =
    //     GetGamesByLeagueIdsReqProtocol();
    // leagueListReq.leagueIds = matchesDetailModel?.data?.leagueId;
    // GetGamesByLeagueIdsRspProtocol leagueRsp = await leagueListReq.request();
    // if (leagueRsp.games != null) {
    //   leagueCount = leagueRsp.games.length ?? 0;
    // }
  }

  bool enablePullDownSwitchPage = true;
  bool enablePullUpSwitchPage = true;
  String pullDownSwitchPagePrompt =
      config.langMap['baseLang']['detail']['slideDownToLastMatch'];
  String pullUpSwitchPagePrompt =
      config.langMap['baseLang']['detail']['slideUpToNextMatch'];
  String releaseDownToLastMatchPrompt =
      config.langMap['baseLang']['detail']['releaseDownToLastMatch'];
  String releaseUpToNextMatchPrompt =
      config.langMap['baseLang']['detail']['releaseUpToNextMatch'];

  Widget getTitle() {
    Widget titleWiddget = Container();
    if (isBlackShowHead) {
//      titleWiddget = TitleSection(
//        matchesDetailModel: matchesDetailModel,
//        extendModel: extendModel,
//        isBlackShowHead: isBlackShowHead,
//        isExpanded: this.isExpanded,
//      );
    }
    return titleWiddget;
  }

  DecorationImage getHeadBgImg() {
    String paramGameType = detailSet?.detailParams?.gameType;
    String matchesDetailModelType = detailSet?.detailParams?.gameType;
    String gameType = string(paramGameType,
        defaultVal: string(matchesDetailModelType,
            defaultVal: ""));
    String url = AiImageHelper.gameTypeBg(gameType);

    return headBgImg = DecorationImage(
      image: AiImage.assetImage(url),
      fit: BoxFit.cover,
    );
  }

  Color getHeadBgColor() {
    Color headBgColor = const Color(0xFF000000); // Colors.black;
    if (isBlackShowHead == false) {
      if (detailSet.selectViewType == 'animation') {
        headBgColor = const Color(0xFF222222);
      } else if (detailSet.selectViewType == 'video') {
        headBgColor = const Color(0xFF000000);
      } else {
        headBgColor = const Color(0xFF000000);
      }
    }
    return headBgColor;
  }

  Widget headDetail(double screenWidth, double topOffset) {
      var head = Container(
        decoration: BoxDecoration(color: getHeadBgColor(), image: headBgImg),
        child: HeadDetail(
          isListDetail: isListDetail,
          horizontalDragCallBack: horizontalDragCallBack,
          onMoreVideo: onMoreVideo,
          playerController: playerController,
          dPageModel: dPageModel,
          topOffset: topOffset,
//          matchesDetailModel: matchesDetailModel,
          extendModel: extendModel,
          headHeight: headHeight,
          onHeadExpansiond: onHeadExpansiond,
          isBlackShowHead: isBlackShowHead,
          isExpanded: isExpanded,
        ),
      );
      return Stack(
        children: <Widget>[
          Container(
            height: headHeight,
            child: head,
          ),
        ],
      );
  }

  bool hasImageBackground() {
    return false;
//    return GameType.FT != getCurrentSelectedGameType() &&
//        GameType.BK != getCurrentSelectedGameType();
  }

  void onHeadExpansiond(bool _isExpanded) {
    isExpanded = _isExpanded;
    if (_isExpanded) {
      headBgImg = getHeadBgImg();
    } else {
      headBgImg = null;
    }
    isBlackShowHead = !_isExpanded;
    setState(() {});
  }

  void onGoBack(){
    // ComeBack ??????
    // // ???????????????,???????????????????????????
    // if(_isListenerCancel){
    //   listenInit();
    // }
    // reload(detailSet.detailParams, showLoading: true);
  }

  //??????????????????
  Future<void> checkIfNeedSubscribeChatMessages() async {
    if (this.isVirtual) return;
    var roomRsp;
    if(isFreeAnchor){
      print('??????????????????----isFreeAnchor');
      roomRsp = await IntoChatRoomStatus.ins.query(
          tag: "match_detail",
          anchorId: detailSet?.detailParams?.anchorId,
          liveId: liveId
      );
    }
    else{
      print('??????????????????----match_detail');
      roomRsp = await IntoChatRoomStatus.ins.query(
          tag: "match_detail",
//          systemId: matchesDetailModel?.data?.systemId,
          systemId: '',
          gidm: gidm,
          anchorId: chatroomAnchorId);
    }
    if(roomRsp != null){
      resubscribeChatRoom(roomRsp);
    }
  }

  Future<void> resubscribeChatRoom(RoomInfoRspProtocol roomRsp) async {
    chatRoomOpenStatus = ChatRoomOpenStatus(isOpen: roomRsp.isSuccess);
    roomNo = roomRsp.roomNo;
    config.userInfo.chatRoomNo = roomNo;

    //?????????????????????
    String intoChatRoomTopic = createIntoChatRoomTopicId(
      roomNo: roomRsp.roomNo,
      channelType: roomRsp.channelType,
    );
    if (_intoChatRoomTopic != intoChatRoomTopic) {
      XCStompClient.ins
          .unsubscribe(XCStompAction.IntoChatRoom, _intoChatRoomTopic);
      _intoChatRoomTopic = intoChatRoomTopic;
      XCStompClient.ins.subscribe(XCStompAction.IntoChatRoom,
          _intoChatRoomTopic, _onSubscribeIntoChatRoom);
      ChatRoomSubscribeTopicMgr.ins.saveTopic(roomNo, _intoChatRoomTopic);
    }

    String anchorTopic = createAnchorRoom(
      roomNo: roomRsp.roomNo,
      anchorType: roomRsp.anchorType,
    );
    if (_anchorTopic != anchorTopic) {
      XCStompClient.ins.unsubscribe(XCStompAction.Chat, _anchorTopic);
      _anchorTopic = anchorTopic;
      XCStompClient.ins
          .subscribe(XCStompAction.Chat, _anchorTopic, _onSubscribe);
      ChatRoomSubscribeTopicMgr.ins.saveTopic(roomNo, _anchorTopic);
    }

    //???????????????????????????
    String topic = createChatTopicId(
      roomNo: roomRsp.roomNo,
      channelType: roomRsp.channelType,
    );
    if (_topic != topic) {
      XCStompClient.ins.unsubscribe(XCStompAction.Chat, _topic);
      _topic = topic;
      XCStompClient.ins.subscribe(XCStompAction.Chat, _topic, _onSubscribe2);
      ChatRoomSubscribeTopicMgr.ins.saveTopic(roomNo, _topic);
    }

    //????????????????????????????????????
    String topicLang = createChatLangTopicId(
      roomNo: roomRsp.roomNo,
      channelType: roomRsp.channelType,
    );
    if (_topicLang != topicLang) {
      XCStompClient.ins.unsubscribe(XCStompAction.Chat, _topicLang);
      _topicLang = topicLang;
      XCStompClient.ins
          .subscribe(XCStompAction.Chat, _topicLang, _onLangSubscribe);
      ChatRoomSubscribeTopicMgr.ins.saveTopic(roomNo, _topicLang);
    }

    //?????????????????????
    String giftTopic = createGiftTopicId(
      roomNo: roomRsp.roomNo,
      channelType: roomRsp.channelType,
    );
    if (_giftTopic != giftTopic) {
      XCStompClient.ins.unsubscribe(XCStompAction.Gift, _giftTopic);
      _giftTopic = giftTopic;
      XCStompClient.ins
          .subscribe(XCStompAction.Gift, _giftTopic, _onSubscribeGift);
      ChatRoomSubscribeTopicMgr.ins.saveTopic(roomNo, _giftTopic);
    }

    //?????????????????????(????????????100?????????????????????????????????????????????)
    String overallGiftTopic =
        createOverallGiftTopicId(channelType: roomRsp.channelType);
    if (_overallGiftTopic != overallGiftTopic) {
      XCStompClient.ins
          .unsubscribe(XCStompAction.OverallGift, _overallGiftTopic);
      _overallGiftTopic = overallGiftTopic;
      XCStompClient.ins.subscribe(
          XCStompAction.Gift, _overallGiftTopic, _onSubscribeOverallGift);
      ChatRoomSubscribeTopicMgr.ins.saveTopic(roomNo, _overallGiftTopic);
    }

    //??????????????????
    String anchorOfflineTopic = createAnchorOfflineTopicId(roomNo: roomNo);
    if (_anchorOfflineTopic != anchorOfflineTopic &&
        !isStrNullOrEmpty(roomNo)) {
      if (_anchorOfflineTopic != null) {
        XCStompClient.ins
            .unsubscribe(XCStompAction.AnchorOffline, _anchorOfflineTopic);
      }
      _anchorOfflineTopic = anchorOfflineTopic;
      XCStompClient.ins.subscribe(XCStompAction.AnchorOffline,
          _anchorOfflineTopic, onAnchorOfflineMessage);
      ChatRoomSubscribeTopicMgr.ins.saveTopic(roomNo, _anchorOfflineTopic);
    }

    // ???????????????
    String gameNotifyTopic = createGameNotifyTopicId();
    if(_gameNotifyTopic != gameNotifyTopic){
      if (_gameNotifyTopic != null) {
        XCStompClient.ins.unsubscribe(XCStompAction.GameNotify, _gameNotifyTopic);
      }
      _gameNotifyTopic = gameNotifyTopic;
      XCStompClient.ins.subscribe(XCStompAction.GameNotify, _gameNotifyTopic, onGameNotifyMessage);
      ChatRoomSubscribeTopicMgr.ins.saveTopic(roomNo, _gameNotifyTopic);
    }

    //???????????????
    if(isFreeAnchor){
      String freeAnchorGameTopic = createFreeAnchorGameTopicId(roomNo: roomNo);
      if (_freeAnchorGameTopic != freeAnchorGameTopic && !isStrNullOrEmpty(roomNo)) {
        if (_freeAnchorGameTopic != null) {
          XCStompClient.ins.unsubscribe(XCStompAction.FreeAnchorGame, _freeAnchorGameTopic);
        }
        _freeAnchorGameTopic = freeAnchorGameTopic;
        XCStompClient.ins.subscribe(XCStompAction.FreeAnchorGame, _freeAnchorGameTopic, onFreeAnchorGameTopic);
        ChatRoomSubscribeTopicMgr.ins.saveTopic(roomNo, _freeAnchorGameTopic);
      }
    }
    if (_oldOrientation == Orientation.portrait) {
      BarrageManager.get().close();
    }
  }

  //???????????????
  Future<void> switchChatRoom() async {
    BarrageManager.get().close();
    BarrageManager.get().clear();
    if (mounted) {
      setState(() {
        showBottomNav = false;
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((cb) {
      if (mounted) {
        setState(() {
          showBottomNav = true;
        });
      }
    });
    var roomRsp = await chatRoomController.switchAnchorId(chatroomAnchorId);
    if (null != roomRsp) {
      unsubscribeChatMessages();
      if (updateInfoController.resetRoomStatusFunc != null) {
        updateInfoController.resetRoomStatusFunc();
      }
      if (updateInfoController.updateRoomInfoFunc != null) {
        updateInfoController.updateRoomInfoFunc(
            anchorId: chatroomAnchorId, roomNo: roomRsp.roomNo);
      }
      resubscribeChatRoom(roomRsp);
    }
    BarrageManager.get().show();
  }

  //???????????????
  void _onSubscribe(Map<String, dynamic> message) {
    if (this.isVirtual) return;

    if (!chatRoomOpenStatus.isOpen) return;
    Event.eventBus.fire(ChatMessageEvent(message,comeFrom: 'detail_page_1882'));
    if (_oldOrientation == Orientation.landscape) {
      List<dynamic> data = message['data'];
      data.forEach((f) {
        var json = AiJson(f);
        var playerId = json.getString("playerId");
        if (playerId != config.userInfo.playerId) {
          String headerUrl = "${Api.baseImgUrl}/${json.getString("headImg")}";
          var chatUser = ChatUser(
            showName: json.getString("nickName"),
            chatId: playerId,
            headerUrl: headerUrl,
          );
          var convertString2BarrageData =
              MessageHelper.convertString2BarrageData(
            chatUser: chatUser,
            createDate: json.getDate("createDate"),
            messageBody: json.getString("content"),
            messageType: MessageType.conversation_chatroom,
          );
          BarrageManager.get().addAllData(convertString2BarrageData);
        }
      });
    }
  }

  //???????????????
  void _onSubscribeIntoChatRoom(Map<String, dynamic> message) {
    if (this.isVirtual) return;
    // dPageModel?.pushOrderViewModel?.refresh();
    if (!chatRoomOpenStatus.isOpen) return;
    Event.eventBus.fire(ChatMessageEvent(message,comeFrom: 'detail_page_1913 _onSubscribeIntoChatRoom'));
  }

  void _onSubscribeGift(Map<String, dynamic> message) {
    if (!chatRoomOpenStatus.isOpen) return;
    Event.eventBus.fire(ChatMessageEvent(message,comeFrom: 'detail_page_1918 _onSubscribeGift'));
  }

  void _onSubscribeOverallGift(Map<String, dynamic> message) {
    if (!chatRoomOpenStatus.isOpen) return;
    Event.eventBus.fire(ChatMessageEvent(message,comeFrom: 'detail_page_1923 _onSubscribeOverallGift'));
  }

  void _onSubscribe2(Map<String, dynamic> message) {
    _onSubscribe(message);
  }

  void _onLangSubscribe(Map<String, dynamic> message) {
    _onSubscribe(message);
  }

  // ???????????????
  void onFreeAnchorGameTopic(dynamic message,{bool isManualCall = false}) {
    bool isFreeLiveGameAnchor = detailSet?.detailParams?.isFreeLiveGameAnchor ?? false;
    if(!isFreeLiveGameAnchor) return;
//    Event.eventBus.fire(ChatMessageEvent(message));
    if(isManualCall){
      AnchorGameService.ins.addData(AiGameCellModel());
      Event.eventBus.fire(OpenGameEvent(isUpdateGame: true));
    }
    else{
      List<dynamic> data = message['data'];
      num action = message['action'];
      if(action != 1032)
        return;
      if(data != null && data.isNotEmpty){
        var messageData = data[0];
        String liveGame = AiJson(messageData).getString('liveGame');
        String liveId = AiJson(messageData).getString('liveId');
        String gameRsp = AiJson(messageData).getString('gameRsp');
        Map gameData = jsonDecode(gameRsp) ?? {};
        String gameKey = AiJson(gameData).getString('gameKey');
        String gameName = AiJson(gameData).getString('gameName');
        String gameNameRaw = AiJson(gameData).getString('gameNameRaw');
        String gameType = AiJson(gameData).getString('gameType');
        String icon = AiJson(gameData).getString('icon');
        String img = AiJson(gameData).getString('img');
        String order = AiJson(gameData).getString('order');
        String screen = AiJson(gameData).getString('screen');
        String supplierId = AiJson(gameData).getString('supplierId');
        AiGameCellModel gameMessage = AiGameCellModel(
            liveGame: liveGame,
            liveId: liveId,
            gameKey: gameKey,
            gameName: gameName,
            gameType: gameType,
            icon: icon,
            img: img,
            screen: screen,
            supplierId: supplierId,
         );
        // ????????????gameKey???
        detailSet.detailParams.gameKey = liveGame;
        detailSet.detailParams.gameMessage = gameMessage;
        AnchorGameService.ins.addData(gameMessage);
        Event.eventBus.fire(OpenGameEvent(isUpdateGame: true));
        print('???????????????');
      }
    }
  }

  // ????????????
  void onAnchorOfflineMessage(dynamic message) {
    // ??????????????????
    String offlineAnchorId = AiJson(message).getString('anchorId');
    if (!isStrNullOrEmpty(offlineAnchorId)) {
      config.userInfo.offlineAnchorIds.add(offlineAnchorId);
    }
    LiveVideoInfo currentAnchor = playerController?.toolPanel?.anchorSelectorFull?.model?.currentAnchor;
    if (currentAnchor == null ||
        isStrNullOrEmpty(currentAnchor?.vid) ||
        !(currentAnchor?.isSelectAnchorLive ?? false)) {
      return;
    }
    // ?????????
    String type;
    LiveVideoInfo liveVideoInfo;
    List<LiveVideoInfo> lives = playerController.toolPanel.anchorSelectorFull.model.anchors;
    for (var videoInfo in lives) {
      if (isStrNullOrEmpty(videoInfo.vid)) {
        liveVideoInfo = videoInfo;
        break;
      }
    }
    // ????????????
    if (playerController.hasVideLive && liveVideoInfo != null) {
      type = SelectViewTypeVideo;
    }
    // ????????????(????????????????????????????????????(???????????????????????????????????????))
    else if (!isStrNullOrEmpty(extendModel.data.animateLiveUrl) &&
        config.isCnTwLang) {
      type = SelectViewTypeAnimation;
    }
    // ????????????
    else {
      type = SelectViewTypeScore;
    }
    showToas(baseLang['detail']['anchorOffline']);
    MatchViewChooseModel matchViewChooseModel = MatchViewChooseModel();
    detailSet.selectViewType = type;
    detailSet.isChangeViewType = true;
    matchViewChooseModel.gidm = playerController.toolPanel.topBar.model.gidm;
    matchViewChooseModel.extendModel = extendModel;
    matchViewChooseModel.selectItem = type;
    if (type == "video") {
      playerController.toolPanel.anchorSelectorFull.model.currentAnchor = liveVideoInfo;
      Event.eventBus.fire(AnchorChooseEvent(liveVideoInfo));
      playerController.toolPanel.anchorSelectorFull.anchorVideoChanged.fire();
    } else {
      if (detailSet.selectViewType == SelectViewTypeVideo) {
        playerController.dispose();
      }
      playerController.toolPanel.anchorSelectorFull.model.currentAnchor = null;
    }
    VideoType videoType = VideoType.Score;
    if (type == SelectViewTypeVideo) {
      videoType = VideoType.Video;
    } else if (type == SelectViewTypeAnimation) {
      videoType = VideoType.Animation;
    }
    Event.eventBus.fire(DetailMoreChangeVideoEvent(videoType: videoType));
    Event.eventBus.fire(DetailViewEvent(matchViewChooseModel));
    Event.eventBus.fire(ChatRoomChooseEvent(null));
//    Event.eventBus.fire(LiveChangeEvent(isShowLivePanel: false));
  }

  // ???????????????
  void onGameNotifyMessage(dynamic message) async {
    if (message == null || config.userInfo.isLogout()) {
      return;
    }
    final gameModel =  GameNotifyMessage.json(message);
    if(!gameModel.isTrue) return;
    var result = await AiGameSelectByGameKeyReqProtocol(gameKey: gameModel.gameKey).request();
    if(result.isSuccess){
      final model = result.gameModel;
      gameModel.setDialogInfo(model.gameName,model.supplierId,model.gameType);
      Event.eventBus.fire(GameNotifyEvent(gameModel));

      num cacheDate = AiCache.get().getInt(AiCache.pushMsg_gameNotify_date) ?? 0;

      bool isCanOpen = false;
      if(cacheDate > 0){
        // ????????????????????????
        int difMilliseconds = DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(cacheDate)).inDays;
        bool isB = difMilliseconds > 3;
        if(isB){
          AiCache.get().setInt(AiCache.pushMsg_gameNotify_date,0);
          isCanOpen =true;
        }
      }else{
        isCanOpen = true;
      }

      bool isOpen = ModuleSwitch.getInstance().gameYxdbtk();

      final log = 'isListDetail : $isListDetail , LiveGame.isOpenGame : ${LiveGame.isOpenGame} , _isShowGameDialog : $_isShowGameDialog , isNotSwiper : ${swiperController == null} , '
          'swiperIndex not 1 : ${swiperController.index != 1} , isCanOpen : $isCanOpen , isOpen : $isOpen';
      aiLog(tag: LogTag.progress,message: log);
      // ?????? - ??????????????????
      if (isListDetail) return;
      if (LiveGame.isOpenGame) return;
      if (_isShowGameDialog) return;
      if (swiperController == null)return;
      if (swiperController.index != 1) return;

      if (isCanOpen && isOpen){
        _isShowGameDialog = true;
        _gameNotifyStream.add(gameModel);
      }
    }
  }

  void onDetailHandicapMessage(dynamic message) {
    if (message == null || config.userInfo.isLogout()) {
      return;
    }
    HandicapModel model = HandicapModel.fromMap(message);
    String key = model?.key ?? '';
    if (key.isEmpty) return;
    handicapMap[key] = model;
    // ??????????????????
    bool isFindHandicap = false;
    for (DPageHandicapModel handicapModel in dPageModel.handicapModelList) {
      List<String> handicapKeys =
          handicapModel.handicapPlayDataMap.keys.toList();
      if (handicapKeys.contains(key)) {
        DPagePlayDataModel playDataModel =
            handicapModel.handicapPlayDataMap[key];
        playDataModel.handicapModel = model;
        for (DPageRatioDataModel ratioData
            in playDataModel.ratioDataModelList) {
          ratioData.sw = model.sw;
        }
        isFindHandicap = true;
        break;
      }
      if (isFindHandicap) {
        break;
      }
    }
//    if (isFindHandicap) {
//      if (mounted && detailBetKey != null) {
//        detailBetKey.currentState.refreshHandicap(dPageModel, handicapMap);
////        print('??????????????????-------');
//      }
//    }
  }

  void _onSubscribeBetShareFollow(Map<String, dynamic> message) {
    if (this.isVirtual) return;
    if (!chatRoomOpenStatus.isOpen) return;

    AnchorBetShareFollowModel model = AnchorBetShareFollowModel.from(message);
    model.roomNo = roomNo;
    // dPageModel?.followOrderViewModel?.refresh();
    // dPageModel?.pushOrderViewModel?.refresh();

    if (model.action == 1022) {
      Event.eventBus.fire(AnchorBetShareFollowEvent(model: model));
    }
  }

  //??????????????????
  void unsubscribeChatMessages() async {
    ChatRoomSubscribeTopicMgr.ins.clearTopic(roomNo);
    XCStompClient.ins.unsubscribe(XCStompAction.Chat, _betShareTopic);
    XCStompClient.ins.unsubscribe(XCStompAction.Chat, _topic);
    XCStompClient.ins.unsubscribe(XCStompAction.Chat, _topicLang);
    XCStompClient.ins.unsubscribe(XCStompAction.Gift, _giftTopic);
    XCStompClient.ins.unsubscribe(XCStompAction.Gift, _overallGiftTopic);
    XCStompClient.ins
        .unsubscribe(XCStompAction.IntoChatRoom, _intoChatRoomTopic);
    XCStompClient.ins
        .unsubscribe(XCStompAction.ChatRoomLike, _chatRoomLikeTopic);
    XCStompClient.ins.unsubscribe(XCStompAction.Chat, _anchorTopic);
    XCStompClient.ins.unsubscribe(XCStompAction.Chat, _anchorBetShareTopic);
    XCStompClient.ins
        .unsubscribe(XCStompAction.Chat, _anchorBetShareFollowTopic);
    XCStompClient.ins
        .unsubscribe(XCStompAction.DetailHandicap, _detailHandicapTopic);
    XCStompClient.ins
        .unsubscribe(XCStompAction.AnchorOffline, _anchorOfflineTopic);
    XCStompClient.ins
        .unsubscribe(XCStompAction.AnchorOffline, _freeAnchorGameTopic);
    XCStompClient.ins
        .unsubscribe(XCStompAction.GameNotify, _gameNotifyTopic);
    _freeAnchorGameTopic = null;
    _betShareTopic = null;
    _topic = null;
    _topicLang = null;
    _giftTopic = null;
    _overallGiftTopic = null;
    _intoChatRoomTopic = null;
    _chatRoomLikeTopic = null;
    _anchorTopic = null;
    _anchorBetShareTopic = null;
    _anchorBetShareFollowTopic = null;
    _anchorOfflineTopic = null;
    _gameNotifyTopic = null;
  }

  @override
  void initState() {
    try {
      analysisGameSize();
      moreFunctionSlide = MoreFunctionSlide();
      chatRoomSliderTop.value = true;
      config.userInfo.isWatchLiveTimeShort = true;
      config.userInfo.isAlreadyShowBetHint = false;
      config.userInfo.isBetMoneyApiError = false;
      config.userInfo.watchLiveTime = -1;
      config.userInfo.offlineAnchorIds.clear();
      // ??????????????????
      Wakelock.enable();
      config.userInfo.isMatchDetail = true;
      config.userInfo.showIsDetailPage = true;
      config.userInfo.isShowRefinedDetail = false;
      BarrageManager.get().clear();
      detailSet = DetailSet();
      config.userInfo.detailSet = detailSet;
      // ????????????
      getParams();
      num liveStatus = detailSet?.detailParams?.liveStatus;
      bool isShowChatRoomPage = isListDetail || (liveStatus != null);
      swiperController = MatchDetailController.create(initPage: isShowChatRoomPage ? 1 : 0);
      playerController.isVirtual = this.isVirtual;
      playerController.toolPanel.bottomBar.videoTypeChanged.addListener(onVideoTypeChanged);
      playerController.toolPanel.topBar.moreTap.addListener(onMoreTap);
      playerController.toolPanel.topBar.leagueGameTap.addListener(onSelectLeagueGameTap);
      playerController.toolPanel.topBar.pickupChanged.addListener(onPickupChanged);
      // ????????????????????????
      if(isFreeAnchor){
        freeAnchorDefaultSet();
      }
      this.startTimer(isInit: true);
      listenOrlyInit();
      _timerTool.delayer(Duration(milliseconds: 500), () {
        listenInit();
      });
      refreshHeadVideo();
      headBgImg = getHeadBgImg();
      WidgetsBinding.instance.addObserver(this);
      this.startTimer(isInit: true);


      followSwitchStatus = ModuleSwitch.getInstance().followBet();
      chatRoomSwitchStatus = ModuleSwitch.getInstance().chatRoom();

      if (!isListDetail && ccRoute.hasShowOverlay(FastAiRouteTableName.ActivityDrawFloat)) {
        // ???????????????
        FloatActivityDrawCarHelper.activityDrawStatus(false, isDetail: true);
      }
      slideAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 150));
      if (ModuleSwitch.getInstance().redPacket()) {
        redPacketHelper = FloatRedPacketHelper(
            liveId: liveId,
  //          systemId: widget?.params?.systemId ?? matchesDetailModel?.data?.systemId,
            systemId: "",
            gidm: gidm);
        redPacketHelper.initHelper();
      }
      InputChatRoomBarrageManager.ins().clear();

      _timerTool.delayer(Duration(milliseconds: 500), () {
//        ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsEntryGameDetail);
      });
      bool _needShowRedPacket = widget?.params?.packetId != null && widget?.params?.systemId != null;
      // ????????????????????????????????????????????????
      WidgetsBinding.instance.addPostFrameCallback((d) {
        if (_needShowRedPacket) {
          _showRedPacket();
        }
        AnchorShareService.ins.initData();
        AnchorGameService.ins.initData();

        detailPageContentHashCode = context.hashCode;
      });
      // ????????????ContainerPage?????????
      if (!(isListDetail || config.userInfo.isShowRefinedDetail)) {
        ContainerTimerManager.instance.stopTimer();
      }
      DetailPageRefreshManager.instance.addComeBackRefresh(comeBackRefresh);
    }
    catch (e) {
      print('????????????------:${e.toString()}');
    }
    super.initState();
  }

  // ???????????????????????????
  void analysisGameSize() {
    String type1Size = AiJson(config.langMap['baseLang']).getString('gameHeightType1');
    String type2Size = AiJson(config.langMap['baseLang']).getString('gameHeightType2');
    if(!isStrNullOrEmpty(type1Size) && type1Size.contains('*')) {
      List<String> list = type1Size.split('*') ?? [];
      double width = 0.0;
      double height = 0.0;
      if(list.isNotEmpty && list.length > 1) {
        width = double.tryParse(list[0]) ?? 0.0;
        height = double.tryParse(list[1]) ?? 0.0;
        if(width > 0.0 && height > 0.0) {
          gameType1Size = Size(width, height);
        }
      }
    }
    if(!isStrNullOrEmpty(type2Size) && type2Size.contains('*')) {
      List<String> list = type2Size.split('*') ?? [];
      double width = 0.0;
      double height = 0.0;
      if(list.isNotEmpty && list.length > 1) {
        width = double.tryParse(list[0]) ?? 0.0;
        height = double.tryParse(list[1]) ?? 0.0;
        if(width > 0.0 && height > 0.0) {
          gameType2Size = Size(width, height);
        }
      }
    }
  }

  void comeBackRefresh(){
    reload(detailSet.detailParams, showLoading: true);
  }

  void freeAnchorDefaultSet(){
    playerController.toolPanel.bottomBar.setVideoType(VideoType.Video);
    detailSet.selectViewType = 'video';
  }

  void refreshHeadVideo() {
    _timerTool.delayer(Duration(milliseconds: 1000), () {
      config.userInfo.isShowHeadVideo = false;
      Event.eventBus.fire(HeadVideoEvent());
    });
  }

  /// ------------------  listenInit start  ------------------

  bool isEnableDetailUpdate = true;

  void pageChangeListener(
      int pageCount, Route route, Route previousRoute, PageMethod method) {
    String routeName = route?.settings?.name ?? '';
    String previousRouteName = previousRoute?.settings?.name ?? '';
    if (method == PageMethod.Push &&
        previousRouteName == AiRouter.AiDetailPage) {
      isEnableDetailUpdate = false;
    }
    if (method == PageMethod.Pop &&
        previousRouteName == AiRouter.AiDetailPage) {
      isEnableDetailUpdate = true;
    }
  }

  void listenShareBetChanged() {
    this
        .bottomNavBarModel
        .hasSharedBetBtnChangedListener
        .addListener(hasSharedBetBtnChangedListener);
  }

  void hasSharedBetBtnChangedListener(value) {
    if (mounted) {
      setState(() {});
    }
  }

  void listenOrlyInit() {
    this.listenShareBetChanged();
    this.listenModuleChangeEvent();
    this.listenMatchGlobalInfoEvent();
    this.listenerMoreVideoEvent();
    this.listenerDetailMoreFunctionEvent();
    this.listenerCloseDetailLiveEvent();
    this.listenerRefinedDetailEvent();
    this.listenerRefinedChatRoomEvent();
  }

  void listenOrlyCancel() {
    this
        .bottomNavBarModel
        ?.hasSharedBetBtnChangedListener
        ?.removeListener(hasSharedBetBtnChangedListener);
    moduleChangeEvent?.cancel();
    showMatchGlobalInfoEvent?.cancel();
    showMoreVideoEvent?.cancel();
    detailMoreFunctionEvent?.cancel();
    closeDetailLiveEvent?.cancel();
    refinedDetailEvent?.cancel();
    refinedChatRoomEvent?.cancel();
  }

  void listenInit() {
    this.listenNetworkState();
    this.listenLiveGameVideo();
    this.listenDetailParams();
    this.listenDetailMatchViewEvent();
    this.listenCollectPlayTypeEvent();
    this.listenDetail();
    this.listenExtend();
    this.listenDetailOrientation();
    this.listenAnchorChooseEvent();
    this.listenDetailLiveList();
    this.listenCloseDetailPage();
    this.listenChatRoomChooseEvent();
    this.showGameAnimated();

    _isListenerCancel = false;
  }

  void listenCancel() {
    liveRefreshTimer?.cancel();
    watchLiveTimer?.cancel();
    _timerTool?.cancel();
    timer?.cancel();
//    watchLiveTimer?.cancel();
    networkStateEventNetworkStateEvent?.cancel();
    _liveGameVideoEvent?.cancel();
    detailParamsEvent?.cancel();
    chatRoomCloseStreamSubscription?.cancel();
    detailMatchViewEvent?.cancel();
    collectPlayTypeEvent?.cancel();
    detailEvent?.cancel();
    extendEvent?.cancel();
    detailOrientationEvent?.cancel();
    showGameAnimatedEvent?.cancel();
    anchorChooseEvent?.cancel();
    detailLiveListEvent?.cancel();
    closeDetailPageEvent?.cancel();
    chatRoomEvent?.cancel();

    playerController?.matchOverListener?.clear();
    _isListenerCancel = true;
  }

  void forwardGameAnimated({AiGameCellModel gameModel, Offset offset, double gamePanHeight, double topMargin}) {
    if(gameAnimatedKey?.currentState != null) {
     gameAnimatedKey?.currentState?.forwardAnimated(cellModel: gameModel, offset: offset, gamePanHeight: gamePanHeight, topMargin: topMargin);
    }
  }

  void reverseGameAnimated() {
    if(gameAnimatedKey?.currentState != null) {
      gameAnimatedKey?.currentState?.reverseAnimated();
    }
  }

  void showGameAnimated() {
    showGameAnimatedEvent?.cancel();
    showGameAnimatedEvent = Event.eventBus.on<ShowGameAnimatedEvent>().listen((event) {
      if(event is ShowGameAnimatedEvent){
        gameBtnOffset = event.offset;
        gameModel = event.gameModel;
        if(isStrNullOrEmpty(gameModel.anchorId)) {
          gameModel.anchorId = getAnchorId();
        }
        if(isStrNullOrEmpty(gameModel.roomNo)) {
          gameModel.roomNo = roomNo;
        }
        gameTopMargin = 0.0;
        Offset offset = Offset(gameBtnOffset.dx, gameBtnOffset.dy - gamePanTopMargin);
        _gameAnimatedNotifyStream.add(true);
        Future.delayed(Duration(milliseconds: 50), (){
          forwardGameAnimated(gameModel: gameModel, offset: offset, gamePanHeight: gamePanHeight, topMargin: gamePanTopMargin);
        });
        // 5???????????????????????????????????????
        gameTimer?.cancel();
        gameTimer = Timer.periodic(Duration(minutes: 5), (timer) {
          if(gameTopMargin < 0.0) {
            gameTimer?.cancel();
            isShowGameView = false;
            if(mounted) setState(() {});
            Future.delayed(Duration(milliseconds: 100), (){
              isShowGameView = true;
              if(mounted) setState(() {});
            });
          }
        });
      }
    });
  }

  double get gamePanTopMargin {
    Size size = MediaQuery.of(context).size;
    double screenH = size.height;
    return screenH - gamePanHeight;
  }

  double get gamePanHeight {
    //640 * 960??????(w*h)?????????
    //375 * 474(w*h)?????????
    Size size = MediaQuery.of(context).size;
    double screenW = size.width;
    double screenH = size.height;
    double height = gameType2Size.height * screenW / gameType2Size.width;
    String gameKey = gameModel.gameKey;
    if (gameKey == 'BAC') {
      height = gameType1Size.height * screenW / gameType1Size.width;
    }
    return height;
  }

  void listenNetworkState() async {
    isConnectNetwork = !config.isNotConnect;
    networkStateEventNetworkStateEvent?.cancel();
    networkStateEventNetworkStateEvent =
        Event.eventBus.on<NetworkStateEvent>().listen((event) {
      bool isConnect = !config.isNotConnect;
      //??????????????????????????????????????????????????????????????????????????????
      if (isConnectNetwork != isConnect && isConnect) {
        if (VideoType.Video ==
            playerController.toolPanel.bottomBar.model.videoType) {
          playerController.player.replay();
        }
      }
      isConnectNetwork = isConnect;
    });
  }

  void listenLiveGameVideo() async {
    if (isListDetail) {
      // ????????? ????????????????????????
      _liveGameVideoEvent?.cancel();
      _liveGameVideoEvent =
          Event.eventBus.on<LiveGameVideoEvent>().listen((event) {
        if (event.state == 'pause' && playerController.player.isOk) {
          Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
        }
        if (event.state == 'play' && playerController.player.isOk) {
          Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
        }
      });
    }
  }

  void listenDetailParams() async {
    detailParamsEvent?.cancel();
    detailParamsEvent = Event.eventBus.on<DetailParams>().listen((params) async {
      reload(params);
    });
  }

  // ???????????????????????????
  void listenDetailMatchViewEvent() {
    chatRoomCloseStreamSubscription?.cancel();
    chatRoomCloseStreamSubscription =
        Event.eventBus.on<ChatRoomOpenStatus>().listen((event) {
      chatRoomOpenStatus = event;
    });

    //??????????????????????????????????????????????????????????????????????????????
    detailMatchViewEvent?.cancel();
    detailMatchViewEvent = Event.eventBus.on<DetailViewEvent>().listen((event) {
      detailSet.selectViewType = event.matchViewChooseModel.selectItem;
      config.userInfo.detailSet = detailSet;
      if (isBlackShowHead == false) {
        setHeightAndBg();
        if (mounted) {
          setState(() {});
        }
      }

      syncViewTypeChanged();
    });
  }

  // ??????????????????
  void listenCollectPlayTypeEvent() {
//    collectPlayTypeEvent?.cancel();
//    collectPlayTypeEvent =
//        Event.eventBus.on<CollectPlayTypeEvent>().listen((event) {
//      if (mounted) {
//        detailBetKey?.currentState?.refresh(
//          selectGroupId: this._selectGroupId,
//          detailRateModel: detailRateModel,
//          playGroupModel: playGroupModel,
//          matchesDetailModel: matchesDetailModel,
//          isVirtualBetOver: this.isVirtualMatchOver,
//          handicapRatioDataMap: this.handicapMap,
//        );
//      }
//    });
  }

  // ????????????
  void listenDetail() {
    detailEvent?.cancel();
    detailEvent = Event.eventBus.on<DetailEvent>().listen((event) {
      detailSet = DetailSet();
      config.userInfo.detailSet = detailSet;
      this.gidm = event.gidm;
      startTimer();
    });
  }

  // ????????????
  void listenExtend() {
    extendEvent?.cancel();
    extendEvent = Event.eventBus.on<ExtendEvent>().listen((event) {
      setState(() {
        this.extendModel = event.extendModel;
      });
    });
  }

  // ????????????????????????????????????/??????????????????
  void listenDetailOrientation() {
    detailOrientationEvent?.cancel();
    detailOrientationEvent =
        Event.eventBus.on<DetailOrientationEvent>().listen((event) {
      Orientation orientation = event.orientation;
      playerController?.toolPanel?.activeBannerController?.orientation =
          orientation;
      if (_oldOrientation != orientation) {
        _oldOrientation = orientation;
        //??????
        if (orientation == Orientation.landscape) {
          Size size = MediaQuery.of(context).size;
          moreFunctionSlide.closeMoreVideo(size);
          hideKeyBoard(context);
          BarrageManager.get().show();
          isBettingBottom = false;
        } else {
          //?????????????????????
          BarrageManager.get().close();
          BarrageManager.get().clear();
          isBettingBottom = true;
        }
        setState(() {});
      }
    });
  }

  // ??????????????????
  void listenAnchorChooseEvent() {
    anchorChooseEvent?.cancel();
    anchorChooseEvent = Event.eventBus.on<AnchorChooseEvent>().listen((event) {
      this.selectAnchorId = event.liveVideoInfo.vid;
    });
  }

  void listenDetailLiveList() {
    detailLiveListEvent?.cancel();
    detailLiveListEvent = Event.eventBus.on<DetailLiveEvent>().listen((event) {
      livePlayerKey.currentState.showLiveList();
    });
  }

  void listenCloseDetailPage() async {
    closeDetailPageEvent?.cancel();
    closeDetailPageEvent =
        Event.eventBus.on<CloseDetailPageEvent>().listen((e) {
      unsubscribeChatMessages();
      listenCancel();
    });
  }

  void listenChatRoomChooseEvent() {
    chatRoomEvent?.cancel();
    chatRoomEvent = Event.eventBus.on<ChatRoomChooseEvent>().listen((event) {
      this.chatroomAnchorId = event.anchorId;
      switchChatRoom();
    });
  }

  // ????????????????????????????????????????????????
  void listenModuleChangeEvent() {
    moduleChangeEvent?.cancel();
    moduleChangeEvent =
        Event.eventBus.on<ModuleSwitchChangeEvent>().listen((event) {
      if (mounted &&
          (followSwitchStatus != ModuleSwitch.getInstance().followBet() ||
              chatRoomSwitchStatus != ModuleSwitch.getInstance().chatRoom())) {}
    });
  }

  // ?????????????????????????????????????????????????????????
  void listenMatchGlobalInfoEvent() {
//    showMatchGlobalInfoEvent?.cancel();
//    showMatchGlobalInfoEvent =
//        Event.eventBus.on<MatchGlobalInfoEvent>().listen((e) {
//      if (isListDetail) return;
//      if (mounted) {
//        PopupShareService.ins.pause('showMatchGlobalInfo');
//        showModalBottomSheetRoute(context,
//            barrierColor: Colors.transparent,
//            child: MatchGlobalInfoView(
//              showType: matchesDetailModel?.data?.showtype,
//              gameType: matchesDetailModel?.data?.gameType,
//              matchesDetailModel: matchesDetailModel,
//              isVirtualGame: isVirtual,
//            )).then((_) {
//          PopupShareService.ins.resume('showMatchGlobalInfo');
//        });
//      }
//    });
  }

  void listenerMoreVideoEvent() {
    showMoreVideoEvent?.cancel();
    showMoreVideoEvent = Event.eventBus.on<MoreVideoEvent>().listen((e) {
      PopupShareService.ins.pause('showMoreVideo');
      showModalBottomSheetRoute(context,
          child: VideoLiveView(
            gameType: config.userInfo.detailSet.detailParams.gameType ?? "FT",
            currentGidm: config.userInfo.detailSet.detailParams.gidm,
            currentLiveVideoInfo: playerController?.toolPanel?.anchorSelectorFull?.model?.currentAnchor,
            closeCallback: () {
              AiRouter.pop(context);
              if (mounted) {
                setState(() {
                  showBottomNav = false;
                });
              }
            },
          )).then((_) {
        PopupShareService.ins.resume('showMoreVideo');
      });
    });
  }

  // ??????????????????????????????????????????
  void listenerDetailMoreFunctionEvent() {

    detailMoreFunctionEvent?.cancel();
    detailMoreFunctionEvent = Event.eventBus.on<DetailMoreFunctionEvent>().listen((e) {
      if (isListDetail) return;
      NewHeadAnchorModel newHeadAnchorModel = NewHeadAnchorModel(
        this.extendModel,
        this.selectAnchorId ?? detailSet.detailParams.anchorId ?? '',
      );
      newHeadAnchorModel.initData();

      String anchorId = !isStrNullOrEmpty(selectAnchorId) ? selectAnchorId : chatroomAnchorId;
      if(isStrNullOrEmpty(anchorId)){
        anchorId = detailSet.detailParams?.anchorId;
      }
      PopupShareService.ins.pause('detailMoreFunction');
      showPopup(
          context,
          MoreFunction(
            anchorId: anchorId,
            roomNo: roomNo,
//            matchesDetailModel: matchesDetailModel,
//            extendModel: extendModel,
            newHeadAnchorModel: newHeadAnchorModel,
            playerController: playerController,
            detailSet: detailSet,
            onShowMatchInfo: onShowMatchInfo,
            isFreeAnchor: isFreeAnchor,
            closeCallBack: () {
              AiRouter.pop(context);
            },
          ),
          false,
          () {},
          RouteSettings(name: AiRouter.AiMoreFunction));
      PopupShareService.ins.resume('detailMoreFunction');
    });
  }

  // ??????????????????
  void listenerCloseDetailLiveEvent() {
    closeDetailLiveEvent?.cancel();
    closeDetailLiveEvent =
        Event.eventBus.on<CloseDetailLiveEvent>().listen((e) {
      playerController?.player?.pause();
    });
  }

  void listenerRefinedDetailEvent() {
    refinedDetailEvent?.cancel();
    refinedDetailEvent =
        Event.eventBus.on<RefinedDetailEvent>().listen((event) {
      RefinedDetailEvent detailEvent = event;
      isListDetail = !detailEvent.isShowRefinedDetail;
      if (mounted) setState(() {});
//    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//      swiperController?.move(1);
//    });
    });
  }

  void listenerRefinedChatRoomEvent() {
    refinedChatRoomEvent?.cancel();
    refinedChatRoomEvent =
        Event.eventBus.on<RefinedChatRoomEvent>().listen((e) {
      if (ModuleSwitch.getInstance().chatRoom()) {
        swiperController?.move(1);
      }
    });
  }

  /// ------------------  listenInit end  ------------------

  /// ------------------ playerController listener start ------------------

  //??????ViewType?????????
  onVideoTypeChanged(VideoType videoType) {
    if (videoType == VideoType.Score) {
      detailSet.selectViewType = "default";
    } else if (videoType == VideoType.Animation) {
      detailSet.selectViewType = "animation";
    } else if (videoType == VideoType.Video) {
      detailSet.selectViewType = "video";
    }
    config.userInfo.detailSet = detailSet;
    if (isBlackShowHead == false) {
      setHeightAndBg();
      if (mounted) {
        setState(() {});
      }
    }
  }

  // ????????????
  onMoreTap() async {
//    String anchorId =
//        this.selectAnchorId ?? detailSet.detailParams.anchorId ?? '';
//    var selectAgent = SelectGameAgent(extendModel, playerController,
//        matchesDetailModel, detailSet, context, "", "", anchorId);
//    selectAgent.showMatchViewChoose();
  }

  //????????????
  onSelectLeagueGameTap() {
//    var leagueId = matchesDetailModel?.data?.leagueId;
//    var leagueName = matchesDetailModel?.data?.leagueName;
//    var selectAgent = SelectGameAgent(extendModel, playerController,
//        matchesDetailModel, detailSet, context, leagueId, leagueName);
//    selectAgent.showSelectLeagueGame();
  }

  //??????????????????
  onPickupChanged(bool isPickup) {
    onHeadExpansiond(isPickup);
  }

  /// ------------------ playerController listener end ------------------

  void _loadRedPacketList() {
    if (_didLoadRedPacketList) return;
    if (!ModuleSwitch.getInstance().redPacket()) {
      return;
    }
    _didLoadRedPacketList = true;
    redPacketHelper.loadRedBagList(sysId: '');
  }

  void onPlayListScroll() {
    if (activeBannerKey1 != null && activeBannerKey1?.currentState != null) {
      activeBannerKey1?.currentState?.hideBanner();
    }
  }

  /// ???????????????????????????????????????????????????????????????????????????????????????
  void onShowMatchInfo() {
    if (isListDetail) return;
    Event.eventBus.fire(MatchGlobalInfoEvent());
  }

  void horizontalDragCallBack(dragType, details) {
    if (dragType == HorizontalDragType.start) {
      onMoreVideo(isClickMore: false);
      moreFunctionSlide.onHorizontalDragStart(details, context);
    } else if (dragType == HorizontalDragType.update) {
      moreFunctionSlide.onHorizontalDragUpdate(details, context);
    } else if (dragType == HorizontalDragType.end) {
      moreFunctionSlide.onHorizontalDragEnd(details, context);
    }
  }

  /// ????????????????????????????????????????????????????????????
  void onMoreVideo({bool isClickMore = true}) {
    moreFunctionSlide.showMoreVideo(context,
//        gameType: config.userInfo.detailSet.detailParams.gameType ?? "FT",
//        currentGidm: config.userInfo.detailSet.detailParams.gidm,
        currentLiveVideoInfo: playerController?.toolPanel?.anchorSelectorFull?.model?.currentAnchor,
        controller: slideAnimationController,
        isClickMore: isClickMore,
        closeCallback: () {});
  }

  @override
  void dispose() {
    config.anchorType = AnchorType.none;

    try {
      AiNavigatorObserver.getInstance()
          ?.removePageCountChangeListener(pageChangeListener);
//      _autoOddsService.disposeService();
      dPageModel?.dispose();
      chatRoomSliderBottom?.dispose();
      chatRoomSliderTop?.dispose();
      AnchorShareService?.ins?.dispose();
      AnchorGameService?.ins?.dispose();
//      if (!isListDetail) {
//        config.userInfo.currentSaveHitOptionType = outSideHitOptionType;
//        AiHitService.currentMode = outSideHitMode;
//      }
      unsubscribeChatMessages();
      ChatRoomBlocFactory?.ins?.clear();
      PopupShareService?.ins?.close();
      // ??????????????????
      Wakelock.disable();
      listenCancel();
      listenOrlyCancel();
      // ????????????????????????
      moreFunctionSlide?.dispose();
//      slideAnimationController?.stop();
//      slideAnimationController?.dispose();
      config?.userInfo?.isMatchDetail = false;
      Event.eventBus.fire(CloseDetailPageEvent());
      Event.eventBus.fire(FreeAnchorEntryDetailEvent(isExitDetail: true));
      config?.userInfo?.showIsDetailPage = false;

//      FloatShopCarHelper.setLocalShoppingCarStatus(false);
//      if (FloatShopCarConfig.ins.showFloatShopCar &&
//          !config.showBettingContainerView) {
//        FloatShopCarHelper.shoppingCarStatus(true);
//      }

      if (ccRoute.hasShowOverlay(FastAiRouteTableName.ActivityDrawFloat) &&
          !isListDetail) {
        FloatActivityDrawCarHelper.activityDrawStatus(true, isDetail: true);
      }

//      Event.eventBus.fire(
//          MatchCollectionSelectedOverlayNotication(mode: OperatorMode.show));
//      serivce.recordCurrentPage(null);
//      serivce.saveOrUpdateCurrentMatchUserWatching(null);
      DetailPage.currentPageIsDetailPage = false;

      config.userInfo.detailSet = DetailSet();
      playerController?.toolPanel?.topBar?.moreTap?.removeListener(onMoreTap);
      playerController?.toolPanel?.bottomBar?.videoTypeChanged
          ?.removeListener(onVideoTypeChanged);
      playerController?.toolPanel?.topBar?.leagueGameTap
          ?.removeListener(onSelectLeagueGameTap);
      playerController?.toolPanel?.topBar?.pickupChanged
          ?.removeListener(onPickupChanged);
      playerController?.player?.pause();
      playerController?.dispose();
      WidgetsBinding.instance.removeObserver(this);

      _liveGameVideoEvent?.cancel();
//      expandCache?.clear();
      IntoChatRoomStatus.ins.reset();
      Event.eventBus.fire(AnchorLiveEvent());
      config.userInfo.chatRoomNo = null;
      _firstLoadTimeOutTimer?.cancel();
      InputChatRoomBarrageManager.ins().clear();
    } catch (e) {
      //print(e);
    }
    config.userInfo.recordVideoStatus = '';
    config.userInfo.offlineAnchorIds.clear();
    if (isNotEmpty(roomNo)) {
      ExitRoomReqProtocol(roomNo).request();
    }
    if (!isFreeAnchorListEntry) {
      if (needShowFloatVideoWindow) {
        needShowFloatVideoWindow = false;
        String anchorId = playerController.toolPanel?.anchorSelectorFull?.model?.currentAnchor?.vid;
        updateFloatAnchorId(anchorId);
        Event.eventBus.fire(ShowFloatVideo());
      }
    }
    if (hasVideoOrAnchor && !config.isApp) {
      XcSdkApi.canAutorotate(false);
    }

    redPacketHelper?.disposeHelper();

    config.fromBetRecordToDetail = false;
    if (config.needRecoveryBottomBarStatus) {
      XcSdkApi.showBottomBar();
    }

    // ????????????ContainerPage?????????
    if (!(isListDetail || config.userInfo.isShowRefinedDetail)) {
      ContainerTimerManager.instance.reset();
    }

    DetailPageRefreshManager.instance.removeComeBackRefresh(comeBackRefresh);
    _gameNotifyStream?.close();
    _gameAnimatedNotifyStream?.close();
    super.dispose();
    print('DetailPage-dispose');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    //??????
    if (state == AppLifecycleState.resumed) {
      listenInit();
      this.startTimer(isReload: false);
      _topic = null;
      _giftTopic = null;
      _overallGiftTopic = null;
      _intoChatRoomTopic = null;
      _chatRoomLikeTopic = null;
      _anchorOfflineTopic = null;
      checkIfNeedSubscribeChatMessages();
      Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
    }
    //??????
    else if (state == AppLifecycleState.paused) {
      unsubscribeChatMessages();
      listenCancel();
      Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
    }
  }

  void chatDataReset() {
    _topic = null;
    _giftTopic = null;
    _overallGiftTopic = null;
    _intoChatRoomTopic = null;
    _chatRoomLikeTopic = null;
  }

  Future reload(DetailParams params,{bool showLoading = true,bool isCheckComplete}) async {
    final isComplete = isCheckComplete ?? false;
    if(!isComplete){
      final isComeBack = DetailPageRefreshManager.instance.isComeBackReload;
      // ?????????????????????,??????
      if(isComeBack){
        // ??????????????????????????????reload,??????????????????????????????????????????
        // ???????????????????????????????????????
        final isNeedRefresh = DetailPageRefreshManager.instance.isNeedReloadRefresh(widget.hashCode);
        if(isNeedRefresh){
          reload(params,isCheckComplete:true);
        }
      }else{
        // ?????????
        reload(params,isCheckComplete:true);
      }
      return;
    }

    // ???????????????,???????????????????????????
    if(_isListenerCancel){
      listenInit();
    }

    if(params.isFreeAnchor){
      initFreeAnchor(params);
      _isFreeReload = true;
      if(mounted)setState(() {});
      await Future.delayed(const Duration(milliseconds: 500));
    }
    else{
      detailSet.detailParams = params;
      config.userInfo.detailSet.detailParams = params;
      watchTotal = params.watchTotal;
      isFreeAnchor = false;
      isFreeAnchorListEntry = false;
      isFreeLiveGameAnchor = false;
      liveId = null;
      moreFunctionSlide.isFreeAnchor = false;

      _updateAnchorType(params.anchorId);
    }

    chatRoomSliderTop.value = false;
    bottomNavBarModel.hasSharedRecordBtn = false;
    DetailParams detailParams = params;
    gidm = params.gidm;
    if(isFreeAnchor){
      moreFunctionSlide?.removeListener();
      // ??????????????????????????????????????????
      ChatRoomBlocFactory.ins.clear();
    }
    if (params?.intoDetailPath == IntoDetailPath.betRecordSingle) {
//      config.userInfo.currentSaveHitOptionType = HitOptionType.single;
//      AiHitService.currentMode = HitMode.mix;
    } else if (params?.intoDetailPath == IntoDetailPath.betRecordCombo) {
//      config.userInfo.currentSaveHitOptionType = HitOptionType.combo;
//      AiHitService.currentMode = HitMode.combo;
    }
    // BUGE16807???????????????--?????????????????????????????????????????????????????????????????????????????????
    if (!isStrNullOrEmpty(detailParams?.gameType) &&
        (detailParams?.isDetailMoreLiveChange ?? false)) {
      isInited = false;
    }
    detailSet.showLoading = showLoading;

    unsubscribeChatMessages();
    InputChatRoomBarrageManager?.ins()?.clear();
//    serivce.saveOrUpdateCurrentMatchUserWatching(MatchCollectionInfoModel(
//      gameType: gameType,
//      gidm: params.gidm,
//    ));
//    if (mounted) {
//      setState(() {
    chatRoomController = null;
//      });
//    }
//    await sleep(100, () {
//      if (mounted) {
//        setState(() {

    num liveStatus = detailSet?.detailParams?.liveStatus;
    bool isShowChatRoomPage = isListDetail || (liveStatus != null && liveStatus == 1);
    swiperController = MatchDetailController.create(initPage: isShowChatRoomPage ? 1 : 0);
    chatRoomController = ChatroomController();
//        });
//      }
//    });
    params.fromPage = detailSet.detailParams.fromPage;
    playerController?.player?.pause();
    chatDataReset();
    //
//    Event.eventBus.fire(MatchCollectionSelectedOverlayNotication(mode: OperatorMode.hide));
    detailSet = DetailSet();
    config.userInfo.detailSet = detailSet;

    playerController?.player?.pause();
    _videoPlayerVM = CommonVideoPlayerViewModel.create();
    playerController.isVirtual = this.isVirtual;
    playerController.toolPanel.bottomBar.videoTypeChanged.addListener(onVideoTypeChanged);
    playerController.toolPanel.topBar.moreTap.addListener(onMoreTap);
    playerController.toolPanel.topBar.leagueGameTap.addListener(onSelectLeagueGameTap);
    playerController.toolPanel.topBar.pickupChanged.addListener(onPickupChanged);

    // ????????????????????????
    if(isFreeAnchor){
      freeAnchorDefaultSet();
    }

    gidm = params.gidm;
    detailSet.detailParams = params;
    headBgImg = getHeadBgImg();
    this.selectAnchorId = params?.anchorId ?? "";
    chatroomAnchorId = params?.anchorId ?? "";

    _isFreeReload = false;
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isStartRefreshData = false;
      startTimer(loadEndCallback: () {
        refreshHeadVideo();
      });
      AnchorShareService.ins.initData();
      AnchorGameService.ins.initData();
//      PopupShareService.ins.init(context);
    });
  }

  //??????ViewType?????????
  syncViewTypeChanged() {
    if (detailSet.selectViewType == 'default') {
      playerController.toolPanel.bottomBar.setVideoType(VideoType.Score);
    } else if (detailSet.selectViewType == 'animation') {
      playerController.toolPanel.bottomBar.setVideoType(VideoType.Animation);
    } else if (detailSet.selectViewType == 'video') {
      playerController.toolPanel.bottomBar.setVideoType(VideoType.Video);
    }
  }

  setHeightAndBg() {
    if (detailSet.selectViewType == 'default') {
      headBgImg = isBlackShowHead ? null : getHeadBgImg();
      headHeight = videoHeadHeight;
    } else if (detailSet.selectViewType == 'animation') {
      headBgImg = null;
      headHeight = animationHeadHeight;
    } else if (detailSet.selectViewType == 'video') {
      headBgImg = null;
      headHeight = videoHeadHeight;
    }
  }

  closeAllTimer() {
    timer?.cancel();
    _firstLoadTimeOutTimer?.cancel();
    _firstLoadTimeOut = false;
    detailSet.showLoading = false;
  }

  //???????????????????????????????????????????????????????????????
  Future initDataFirstLoad(
      {bool isTimerUpdateLoad = false, bool isRefresh = false}) async {
    try {
      if (SlideStatus.none != status) {
        String gameType = strings([
          detailSet.detailParams?.gameType,
          "FT"
        ]);
        String tgidm = string(detailSet.detailParams?.gidm, defaultVal: gidm);
        String groupId = "${config.userInfo.sportPlatformId}";
        var slide = SlideProtocol(gameType: gameType, gidm: tgidm, groupId: groupId);
        var slideRequest = await slide.request();
        if (slideRequest.isSuccess) {
          if (status == SlideStatus.pull_down) {
            gidm = string(slideRequest.preGidm, defaultVal: gidm);
          } else {
            gidm = string(slideRequest.nextGidm, defaultVal: gidm);
          }
          detailSet.detailParams.gidm = gidm;
        }
        status = SlideStatus.none;
      }

      if(isFreeAnchor){
        _firstLoadTimeOutTimer?.cancel();
        _firstLoadTimeOut = false;
        _loadRedPacketList();
        isMatchClose = false;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          jump2ChatRoom();
        });
        // ???????????????????????????
        num liveStatus = detailSet.detailParams?.liveStatus;
        bool isFreeAnchorStart = (liveStatus != null && liveStatus == 1);
        if(isFreeAnchorStart){
          String liveId = detailSet.detailParams?.liveId ?? '';
          var result = await LiveRoomInfoReqProtocol(liveId: liveId).request();
          if(result.isSuccess){
            String liveType = result?.liveRoomInfo?.liveType ?? '';
            detailSet.detailParams.freeLiveRoomInfo = result.liveRoomInfo;
            detailSet.detailParams.isFreeLiveGameAnchor = (liveType == config.freeAnchorGame);
            initFreeAnchor(detailSet.detailParams);
          }
        }
      }
    } catch (e) {
      print('??????----:${e?.toString()}');
    }
    isInited = true;
    //???????????????????????????????????????????????????
    detailSet.showLoading = false;
    if (!isTimerUpdateLoad) {
      showBottomNav = true;
    }
    isFirstLoad = false;
    if (mounted) {
      setState(() {});
    }
    isReload = false;
    config.userInfo.detailSet = detailSet;
  }

  //?????????????????????????????????????????????????????????
  Future initDataSecondStepLoad({bool isTimerUpdateLoad = false}) async {
    try {
      num liveStatus = detailSet?.detailParams?.liveStatus;
      if (liveStatus != null && liveStatus == 1) {
        await checkIfNeedSubscribeChatMessages();
      }
    } catch (e) {}
    // ?????????????????????
    Future.delayed(Duration(milliseconds: 350), () {
      if (activeBannerKey1 != null &&
          activeBannerKey1?.currentState != null &&
          !isStartActiveBannerTimer) {
        isStartActiveBannerTimer = true;
        activeBannerKey1?.currentState?.startTimer();
      }
    });
    dPageModel?.dispose();
    allLoadFinished = true;
    detailSet?.detailParams?.allLoadFinished = allLoadFinished;
    if (mounted) {
      setState(() {});
    }
  }

  ///?????????????????????????????????
  void startFirstLoadTimeOutTimer() {
    _firstLoadTimeOutTimer?.cancel();
    _firstLoadTimeOutTimer =
        Timer(Duration(seconds: _firstLoadTimeOutSecond), () {
      _firstLoadCancelToken?.cancel("first load time out");
      if (mounted) {
        setState(() {
          _firstLoadTimeOut = true;
        });
      }
    });
  }

  bool isStartRefreshData = false; // ????????????????????????
  Future startTimer(
      {bool isReload = true,
      bool isRefresh = false,
      bool isInit = false,
      VoidCallback loadEndCallback}) async {
    chatRoomSliderTop.value = false;
    if (isRefresh) {
      await initDataFirstLoad(isRefresh: isRefresh);
    } else {
      if (timer != null) {
        timer.cancel();
      }
      this.isReload = isReload;
      // ???????????????????????????????????????
      await sleep(100);
      allLoadFinished = false;

      ///?????????????????????????????????
      giftResPreloadDelayTimer?.cancel();
      giftResPreloadDelayTimer = Timer(Duration(seconds: 10), () {
        giftResPreloadDelayTimer?.cancel();
        if (isNotEmpty(chatroomAnchorId)) {
          GiftResPreloadServer.ins.start(task: GiftResPreloadTask());
        }
      });

      startFirstLoadTimeOutTimer();

      //??????????????????
      await initDataFirstLoad();
      await initDataSecondStepLoad();

      int earlyMatchUpdateTime = config.fiexd.earlyMatchUpdateTime;
      int showTypeFtLessImportantUpdateTime = config.fiexd.showTypeFtLessImportantUpdateTime;
      int milliseconds;
      if(isFreeAnchor){
        milliseconds = config.fiexd.freeAnchorUpdateQueryTime * 1000;
      } else if (config.merchantAppConfig.isOpenAutoOdds) {
        milliseconds = config.fiexd.autoOpenOddsUpdateTime * 1000;
      } else {
        milliseconds = earlyMatchUpdateTime * 1000;
      }
      int totalTime = 0;
      int count = 0;
      if (config.userInfo.isWatchLiveTimeShort) {
        watchLiveTimer?.cancel();
        watchLiveTimer = Timer(Duration(seconds: config.fiexd.runningMatchUpdateTime), () {
          config.userInfo.isWatchLiveTimeShort = false;
          watchLiveTimer?.cancel();
        });
      }
      timer?.cancel();
      timer = new Timer.periodic(new Duration(milliseconds: milliseconds),
          (t) async {
        if (!mounted) {
          t.cancel();
        }
        totalTime += milliseconds;
        await initDataFirstLoad(isTimerUpdateLoad: true);
        if ((totalTime / 1000) ~/ config.fiexd.runningLessImportantUpdateTime !=
                count) {
          count =
              (totalTime / 1000) ~/ config.fiexd.runningLessImportantUpdateTime;
          await initDataSecondStepLoad(isTimerUpdateLoad: true);
        } else if ((totalTime / 1000) ~/ showTypeFtLessImportantUpdateTime != count) {
          count = (totalTime / 1000) ~/ showTypeFtLessImportantUpdateTime;
          await initDataSecondStepLoad(isTimerUpdateLoad: true);
        }
      });
      if (loadEndCallback != null) {
        loadEndCallback();
      }
    }
  }

  String getAnchorId() {
    String anchorId = !isStrNullOrEmpty(selectAnchorId) ? selectAnchorId : chatroomAnchorId;
    if(isStrNullOrEmpty(anchorId)){
      anchorId = detailSet.detailParams?.anchorId;
    }
    return anchorId;
  }

  @override
  void updateState([VoidCallback fn]) {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void onDataUpdatedAfter() {}

  void _updateAnchorType(String anchorId) {
    final aType = config.anchorType;
    if(isFreeLiveGameAnchor) config.anchorType = AnchorType.game;
    else if(isFreeAnchor) config.anchorType = AnchorType.free;
    else if(isEmpty(anchorId)) config.anchorType = AnchorType.match;
    else config.anchorType = AnchorType.none;

    if(aType != config.anchorType && config.anchorType != AnchorType.none && aType != AnchorType.none) {
      Event.eventBus.fire(AnchorTypeChangedEvent());
      print('00-_updateAnchorType=${config.anchorType}');
    }
    print('11-_updateAnchorType=${config.anchorType}');
  }
}

class MyScrollController extends ScrollController {
  MyScrollController({double initialScrollOffset = 0})
      : super(initialScrollOffset: initialScrollOffset);

  void jumpToBottom() {
    this.positions.last.jumpTo(this.positions.last.maxScrollExtent);
  }
}

enum SlideStatus {
  none,
  pull_down,
  pull_up,
}
