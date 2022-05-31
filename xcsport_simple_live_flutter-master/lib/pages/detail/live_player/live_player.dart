/*
import 'dart:async';
import 'dart:math';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/anchor/anchor_grade.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_anchor_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_chat/live_chat_message.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_flux_tips.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_loading.dart';
import 'package:fast_ai/services/sys_service.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/barrage/barrage.dart';
import 'package:fast_ai/widgets/common_match/match_cell/anchor_match_cell/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/widgets/float_widget.dart';
import 'package:fast_ai/widgets/xc_slide.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'live_player_controller.dart';
import 'views/live_bottombar/live_bottombar_model.dart';
import 'views/live_toolpanel/live_toolpanel.dart';
import 'views/video_player/video_player.dart';
import 'package:fast_ai/pages/detail/detail_container/match_detail_container.dart';

class LivePlayer extends StatefulWidget {
  //点击显示联赛
  final VoidCallback onShowLeagueGame;
  final VoidCallback onMoreVideo;
  final LivePlayerController controller;
  final EdgeInsets padding;
  final Widget defaultHeader;
  final bool isExpanded;

  // hank小视频直播共用
  final bool isVlogLive;
  final String weburl;
  final String m3u8;
  final String flv;
  final String rtmp;
  final String showType;
  final HorizontalDragCallBack horizontalDragCallBack;
  final activeBannerKey;
  final MatchesDetailModel matchesDetailModel;
  final ExtendModel extendModel;
  final NewHeadAnchorModel newHeadAnchorModel;
  final LivePlayerController playerController;
  final DetailSet detailSet;
  final VoidCallback onShowMatchInfo;
  final VoidCallback onEntryGameDetail; // 小视频回调进比赛详情
  final bool isListDetail;
  final MatchDetailController swiperController;
  final Orientation orientation;
//  final bool isFreeAnchor;
  final bool isFreeAnchorListEntry;  // 自由播列表进入
  final bool isFreeLiveGameAnchor; // 游戏自由播正在播
  final AnchorSubCellModel freeAnchorModel;
  final VoidCallback onCloseVideo;
  final String anchorId;
  final String liveId;
  final String roomNo;
  LivePlayer({
    Key key,
    this.isVlogLive = false,
    this.weburl,
    this.m3u8,
    this.flv,
    this.rtmp,
//    this.isFreeAnchor = false,
    this.onShowLeagueGame,
    this.controller,
    this.onMoreVideo,
    this.showType = '',
    this.horizontalDragCallBack,
    @required this.padding,
    @required this.defaultHeader,
    @required this.isExpanded,
    this.activeBannerKey,
    this.matchesDetailModel,
    this.extendModel,
    this.newHeadAnchorModel,
    this.playerController,
    this.detailSet,
    this.onShowMatchInfo,
    this.onEntryGameDetail,
    this.isListDetail = false,
    this.swiperController,
    this.orientation,
    this.isFreeAnchorListEntry = false,
    this.freeAnchorModel,
    this.onCloseVideo,
    this.anchorId,
    this.liveId,
    this.roomNo,
    this.isFreeLiveGameAnchor = false,
  }) : super(key: key);

  @override
  _LivePlayerState createState() => _LivePlayerState();
}

class _LivePlayerState extends State<LivePlayer> {
  GlobalKey<BarrageState> _barrageKey = new GlobalKey();
  final LivePlayerController defaultController = LivePlayerController();

  LivePlayerController get controller {
    return widget.controller ?? defaultController;
  }

  StreamSubscription<WifiEvent> wifiEventStreamSubscription;
  StreamSubscription<DetailOrientationEvent> detailOrientationEvent;
  StreamSubscription<LiveChangeEvent> liveChangeEvent;
  bool isHaveVideo;
  bool isHiddenMore = false;
  String freeAnchorM3u8;
  String freeAnchorFlv;
  String freeAnchorRtmp;

  // 是否中场休息
  bool _isHaltTime = false;
  Timer _moreLiveTimer;
  StreamController<double> _moreLiveController;
  double _moreLivePosition = 0.0;
  final _moreLiveOffset = -30.0;
  bool get isFreeAnchor => widget.detailSet?.detailParams?.isFreeAnchor ?? false;

  @override
  void initState() {
    bool openLog = gReleaseShowLog && kReleaseMode || kDebugMode;
    IjkConfig.isLog = openLog;
    IjkConfig.level = openLog ? LogLevel.verbose : LogLevel.error;
    isHaveVideo = widget?.showType == 'RB';
    //controller.toolPanel.bottombar.currentModel.videoType = VideoType.Video;
    initScreen(controller.toolPanel.bottombar.currentModel.videoType);
    controller.toolPanel.bottombar.videoTypeChanged.addListener(videoTypeChanged);
    controller.toolPanel.anchorSelectorFull.anchorVideoChanged.addListener(onAnchorVideoChanged);
    controller.toolPanel.anchorSelectorRight.anchorVideoChanged.addListener(onAnchorVideoChanged);
    controller.cfg.fluxModeChanged.addListener(onFluxModeChanged);

    widget.playerController?.videoPlayer?.playStateChanged?.addListener(videoPlayStateChanged);

    _moreLiveController = StreamController.broadcast();

    String runningTime = widget.matchesDetailModel?.data?.getGame?.gameInfo?.runningTime;
    _isHaltTime = runningTime == config.langMap['baseLang']['models']['RBFTTime']['halfTime'];
    _startMoreLiveTimer();
    if(isFreeAnchor){
      if(widget.isFreeAnchorListEntry){
        freeAnchorM3u8 = widget?.m3u8 ?? '';
        freeAnchorFlv = widget?.flv ?? '';
        freeAnchorRtmp = widget?.rtmp ?? '';
      }
      else{
        freeAnchorM3u8 = widget?.detailSet?.detailParams?.liveParams['m3u8'] ?? '';
        freeAnchorFlv = widget?.detailSet?.detailParams?.liveParams['flv'] ?? '';
        freeAnchorRtmp = widget?.detailSet?.detailParams?.liveParams['rtmp'] ?? '';
      }
    }
    super.initState();
    subscribe();
  }


  Orientation _oldOrientation = Orientation.portrait;

  void subscribe() {
    wifiEventStreamSubscription = Event.eventBus.on<WifiEvent>().listen((event) {
      controller.cfg.fluxMode = event.mode;
    });
    detailOrientationEvent = Event.eventBus.on<DetailOrientationEvent>().listen((event) {
      Orientation orientation = event.orientation;
      if (_oldOrientation != orientation) {
        _oldOrientation = orientation;
        isHiddenMore = orientation == Orientation.landscape;
        if (mounted) setState(() {});
      }
    });
    liveChangeEvent = Event.eventBus.on<LiveChangeEvent>().listen((event) {

      if(event.isShowLivePanel){
//        num betTotal = config?.userInfo?.roomFirstBettingTotal;
//        num currentBetTotal = config?.userInfo?.currLaunchAllBetGold;
        num betTotal = config?.userInfo?.videoBettingTotal;
        num currentBetTotal = config?.userInfo?.videoCurrAllBetGold;
        num watchLiveTime = config?.userInfo?.watchLiveTime;
        bool isUnallowWatchLive = (betTotal <= 0 && currentBetTotal <= 0 && watchLiveTime >= 0);

        if (isUnallowWatchLive) return;
      }

      if(isHiddenMore != event.isShowLivePanel){
        isHiddenMore = event.isShowLivePanel;
        if (mounted) setState(() {});
      }
    });
  }

  void unsubscribe() {
    wifiEventStreamSubscription?.cancel();
    detailOrientationEvent?.cancel();
    liveChangeEvent?.cancel();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    //前台
    if (state == AppLifecycleState.resumed) {
      subscribe();
    }
    //后台
    else if (state == AppLifecycleState.paused) {
      unsubscribe();
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    controller.toolPanel.bottombar.videoTypeChanged.removeListener(videoTypeChanged);
    controller.toolPanel.anchorSelectorFull.anchorVideoChanged.removeListener(onAnchorVideoChanged);
    controller.toolPanel.anchorSelectorRight.anchorVideoChanged.removeListener(onAnchorVideoChanged);
    controller.cfg.fluxModeChanged.removeListener(onFluxModeChanged);

    // 更多直播
    widget.playerController?.videoPlayer?.playStateChanged?.removeListener(videoPlayStateChanged);
    _cancelMoreLiveTimer();
    _moreLiveController.close();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant LivePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    String runningTime = widget.matchesDetailModel?.data?.getGame?.gameInfo?.runningTime;
    _isHaltTime = runningTime == config.langMap['baseLang']['models']['RBFTTime']['halfTime'];
    if (_isHaltTime) {
      _showMoreLiveView(isNeedClose: false);
    } else if (widget.playerController?.videoPlayer?.state == AiWebVideoPlayerState.Playing) {
      if(!(_moreLiveTimer?.isActive ?? false) && _moreLivePosition == 0){
        _startMoreLiveTimer();
      }
    }
  }

  onFluxModeChanged(AiFluxMode mode) {
    uploadState();
  }

  videoTypeChanged(VideoType videoType) {
    if (videoType == VideoType.Video) {
      _showMoreLiveView();
    }
    initScreen(videoType);
    uploadState();
  }

  onAnchorVideoChanged() {
    uploadState();
  }

  void uploadState() {
    if (mounted) setState(() {});
  }

  initScreen(VideoType videoType) {
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

  bool _isExpanded = true;

  changeScreen(bool isExpanded) {
    if (_isExpanded == isExpanded) return;
    _isExpanded = isExpanded;

    if (_isExpanded) {
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

  @override
  Widget build(BuildContext context) {
    widget.controller.toolPanel.topbar.currentModel.isExpanded = widget.isExpanded;
    changeScreen(widget.isExpanded);

    // _isExpanded = false;
    // changeScreen(true);
    print('widget.matchesDetailModel----：${widget?.matchesDetailModel?.data?.gidm}');

    return Stack(
      children: <Widget>[
        Offstage(
          offstage: !widget.isExpanded,
          child: buildBody(),
        ),
        Offstage(
          offstage: widget.isExpanded,
          child: widget.defaultHeader,
        ),
      ],
    );
  }

  //更新流量播放模式
  void updateFluxMode() {
    if (LiveFluxTipsCache.isAutoPlayingWithMobile()) {
      controller.cfg.fluxMode = AiFluxMode.ArrowMobile;
    }
  }

  String url = "";

  static bool hasShowTips = false;

  Widget buildBody() {

    updateFluxMode();

    var width = 0.0;
    var height = 0.0;
    var padding = widget.padding;

    if (controller.toolPanel.bottombar.currentModel.screenDirection == ScreenDirection.TopDown) {
      padding = padding.copyWith(bottom: 0);
      width = MediaQuery.of(context).size.width - padding.left - padding.right - (widget.isFreeAnchorListEntry ? 16.0 : 0.0);
      height = width * 0.562512;
    } else {
      width = MediaQuery.of(context).size.width - padding.left - padding.right;
      height = MediaQuery.of(context).size.height - padding.top - padding.bottom;
    }
    var size = Size(width, height);

    var videoType = controller.toolPanel.bottombar.currentModel.videoType;
    // videoType = VideoType.Video;
    num liveStatus = widget.detailSet.detailParams?.liveStatus;
    if (videoType == VideoType.Score || (isFreeAnchor && liveStatus != null && liveStatus == 0)) {
      return widget.defaultHeader;
    } else {
      var url = "";
      String selectAnchorId = '';
      String anchorId = '';
      AiVideoFormat videoFormat = AiVideoFormat.unknow;
      if (videoType == VideoType.Animation) {
        if (controller?.hasAnimateLive ?? false) {
          url = controller.animateLiveUrl;
        } else {
          url = "";
        }
        videoFormat = AiVideoFormat.weburl;
      } else if (videoType == VideoType.Video) {
        var weburl = controller.toolPanel.anchorSelectorFull.currentModel.currentAnchor?.weburl ?? "";
        var m3u8 = controller.toolPanel.anchorSelectorFull.currentModel.currentAnchor?.m3u8 ?? "";
        var flv = controller.toolPanel.anchorSelectorFull.currentModel.currentAnchor?.flv ?? "";
        var rtmp = controller.toolPanel.anchorSelectorFull.currentModel.currentAnchor?.rtmp ?? "";
        selectAnchorId = controller.toolPanel.anchorSelectorFull.currentModel.currentAnchor?.vid ?? "";
        anchorId = widget?.extendModel?.data?.anchorId ?? '';
        if(isFreeAnchor){
          anchorId = widget?.detailSet?.detailParams?.anchorId ?? widget.anchorId;
          selectAnchorId = anchorId;
          m3u8 = widget?.detailSet?.detailParams?.liveParams['m3u8'] ?? '';
          flv = widget?.detailSet?.detailParams?.liveParams['flv'] ?? '';
          rtmp = widget?.detailSet?.detailParams?.liveParams['rtmp'] ?? '';
          weburl = widget?.detailSet?.detailParams?.liveParams['url'] ?? '';
        }
        if (widget.isVlogLive) {
          weburl = widget.weburl;
          m3u8 = widget.m3u8;
          flv = widget.flv;
        }
        if (!isNullOrEmpty(flv)) {
          videoFormat = AiVideoFormat.flv;
          url = flv;
        } else if (!isNullOrEmpty(rtmp)) {
          videoFormat = AiVideoFormat.rtmp;
          url = rtmp;
        } else if (!isNullOrEmpty(m3u8)) {
          videoFormat = AiVideoFormat.m3u8;
          url = m3u8;
        } else if (!isNullOrEmpty(weburl)) {
          videoFormat = AiVideoFormat.loadWeburl;
          url = weburl;
        }
      }

      this.url = string(url, defaultVal: this.url);
      _barrageKey.currentState?.resize(
          width: width,
          height: height,
          paddingTop: max(AiMeasure.topOffset(context).toInt(), 50),
          maxChannel: controller.toolPanel.bottombar.currentModel.screenDirection == ScreenDirection.TopDown ? 2 : 3);

      setFloatVideoInfo(fvUrl: url, fvFormat: videoFormat, fvSize: size, isFreeAnchor: isFreeAnchor);

      var videoPlayer = FloatWidget(
        child: AiWebVideoPlayer(controller: controller.videoPlayer, url: this.url, videoFormat: videoFormat, size: size),
        videoType: videoType,
      );
      var hasVideLive = controller.hasVideLive;

//      bool flux_tips_enable = false   ;
//      if(ModalRoute.of(context).settings.arguments is Map){
//        flux_tips_enable = (ModalRoute.of(context).settings.arguments as Map)['flux_tips_enable']??true;
//      }
      //double screenWidth = MediaQuery.of(context).size.width;
      var body = Container(
        padding: padding,
        width: width + padding.left + padding.right,
        height: height + padding.top + padding.bottom,
        color: Color(0xFF071C29),
        //color: Colors.white,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            !(controller.needShowFluxWidget) ? videoPlayer : Container(),
            LiveLoading(
              player: controller.videoPlayer,
            ),
            Container(
              width: width,
              height: height,
              child: Barrage(
                key: _barrageKey,
                width: width + padding.left + padding.right,
                height: height + padding.top + padding.bottom,
                maxChannel: 2,
                paddingTop: AiMeasure.topOffset(context).toInt(),
              ),
            ),
            LiveFluxTipsBackground(
              player: controller,
            ),
            widget.isFreeAnchorListEntry
            ? Positioned(
                top: 0,
                right: 0,
                child: (widget?.freeAnchorModel?.isShowFreeAnchor ?? false)
                  ? SizedBox.shrink()
                  : merchantInfo()
              )
            : Positioned(
                top: 0,
                child: LiveToolPanel(
                  anchorId: widget.anchorId,
                  roomNo: widget.roomNo,
                  orientation: widget.orientation,
                  swiperController: widget.swiperController,
                  onEntryGameDetail: widget.onEntryGameDetail,
                  isVlogLive: widget.isVlogLive,
                  controller: controller.toolPanel,
                  size: size,
                  isFreeAnchor: isFreeAnchor,
                  isFreeLiveGameAnchor: widget.isFreeLiveGameAnchor,
                  padding: padding,
                  horizontalDragCallBack: widget?.horizontalDragCallBack,
                  activeBannerKey: widget?.activeBannerKey,
                  matchesDetailModel: widget?.matchesDetailModel,
                  extendModel: widget?.extendModel,
                  newHeadAnchorModel: widget?.newHeadAnchorModel,
                  playerController: widget?.playerController,
                  detailSet: widget?.detailSet,
                  onShowMatchInfo: widget?.onShowMatchInfo,
                ),
              ),
            widget.isFreeAnchorListEntry
              ? SizedBox.shrink()
              : moreLiveWidget(),
            widget.isFreeAnchorListEntry && (!isStrNullOrEmpty(selectAnchorId) || !isStrNullOrEmpty(anchorId))
              ? Positioned(
                  top: 36.0,
                  right: 0,
                  bottom: 0,
                  width: 116.0,
                  child: LiveChatMessage(
                    matchesDetailModel: widget.matchesDetailModel,
                    extendModel: widget.extendModel,
                    liveToolPanelController: controller.toolPanel,
//                    isFreeAnchorListEntry: widget.isFreeAnchorListEntry,
//                    isFreeAnchor: isFreeAnchor,
                    detailParams: widget?.detailSet?.detailParams,
//                    liveId: widget.detailParams?.liveId ?? widget.liveId,
//                    anchorId: widget.detailParams?.anchorId ?? '',
                  )
                )
              : SizedBox.shrink(),
            widget.isFreeAnchorListEntry
              ? Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  left: 0,
                  child: freeAnchorInfoWidget()
                )
              : SizedBox.shrink()
          ],
        ),
      );
      return body;
    }
  }

    Widget freeAnchorInfoWidget() {
      AnchorSubCellModel freeAnchorModel = widget?.freeAnchorModel;
      String anchorLevelIcon = freeAnchorModel?.anchorLevelIcon ?? '';
      String anchorLevelTitle = freeAnchorModel.anchorLevelTitle ?? '';
      String userLogo = string(freeAnchorModel?.icon,defaultVal: freeAnchorModel?.cover);
      String anchorName = freeAnchorModel.name ?? '';
      if(isStrNullOrEmpty(anchorName)){
        anchorName = freeAnchorModel.nickname;
      }
      String anchorLabel = freeAnchorModel.label ?? '';

      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Offstage(
                        offstage: !freeAnchorModel.isShowAnchorLevel,
                        child: Container(
                          margin: EdgeInsets.only(left: 8.0, top: 10.0),
                          child: AnchorGrade(
                            anchorLevelIcon: anchorLevelIcon,
                            anchorLevelTitle: anchorLevelTitle,
                          ),
                        ),
                      )
                    ),
                    merchantInfo()
                  ],
                )
              )
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.3)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
//                  Container(
//                    margin: EdgeInsets.only(right: 5.0),
//                    width: 28.0,
//                    height: 28.0,
//                    alignment: Alignment.center,
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
//                      color: Colors.white,
//                    ),
//                    child: AiImage.userLogo(userLogo, size: 18.0),
//                  ),
                  const SizedBox(width: 8.0),
                  Text(anchorName, style: textStyle(),),
                  Offstage(
                    offstage: isStrNullOrEmpty(anchorLabel),
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0),
                      height: 16.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2.0),
                            topRight: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(2.0),
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFFFC92B4), Color(0xFFF74C86)]
                          )
                      ),
                      padding: EdgeInsets.only(left: 6.0, right: 4.0),
                      child: Text(anchorLabel, style: anchorLabelStyle(),),
                    )
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget merchantInfo(){
      return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            merchantInfoWidget(),
            closeVideoWidget(),
          ],
        ),
      );
    }

    Widget closeVideoWidget(){
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
            margin: EdgeInsets.only(right: 5.0, top: 5.0),
            width: 25,
            height: 25,
            child: Center(child: Icon(Icons.close,color: Colors.white,))
        ),
        onTap: (){
          config.userInfo.isCloseFreeAnchor = true;
          widget?.controller?.toolPanel?.player?.videoPlayer?.stop();
          Event.eventBus.fire(FreeAnchorCloseVideoEvent());
          if(widget?.onCloseVideo != null){
            widget?.onCloseVideo();
          }
        },
      );
    }

    Widget merchantInfoWidget() {
    String liveName = config.userInfo.merchantLiveInfo["liveName"];
    String liveLogo = config.userInfo.merchantLiveInfo["liveLogo"];
    if (isStrNullOrEmpty(liveName) && isStrNullOrEmpty(liveLogo)) {
      return Container();
    }

    return Container(
      margin: EdgeInsets.only(top: 5.0),
//      width: 80.0,
      height: 28.0,
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !isStrNullOrEmpty(liveLogo)
              ? Container(
            margin: EdgeInsets.only(right: 3),
            width: 16.0,
            child: AiImage.fromUrl(liveLogo, "team", BoxFit.fill),
          )
              : Container(),
          Text(
            liveName,
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: liveTextStyle(),
          ),
        ],
      ),
    );
  }

   textStyle() {
    return AiTextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: config.skin.fontWeight.medium,
      fontFamily: config.skin.fontFimaly.pingFang,
    );
  }

  liveTextStyle() {
    return AiTextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: config.skin.fontWeight.medium,
      fontFamily: config.skin.fontFimaly.pingFang,
    );
  }

  TextStyle anchorLabelStyle() {
    return AiTextStyle(
        color: Colors.white,
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h6,
        fontFamily: config.skin.fontFimaly.pingFang);
  }

  // 更多直播视频
  Widget moreLiveWidget() {
    String runningTime = widget.matchesDetailModel?.data?.getGame?.gameInfo?.runningTime;
    if (runningTime == config.langMap['baseLang']['models']['RBFTTime']['halfTime']) {}

    if (isHiddenMore || widget.isVlogLive || widget.isListDetail || !ModuleSwitch.getInstance().videoAndAnchor() || isFreeAnchor) {
      return SizedBox.shrink();
    }
    return StreamBuilder(
        stream: _moreLiveController.stream,
        initialData: _moreLivePosition,
        builder: (cxt, span) {
          return AnimatedPositioned(
            top: 80.0,
            right: _moreLivePosition,
            curve: Curves.linear,
            duration: Duration(milliseconds: 200),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 63.0,
                height: 28.0,
                child: AiImage.asset('assets/images/detail/more/enter_detail_more_live.png', width: 63.0, height: 28.0, userInternational: true),
              ),
              onTap: () {
                // if (!_showMoreLiveView()) {
                  ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailLiveMore);
                  if (widget?.onMoreVideo != null) {
                    widget?.onMoreVideo();
                  }
                // }
              },
            ),
          );
        });
  }

  void videoPlayStateChanged(AiWebVideoPlayerState state) async {
    if (state == AiWebVideoPlayerState.Playing) {
      _startMoreLiveTimer();
    } else if (state == AiWebVideoPlayerState.Stop) {
      _showMoreLiveView(isNeedClose: false);
    }
  }

  // 显示更多视频View
  bool _showMoreLiveView({bool isNeedClose = true}) {
    if (_moreLivePosition == _moreLiveOffset) {
      _moreLivePosition = 0.0;
      _moreLiveController.add(0.0);
      if (isNeedClose) {
        _startMoreLiveTimer();
      }
      return true;
    }
    return false;
  }

  // 启动隐藏更多视频定时器
  void _startMoreLiveTimer() {
    _cancelMoreLiveTimer();
    if (_isHaltTime) return;
    print('启动了定时器 _isHaltTime = $isHiddenMore  ${widget.isVlogLive} ${widget.isListDetail}');
    if (isHiddenMore || widget.isVlogLive || widget.isListDetail) return;
    _moreLiveTimer = Timer(Duration(seconds: 5), () {
      print('启动了定时器 _moreLiveTimer');
      if (_moreLivePosition == 0) {
        _moreLivePosition = _moreLiveOffset;
        _moreLiveController.add(_moreLivePosition);
      }
    });
  }

  void _cancelMoreLiveTimer() {
    _moreLiveTimer?.cancel();
    _moreLiveTimer = null;
  }

  Widget createViewPlayer() {
    return AiImage.asset("assets/images/liveplayer/img_live_test_normal.png", fit: BoxFit.fill);
  }
}

class LivePlayerCache {
  //设置视频浮动窗口缓存
  static set floatVideoAble(bool value) {
    AiCache.get().setBool('select_float_video', value);
  }

  static bool get floatVideoAble => AiCache.get().getBool('select_float_video') ?? true;
}
*/