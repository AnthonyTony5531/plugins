import 'package:fast_ai/migrate_plugins/xcpageslider/page_slider_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fast_ai/migrate_plugins/xcpageslider/page_slider.dart';

class ChatRoomSliderContainerWidget extends StatefulWidget {
  final Widget body;
  final bool isListDetail;
  final ValueNotifier<bool> isChatBottomNotifier;
  final ValueNotifier<bool> isChatTopNotifier;
  final OnPageStatusChanged onPageStatusChanged;

  ChatRoomSliderContainerWidget({
    this.body,
    this.isListDetail,
    this.isChatBottomNotifier,
    this.isChatTopNotifier,
    this.onPageStatusChanged,
  });

  @override
  _ChatRoomSliderContainerWidgetState createState() =>
      _ChatRoomSliderContainerWidgetState();
}

class _ChatRoomSliderContainerWidgetState
    extends State<ChatRoomSliderContainerWidget> with TickerProviderStateMixin {
  PageSliderController controller;

  AnimationController animationControllerY;

  Offset offsetStart = Offset.zero;

  Offset offsetChange = Offset.zero;

  Animation animationY;

  DateTime dateTime = DateTime.now();

  bool _isTopOver = true;
  bool _isBottomOver = false;

  @override
  void initState() {
    super.initState();
    widget.isChatBottomNotifier?.addListener(_onChatRoomIsBottomChange);
    widget.isChatTopNotifier?.addListener(_onChatRoomIsTopChange);
  }

  @override
  void dispose() {
    widget.isChatBottomNotifier?.removeListener(_onChatRoomIsBottomChange);
    widget.isChatTopNotifier?.removeListener(_onChatRoomIsTopChange);
    animationControllerY?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ChatRoomSliderContainerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isChatBottomNotifier != null &&
        oldWidget.isChatBottomNotifier != widget.isChatBottomNotifier) {
      oldWidget.isChatBottomNotifier?.removeListener(_onChatRoomIsBottomChange);
      widget.isChatBottomNotifier?.addListener(_onChatRoomIsBottomChange);
    }

    if (oldWidget.isChatTopNotifier != null &&
        oldWidget.isChatTopNotifier != widget.isChatTopNotifier) {
      oldWidget.isChatTopNotifier?.removeListener(_onChatRoomIsTopChange);
      widget.isChatTopNotifier?.addListener(_onChatRoomIsTopChange);
    }
  }

  void _onChatRoomIsBottomChange() {
    _isBottomOver = widget.isChatBottomNotifier?.value ?? false;
  }

  void _onChatRoomIsTopChange() {
    _isTopOver = widget.isChatTopNotifier?.value ?? false;
  }

  bool enableNext = false;

  @override
  Widget build(BuildContext context) {
    double validArea = MediaQuery.of(context).size.width * 0.8;

    controller ??= Provider.of<PageSliderController>(context);
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) {
        if (animationControllerY?.isAnimating ?? false) return;
        if (event.localPosition.dx > validArea) return;
        offsetStart = event.localPosition;
        dateTime = DateTime.now();
        enableNext =
            widget.isChatBottomNotifier.value || widget.isChatTopNotifier.value;
        widget.onPageStatusChanged
            ?.call(PageSliderDirection.Unknow, PageSliderStatus.DraggDown);
      },
      onPointerMove: (event) {
        if (!enableNext) return;
        _isBottomOver = widget.isChatBottomNotifier.value;
        _isTopOver = widget.isChatTopNotifier.value;
        if (offsetStart.distance == 0.0) return;
        if (animationControllerY?.isAnimating ?? false) return;
        var offsetY = (event.localPosition.dy - offsetStart.dy) * 0.4;
        bool isSlide2Top = offsetY < 0;

        //如果是上推，且 _isBottomOver不满足
        if (isSlide2Top && !_isBottomOver) {
          enableNext = false;
          return;
        }
        //如果是下推，且头部没滚动到0状态
        if (!isSlide2Top && !_isTopOver) {
          enableNext = false;
          return;
        }

        widget.onPageStatusChanged?.call(
            offsetY > 0 ? PageSliderDirection.Up : PageSliderDirection.Down,
            PageSliderStatus.Dragging);

        // 到底部只能上拉情况
        offsetChange += Offset(0, offsetY);
        if (offsetChange.dy.abs() > 80) {
          widget.onPageStatusChanged?.call(
              offsetY > 0 ? PageSliderDirection.Up : PageSliderDirection.Down,
              PageSliderStatus.EnableRelease);
        }
        if (_isBottomOver && !_isTopOver) {
          if (offsetChange.dy > 0) offsetChange = Offset.zero;
        }

        // 到头部只能下拉情况
        if (_isTopOver && !_isBottomOver) {
          if (offsetChange.dy < 0) offsetChange = Offset.zero;
        }

        controller.offset = offsetChange;
        offsetStart = event.localPosition;
      },
      onPointerCancel: (event) {
        if (animationControllerY?.isAnimating ?? false) return;
        offsetStart = Offset.zero;
        back2Zero();
      },
      onPointerUp: (event) {
        if (offsetStart.distance == 0.0) return;
        if (animationControllerY?.isAnimating ?? false) return;
        offsetStart = Offset.zero;
        var value = offsetChange.dy;
        num distime = DateTime.now().millisecondsSinceEpoch -
            dateTime.millisecondsSinceEpoch;

        //上下拉阀值设置为100,不允许快速滑动
        if (distime > 300 && value.abs() > 80) {

          // 上拉
          if (value > 0) {
            widget.onPageStatusChanged
                ?.call(PageSliderDirection.Up, PageSliderStatus.Release);
            moveWithAnimation(offsetChange.dy,
                endY: controller.containerHeight,
                milliseconds: 500, listener: (status) {
              if (status == AnimationStatus.completed ||
                  status == AnimationStatus.dismissed) {
                controller.offset = Offset.zero;
                offsetChange = Offset.zero;
                widget.onPageStatusChanged
                    ?.call(PageSliderDirection.Up, PageSliderStatus.Refreshing)
                    ?.whenComplete(() {
                  widget.onPageStatusChanged
                      ?.call(PageSliderDirection.Unknow, PageSliderStatus.Done);
                });
              }
            });
          } else {
            widget.onPageStatusChanged
                ?.call(PageSliderDirection.Down, PageSliderStatus.Release);
            moveWithAnimation(offsetChange.dy,
                endY: -controller.containerHeight,
                milliseconds: 500, listener: (status) {
              if (status == AnimationStatus.completed ||
                  status == AnimationStatus.dismissed) {
                controller.offset = Offset.zero;
                offsetChange = Offset.zero;
                widget.onPageStatusChanged
                    ?.call(
                        PageSliderDirection.Down, PageSliderStatus.Refreshing)
                    ?.whenComplete(() {
                  widget.onPageStatusChanged
                      ?.call(PageSliderDirection.Unknow, PageSliderStatus.Done);
                });
              }
            });
          }
        } else if (value.abs() > 5) {
          back2Zero();
        } else {
          controller.offset = Offset.zero;
        }
      },
      child: widget.body ?? SizedBox.shrink(),
    );
  }

  void back2Zero() {
    moveWithAnimation(offsetChange.dy);
  }

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
          controller.offset = Offset(0, animationY.value);
        });
      })
      ..addStatusListener(listener ??
          (status) {
            if (status == AnimationStatus.completed ||
                status == AnimationStatus.dismissed) {
              controller.offset = Offset.zero;
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
}
