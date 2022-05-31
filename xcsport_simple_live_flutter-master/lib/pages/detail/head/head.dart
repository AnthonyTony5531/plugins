import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/head/expansionTitles.dart';
import 'package:fast_ai/pages/detail/head/reserve_match.dart';
import 'package:fast_ai/pages/detail/live_player/live_player_config.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/xc_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../../../utils/string_util.dart';
import 'anchor_detail_head.dart';

class HeadDetail extends StatefulWidget {
  HeadDetail(
      {Key key,
      this.matchesDetailModel,
      this.extendModel,
      this.headHeight,
      this.isBlackShowHead,
      this.onHeadExpansiond,
      this.topOffset,
      this.isExpanded,
      this.isFreeAnchor = false ,

      this.dPageModel,
      this.onMoreVideo,
      this.horizontalDragCallBack,
      this.isListDetail = false,
      this.playerController})
      : super(key: key);
  MatchesDetailModel matchesDetailModel;
  ExtendModel extendModel;
  final double topOffset;
  double headHeight;
  bool isExpanded;
  bool isFreeAnchor;

  bool isBlackShowHead;
  final ValueChanged<bool> onHeadExpansiond;
  DPageModel dPageModel;
  CommonVideoPlayerController playerController;
  final VoidCallback onMoreVideo;
  final HorizontalDragCallBack horizontalDragCallBack;
  final bool isListDetail;

  @override
  State<StatefulWidget> createState() {
    return _HeadDetail();
  }
}

class _HeadDetail extends State<HeadDetail> with WidgetsBindingObserver {
  CommonVideoPlayerController get playerController {
    return widget.playerController;
  }

  String gameTime;

  String noRBMatchDate() {
    if (isNotEmpty(gameTime)) return gameTime;
    int gateDate = this.matchesDetailModel.data.gameDate;
    if (null == gateDate || 0 == gateDate) return '';
    var date = DateTime.fromMillisecondsSinceEpoch(gateDate);
    gameTime = DateFormat("MM-dd HH:mm").format(date);
    return gameTime;
  }

  Map get baseLang => config.langMap['baseLang'];

  MatchesDetailModel get matchesDetailModel {
    return widget.matchesDetailModel;
  }

  ExtendModel get extendModel {
    return widget.extendModel;
  }

  DPageModel get dPageModel {
    return widget.dPageModel;
  }

  double get headHeight {
    return widget.headHeight;
  }

  bool get isBlackShowHead {
    return widget.isBlackShowHead;
  }

  bool get isExpanded {
    return widget.isExpanded;
  }

  //bool isBlackShowHead = false;
  DetailSet detailSet = config.userInfo.detailSet;
  bool get isFreeAnchor => detailSet.detailParams?.isFreeAnchor ?? false;

  bool get isMobileNetworkState => config.netConnectStatus == XCNetworkState.mobile;
  bool isShowMobileNetwork = false;
  String cacheVideoPlayAutoNotWifi; //1自动播放，2非自播放，  缓存设置（非WIFI下自动播放）
  var netWorkSubscription;

  StreamSubscription moduleChangeEvent;
  StreamSubscription<HeadVideoEvent>  headVideoEvent;
  final DateTime _initTime = DateTime.now();
  bool isShowHeadVideo = false;

  @override
  void initState() {
    if (isMobileNetworkState) {
      cacheVideoPlayAutoNotWifi = AiCache.get().getString('videoPlayAutoNotWifiState121');
      isShowMobileNetwork = detailSet.selectViewType == 'video' && cacheVideoPlayAutoNotWifi == null && detailSet.fixedDetailHeadType == 0;
    }
    super.initState();
    listenInit();
    WidgetsBinding.instance.addObserver(this);
    bindEvent();
  }

  void bindEvent(){
    moduleChangeEvent = Event.eventBus.on<ModuleSwitchChangeEvent>().listen((e) {
      if (mounted) {
        setState(() {});
      }
    });
    headVideoEvent = Event.eventBus.on<HeadVideoEvent>().listen((event) {
      if(config.userInfo.isShowHeadVideo){
        return;
      }
      config.userInfo.isShowHeadVideo = true;
      isShowHeadVideo = true;
      if(mounted)setState(() {});
    });
  }

  void unbindEvent(){
    moduleChangeEvent?.cancel();
    headVideoEvent?.cancel();
  }


  @override
  void dispose() {
    listenCancel();
    WidgetsBinding.instance.removeObserver(this);
    unbindEvent();
    config.userInfo.isShowHeadVideo = false;
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    //前台
    if (state == AppLifecycleState.resumed) {
      listenInit();
    }
    //后台
    else if (state == AppLifecycleState.paused) {
      listenCancel();
    }
  }

  void listenInit() {
    listenDetailMatchViewEvent();
    listenNetworkStateEvent();
    listenDetailHeadHideOrShowEvent();
  }

  void listenCancel() {
    detailMatchViewEvent?.cancel();
    networkStateEvent?.cancel();
    detailHeadHideOrShowEvent?.cancel();
  }

  //初始值为动画样式
  @override
  Widget build(BuildContext context) {
    //初始值为动画样式
    double positionedTop = 0;
    EdgeInsets positionedChildPadding = const EdgeInsets.fromLTRB(0, 10, 0, 0);
    //比分板样式
    if (detailSet.selectViewType == 'default') {
      positionedTop = matchesDetailModel.data?.showtype != "RB" ? 20 : 30;
      positionedChildPadding = const EdgeInsets.fromLTRB(20, 12, 20, 0);
    } else if (detailSet.selectViewType == 'video') {}

    num liveStatus = detailSet.detailParams?.liveStatus;
    // 主播头部
    DetailParams detailParams = detailSet.detailParams;
    if (((detailParams?.showtype ?? '') != 'RB' && !isStrNullOrEmpty((detailParams?.anchorId ?? '')) && (detailParams?.type ?? '') == '1') ||
        (isFreeAnchor && liveStatus != null && liveStatus == 0)) {
      return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            isExpanded
                ? AnchorDetailHead(
              detailParams: detailParams,
              extendModel: extendModel,
            )
                : Container(color: Colors.black, height: widget.topOffset + 70.0),
          ],
        ),
      );
    }

    return GestureDetector(
        child: Stack(
      children: <Widget>[
//        detailSet.selectViewType == 'default' && needShowMp4()
//            ? IjkNativePlayer(
//                videoHeight: headHeight,
//                videoWidth: MediaQuery.of(context).size.width,
//                videoUrl: getTypeMp4ByNative(),
//                cover: AiImage.asset(getTypeBgByNative()),
//                autoPlay: true,
//              )
//            : Container(),
//        detailSet.selectViewType == 'default' && needShowMp4() && isShowHeadVideo ? SizedBox(
//          width: MediaQuery.of(context).size.width,
//          height: headHeight,
//          child: SimplePlayer(
//            // source: config?.sdkAssetsDir == null ? gameTypeMp4() : 'file://${config.sdkAssetsDir}/${gameTypeMp4()}',
//            source:  isStrNullOrEmpty(config?.sdkAssetsModel?.sdkAssetsDir) ? getTypeMp4ByNative() : AiFile.file(getTypeMp4ByNative()),
//            autoPlay: true,
//          ),
//        ):Container(),
        Container(
          // padding: EdgeInsets.only(top: widget.topOffset),
          child: ExpansionLayout(
            isListDetail: widget.isListDetail,
            horizontalDragCallBack: widget?.horizontalDragCallBack,
            backgroundColor: Colors.white,
            //onExpansionChanged: onExpansionChanged,
            isExpanded: isExpanded,
            milliseconds: millisecondsExpan,
            onMoreVideo: widget?.onMoreVideo,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  color: Colors.transparent,
                  height: headHeight,
                  child: widget.playerController.isVirtual
                      ? Column(
                          children: <Widget>[
                            Container(
                              padding: positionedChildPadding,
                              margin: EdgeInsets.only(top: matchesDetailModel.data?.showtype != "RB" ? 0 : 39),
                            ),
                            Expanded(
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: getHead(context),
                                      ) ??
                                      Container(),
                                ],
                              ),
                            )
                          ],
                        )
                      : Stack(
                          children: <Widget>[
                            Positioned(
                              top: positionedTop,
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                padding: positionedChildPadding,
                                child: Column(
                                  children: getHead(context) ?? Container(),
                                ),
                              ),
                            ),
                            //fuftTime,
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  bool needShowMp4() {
    GameType gameType = parse2GameType(matchesDetailModel?.data?.gameType);
    return GameType.FT == gameType || GameType.BK == gameType;
  }

  String getTypeMp4ByNative() {
    GameType gameType = parse2GameType(matchesDetailModel?.data?.gameType);
    if (GameType.FT == gameType) return 'assets/files/media/ft.mp4';
    if (GameType.BK == gameType) return 'assets/files/media/bk.mp4';
    return 'assets/files/media/ft.mp4';
  }

  String getTypeBgByNative() {
    GameType gameType = parse2GameType(matchesDetailModel?.data?.gameType);
    if (GameType.FT == gameType) return 'assets/files/media/ft.jpg';
    if (GameType.BK == gameType) return 'assets/files/media/bk.jpg';
    return 'assets/files/media/ft.jpg';
  }

  int millisecondsExpan = 200;

  bool isShowChangeVideoAnimationWidget = false;
  bool videoAnimationLoading = true;

  //视图选中类型
  StreamSubscription<DetailViewEvent> detailMatchViewEvent;

  void listenDetailMatchViewEvent() {
    detailMatchViewEvent = Event.eventBus.on<DetailViewEvent>().listen((event) {
      if (event.matchViewChooseModel.selectItem != 'data') {
        detailSet.selectViewType = event.matchViewChooseModel.selectItem;
      }
      if (mounted) {
        setState(() {
          if (detailSet.selectViewType == 'animation' || detailSet.selectViewType == 'video') {
            videoAnimationLoading = true;
            isShowChangeVideoAnimationWidget = true;
          }
        });
      }
    });
  }

  bool _headHideStuff = false;
  StreamSubscription<DetailHeadHideOrShowEvent> detailHeadHideOrShowEvent;

  void listenDetailHeadHideOrShowEvent() {
    detailHeadHideOrShowEvent = Event.eventBus.on<DetailHeadHideOrShowEvent>().listen((event) {
      if (mounted) {
        setState(() {
          _headHideStuff = event.hideStuff;
        });
      }
    });
  }

  //监听网络变化
  StreamSubscription<NetworkStateEvent> networkStateEvent;

  void listenNetworkStateEvent() {
    networkStateEvent = Event.eventBus.on<NetworkStateEvent>().listen((event) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  List<Widget> getHead(BuildContext context) {
    var head = <Widget>[];
    if (detailSet.selectViewType == 'default') {
      head = defaultHead();
    } else if (detailSet.selectViewType == 'animation' || detailSet.selectViewType == 'video') {
      //head = videoAnimationHead();
    } else {
      head = defaultHead();
    }
    return head;
  }

  List<Widget> defaultHead() {
    _headHideStuff = false;
    var head = <Widget>[];
    if (this.matchesDetailModel.data.showtype != 'RB') {
      head = <Widget>[
        ReserveMatch(
          matchesDetailModel: matchesDetailModel,
          detailSet: detailSet,
        ),
      ];
    } else {
//      var scoreDetail;
//      if (matchesDetailModel.data.gameType == gameType2String(GameType.FT)) {
////        scoreDetail = FTScoreDetail(matchesDetailModel: matchesDetailModel);
//      } else if (matchesDetailModel.data.gameType == gameType2String(GameType.BK)) {
////        scoreDetail = BKScoreDetail(matchesDetailModel: matchesDetailModel);
//      } else if (matchesDetailModel.data.gameType == gameType2String(GameType.TN)) {
//        scoreDetail = TNScoreDetail(matchesDetailModel: matchesDetailModel);
//      } else if (matchesDetailModel.data.gameType == gameType2String(GameType.BS)) {
//        scoreDetail = BaseBallScoreDetail(matchesDetailModel: matchesDetailModel);
//      } else if (matchesDetailModel.data.gameType == gameType2String(GameType.OP_DJ)) {
//        //电竟没小比分
//      } else if (matchesDetailModel.data.gameType == gameType2String(GameType.OP_IH)) {
//        scoreDetail = IceBallScoreDetail(matchesDetailModel: matchesDetailModel);
//      } else if (matchesDetailModel.data.gameType == gameType2String(GameType.OP_TN)) {
//        scoreDetail = PPScoreDetail(matchesDetailModel: matchesDetailModel);
//      } else if (matchesDetailModel.data.gameType == gameType2String(GameType.OP_VB)) {
//        scoreDetail = VBScoreDetail(matchesDetailModel: matchesDetailModel);
//      } else if (matchesDetailModel.data.gameType == gameType2String(GameType.BK_AFT)) {
//        scoreDetail = BkAftScoreDetail(matchesDetailModel: matchesDetailModel);
//      }

//      head = <Widget>[
//        RbTeamSection(matchesDetailModel: matchesDetailModel, scoreModel: dPageModel.scoreModel),
//      ];
//      if (scoreDetail != null) {
//        head.add(scoreDetail);
//      }
    }
    return head;
  }

  Widget loading() {
    String str = detailSet.selectViewType == 'video' ? baseLang['detail']['gameVideo'] : baseLang['detail']['animationLive'];
    return Container(
      padding: EdgeInsets.only(top: 35),
      alignment: Alignment.center,
      height: headHeight,
      color: detailSet.selectViewType == 'video' ? Colors.black : Color(0xFF222222),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AiImage.asset(
            "assets/images/detail/loading.gif",
            width: 20,
          ),
          Padding(
            padding: EdgeInsets.only(top: 7, bottom: 18),
            child: Text(
              '$str${baseLang['message']['loading']}',
              style: AiTextStyle(color: Color.fromRGBO(255, 255, 255, 0.4), fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

  Widget mobileNetworkState() {
    return Container(
      alignment: Alignment.center,
      height: headHeight,
      color: detailSet.selectViewType == 'video' ? Colors.black : Color(0xFF000000),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                baseLang['detail']['mobileNetworkPlayText'],
                style: AiTextStyle(fontSize: 12, color: Color.fromRGBO(255, 255, 255, 1)),
              ),
            ],
          ),
          Container(
            height: 8,
          ),
          InkWell(
            onTap: onWifiNetwork,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AiSvgPicture.asset(
                  "assets/images/detail/icon_live_select_${cacheVideoPlayAutoNotWifi == '1' ? 'selected' : 'normal'}.svg",
                  width: 13,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    baseLang['detail']['videoPlayAutoNotWifiText'],
                    style: AiTextStyle(fontSize: 12, color: Color.fromRGBO(255, 255, 255, 0.5)),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  isShowMobileNetwork = false;
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 24,
                  width: 70,
                  child: Text(
                    baseLang['detail']['continuePlay'],
                    style: AiTextStyle(fontSize: 12, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      //添加边框
                      width: 0.8, //边框宽度
                      color: Colors.white, //边框颜色
                    ),
                    borderRadius: new BorderRadius.all(Radius.circular(15)), //设置圆角
                  ),
                ),
              ),
              extendModel.data.animateLiveUrl != null
                  ? InkWell(
                      onTap: () {
                        isShowMobileNetwork = false;
                        detailSet.selectViewType = 'animation';
                        Event.eventBus.fire(WifiEvent(AiFluxMode.ArrowMobile));
                        playerController.toolPanel.bottomBar.setVideoType(VideoType.Animation);
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 40),
                        alignment: Alignment.center,
                        height: 24,
                        width: 70,
                        child: Text(
                          baseLang['detail']['animationLive1'],
                          style: AiTextStyle(fontSize: 12, color: Colors.black),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            //添加边框
                            width: 0.8, //边框宽度
                            color: Color.fromRGBO(253, 220, 57, 1), //边框颜色
                          ),
                          color: Color.fromRGBO(253, 220, 57, 1),
                          borderRadius: new BorderRadius.all(Radius.circular(15)), //设置圆角
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          Container(
            height: 40,
          )
        ],
      ),
    );
  }

  int n = 0;

  void onWifiNetwork() {
    String state = AiCache.get().getString('videoPlayAutoNotWifiState');
    if (state == '1') {
      state = '2';
    } else {
      state = '1';
    }

    AiCache.get().setString('videoPlayAutoNotWifiState', state);
    setState(() {
      cacheVideoPlayAutoNotWifi = state;
    });
  }
}
