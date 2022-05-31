import 'dart:async';

import 'package:fast_ai/api/protocols/detail/active_banner_protocol.dart';
import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/anchor/banner/aibanner.dart';
import 'package:fast_ai/pages/anchor/banner/aibanner_model.dart';
import 'package:fast_ai/pages/anchor/banner/aibanner_single/aibanner_single_model.dart';
import 'package:fast_ai/pages/detail/active_banner/active_banner_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/active_banner_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterswiper/flutter_swiper.dart';

const double bannerHiddenBoundary = -60.0;
const double positionHiddenRight = -40.0;
const double positionShowRight = 2.0;

class ActiveBanner extends StatefulWidget {
  final ActiveBannerController controller;
  final bool isPortraitBanner;
  final ValueChanged<bool> onActiveBannerIsEmpty;

  ActiveBanner({
    Key key,
    @required this.controller,
    this.isPortraitBanner = false,
    this.onActiveBannerIsEmpty,
  }) : super(key: key);

  @override
  ActiveBannerState createState() => ActiveBannerState();
}

class ActiveBannerState extends State<ActiveBanner> with SingleTickerProviderStateMixin {
  List<AiBannerSingleModel> dataSource = [];
  List<Widget> indicatorList = [];
  int selectIndex = 0;
  ScrollController controller = ScrollController();
  SwiperController swiperController = SwiperController();
  int currentIndex = 0;
  final AiBannerModel bannerModel = AiBannerModel();
  AnimationController animationController;
  Animation tween;
  double positionRight = 15.0;
  bool isHiddenBanner = false;
  bool isClickBanner = false;
  bool isNoScrollPlayList = false;
  GlobalKey<AiBannerState> bannerKey = GlobalKey<AiBannerState>();
  StreamSubscription<DetailOrientationEvent> detailOrientationEvent;
  StreamSubscription<DetailSwiperChangeEvent> detailSwiperChangeEvent;
  Timer intervalTimer;
  bool isEntryChatroom = false;
  StateSetter panStateSetter;
  double offsetX = 0;
  bool isPanBanner = false;
  double startDistanceX = 0.0;
  double bufferOffsetX = 0.0;
  double distance = 0.0;
  double bufferValue = 0.1;
  bool isCloseBanner = false;
  double itemW = 36.0;
  double itemH = 36.0;

  @override
  void initState() {
    super.initState();
    loadData();
    bindEvent();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    Animation curve = CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    tween = Tween(begin: positionHiddenRight, end: positionShowRight).animate(animationController);
    animationController.forward();
    widget?.controller?.animationController = animationController;
    widget?.controller?.show();
  }

  @override
  void dispose() {
    unbindEvent();
    animationController?.dispose();
    widget?.controller?.animationController = null;
    stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!config.userInfo.isActiveBannerShow) {
      return Container();
    }
    if (widget?.isPortraitBanner ?? false) {
      return AnimatedBuilder(
          animation: tween,
          builder: (BuildContext context, Widget child) {
            return portraitBuilder();
          });
    } else {
      if (widget?.controller == null) {
        return _builder(context, null);
      }
      return AnimatedBuilder(
        animation: tween,
        builder: (BuildContext context, Widget child) {
          return Transform.translate(
            offset: Offset(72.0 * animationController.value, 0),
            child: StreamBuilder<ActiveBannerModel>(
              initialData: widget.controller.model,
              stream: widget.controller.stream(),
              builder: (context, as) {
                return _builder(context, as.data);
              }
            ),
            // child: ModelControllerBuilder<ActiveBannerModel, ActiveBannerController>(
            //   builder: _builder,
            //   controller: widget.controller,
            // ),
          );
        },
      );
    }
  }

  Widget portraitBuilder() {
    return bannerWidget();
  }

  Widget _builder(BuildContext context, ActiveBannerModel model) {
    return bannerWidget();
  }

  Widget bannerWidget() {
    if (isCloseBanner || dataSource.isEmpty) {
      return Container();
    }

    indicatorList.clear();
    for (int index = 0; index < dataSource.length; index++) {
      indicatorList.add(Container(
        width: 4.0,
        height: 4.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: index == selectIndex ? Colors.white.withOpacity(0.7) : Colors.white.withOpacity(0.2),
        ),
        margin: EdgeInsets.only(left: 2.0, right: 2.0),
      ));
    }
    Size size = MediaQuery.of(context).size;
    return Container(
//      width: size.width,
//      height: size.height,
//      color: Colors.red,
      child: Stack(
        children: <Widget>[
          StatefulBuilder(builder: (BuildContext ctx, StateSetter setter) {
            panStateSetter = setter;
            return Stack(
              children: <Widget>[
                Positioned(
//                    right: (widget?.isPortraitBanner ?? false) ? (isPanBanner ? offsetX : tween.value) : 0.0,
//                    bottom: 35.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
//                          width: 62.0 + 10,
//                          height: 80.0,
                          width: itemW,
                          height: itemH,
                        ),
                        Positioned(
//                          top: (widget?.isPortraitBanner ?? false) ? 14.0 : 0.0,
                          left: 0.0,
                          child: Offstage(
                            offstage: dataSource.length <= 0,
                            child: Column(
                              children: <Widget>[
                                AiBanner(
                                  key: bannerKey,
                                  isHiddenBg: true,
                                  isAutoplay: dataSource.length > 1,
                                  bannerHeight: itemW,
                                  bannerWidth: itemH,
                                  model: bannerModel,
                                  isDetailActiveBanner: true,
                                  onClickBanner: onClickBanner,
                                  onCurrentSelectIndex: onCurrentSelectIndex,
                                  onClickCallback: onClickCallback,
                                  isOnlyFixUp: true,
                                ),
                                Offstage(
                                  offstage: (dataSource.length <= 1),
                                  child: Container(
                                    width: itemW,
                                    height: 12.0,
                                    margin: EdgeInsets.only(top: 5.0),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: indicatorList,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
//                        Positioned(
//                            right: 0.0,
//                            top: 0.0,
//                            child: Offstage(
//                              offstage: !(widget?.isPortraitBanner ?? false),
//                              child: GestureDetector(
//                                behavior: HitTestBehavior.opaque,
//                                child: Container(
////                                color: Colors.pink,
//                                  width: 14.0,
//                                  height: 14.0,
//                                  child: AiImage.svgLogo('assets/images/detail/icon_detail_banner_close.svg', size: 14.0),
//                                ),
//                                onTap: () {
//                                  isCloseBanner = true;
//                                  config.userInfo.isActiveBannerShow = false;
//                                  AiCache.get().setInt(AiCache.show_detail_banner_time, DateTime.now().millisecondsSinceEpoch.toInt());
//                                  if (mounted) {
//                                    setState(() {});
//                                  }
//                                },
//                              ),
//                            ))
                      ],
                    )),
              ],
            );
          }),
          Positioned(
              right: 0,
              bottom: 80.0,
//              width: 50.0,
//              height: 100.0,
              width: itemW,
              height: itemH,
              child: Offstage(
                offstage: (widget?.isPortraitBanner ?? false) ? !isHiddenBanner : true,
                child: GestureDetector(
                  child: Container(
                    color: Colors.white.withOpacity(0.001),
                  ),
                  onPanStart: (DragStartDetails details) {
                    offsetX = positionHiddenRight;
                    isPanBanner = true;
                  },
                  onPanUpdate: (DragUpdateDetails details) {
                    offsetX -= details.delta.dx;
                    // 左滑边界
                    if (offsetX > positionShowRight) {
                      offsetX = positionShowRight;
                    }
                    // 优化边界
                    if (offsetX < positionHiddenRight) {
                      offsetX = positionHiddenRight;
                    }
                    if (panStateSetter != null) {
                      panStateSetter(() {});
                    }
                  },
                  onPanEnd: (DragEndDetails details) {
                    isPanBanner = false;
                    startDistanceX = offsetX;
                    // 隐藏起来
                    if (offsetX < -50.0) {
                      tween = Tween(begin: offsetX, end: positionHiddenRight).animate(animationController);
                      isHiddenBanner = true;
                    }
                    // 显示出来
                    else {
                      tween = Tween(begin: offsetX, end: positionShowRight).animate(animationController);
                      isHiddenBanner = false;
                      startTimer();
                    }
                    animationController?.reset();
                    animationController?.forward();
                    isClickBanner = false;
                  },
                  onTap: () {
                    onClickBanner();
                  },
                ),
              )),
        ],
      ),
    );
  }

  bool isInitialActiveBanner = false;
  Orientation _oldOrientation;

  void bindEvent() {
    // 横屏
    detailOrientationEvent = Event.eventBus.on<DetailOrientationEvent>().listen((event) {
      Orientation orientation = event.orientation;
      if (_oldOrientation != orientation) {
        _oldOrientation = orientation;
        //横屏
        if (orientation == Orientation.landscape) {
          if (!isInitialActiveBanner) {
            widget?.controller?.animationController = animationController;
            widget?.controller?.show();
            isInitialActiveBanner = true;
          }
        } else {
          //竖屏不显示弹幕

        }
        if (mounted) setState(() {});
      }
    });
    // 详情左右切换
    detailSwiperChangeEvent = Event.eventBus.on<DetailSwiperChangeEvent>().listen((event) {
      swiperListener(event.index);
    });
  }

  void unbindEvent() {
    detailOrientationEvent?.cancel();
    detailSwiperChangeEvent?.cancel();
  }

  void onClickBanner() {
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailFloatBanner);
    if (isHiddenBanner) {
      showBanner();
    } else {
      hideBanner();
    }
  }

  void onCurrentSelectIndex(int index) {
    selectIndex = index;
    if (mounted) {
      setState(() {});
    }
  }

  void onClickCallback(AiBannerSingleModel singleModel){
    Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
  }

  void swiperListener(int index) {
    if (dataSource.isEmpty) return;
    currentIndex = index;
    isEntryChatroom = currentIndex == 1;
    if (isEntryChatroom) {
      showBanner();
    } else {
      // 投注显示时重新计数5s
      if (!isHiddenBanner) {
        showBanner();
      }
    }
  }

  int count = 0;

  Future startTimer() {
    if (isCloseBanner) return Future.value(true);
    if (!(widget?.isPortraitBanner ?? false)) {
      return Future.value(true);
    }
    count = 0;
    intervalTimer?.cancel();
    intervalTimer = null;
    intervalTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      count++;
      // 聊天室5s计数
      if (isEntryChatroom) {
        print('聊天计时------:$count');
        if (count < 6) {
          return;
        }
        count = 0;
      }
      // 投注页5s计数
      else {
        print('投注计时------:$count');
        if (count < 6) {
          return;
        }
        count = 0;
      }
      if (!isClickBanner) {
        isClickBanner = true;
        hideBanner();
      }
    });
  }

  void stopTimer() {
    intervalTimer?.cancel();
    intervalTimer = null;
    //print('销毁定时器---------');
  }

  void hideBanner() {
    stopTimer();
    if (!isHiddenBanner) {
      isHiddenBanner = true;
      tween = Tween(begin: positionShowRight, end: positionHiddenRight).animate(animationController);
      animationController?.reset();
      animationController?.forward();
      if (bannerKey != null && bannerKey?.currentState != null) {
        bannerKey?.currentState?.updateBannerStatus(!isHiddenBanner);
      }
    }
  }

  void showBanner() {
    if (isCloseBanner) return;
    isClickBanner = false;
    startTimer();
    if (isHiddenBanner) {
      isHiddenBanner = false;
      tween = Tween(begin: positionHiddenRight, end: positionShowRight).animate(animationController);
      animationController?.reset();
      animationController.forward();
      if (bannerKey != null && bannerKey?.currentState != null) {
        bannerKey?.currentState?.updateBannerStatus(!isHiddenBanner);
      }
    }
  }

  void loadData() async {
    if (isCloseBanner) return;
    ActiveBannerReqProtocol req = ActiveBannerReqProtocol();
    var rsp = await req.request();
    dataSource.clear();
    indicatorList.clear();
    rsp.banners.forEach((value) {
      AiBannerSingleModel model = AiBannerSingleModel().fromBannersRspProtocol(value);
      dataSource.add(model);
    });
    if (dataSource.length > 5) {
      List<AiBannerSingleModel> tempList = dataSource.sublist(0, 5);
      dataSource.clear();
      dataSource.addAll(tempList);
      bannerModel.updateBannerModels(tempList);
    } else {
      bannerModel.updateBannerModels(dataSource);
    }
    if(widget.onActiveBannerIsEmpty != null){
      widget.onActiveBannerIsEmpty(dataSource.isNotEmpty);
    }
    if (mounted) {
      setState(() {});
    }
  }
}
