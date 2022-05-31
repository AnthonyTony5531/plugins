/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-30
 * 说明：显示弹窗口
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/


import 'package:fast_ai/router.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const Duration _sheetDuration = Duration(milliseconds: 200);
const double _minFlingVelocity = 100.0;
const double _closeProgressThreshold = 0.5;

class _PopupPageRoute extends PopupRoute {
  _PopupPageRoute({
    @required this.child,
    RouteSettings settings,
    this.theme,
    this.popAnimate = PopAnimate.Right,
    this.isForbidSideslip = false,      // 显示503系统维护页时禁止返回
  }) : super(settings: settings);

  final Widget child;
  final ThemeData theme;
  final PopAnimate popAnimate;
  final bool isForbidSideslip;

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
    _animationController = PopupSheet.createAnimationController(navigator.overlay);
    return _animationController;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {

    Widget body;
    if(popAnimate == PopAnimate.Fade){
      body = FadeTransition(
        opacity: animation,
        child: child
      );
    }

    if(popAnimate == PopAnimate.Scale){
      body = ScaleTransition(
        child: child, 
        scale: animation,
      );
    }


    if(popAnimate == PopAnimate.Rotation){
      body = RotationTransition(
        child: child, 
        turns: animation,
      );
    }

    if(popAnimate == PopAnimate.Size){
      body = SizeTransition(
        child: child, 
        sizeFactor: animation,
      );
    }

    if(popAnimate == PopAnimate.Right){
      var positionRight = Tween(begin: Offset(1, 0),end: Offset(0, 0)).animate(animation);
      body = SlideTransition(
        child: child, 
        position: positionRight,
      );
    }

    if(popAnimate == PopAnimate.Left){
      var positionLeft = Tween(begin: Offset(-1, 0),end: Offset(0, 0)).animate(animation);
      body = SlideTransition(
        child: child, 
        position: positionLeft,
      );
    }
    
    if(popAnimate == PopAnimate.Up){
      var positionUp = Tween(begin: Offset(0, 1),end: Offset(0, 0)).animate(animation);
      body = SlideTransition(
        child: child, 
        position: positionUp,
      );
    }

    if(popAnimate == PopAnimate.Down){
      var positionDown = Tween(begin: Offset(0, -1),end: Offset(0, 0)).animate(animation);
      body = SlideTransition(
        child: child, 
        position: positionDown,
      );
    }

    // Widget popupSheet = MediaQuery.removePadding(
    //   context: context,
    //   // removeTop: true,
    //   child: _PopupPageSheet(
    //     route: this,
    //     child: child,
    //   ),
    // );

    Widget popupSheet = _PopupPageSheet(
        route: this,
        child: child,
        isForbidSideslip: isForbidSideslip,
      );

    if (theme != null)
      popupSheet = Theme(data: theme, child: popupSheet);
    // 显示503系统维护页时禁止返回
    if (isForbidSideslip) {
      return WillPopScope(
        child: popupSheet,
        onWillPop: (){
          return Future.value(false);
        },
      );
    }
    else{
      return popupSheet;
    }
  }
}

class _PopupPageSheet extends StatefulWidget {
  const _PopupPageSheet({
    Key key,
    this.route, 
    this.isForbidSideslip = false,
    @required this.child, 
  }) : super(key: key);

  final _PopupPageRoute route;
  final Widget child;
  final bool isForbidSideslip;


  @override
  _PopupPageSheetState createState() => _PopupPageSheetState();
}

class _PopupPageSheetState extends State<_PopupPageSheet> {
  String _getRouteLabel(MaterialLocalizations localizations) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return '';
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return localizations.dialogLabel;
      default :
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
            child: CustomSingleChildLayout(
              delegate: _PopupPageSheetLayout(animationValue),
              child: PopupSheet(
                animationController: widget.route._animationController,
                onClosing: () {
                  if (widget.route.isCurrent) {
                    AiRouter.pop(context);
                  }
                },
                child: widget.child,
                isForbidSideslip: widget.isForbidSideslip,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PopupPageSheetLayout extends SingleChildLayoutDelegate {
  _PopupPageSheetLayout(
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
  bool shouldRelayout(_PopupPageSheetLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}


class PopupSheet extends StatefulWidget {
  const PopupSheet({
    Key key,
    this.animationController,
    this.isForbidSideslip = false,
    @required this.onClosing,
    @required this.child,
  }) : assert(onClosing != null),
       super(key: key);

  final AnimationController animationController;
  final VoidCallback onClosing;
  final Widget child;
  final bool isForbidSideslip;

  @override
  _PopupSheetState createState() => _PopupSheetState();
  static AnimationController createAnimationController(TickerProvider vsync) {
    return AnimationController(
      duration: _sheetDuration,
      debugLabel: 'PopupSheet',
      vsync: vsync,
    );
  }
}

class _PopupSheetState extends State<PopupSheet> {
  final GlobalKey _childKey = GlobalKey(debugLabel: 'PopupSheet child');
  double get _childWidth {
    final RenderBox renderBox = _childKey.currentContext.findRenderObject();
    return renderBox.size.width;
  }
  bool get _dismissUnderway => widget.animationController.status == AnimationStatus.reverse;
  double _dx = 0;
  double _dy = 0;
  bool isWorking = false;
  void _handleDragStart(DragStartDetails details) {
    if (widget.isForbidSideslip) {
      return;
    }
    _dx = details.localPosition?.dx ?? 0;
    _dy = details.localPosition?.dy ?? 0;
    if (_dismissUnderway)
      return;

    isWorking = false;
  }
  void _handleDragUpdate(DragUpdateDetails details) {
    if (widget.isForbidSideslip) {
      return;
    }
    var tdx = details.localPosition?.dx ?? 0;
    var tdy = details.localPosition?.dy ?? 0;
    var dx = tdx - _dx;
    var dy = tdy - _dy;

    // print('dx:$dx dy:$dy , _dx:$_dx _dy:$_dy , tdx:$tdx tdy:$tdy');
    if(dx < dy)
      return;

    if (_dismissUnderway)
      return;

    // print('dx:$dx dy:$dy');

    isWorking = true;
    widget.animationController.value -= details.primaryDelta / (_childWidth ?? details.primaryDelta);
  }
  void _handleDragEnd(DragEndDetails details) {
    // var dx = details.localPosition?.dx ?? 0 - _dx;
    // var dy = details.localPosition?.dy ?? 0 - _dy;
    // if(dx < dy)
    //   return;
    if (_dismissUnderway)
      return;
    if(!isWorking)
      return;
    if (details.velocity.pixelsPerSecond.dx > _minFlingVelocity) {
      final double flingVelocity = -details.velocity.pixelsPerSecond.dx / _childWidth;
      if (widget.animationController.value > 0.0) {
        widget.animationController.fling(velocity: flingVelocity);
      }
      if (flingVelocity < 0.0) {
        widget.onClosing();
      }
    } else if (widget.animationController.value < _closeProgressThreshold) {
      if (widget.animationController.value > 0.0)
        widget.animationController.fling(velocity: -1.0);
      widget.onClosing();
    } else {
      widget.animationController.forward();
   }
  }

  double _offsetX = 0;
  double _offsetY = 0;
  bool _isWorking = false;
  bool _handleScrollNotification(ScrollNotification notification){
    if(notification.metrics.axisDirection == AxisDirection.right){
      _isWorking = true;
      return false;
    }
    return false;
  }
  bool _onNotification(Notification notification){

    if(notification is ScrollStartNotification){
      _offsetX = notification?.dragDetails?.localPosition?.dx ?? 0;
      _offsetY = notification?.dragDetails?.localPosition?.dy ?? 0;
      _isWorking = false;
    }else if(notification is UserScrollNotification){
      if(_isWorking && notification.direction == ScrollDirection.reverse){
        if(widget.animationController.value < 1){
          _isWorking = false;
          widget.animationController.forward();
        }
      }
    }else if(notification is OverscrollNotification){
      if(_isWorking){
        var dy = notification.dragDetails?.localPosition?.dy ?? 0;
        var dx = notification.dragDetails?.localPosition?.dx ?? 0;
        var offdx = dx - _offsetX;
        var offdy = dy - _offsetY;
        // print("$dx $dy");

        if(offdx > offdy){
           var width = MediaQuery.of(context).size.width;
           var a = (dx - _offsetX) / width;
           widget.animationController.value =  1- a;
        }
      }
    }else if(notification is ScrollEndNotification){
        if (widget.animationController.value < 0.8) {
            if (widget.animationController.value > 0.0)
              widget.animationController.fling(velocity: -1.0);
            if(_isWorking){
              widget.onClosing();
            }
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

    final Widget bottomSheet = Material(
      key: _childKey,
      color: Colors.transparent,
      elevation: 0,
      shape: shape,
      child: NotificationListener<DraggableScrollableNotification>(
        onNotification: extentChanged,
        child: NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: NotificationListener(
            onNotification: _onNotification,
            child: widget.child,
          ),
        )
      )
    );
    return GestureDetector(
      onHorizontalDragStart: _handleDragStart,
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: bottomSheet,
      excludeFromSemantics: true,
    );
  }
}

Future showPageSheet(BuildContext context,Widget child,[PopAnimate popAnimate = PopAnimate.Right,bool isForbidSideslip = false]) {
  return AiRouter.pushWithRoute(context,_PopupPageRoute(
    popAnimate: popAnimate,
    child: child,
    isForbidSideslip: isForbidSideslip
  ));
}

