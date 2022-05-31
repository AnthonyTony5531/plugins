/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-30
 * 说明：显示弹窗口
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//import 'overlay/match_collected_overlay.dart';

const Duration _sheetDuration = Duration(milliseconds: 200);
const double _minFlingVelocity = 100.0;
const double _closeProgressThreshold = 0.5;

class PopupSliderPageRoute extends PopupRoute {
  PopupSliderPageRoute({
    @required Widget child,
    RouteSettings settings,
    this.theme,
    this.floatOverlay,
    this.popAnimate = PopAnimate.Right,
    this.onClosing,
  }) : super(settings: settings) {
    this.child = NotificationListener(
      onNotification: (_) {
        return true;
      },
      child: child,
    );
  }

  Widget child;
  final ThemeData theme;
  final PopAnimate popAnimate;
  final FloatOverlay floatOverlay;
  final VoidCallback onClosing; //关闭页面

  @override
  Duration get transitionDuration => _sheetDuration;

  @override
  bool get barrierDismissible => true;

  @override
  final String barrierLabel = "";

  @override
  Color get barrierColor => Colors.black54;

  AnimationController _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController = PopupSliderSheet.createAnimationController(navigator.overlay);
    return _animationController;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    print("buildPage>>>>>>>>>${animation.value}");

    Widget popupSheet = _PopupSliderPageSheet(
      route: this,
      floatOverlay: this.floatOverlay,
      child: child,
      onClosing: onClosing,
      popAnimate: popAnimate,
    );
    if (theme != null) popupSheet = Theme(data: theme, child: popupSheet);
    return popupSheet;
  }

  @override
  TickerFuture didPush() {
    // TODO: implement didPush
    return super.didPush();
  }
}

class _PopupSliderPageSheet extends StatefulWidget {
  const _PopupSliderPageSheet({
    Key key,
    this.route,
    this.floatOverlay,
    this.onClosing,
    this.popAnimate,
    @required this.child,
  }) : super(key: key);

  final PopupSliderPageRoute route;
  final Widget child;
  final FloatOverlay floatOverlay;
  final VoidCallback onClosing; //关闭页面
  final PopAnimate popAnimate;

  @override
  _PopupSliderPageSheetState createState() => _PopupSliderPageSheetState();
}

class _PopupSliderPageSheetState extends State<_PopupSliderPageSheet> {
  bool _isInitComplete = false;

  @override
  void initState() {
    super.initState();
    widget.route.animation?.addListener(_onAnimationListener);
  }

  @override
  void dispose() {
    widget.route.animation?.removeListener(_onAnimationListener);
    super.dispose();
  }

  void _onAnimationListener() {
    if (!_isInitComplete && widget.route.animation.isCompleted) {
      _isInitComplete = true;
      setState(() {});
    }
  }

  String _getRouteLabel(MaterialLocalizations localizations) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return '';
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return localizations.dialogLabel;
      default:
        return null;
    }
    // return null;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final String routeLabel = _getRouteLabel(localizations);

    if(widget.popAnimate == PopAnimate.Fade){
      return AnimatedBuilder(
        animation: widget.route._animationController,
        builder: (BuildContext context, Widget child) {
          double animationValue = mediaQuery.accessibleNavigation ? 1.0 : widget.route.animation.value;
          if(!_isInitComplete){
            animationValue = 1.0;
          }
          return Semantics(
            scopesRoute: true,
            namesRoute: true,
            label: routeLabel,
            explicitChildNodes: true,
            child: ClipRect(
              child: AbsorbPointer(
                absorbing: !_isInitComplete,
                child: CustomSingleChildLayout(
                  delegate: _PopupSliderPageSheetLayout(animationValue),
                  child: PopupSliderSheet(
                      floatOverlay: widget.floatOverlay,
                      animationController: widget.route._animationController,
                      onClosing: () {
                        if (widget.route.isCurrent) {
                          AiRouter.pop(context);
                          Future.delayed(Duration(milliseconds: 100), () {
                            try {
                              if (widget?.onClosing != null) {
                                widget?.onClosing();
                              }
                            } catch (e, s) {
                              print("widget?.onClosing》》》》》》》》》》》$e$s");
                            }
                          });
                        }
                      },
                      child: widget.child),
                ),
              ),
            ),
          );
        },
      );
    }
    return AnimatedBuilder(
      animation: widget.route.animation,
      builder: (BuildContext context, Widget child) {
        final double animationValue = mediaQuery.accessibleNavigation ? 1.0 : widget.route.animation.value;
        return Semantics(
          scopesRoute: true,
          namesRoute: true,
          label: routeLabel,
          explicitChildNodes: true,
          child: ClipRect(
            child: AbsorbPointer(
              absorbing: !_isInitComplete,
              child: CustomSingleChildLayout(
                delegate: _PopupSliderPageSheetLayout(animationValue),
                child: PopupSliderSheet(
                    floatOverlay: widget.floatOverlay,
                    animationController: widget.route._animationController,
                    onClosing: () {
                      if (widget.route.isCurrent) {
                        AiRouter.pop(context);
                        Future.delayed(Duration(milliseconds: 100), () {
                          try {
                            if (widget?.onClosing != null) {
                              widget?.onClosing();
                            }
                          } catch (e, s) {
                            print("widget?.onClosing》》》》》》》》》》》$e$s");
                          }
                        });
                      }
                    },
                    child: widget.child),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PopupSliderPageSheetLayout extends SingleChildLayoutDelegate {
  _PopupSliderPageSheetLayout(
    this.progress,
  );

  final double progress;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      maxHeight: constraints.maxHeight,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(size.width - childSize.width * progress, 0);
  }

  @override
  bool shouldRelayout(_PopupSliderPageSheetLayout oldDelegate) {
    print("shouldRelayout>>>>>>>>>${oldDelegate.progress}");
    return progress != oldDelegate.progress;
  }
}

class PopupSliderSheet extends StatefulWidget {
  const PopupSliderSheet({
    Key key,
    this.animationController,
    @required this.onClosing,
    this.floatOverlay,
    @required this.child,
  })  : assert(onClosing != null),
        super(key: key);

  final AnimationController animationController;
  final VoidCallback onClosing;
  final FloatOverlay floatOverlay;

  final Widget child;

  @override
  _PopupSliderSheetState createState() => _PopupSliderSheetState();

  static AnimationController createAnimationController(TickerProvider vsync) {
    return AnimationController(
      duration: _sheetDuration,
      debugLabel: 'PopupSliderSheet',
      vsync: vsync,
    );
  }
}

class _PopupSliderSheetState extends State<PopupSliderSheet> {
  final GlobalKey _childKey = GlobalKey(debugLabel: 'PopupSliderSheet child');

  double get _childWidth {
    final RenderBox renderBox = _childKey.currentContext.findRenderObject();
    return renderBox.size.width;
  }

  bool get _dismissUnderway => widget.animationController.status == AnimationStatus.reverse;

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_dismissUnderway) return;
    //print("details.localPosition.dy ${details.localPosition.dy}");

    widget.animationController.value -= details.primaryDelta / (_childWidth ?? details.primaryDelta);
    _overlayEntrykey.currentState?.updateDrag(details.localPosition);
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_dismissUnderway) return;
    _overlayEntrykey.currentState?.updateProgressEnd();
    if (details.velocity.pixelsPerSecond.dx > _minFlingVelocity) {
      final double flingVelocity = -details.velocity.pixelsPerSecond.dx / _childWidth;
      if (widget.animationController.value > 0.0) {
        widget.animationController.fling(velocity: flingVelocity);
      }
      if (flingVelocity < 0.0) {
        widget.onClosing();
      }
    } else if (widget.animationController.value < _closeProgressThreshold) {
      if (widget.animationController.value > 0.0) widget.animationController.fling(velocity: -1.0);
      widget.onClosing();
    } else {
      widget.animationController.forward();
    }
  }

  static OverlayEntry overlayEntry;
  GlobalKey<AbFloatOverlayState> _overlayEntrykey;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _overlayEntrykey = new GlobalKey<AbFloatOverlayState>();
      overlayEntry?.remove();
      overlayEntry = FloatOverlayStateFactory.createOverlayEntry(key: _overlayEntrykey, overlay: widget.floatOverlay);
      if (null != overlayEntry) {
        Overlay.of(context).insert(overlayEntry);
      }
    });
    widget.animationController.addListener(() {
      _overlayEntrykey.currentState?.updateProgress(widget.animationController.value);
    });
  }

  @override
  void dispose() {
    overlayEntry?.remove();
    overlayEntry = null;
    super.dispose();
  }

  double _offsetX = 0;
  double _offsetY = 0;
  bool _isWorking = false;

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.axisDirection == AxisDirection.right) {
      _isWorking = true;
      return false;
    }
    return false;
  }

  bool _onNotification(Notification notification) {
    if (notification is ScrollNotification) {
      if (notification.metrics.axisDirection == AxisDirection.left) {
        _isWorking = true;
      }
    }

    // print(notification);
    if (notification is ScrollStartNotification) {
      _offsetX = notification?.dragDetails?.localPosition?.dx ?? 0;
      _offsetY = notification?.dragDetails?.localPosition?.dy ?? 0;
      _isWorking = false;
    } else if (notification is UserScrollNotification) {
      if (_isWorking && notification.direction == ScrollDirection.reverse) {
        if (widget.animationController.value < 1) {
          _isWorking = false;
          widget.animationController.forward();
        }
      }
    } else if (notification is OverscrollNotification) {
      if (_isWorking && FloatOverlay.MatchesCollectedOverlay != widget.floatOverlay) {
        var dy = notification.dragDetails?.localPosition?.dy ?? 0;
        var dx = notification.dragDetails?.localPosition?.dx ?? 0;
        var offdx = dx - _offsetX;
        var offdy = dy - _offsetY;
        // print("$dx $dy");

        if (offdx > offdy) {
          var width = MediaQuery.of(context).size.width;
          var a = (dx - _offsetX) / width;
          widget.animationController.value = 1 - a;
        }
      }
    } else if (notification is ScrollEndNotification) {
      if (widget.animationController.value < 0.8) {
        if (widget.animationController.value > 0.0) widget.animationController.fling(velocity: -1.0);
        widget.onClosing();
      } else {
        widget.animationController.forward();
      }
    }
    return false;
  }

  bool extentChanged(DraggableScrollableNotification notification) {
    if (notification.extent == notification.minExtent) {
      widget.onClosing();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final ShapeBorder shape = null;
    double topPadding = 0.0;
    if (DetailPage.currentPageIsDetailPage) {
      // topOffset + topHeadHeight + gameInfoHeight
      topPadding = AiMeasure.topOffset(context) + 102;
    }
    var sliderBorder = NotificationListener<DraggableScrollableNotification>(
        onNotification: extentChanged,
        child: Container(
          color: Color(0x01000000),
          width: 20,
          margin: EdgeInsets.only(top: topPadding + 70),
          height: MediaQuery.of(context).size.height - topPadding,
        ));

    var gesBorder = GestureDetector(
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      excludeFromSemantics: true,
      child: sliderBorder,
    );

    final Widget bodySheet = Material(
        key: _childKey,
        color: Colors.transparent,
        elevation: 0,
        shape: shape,
        child: Stack(
          children: <Widget>[
            NotificationListener<DraggableScrollableNotification>(
                onNotification: extentChanged,
                child: NotificationListener<ScrollNotification>(
                  onNotification: _handleScrollNotification,
                  child: NotificationListener(
                    onNotification: _onNotification,
                    child: widget.child,
                  ),
                )),
            Align(
              alignment: Alignment(-1, 0),
              child: gesBorder,
            )
          ],
        ));
    return bodySheet;
  }
}

enum FloatOverlay {
  MatchesCollectedOverlay,
  None,
}

class FloatOverlayStateFactory {
  static OverlayEntry createOverlayEntry({GlobalKey<AbFloatOverlayState> key, FloatOverlay overlay}) {
    Widget child;
    switch (overlay) {
      case FloatOverlay.MatchesCollectedOverlay:
//        child = MatchesCollectedOverlay(
//          key: key,
//        );
        break;
      case FloatOverlay.None:
        break;
    }
    return null == child
        ? null
        : OverlayEntry(builder: (context) {
            return child;
          });
  }
}

abstract class AbFloatOverlayState<T extends StatefulWidget> extends State<T> {
  void updateProgress(double value);

  void updateDrag(Offset offset);

  void updateProgressEnd();
}

Future showSliderPageSheet(BuildContext context, Widget child,
    {FloatOverlay floatOverlay, dynamic params, RouteSettings settings, VoidCallback onClosing}) {
  return AiRouter.pushWithRoute(
      context,
      PopupSliderPageRoute(
        settings: settings,
        popAnimate: PopAnimate.Right,
        floatOverlay: floatOverlay,
        child: child,
        onClosing: onClosing,
      ),
      params: params);
}

Future showSliderPageSheet2(BuildContext context, Widget child,{RouteSettings settings}) async {
  var ret = Navigator.of(context).pushReplacement(
    PopupSliderPageRoute(popAnimate: PopAnimate.Right, child: child, floatOverlay: FloatOverlay.MatchesCollectedOverlay,settings: settings),
  );

  AiRouter.updateEdgePopGestureStatus(context);
  return ret;
}

hideSliderPageSheet(BuildContext context) {
  AiRouter.pop(context);
}
