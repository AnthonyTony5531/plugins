//**********************************************************************
//* author:Sam
//* date:2020-08-25
//**********************************************************************

import 'dart:async';

import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/util/disposable.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/migrate_plugins/xcpageslider/page_slider.dart';
import 'package:fast_ai/migrate_plugins/xcpageslider/page_slider_container.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_widget.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/slider/chat_room_slider_container_widget.dart';
import 'package:fast_ai/pages/detail/gift/player/gift_play_server.dart';
import 'package:fast_ai/pages/detail/gift/player/svga_gift_player.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/play_group_nav/play_group_nav_ping_controller.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/widgets/ai_nested_scroll_view.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../detail_page_model.dart';

//比赛详情容器
class MatchDetailContainer extends StatefulWidget {
  //投注页顶部
  final Widget betListTopBar;

  //聊天顶部
  final Widget chatroomTopBar;

  //自由播聊天顶部
  final Widget chatroomTopFreeAnchor;

  //聊天底部Bar
  final Widget bottomNavBarView;

  //顶部高度
  final double topBarHeight;

  //顶部自由播
  final double topFreeAnchorHeight;

  //比赛信息
  final Widget gameInfo;

  //比赛信息固定高度
  final double gameInfoHeight;

  //聊天室
  final Widget chatRoom;

  //投注列表
  final Widget betList;

  //赛事展示部分
  final Widget matchDisplay;

  //赛事展示部分高度
  final double matchDisplayHeight;

  final bool isFreeAnchor;
  final bool isFreeLiveGameAnchor; // 游戏自由播正在播

  final DetailSet detailSet;
  //
  final MatchDetailController swiperController;

  //精选赛事列表详情顶部遮罩
  final Widget topCover;

  //是否精选赛事
  final bool isListDetail;
  final int anchorLiveStatus;
  final bool isMatchClose;
  final CommonVideoPlayerController playerController;
  final PageSliderController pageSliderContainer;
  final PlayGroupNavPingController playGroupNavPingController;
  final DPageModel dPageModel;
  final bool isDing;
  final ValueNotifier<bool> chatRoomSliderBottom;
  final ValueNotifier<bool> chatRoomSliderTop;
  final OnPageStatusChanged onPSDirectionRefresh;

  ///返回true拦截不给下拉刷新，否则允许
  final ValueChanged<bool> onPull2FreshCallback;
  final VoidCallback onPingCallback;
  final String roomNo;

  const MatchDetailContainer({
    Key key,
    @required this.playerController,
    @required this.onPSDirectionRefresh,
    @required this.topBarHeight,
    @required this.anchorLiveStatus,
    @required this.chatRoomSliderBottom,
    @required this.chatRoomSliderTop,
    @required this.matchDisplayHeight,
    @required this.gameInfoHeight,
    @required this.betListTopBar,
    @required this.chatroomTopBar,
    @required this.gameInfo,
    @required this.chatRoom,
    @required this.dPageModel,
    @required this.betList,
    @required this.isDing,
    @required this.matchDisplay,
    @required this.swiperController,
    @required this.pageSliderContainer,
    @required this.playGroupNavPingController,
    @required this.onPull2FreshCallback,
    @required this.onPingCallback,
    this.isListDetail = false,
    this.isMatchClose = false,
    this.isFreeAnchor = false,
    this.topCover,
    this.topFreeAnchorHeight = 0.0,
    this.chatroomTopFreeAnchor,
    this.detailSet,
    this.roomNo,
    this.isFreeLiveGameAnchor = false,
    this.bottomNavBarView,
  }) : super(key: key);

  @override
  _MatchDetailContainerState createState() => _MatchDetailContainerState();
}

class _MatchDetailContainerState extends State<MatchDetailContainer>
    with TickerProviderStateMixin {
  Orientation _oldOrientation;
  PageController barPageController = new PageController();

  double _matchDisplayHeight;

  StreamSubscription emptyHandicapEventStream;
  StreamSubscription<RefinedDetailEvent> refinedDetailEvent;

  bool isListDetail;
  bool isRecordFreeAnchorBet = false;

  Widget wrapSliderListener({Widget child}) {
    return ChatRoomSliderContainerWidget(
      body: child,
      isListDetail: widget.isListDetail,
      isChatBottomNotifier: widget.chatRoomSliderBottom,
      isChatTopNotifier: widget.chatRoomSliderTop,
      onPageStatusChanged: widget.onPSDirectionRefresh,
    );
  }
  String gameName = '';
  bool isFreeLiveGameAnchor = false;
  bool _isDing = false;
  double gameHeight = 0; // 自由播游戏高
  String anchorId = '';

  //手动切到聊天室时候，必须要固定,_isBan为true。用来固定
  bool _isBan = false;

  bool _beforeDing;

  bool get isDing {
    //
    if (_isBan) {
      return true;
    }
    return _isDing;
  }

  @override
  void initState() {
    anchorId = widget.detailSet.detailParams.anchorId ?? '';
    isFreeLiveGameAnchor = widget.detailSet.detailParams?.isFreeLiveGameAnchor ?? false;
    gameName = widget.detailSet.detailParams?.liveGame ?? '';
    GiftPlayServer.ins.start();
    _matchDisplayHeight = widget.matchDisplayHeight;
    widget?.playGroupNavPingController
        ?.addPingStatusListener(pingStatusListener);
    bindEvent();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.swiperController.index == 0) {
        GiftPlayServer.ins.removeAllGift();
        GiftPlayServer.ins.pause();
      }
    });
    widget.swiperController.runOnParentInitState();
    widget.swiperController.addListener(() {
      if (widget.swiperController.page == 0) {
        GiftPlayServer.ins.removeAllGift();
        GiftPlayServer.ins.pause();
        if (!isRecordFreeAnchorBet && widget.isFreeAnchor) {
          isRecordFreeAnchorBet = true;
//          ModuleStatistics.ins
//              .statisticsEvent(StatisticsType.StatisticsFreeAnchorDetail);
        }
      } else {
        isRecordFreeAnchorBet = false;
      }
    });
    isListDetail = widget.isListDetail;

    super.initState();
    this._isDing = widget.isDing ||
        widget.dPageModel?.matchesDetailModel?.data?.showtype == "RB" ||
        widget.isListDetail;
    widget.swiperController.addListener(() {
      if(barPageController.positions.isEmpty)return;
      barPageController.jumpTo(widget.swiperController.offset);
    });
//    widget.swiperController.controller.addListener(() {
//      barPageController.jumpTo(widget.swiperController.offset);
//      //投注页点击送礼按钮,SvgaGiftPlayer没有初始化导致送礼没有动效
//      if (mounted) setState(() {});
//    });

    if (isListDetail) {
      barPageController = PageController(initialPage: 1);
    }
    if (barPageController.initialPage == 1) {
      _isBan = true;
    }

    if (null == top) {
      top = maxTop;
    }

    if (isDing) {
      ding(needUpdate: false);
    } else {
      unding(needUpdate: false);
    }
  }

  @override
  void didUpdateWidget(covariant MatchDetailContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    this._isDing = widget.isDing || widget.isListDetail;
    this.isListDetail = widget.isListDetail;
    if (this.isListDetail) {
      if (ccRoute.hasShowOverlay(FastAiRouteTableName.ActivityDrawFloat)) {
        FloatActivityDrawCarHelper.activityDrawStatus(true, isDetail: true);
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isDing) {
        ding();
      }
    });
  }

  void bindEvent() {
    emptyHandicapEventStream =
        Event.eventBus.on<EmptyHandicapEvent>().listen(emptyHandicapEvent);
    refinedDetailEvent =
        Event.eventBus.on<RefinedDetailEvent>().listen(showRefinedDetail);
  }

  void unbindEvent() {
    emptyHandicapEventStream?.cancel();
    refinedDetailEvent?.cancel();
  }

  @override
  void dispose() {
    GiftPlayServer.ins.stop();
    unbindEvent();
    widget?.playGroupNavPingController
        ?.removePingStatusListener(pingStatusListener);
    super.dispose();
  }

  void showRefinedDetail(event) {
    RefinedDetailEvent detailEvent = event;
    isListDetail = !detailEvent.isShowRefinedDetail;
    if (mounted) setState(() {});
  }

  void emptyHandicapEvent(e) {
    if (_matchDisplayHeight != widget.matchDisplayHeight && mounted) {
      setState(() {
        _matchDisplayHeight = widget.matchDisplayHeight;
      });
    }
  }

  void pingStatusListener(bool ping) {
    if (mounted) {
      //print("pingStatusListener>>$ping");
      if (ping) {
        ding();
      } else {
        unding();
      }
    }
  }

  bool goBackRecovery = false;
  int indexPage = 0;
  num lastTop;
  bool isAnimMoving = false;

  ScrollController scrollController = new ScrollController();

  double dingTop = 0;

  void ding({bool needUpdate = true}) {
    _isDing = true;
    dingTop = maxTop + widget.topBarHeight + widget.gameInfoHeight;
    if (needUpdate) {
      if (mounted) {
        setState(() {});
      }
    }
  }

  void unding({bool needUpdate = true}) {
    _isDing = false;
    var currentTop = top;
    top = maxTop;
    if (needUpdate) {
      if (mounted) {
        setState(() {});
      }
    }
  }

  GlobalKey scrollerkey = GlobalKey();

  @override
  Widget build(BuildContext context) {

//    double topOffset = AiMeasure.topOffset(context);
    isFreeLiveGameAnchor = widget.detailSet.detailParams?.isFreeLiveGameAnchor ?? false;
    //640 * 960适配(w*h)
    Size screenSize = MediaQuery.of(context).size;
    gameHeight = 960.0 * screenSize.width / 640.0;
    int pageIndex = widget.swiperController.index;
    num liveStatus = widget.detailSet.detailParams?.liveStatus;
    double freeAnchorTopMargin = widget.topBarHeight + widget.gameInfoHeight + widget.topFreeAnchorHeight + widget.matchDisplayHeight;

    return NotificationListener(
      onNotification: (_) => true,
      child: OrientationBuilder(
        builder: (context, orientation) {
          if (_oldOrientation != orientation) {
            var direction = (orientation == Orientation.landscape)
                ? ScreenDirection.LeftRight
                : ScreenDirection.TopDown;
            _oldOrientation = orientation;
            //发送消息通知详情页【显示/隐藏】投注栏
            Event.eventBus.fire(DetailOrientationEvent(orientation));
            widget.playerController.toolPanel.bottomBar.model.screenDirection = direction;
            widget.playerController.toolPanel.bottomBar.update();
          }
          if (orientation == Orientation.landscape) {
            GiftPlayServer.ins.removeAllGift();
            GiftPlayServer.ins.pause();
          } else if (orientation == Orientation.portrait &&
              widget.swiperController.index == 1) {
            GiftPlayServer.ins.resume();
          }
          return wrapSliderListener(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(children: <Widget>[
                  orientation == Orientation.portrait
                      ? h(widget.topBarHeight)
                      : h(0),
                  orientation == Orientation.portrait && widget.isFreeAnchor
                      ? h(widget.topFreeAnchorHeight)
                      : h(0),
                  orientation == Orientation.portrait ? widget.gameInfo : h(0),
                  widget.matchDisplay,
                ]),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: pageIndex == 0
                      ? screenSize.height - gameHeight
                      : freeAnchorTopMargin,
                  child: Show(
                    isShow: widget.isFreeAnchor,
                    child: _body()
                  ),
                ),
                Positioned.fill( // 自由播未开播
                  child: Show(
                    isShow: orientation == Orientation.portrait && liveStatus != null && liveStatus == 0,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipPath(
                            clipper: _EmptyClipper(top: freeAnchorTopMargin),
                            child: AiImage.asset('assets/images/detail/bg_detail_football.png',
                                fit: BoxFit.cover,
                                width: AiMeasure.screenWidth(context),
                                height: AiMeasure.screenHeight(context)
                            ),
                          ),
                        ),
                        Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            top: freeAnchorTopMargin - 1, //减1是减掉头部的1dp
                            child: _body()
                        )
                      ],
                    )
                  )
                ),
                Show(isShow: !widget.isFreeAnchor,
                    child: StatefulBuilder(builder: (_, state) {
                      betListPageStateSetter = state;
                      return Stack(
                        children: [
                          Positioned.fill(
                              child: Visibility(
                                visible: orientation == Orientation.portrait,
                                child: ClipPath(
                                    clipper: _EmptyClipper(
                                        top: isDing
                                            ? dingTop + 1 //+1是加多头部1像素问题
                                            : top +
                                            widget.topBarHeight +
                                            widget.gameInfoHeight),
                                    child: background()),
                              )),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            top: isDing
                                ? dingTop - 1 //减1是减掉头部的1dp
                                : widget.topBarHeight + widget.gameInfoHeight,
                            child: Visibility(
                              visible: orientation == Orientation.portrait,
                              child: ClipPath(
                                clipper: _EmptyClipper(top: isDing ? 0 : top),
                                child: NotificationListener<ScrollNotification>(
                                  onNotification: listener,
                                  child: Show(
                                    isShow: !(widget.isFreeAnchor && widget.anchorLiveStatus ==1),
                                    replacement: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: isDing
                                                  ? 1 //必须是1，否则下拉不了
                                                  : widget.matchDisplayHeight),
                                        ),
                                        Expanded(child: _body()),
                                      ],
                                    ),
                                    child: AiNestedScrollView(
                                        controller: scrollController,
                                        headerSliverBuilder: (_, __) {
                                          return [
                                            SliverList(
                                                delegate: SliverChildListDelegate([
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: isDing
                                                            ? 1 //必须是1，否则下拉不了
                                                            : widget
                                                            .matchDisplayHeight),
                                                  ),
                                                ]))
                                          ];
                                        },
                                        body: _body()),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    })
                ),
                Visibility(
                    visible: orientation == Orientation.portrait &&
                        widget.swiperController.index == 1,
                    child: SvgaGiftPlayer()),
                Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: Visibility(
                      visible: isListDetail,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: widget.topCover ?? Container(),
                        onTap: () {
//                            isListDetail = false;
                          if (widget.isMatchClose) {
                            widget.swiperController.move(0);
                          }
                          config.userInfo.isShowRefinedDetail = true;
                          if (mounted) setState(() {});
                          Event.eventBus.fire(
                              RefinedDetailEvent(isShowRefinedDetail: true));
                          if (config.isTabSDK) {
                            XcSdkApi.hideBottomBar();
                          }
                          if (ccRoute.hasShowOverlay(
                              FastAiRouteTableName.ActivityDrawFloat)) {
                            FloatActivityDrawCarHelper.activityDrawStatus(false,
                                isDetail: true);
                          }
                        },
                      ),
                    )),
                Visibility(
                  visible: orientation == Orientation.portrait,
                  child: Stack(
                    children: [
                      Positioned.fromRect(
                        rect: Rect.fromLTWH(
                            0,
                            0,
                            AiMeasure.screenWidth(context),
                             widget.topBarHeight),
                        child: Container(
                          height: widget.topBarHeight,
                          child: Show(
                            isShow: !widget.isFreeAnchor,
                            replacement: widget.chatroomTopBar,
                            child: PageView(
                              controller: barPageController,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                widget.betListTopBar,
                                widget.chatroomTopBar,
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: widget.topBarHeight,
                  right: 0,
                  height: widget.topFreeAnchorHeight,
                  child: Show(
                    isShow: widget.isFreeAnchor,
                    child: widget.chatroomTopFreeAnchor ?? SizedBox.shrink()
                  )
                )
              ],
            ),
          );
        },
      ),
    );
  }

  double hh = 800;
  StateSetter betListPageStateSetter;
  Drag _drag;
  //投注列表
  Widget betListPage() {
    if (widget.isFreeAnchor && widget.anchorLiveStatus == 1) {
      return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is UserScrollNotification) {
              if ((notification.direction == ScrollDirection.reverse &&
                      widget.swiperController.index == 0) ||
                  (notification.direction == ScrollDirection.forward &&
                      widget.swiperController.index == 1)) {
                _drag = widget.swiperController._pagePageController.position
                    .drag(DragStartDetails(), () {});
              }
            }
            if (notification is OverscrollNotification) {
              if (notification.dragDetails != null && _drag != null) {
                _drag?.update(notification.dragDetails);
              }
            }
            if (notification is ScrollEndNotification) {
              if (notification.dragDetails != null && _drag != null) {
                _drag?.end(notification.dragDetails);
              }
            }
            return false;
          },
          child: widget.betList);
    }

    return widget.betList;
  }

  //聊天页面
  Widget chatroomPage() {
    return widget.chatRoom;
  }

  AnimationController animationController;

  //不能有默认值
  double get maxTop => widget.matchDisplayHeight;

  //不能有top
  double top;

  Widget _body() {

    num liveStatus = widget?.detailSet?.detailParams?.liveStatus;
    bool isForbidScrollable = (liveStatus != null && liveStatus == 0) || widget.isFreeAnchor;
    return PageView(
       physics: ModuleSwitch.getInstance().chatRoom()
           ? (isForbidScrollable ? NeverScrollableScrollPhysics() : ClampingScrollPhysics())
           : NeverScrollableScrollPhysics(),
      controller: widget.swiperController.controller,
      onPageChanged: (index) {
        widget.swiperController.index = index;
//        if(widget.swiperController.controller.hasListeners){
//          widget.swiperController.controller.notifyListeners();
//        }
        if (index == 1) {
          GiftPlayServer.ins.resume();
        } else {
          GiftPlayServer.ins.removeAllGift();
          GiftPlayServer.ins.pause();
        }
        //投注页点击送礼按钮,SvgaGiftPlayer没有初始化导致送礼没有动效

        if (mounted) setState(() {});
        if (!widget.isListDetail) {
          if (index == 1) {
            onChooseChatRoom();
          } else {
            _isBan = false;
            //点一次进来是空的，然后根据滚球情况来决定是否要固定。
            if (null == _beforeDing) {
              _beforeDing = "RB" ==
                      widget?.dPageModel?.matchesDetailModel?.data?.showtype ??
                  false;
              widget.playGroupNavPingController.setPingStatus(_beforeDing);
              widget.onPingCallback?.call();
            } else {
              //恢复上一次的状态
              if (_beforeDing !=
                  widget.playGroupNavPingController.getPingStatus()) {
                widget.playGroupNavPingController.setPingStatus(_beforeDing);
                widget.onPingCallback?.call();
              }
            }
          }
        }
      },
      children: [
        Container(
          child: Show(
            isShow: widget.isFreeAnchor,
            child: Container(),
            replacement: betListPage(),
          ),
          padding: EdgeInsets.only(bottom: 1),
        ),
        Container(
            padding: EdgeInsets.only(bottom: 1),
            child: widget.chatRoom
        ),
      ],
    );
  }

  void onChooseChatRoom() {
    //聊天室需要固定.不能滑动。第一次进来需要判断当前玩法页面是否需要固定
    if (_beforeDing == null) {
      _beforeDing =
          "RB" == widget?.dPageModel?.matchesDetailModel?.data?.showtype ??
              false;
    } else {
      _beforeDing = widget.playGroupNavPingController.getPingStatus();
    }
    top = maxTop;
    dingTop = this.top + widget.topBarHeight + widget.gameInfoHeight;
    _isBan = true;
    widget.playGroupNavPingController.pingStatus = true;
    widget.onPingCallback?.call();
  }

  bool currentIsTop = false;

  bool listener(ScrollNotification notification) {
    if (notification.metrics.axis == Axis.horizontal) return false;

    //只允许列表头部下面的时候才允许下拉
    widget.onPull2FreshCallback
        ?.call(notification.metrics.pixels == 0 && notification.depth == 2);

    if ((notification.metrics.pixels == notification.metrics.maxScrollExtent &&
            notification.metrics.maxScrollExtent > 0) ||
        (notification.depth == 2 &&
            notification.metrics.pixels ==
                notification.metrics.maxScrollExtent)) {
      widget.chatRoomSliderBottom.value = true;
      widget.chatRoomSliderTop.value = false;

      widget.onPull2FreshCallback?.call(true);
      // print("chatRoomSliderBottom true");
    } else {
      widget.chatRoomSliderBottom.value = false;
      // print("chatRoomSliderBottom false");

      if (notification.metrics.pixels <= 1) {
        //第二页才允许下拉翻页
        if (1 == widget.swiperController.index) {
          widget.chatRoomSliderTop.value = false;
        }

        // print("chatRoomSliderTop true");
      } else {
        widget.chatRoomSliderTop.value = false;
        widget.onPull2FreshCallback?.call(true);
        // print("chatRoomSliderTop false");
      }
    }

    if (isDing) {
      return false;
    }
    if (0 == widget.swiperController.index) {
      widget.chatRoomSliderTop.value = false;
    }

    if (notification.depth == 0) {
      double temp = maxTop - notification.metrics.pixels;
      if (temp < 0) {
        temp = 0;
      }
      if (temp > maxTop) {
        temp = maxTop;
      }
      if (temp != top) {
        top = temp;
        if (top >= 0 && top <= maxTop) {
          widget.playGroupNavPingController.isOnTop = top < 1;
          betListPageStateSetter(() {});
        }
      }
      if (notification is ScrollEndNotification &&
          (animationController?.isCompleted ?? true)) {
        if (temp < MediaQuery.of(context).devicePixelRatio) {
          //释放的时候，notification有概率为0，这时候temp小于1。需要将这个返回，否则会滚动到上面
          return false;
        }
//        print(
//            "end>>---${notification.depth}--${notification.metrics.pixels}>>${notification.metrics.maxScrollExtent}--");
        top = maxTop - notification.metrics.pixels;
        if (top < 0) {
          top = 0;
        }
        if (top > maxTop) {
          top = maxTop;
        }
        if (top > 0 && top < maxTop) {
          if (lastTop != top && !isAnimMoving) {
            lastTop = top;
            isAnimMoving = true;
            var shouldScrollDown = lastTop > maxTop * 0.5;

            animationController?.dispose();
            animationController = AnimationController(
                vsync: this, duration: Duration(milliseconds: 300));
            final CurvedAnimation curve = new CurvedAnimation(
                parent: animationController, curve: Curves.easeOut);
            var start = top;
            var di = (top - maxTop).abs();
            curve.addStatusListener((status) {
              if (status == AnimationStatus.completed ||
                  status == AnimationStatus.dismissed) {
                isAnimMoving = false;
              }
            });
            curve.addListener(() {
              if (!shouldScrollDown) {
                top = start - start * curve.value;
              } else {
                top = start + curve.value * di;
              }
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                //裁剪的方向是和滚动相反，所以需要用最大值减去当前top
                var value = maxTop - top;
                //防止自动触发下拉
//                value = value < 1 ? 1 : value;
//                value = value == maxTop ? maxTop - 1 : value;
                if(widget.anchorLiveStatus != 1){
                   scrollController.jumpTo(value);
                }
              });
              if (betListPageStateSetter != null) {
                betListPageStateSetter(() {});
              }
              // print("top>>>>>>$top");
            });
            // if(shouldScrollDown){
            //   scrollController.animateTo(0, duration: Duration(
            //       milliseconds:100
            //   ), curve:  Curves.linearToEaseOut);
            // }else{
            //   scrollController.animateTo(maxTop, duration: Duration(
            //       milliseconds:100
            //   ), curve:  Curves.linearToEaseOut);
            // }

            // if (shouldScrollDown) {
            //    scrollController.jumpTo(0);
            //    currentIsTop = false;
            // } else {
            //    scrollController.jumpTo(maxTop);
            //    currentIsTop = true;
            // }

            animationController.forward();
          }
        }
      }
    }
    return false;
  }

  // // 后台是否配置了 - 联赛背景
  // bool _isShowLeagueBg() {
  //   String leagueBg = ?.data?.leagueBackgroundImage;
  //   return leagueBg != null && leagueBg != '';
  // }

  Widget background() {
    if (widget.isListDetail) {
      return Container();
    }
    String bg = widget.dPageModel?.matchBgImage();
    return (widget.dPageModel?.isShowLeagueBg() ?? false)
        ? AiImage.fromUrlWithXcFadeInImage(
            widget.dPageModel?.matchesDetailModel?.data?.leagueBackgroundImage,
            'assets/images/detail/$bg',
            fit: BoxFit.cover,
            width: AiMeasure.screenWidth(context),
            height: AiMeasure.screenHeight(context))
        : AiImage.asset('assets/images/detail/$bg',
            fit: BoxFit.cover,
            width: AiMeasure.screenWidth(context),
            height: AiMeasure.screenHeight(context));
  }
}

class MatchDetailController implements IDisposable {
  int page = 0;
  PageController _pagePageController;
  bool isInit = false;

  MatchDetailController.create({int initPage = 0}) {
    _pagePageController = new PageController(initialPage: initPage);
    this.page = initPage;
  }

  PageController get controller => _pagePageController;

  int get index => this.page;

  set index(int page) {
    this.page = page;
  }

  double get offset => _pagePageController.offset;

  void addListener(VoidCallback listener) {
    _pagePageController.addListener(listener);
  }

  void removeListener(VoidCallback listener) {
    _pagePageController.removeListener(listener);
  }

  void move(int page) {
    this.page = page;
    _pagePageController.jumpToPage(page);
  }

  void runOnParentInitState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (page != _pagePageController.initialPage) {
        _pagePageController.jumpToPage(page);
      }
    });
  }

  @override
  void dispose() {
    _pagePageController.dispose();
  }
}

class _EmptyClipper extends CustomClipper<Path> {
  final double top;

  _EmptyClipper({this.top = 0});

  @override
  Path getClip(Size clipSize) {
    var path = Path();
    path.moveTo(0, top);
    path.lineTo(clipSize.width, top);
    path.lineTo(clipSize.width, clipSize.height);
    path.lineTo(0, clipSize.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
