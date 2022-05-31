import "package:fast_ai/utils/ai_image.dart";


/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-12-17
 * 右滑刷新
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class AiDragRefresh extends StatefulWidget {
  final Widget child;
  final VoidCallback onRefresh;
  final double dragWidth;
  final double height;
  final double fixWidth;
  final Color color;
  final AiDragRefreshController controller;
  AiDragRefresh({Key key, 
    @required this.child, 
    this.onRefresh, 
    this.dragWidth, 
    this.height, 
    this.fixWidth,
    this.controller,
    this.color
  }) : super(key: controller.globalKey);

  @override
  _AiDragRefreshState createState() => _AiDragRefreshState();
}

class AiDragRefreshController{

  GlobalKey<_AiDragRefreshState> globalKey = new GlobalKey<_AiDragRefreshState>();

  set scrollable(bool scrollable){
    globalKey.currentState?.scrollable = scrollable;
  }
}

class _AiDragRefreshState extends State<AiDragRefresh> with TickerProviderStateMixin{
  AnimationController _controller;


   set scrollable(bool scrollable){
    globalKey.currentState?.scrollable = scrollable;
  }


  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double dragWidth =  40;

  GlobalKey<_AiDrawerSheetState> globalKey  = new GlobalKey<_AiDrawerSheetState>();


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          AiDragRefreshSheet(
            key: globalKey,
            dragWidth: dragWidth,
            child: widget.child,
            animationController: _controller,
            onClosing: () {
              if(widget.onRefresh != null){
                widget.onRefresh();
              }
            },
          ),
          animatedBuilder()
        ],
      ),
    );
  }

  AnimatedBuilder animatedBuilder(){
    double height = widget.height ?? 200;
    double fixWidth = widget.fixWidth ?? 0;
    return AnimatedBuilder(
      animation: _controller, 
      builder: (BuildContext context, Widget child) {
        double width = fixWidth + (dragWidth) * _controller.value;
        return Positioned(
          right: 0,
          top: (MediaQuery.of(context).size.height - height) / 2,
          child: Container(
            width: width,
            height: height,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                AiSvgPicture.asset("assets/images/drag/left_bg.svg",fit: BoxFit.fill, ),
                Align(
                  alignment: Alignment(1, 0),
                  child: _controller.value < 0.8 ? Container() : Container(
                    margin: EdgeInsets.only(right: 25),
                    child: AiSvgPicture.asset("assets/images/drag/left.svg",),
                  )
                ),
                Align(
                  alignment: Alignment(1, 0),
                  child: _controller.value < 0.8 ? Container() :  Container(
                    width: 12,
                    margin: EdgeInsets.only(right: 5),
                    child: Text("${config.langMap['baseLang']['widgets']['goToNext']}",style: AiTextStyle(
                        fontFamily: config.skin.fontFimaly.pingFang,
                        fontSize: config.skin.fontSize.h6,
                        letterSpacing: 1
                      ),
                      textDirection : TextDirection.rtl
                    ),
                  )
                )
              ],
            )
            // color: Colors.red,
          ),
        );
      }
    );
  }
}

const Duration _sheetDuration = Duration(milliseconds: 200);
// const double _minFlingVelocity = 100.0;
// const double _closeProgressThreshold = 0.5;
class AiDragRefreshSheet extends StatefulWidget {
  const AiDragRefreshSheet({
    Key key,
    this.animationController,
    @required this.onClosing,
    @required this.child, 
    @required this.dragWidth,
  }) : assert(onClosing != null),
       super(key: key);

  final AnimationController animationController;
  final VoidCallback onClosing;
  final Widget child;
  final double dragWidth;
  @override
  _AiDrawerSheetState createState() => _AiDrawerSheetState();
  static AnimationController createAnimationController(TickerProvider vsync) {
    return AnimationController(
      duration: _sheetDuration,
      debugLabel: 'AiDragRefreshSheet',
      vsync: vsync,
    );
  }
}

class _AiDrawerSheetState extends State<AiDragRefreshSheet> {
  final GlobalKey _childKey = GlobalKey(debugLabel: 'AiDragRefreshSheet child');
  _AiDrawerSheetState();

  // double get _childWidth {
  //   final RenderBox renderBox = _childKey.currentContext.findRenderObject();
  //   return renderBox.size.width;
  // }
  // bool get _dismissUnderway => widget.animationController.status == AnimationStatus.reverse;
  void _handleDragUpdate(DragUpdateDetails details) {
    // if (_dismissUnderway)
    //   return;
    // widget.animationController.value -= details.primaryDelta / (_childWidth ?? details.primaryDelta);
  }
  void _handleDragEnd(DragEndDetails details) {
  //   if (_dismissUnderway)
  //     return;
  //   if (details.velocity.pixelsPerSecond.dx > _minFlingVelocity) {
  //     final double flingVelocity = -details.velocity.pixelsPerSecond.dx / _childWidth;
  //     if (widget.animationController.value > 0.0) {
  //       widget.animationController.fling(velocity: flingVelocity);
  //     }
  //     if (flingVelocity < 0.0) {
  //       widget.onClosing();
  //     }
  //   } else if (widget.animationController.value < _closeProgressThreshold) {
  //     if (widget.animationController.value > 0.0)
  //       widget.animationController.fling(velocity: -1.0);
  //     widget.onClosing();
  //   } else {
  //     widget.animationController.forward();
  //  }
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

  bool _scrollable = true;

   set scrollable(bool scrollable){
    _scrollable = scrollable;
    setState(() {

    });
  }

  bool _onNotification(Notification notification){
    if(!this._scrollable)
      return false;
    if(notification is ScrollNotification){
      if(notification.metrics.axisDirection == AxisDirection.right){
        _isWorking = true;
      }
    }

    // notification.metrics.axisDirection
    // print(notification);
    if(notification is ScrollStartNotification){
      _offsetX = notification?.dragDetails?.localPosition?.dx ?? 0;
      _offsetY = notification?.dragDetails?.localPosition?.dy ?? 0;
      _isWorking = false;
    }else if(notification is UserScrollNotification){
      
      if(_isWorking && notification.direction == ScrollDirection.forward){
        if(widget.animationController.value > 0){
          _isWorking = false;
          widget.animationController.fling(velocity: -1.0);
        }
      }
    }else if(notification is OverscrollNotification){
      if(_isWorking){
        var dy = notification.dragDetails?.localPosition?.dy ?? 0;
        var dx = notification.dragDetails?.localPosition?.dx ?? 0;
        var offdx =  _offsetX - dx;
        var offdy =  _offsetY - dy;
        // print("$dx $dy");

        if(offdx > offdy){
           var width = MediaQuery.of(context).size.width / 3;
           if(offdx > width)
              offdx = offdx;
           var a = offdx / width;
           widget.animationController.value =  a;
        }
      }
    }else if(notification is ScrollEndNotification){
        if (widget.animationController.value > 0) {
            if(widget.animationController.value >= 0.8){
              if(_isWorking){
                _isWorking = false;
                widget.onClosing();
              }
            }
            widget.animationController.fling(velocity: -1.0);
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
    // final Widget bottomSheet = Container(
    //   key: _childKey,
    //   child: NotificationListener<DraggableScrollableNotification>(
    //     onNotification: extentChanged,
    //     child: NotificationListener(
    //       onNotification: _onNotification,
    //       child: widget.child,
    //     )
    //   ),
    // );

    final Widget bottomSheet = NotificationListener<ScrollNotification>(
      key: _childKey,
      onNotification: _handleScrollNotification,
      child: NotificationListener(
        onNotification: _onNotification,
        child: widget.child,
      ),
    );
    return GestureDetector(
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: bottomSheet,
      excludeFromSemantics: true,
    );
  }
}

class _AiDragRefreshShapClipper extends CustomClipper<Path>{
  final double fixWidth;
  _AiDragRefreshShapClipper(this.fixWidth);

  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width - fixWidth;
    double height = size.height;

    //右边矩形
    path.moveTo(width, height);
    path.lineTo(size.width, height);
    path.lineTo(size.width, 0);
    path.lineTo(width, 0);

    // //上凹点
    // path.lineTo(width * 0.67, 20);
    // //左中点
    // path.lineTo(0, size.height / 2);
    // //上凹点
    // path.lineTo(width * 0.67, size.height - 20);
    // //终点
    // path.lineTo(width, size.height);

    path.cubicTo(width, 0, 0, size.height / 2, width, size.height);

    // path.quadraticBezierTo(width, 0 , width, -height);
    // path.quadraticBezierTo(width/ 2, height / 4 , 0, -height / 4 * 3);

    // path.quadraticBezierTo(width, size.height, width, size.height);


    path.lineTo(width, size.height);

    return path;
  }

  @override
  bool shouldReclip(_AiDragRefreshShapClipper oldClipper) {
    return this.fixWidth != oldClipper.fixWidth;
  }
}

