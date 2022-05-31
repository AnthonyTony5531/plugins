import 'dart:async';

import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/pages/detail/active_banner/active_banner.dart';
import 'package:fast_ai/pages/detail/detail_container/match_detail_container.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_anchor_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/video_player_cache.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_player_view.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_value.dart';
//import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/widgets/xc_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../live_player_config.dart';
import 'common_video_player_view_style.dart';
import 'controller/bottom_bar_controller.dart';


///生命周期onAttach->onInit->onDetach->onDispose. refresh不属于生命周期，外面掉用，外部没调用可以不实现。
//其中onAttach, onDetach属于视图的生命周期期间同步方法
class CommonVideoPlayerViewModel extends StatefulViewModel<CommonVideoPlayerViewStyle>{
  String url;
  AiVideoType type;
  CommonVideoPlayerController controller = CommonVideoPlayerController();
  /// 播放器配置、自定义View Builder
  AiFijkPlayerBuilder playerConfig;
  /// 控制面板/比赛头部(比如展示：比分/)
  AiVideoPlayerStateWidgetBuild panelBuilder;

  /// ------------ 迁移 LivePlayer 属性 ------------
  bool isVlogLive;
  bool isFreeAnchor;
  num liveStatus;
  VoidCallback onShowLeagueGame;
  VoidCallback onMoreVideo;
  String showType;
  HorizontalDragCallBack horizontalDragCallBack;
  EdgeInsets padding;
  double freeLiveMargin = 0.0;
  Widget defaultHeader;
  bool canRotate = true; // isExpanded
  GlobalKey<ActiveBannerState> activeBannerKey;
  MatchesDetailModel matchesDetailModel;
  ExtendModel extendModel;
  NewHeadAnchorModel newHeadAnchorModel;
  DetailSet detailSet;
  VoidCallback onShowMatchInfo;
  VoidCallback onEntryGameDetail; // 小视频回调进比赛详情
  bool isListDetail;
  MatchDetailController swiperController;
  Orientation orientation;
  bool isFreeAnchorListEntry;  // 自由播列表进入
  AnchorSubCellModel freeAnchorModel;
  VoidCallback onCloseVideo;
  /// 自由播主播Id
  String freeAnchorId;
  String freeLiveId;
  bool isFreeLiveGameAnchor = false;
  String roomNo;

  /// ------------ 迁移 _LivePlayerState 属性 ------------
  /// GlobalKey<BarrageState> _barrageKey = new GlobalKey(); 在CommonVideoPlayerView中
  StreamSubscription<WifiEvent> wifiEventStreamSubscription;
  StreamSubscription<DetailOrientationEvent> detailOrientationEvent;
  StreamSubscription<LiveChangeEvent> liveChangeEvent;
  bool isHaveVideo;
  bool isHiddenMore = false;

  // 是否中场休息
  bool _isHaltTime = false;
  Timer moreLiveTimer;
  StreamController<double> moreLiveController;
  double moreLivePosition = 0.0;
  final moreLiveOffset = -30.0;

  Orientation _oldOrientation = Orientation.portrait;

  CommonVideoPlayerViewModel();

  BottomBarController get bottomBarController => controller.toolPanel.bottomBar;
  String get selectAnchorId => (isFreeAnchor ?? false) ? (detailSet?.detailParams?.anchorId ?? freeAnchorId) : controller.toolPanel.anchorSelectorFull.model?.currentAnchor?.vid ?? "";
  String get anchorId => detailSet?.detailParams?.anchorId ?? freeAnchorId ?? (isNotEmpty(extendModel?.data?.anchorId) ? extendModel.data.anchorId : '');
  String get liveId => detailSet?.detailParams?.liveId ?? freeLiveId;

  //参数传给view时候，在这初始化统一入口初始化，自己要啥扩展参数。注意。Page和Dialog.page参数来源于View的构造函数，
  CommonVideoPlayerViewModel.create({
    this.isVlogLive = false,
    this.url,
    this.type,
    this.isFreeAnchor = false,
    this.onShowLeagueGame,
    this.onMoreVideo,
    this.showType = '',
    this.horizontalDragCallBack,
    this.padding = EdgeInsets.zero,
    this.freeLiveMargin = 0.0,
    this.defaultHeader,
    this.canRotate,
    this.activeBannerKey,
    this.matchesDetailModel,
    this.extendModel,
    this.newHeadAnchorModel,
    this.detailSet,
    this.onShowMatchInfo,
    this.onEntryGameDetail,
    this.isListDetail = false,
    this.swiperController,
    this.orientation,
    this.isFreeAnchorListEntry = false,
    this.freeAnchorModel,
    this.onCloseVideo,
    this.freeAnchorId,
    this.freeLiveId,
    this.isFreeLiveGameAnchor = false,
    this.roomNo,
    //this.controller,
    this.playerConfig,
    this.panelBuilder,
  }) {
    isHaveVideo = showType == 'RB';
    controller.toolPanel.topBar.model.isExpanded = canRotate;
    if(type == AiVideoType.video) {
      controller.toolPanel.bottomBar.model.videoType = VideoType.Video;
    }
    configUrlAndType();
  }

  //更新统一走这个方法
  void update({
    String url,
    AiVideoType type,

    bool isVlogLive = false,
    bool isFreeAnchor = false,
    num liveStatus,
    VoidCallback onShowLeagueGame,
    VoidCallback onMoreVideo,
    String showType = '',
    HorizontalDragCallBack horizontalDragCallBack,
    EdgeInsets padding = EdgeInsets.zero,
    double freeLiveMargin = 0.0,
    Widget defaultHeader,
    bool canRotate,
    GlobalKey<ActiveBannerState> activeBannerKey,
    MatchesDetailModel matchesDetailModel,
    ExtendModel extendModel,
    NewHeadAnchorModel newHeadAnchorModel,
    DetailSet detailSet,
    VoidCallback onShowMatchInfo,
    VoidCallback onEntryGameDetail,
    bool isListDetail = false,
    MatchDetailController swiperController,
    Orientation orientation,
    bool isFreeAnchorListEntry = false,
    AnchorSubCellModel freeAnchorModel,
    VoidCallback onCloseVideo,
    String freeAnchorId,
    num freeLiveId,
    bool isFreeLiveGameAnchor = false,
    String roomNo,
    CommonVideoPlayerController controller,
    AiFijkPlayerBuilder playerConfig,
    AiVideoPlayerStateWidgetBuild headerBuilder}) {
    this.url = url;
    this.type = type;

    this.isVlogLive = isVlogLive;
    this.isFreeAnchor = isFreeAnchor;
    this.liveStatus = liveStatus;
    this.onShowLeagueGame = onShowLeagueGame;
    this.onMoreVideo = onMoreVideo;
    this.showType = showType;
    this.horizontalDragCallBack = horizontalDragCallBack;
    this.padding = padding;
    this.freeLiveMargin = freeLiveMargin;
    this.defaultHeader = defaultHeader;
    this.canRotate = canRotate;
    this.activeBannerKey = activeBannerKey;
    this.matchesDetailModel = matchesDetailModel;
    this.extendModel = extendModel;
    this.newHeadAnchorModel = newHeadAnchorModel;
    this.detailSet = detailSet;
    this.onShowMatchInfo = onShowMatchInfo;
    this.onEntryGameDetail = onEntryGameDetail;
    this.isListDetail = isListDetail;
    this.swiperController = swiperController;
    this.orientation = orientation;
    this.isFreeAnchorListEntry = isFreeAnchorListEntry;
    this.freeAnchorModel = freeAnchorModel;
    this.onCloseVideo = onCloseVideo;
    this.roomNo = roomNo;
    this.isFreeLiveGameAnchor = isFreeLiveGameAnchor;

    if(controller != null) this.controller = controller;
    this.playerConfig = playerConfig;
    this.defaultHeader = defaultHeader;

    isHaveVideo = showType == 'RB';
    controller.toolPanel.topBar.model.isExpanded = canRotate;
    configUrlAndType();
    notifyStateChanged();
  }

 //initState时候同步调用，同步方法。这里不能做io, cache读写.查询等耗时操作。
  @override
  void onAttach() {

  }

  // 播放器状态/事件回调
  void _playerStatusChanged(AiVideoState state) {
    if (state == AiVideoState.started) {
      _startMoreLiveTimer();
    } else if (state == AiVideoState.paused) {
      showMoreLiveView(isNeedClose: false);
    }

    switch(state) {
      case AiVideoState.idle : {
        break;
      }
      case AiVideoState.initialized : {
        break;
      }
      case AiVideoState.asyncPreparing : {
        break;
      }
      case AiVideoState.prepared : {
        break;
      }
      case AiVideoState.started : {
        break;
      }
      case AiVideoState.paused : {
        break;
      }
      case AiVideoState.completed : {
        break;
      }
      case AiVideoState.started : {
        break;
      }
      case AiVideoState.error : {
        break;
      }
      case AiVideoState.end : {
        break;
      }
      case AiVideoState.stopped:
        break;
    }
  }


  //返回true会调用notifyStateChanged, model变化时候也会重新执行。
  @override
  Future<bool> onInit() async {
    if(controller == null) controller = CommonVideoPlayerController();
    //controller.toolPanel.bottomBar.model.videoType = VideoType.Video;
    initScreen(controller.toolPanel.bottomBar.model.videoType);
    _startMoreLiveTimer();
    subscribe();
    return false;
  }

  //这是给外面掉用的
  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) {
    return null;
  }

  //对应widget didUpdateWidget执行后，这个方法会执行，并且oldeViewModel会在这之前执行onDispose。通常在这判断model有没有变动，获取之前的状态做处理。
  @override
  void didModelUpdate(IViewModel o, IViewModel n){
    CommonVideoPlayerViewModel  oldeViewModel = o as CommonVideoPlayerViewModel;
    CommonVideoPlayerViewModel  newViewModel = n as CommonVideoPlayerViewModel;

    String runningTime = matchesDetailModel?.data?.getGame?.gameInfo?.runningTime;
    _isHaltTime = runningTime == config.langMap['baseLang']['models']['RBFTTime']['halfTime'];
    if (_isHaltTime) {
      showMoreLiveView(isNeedClose: false);
    } else if (controller?.player?.isPlaying ?? false) {
      if(!(moreLiveTimer?.isActive ?? false) && moreLivePosition == 0){
        _startMoreLiveTimer();
      }
    }
  }

  //view 摧毁时候会调用，或者model变更被移除的时候也会被执行
  @override
  void onDispose() {
    print('dispose-CommonVideoPlayerViewModel');
    unsubscribe();
    initScreen(VideoType.Score);
    _cancelMoreLiveTimer();
    controller?.dispose();
  }

  @override
  List<CommonVideoPlayerViewStyle> get styleList => [ CommonVideoPlayerViewStyle()];

  void unsubscribe() {
    controller?.toolPanel?.bottomBar?.videoTypeChanged?.removeListener(_videoTypeChanged);
    controller?.toolPanel?.anchorSelectorFull?.anchorVideoChanged?.removeListener(_updateVideoPlayerView);
    controller?.toolPanel?.anchorSelectorRight?.anchorVideoChanged?.removeListener(_updateVideoPlayerView);
    controller?.cfg?.fluxModeChanged?.removeListener(_onFluxModeChanged);
    _playerStatusListener?.cancel();
    moreLiveController?.close();

    wifiEventStreamSubscription?.cancel();
    detailOrientationEvent?.cancel();
    liveChangeEvent?.cancel();
  }

  StreamSubscription<AiVideoState> _playerStatusListener;
  void subscribe() {
    controller.toolPanel.bottomBar.videoTypeChanged.addListener(_videoTypeChanged);
    controller.toolPanel.anchorSelectorFull.anchorVideoChanged.addListener(_updateVideoPlayerView);
    controller.toolPanel.anchorSelectorRight.anchorVideoChanged.addListener(_updateVideoPlayerView);
    controller.cfg.fluxModeChanged.addListener(_onFluxModeChanged);
    _playerStatusListener = controller.player.onVideoState.listen(_playerStatusChanged);
    moreLiveController = StreamController.broadcast();

    wifiEventStreamSubscription = Event.eventBus.on<WifiEvent>().listen((event) {
      controller.cfg.fluxMode = event.mode;
    });
    detailOrientationEvent = Event.eventBus.on<DetailOrientationEvent>().listen((event) {
      Orientation orientation = event.orientation;
      if (_oldOrientation != orientation) {
        _oldOrientation = orientation;
        isHiddenMore = orientation == Orientation.landscape;
        _updateVideoPlayerView();
      }
    });
    liveChangeEvent = Event.eventBus.on<LiveChangeEvent>().listen((event) {
      if(event.isShowLivePanel){
        num betTotal = config?.userInfo?.videoBettingTotal;
        num currentBetTotal = config?.userInfo?.videoCurrAllBetGold;
        num watchLiveTime = config?.userInfo?.watchLiveTime;
        bool isUnallowWatchLive = (betTotal <= 0 && currentBetTotal <= 0 && watchLiveTime >= 0);
        if (isUnallowWatchLive) return;
      }

      if(isHiddenMore != event.isShowLivePanel){
        isHiddenMore = event.isShowLivePanel;
        _updateVideoPlayerView();
      }
    });
  }

  void _onFluxModeChanged(AiFluxMode mode) {
    _updateVideoPlayerView();
  }

  void _videoTypeChanged(VideoType videoType) {
    if (videoType == VideoType.Video) {
      showMoreLiveView();
    }
    initScreen(videoType);
    _updateVideoPlayerView();
  }

  void _updateVideoPlayerView() {
    notifyStateChanged();
  }

  // 显示更多视频View
  bool showMoreLiveView({bool isNeedClose = true}) {
    if (moreLivePosition == moreLiveOffset) {
      moreLivePosition = 0.0;
      moreLiveController.add(0.0);
      if (isNeedClose) {
        _startMoreLiveTimer();
      }
      return true;
    }
    return false;
  }

  void _cancelMoreLiveTimer() {
    moreLiveTimer?.cancel();
    moreLiveTimer = null;
  }

  // 启动隐藏更多视频定时器
  void _startMoreLiveTimer() {
    String runningTime = matchesDetailModel?.data?.getGame?.gameInfo?.runningTime;
    _isHaltTime = runningTime == config.langMap['baseLang']['models']['RBFTTime']['halfTime'];

    _cancelMoreLiveTimer();
    if (_isHaltTime) return;
    print('启动了定时器 _isHaltTime = $isHiddenMore  $isVlogLive $isListDetail');
    if (isHiddenMore || isVlogLive || isListDetail) return;
    moreLiveTimer = Timer(Duration(seconds: 5), () {
      print('启动了定时器 _moreLiveTimer');
      if (moreLivePosition == 0) {
        moreLivePosition = moreLiveOffset;
        moreLiveController.add(moreLivePosition);
      }
    });
  }

  //更新流量播放模式
  void updateFluxMode() {
    if (VideoPlayerCache.isAutoPlayingWithMobile()) {
      controller.cfg.fluxMode = AiFluxMode.ArrowMobile;
    }
  }

  void changeScreen(bool canRotate) {
    if(this.canRotate == canRotate) return;

    this.canRotate = canRotate;
    if (this.canRotate) {
      Future.delayed(Duration(milliseconds: 10), () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      });
    } else {
      Future.delayed(Duration(milliseconds: 10), () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      });
    }
  }

  void initScreen(VideoType videoType) {
    if (videoType == VideoType.Score || videoType == VideoType.Animation) {
      config.detailPageCurrentScreenSupportLandscape = false;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      config.detailPageCurrentScreenSupportLandscape = true;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
  }

  // 设置视频URL和视频类型type
  void configUrlAndType({String flv, String rtmp, String m3u8, String web}) {
    var videoType = bottomBarController.model.videoType;
    if(videoType == VideoType.Score) {
      type = AiVideoType.unknown;
    }
    else if (videoType == VideoType.Animation) {
      type = AiVideoType.web;
      if (controller?.hasAnimateLive ?? false) {
        url = controller.animateLiveUrl;
      } else {
        url = "";
      }
    } else if (videoType == VideoType.Video) {
      type = AiVideoType.video;
      if(isVlogLive) return; // 小视频用传进来的URL

      // 自由播放
      bool isFree = (isFreeAnchor ?? false) && detailSet?.detailParams?.liveParams != null;
      var flvUrl = isFree ? detailSet.detailParams.liveParams['flv'] ?? '' : flv ?? controller.toolPanel.anchorSelectorFull.model.currentAnchor?.flv ?? "";
      var rtmpUrl = isFree ? detailSet.detailParams.liveParams['rtmp'] ?? '' : rtmp ?? controller.toolPanel.anchorSelectorFull.model.currentAnchor?.rtmp ?? "";
      var m3u8Url = isFree ? detailSet.detailParams.liveParams['m3u8'] ?? '' : m3u8 ?? controller.toolPanel.anchorSelectorFull.model.currentAnchor?.m3u8 ?? "";
      var webUrl = web ?? controller.toolPanel.anchorSelectorFull.model.currentAnchor?.weburl ?? "";
      if (isNotEmpty(flvUrl)) {
        url = flvUrl;
      } else if (isNotEmpty(rtmpUrl)) {
        url = rtmpUrl;
      } else if (isNotEmpty(m3u8Url)) {
        url = m3u8Url;
      } else if (isNotEmpty(web)) {
        url = webUrl;
      }
    }
  }
}