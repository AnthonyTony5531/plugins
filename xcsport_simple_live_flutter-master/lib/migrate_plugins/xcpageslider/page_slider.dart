//**********************************************************************
//* author:Sam
//* date:2020-08-26
//**********************************************************************
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page_slider_container.dart';

//上下切换容器的滑板.如果PageSlider不是在PageSliderContainer的body里面，需要传递controller

typedef OnPageStatusChanged = Future<void> Function(
    PageSliderDirection direction, PageSliderStatus status);

class PageSlider extends StatefulWidget {
  final PageSliderController controller;
  final OnPageStatusChanged onPageStatusChanged;

  final Widget child;
  final bool enablePullDownSwitchPage;
  final bool enablePullUpSwitchPage;

  PageSlider({
    Key key,
    this.controller,
    @required this.child,
    @required this.onPageStatusChanged,
    this.enablePullDownSwitchPage = true,
    this.enablePullUpSwitchPage = true,
  }) : super(key: key);

  @override
  _PageSliderState createState() => _PageSliderState();
}

const double DragReleaseDistance = 120;

class _PageSliderState extends State<PageSlider> with TickerProviderStateMixin {
  PageSliderController controller;

  AnimationController animationControllerY;

  @override
  void initState() {
    controller = widget.controller;

    super.initState();
  }

  Offset offsetStart = Offset.zero;

  Offset offsetChange = Offset.zero;

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    controller ??= context?.read<PageSliderController>();

    return GestureDetector(
      onVerticalDragDown: (details) {
        if (animationControllerY?.isAnimating ?? false) {
          return;
        }
        offsetStart = details.localPosition;
        dateTime = DateTime.now();
        widget.onPageStatusChanged
            ?.call(PageSliderDirection.Unknow, PageSliderStatus.DraggDown);
      },
      onVerticalDragStart: (details) {
        if (animationControllerY?.isAnimating ?? false) {
          return;
        }
        offsetStart = details.localPosition;
        dateTime = DateTime.now();
        widget.onPageStatusChanged
            ?.call(PageSliderDirection.Unknow, PageSliderStatus.DraggDown);
      },
      onVerticalDragCancel: () {
        back2Zero();
      },
      onVerticalDragEnd: (details) {
        var value = offsetChange.dy;

        //上下拉阀值设置为100,或者快速滑动也可以
        if (value.abs() > DragReleaseDistance ||
            (DateTime
                .now()
                .millisecondsSinceEpoch -
                dateTime.millisecondsSinceEpoch <
                200)) {
          //下拉
          if (value > 0) {
            if (!widget.enablePullDownSwitchPage) {
              back2Zero();
              return;
            }
            widget.onPageStatusChanged?.call(
                PageSliderDirection.Up, PageSliderStatus.Release);
            moveWithAnimation(offsetChange.dy,
                endY: controller?.containerHeight,
                milliseconds: 500, listener: (status) {
                  if (status == AnimationStatus.completed ||
                      status == AnimationStatus.dismissed) {
                    controller?.offset = Offset.zero;
                    offsetChange = Offset.zero;
                    widget.onPageStatusChanged?.call(
                        PageSliderDirection.Up, PageSliderStatus.Refreshing)
                        ?.whenComplete(() =>
                        () {
                      widget.onPageStatusChanged
                          ?.call(
                          PageSliderDirection.Unknow, PageSliderStatus.Done);
                    });
                  }
                });
          } else {
            if (!widget.enablePullUpSwitchPage) {
              back2Zero();
              return;
            }
            widget.onPageStatusChanged?.call(
                PageSliderDirection.Down, PageSliderStatus.Release);
            moveWithAnimation(offsetChange.dy,
                endY: -controller?.containerHeight,
                milliseconds: 500, listener: (status) {
                  if (status == AnimationStatus.completed ||
                      status == AnimationStatus.dismissed) {
                    controller?.offset = Offset.zero;
                    offsetChange = Offset.zero;
                    widget.onPageStatusChanged?.call(
                        PageSliderDirection.Down, PageSliderStatus.Refreshing)
                        ?.whenComplete(() =>
                        () {
                      widget.onPageStatusChanged
                          ?.call(
                          PageSliderDirection.Unknow, PageSliderStatus.Done);
                    });
                  }
                });
          }
        } else if (value.abs() > 5) {
          back2Zero();
        } else {
          controller?.offset = Offset.zero;
          widget.onPageStatusChanged
              ?.call(PageSliderDirection.Unknow, PageSliderStatus.Done);
        }
      },
      onVerticalDragUpdate: (details) {
        if (animationControllerY?.isAnimating ?? false) {
          return;
        }

        var offsetY = (details.localPosition.dy - offsetStart.dy) * 0.4;
        offsetChange = Offset(0, offsetY);

        PageSliderDirection dragDirection = offsetY > 0 ? PageSliderDirection
            .Up : PageSliderDirection.Down;
        controller?.offset = offsetChange;
        widget.onPageStatusChanged?.call(
            dragDirection,
            PageSliderStatus.Dragging);

        if (offsetChange.dy.abs() > DragReleaseDistance) {
          widget.onPageStatusChanged?.call(
              dragDirection,
              PageSliderStatus.EnableRelease);
        }
      },
      child: widget.child,
    );
  }

  bool get isPullDown {
    return offsetChange.dy > offsetStart.dy;
  }

  void back2Zero() {
    moveWithAnimation(offsetChange.dy);
  }

  Animation animationY;

  void moveWithAnimation(double offsetY,
      {double endY = 0.0,
        int milliseconds = 500,
        AnimationStatusListener listener}) {
    animationControllerY?.dispose();
    animationControllerY = AnimationController(
        duration: Duration(milliseconds: milliseconds), vsync: this);
    final curve = CurvedAnimation(
        parent: animationControllerY, curve: Curves.easeOutCubic);
    animationY = Tween(begin: offsetY, end: endY).animate(curve)
      ..addListener(() {
        setState(() {
          controller?.offset = Offset(0, animationY.value);
        });
      })
      ..addStatusListener(listener ??
              (status) {
            if (status == AnimationStatus.completed ||
                status == AnimationStatus.dismissed) {
              controller?.offset = Offset.zero;
              offsetChange = Offset.zero;
              widget.onPageStatusChanged?.call(
                  offsetY > 0
                      ? PageSliderDirection.Up
                      : PageSliderDirection.Down,
                  PageSliderStatus.Done);
            }
          });
    animationControllerY.forward();
  }

  @override
  void dispose() {
    controller?.offset = Offset.zero;
    animationControllerY?.dispose();
    super.dispose();
  }
}

enum PageSliderStatus {
  Done, //静止状态
  DraggDown, //拖动按下
  Dragging, //拖拽中。。
  EnableRelease, //可以松手刷新
  Release, //已松手准备刷新
  Refreshing, //刷新中
}

enum PageSliderDirection {
  //下拉
  Down,
  //上拉
  Up,
  //还没能判断是什么方向
  Unknow,
}
