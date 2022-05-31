/*--------------------------------------------------------
 * 创建: south
 * 日期: 2020-03-09
 * 说明：显示弹式浮动窗口
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import '../router.dart';

const Duration _sheetDuration = Duration(milliseconds: 200);
const double _minFlingVelocity = 100.0;
const double _closeProgressThreshold = 0.5;


class _PopupFloatPageSheet extends StatefulWidget {
  final bool directShow;
  const _PopupFloatPageSheet({
    Key key,
    @required this.child, 
    this.directShow = false, 
  }) : super(key: key);
  final Widget child;

  @override
  _PopupFloatPageSheetState createState() => _PopupFloatPageSheetState();
}

class _PopupFloatPageSheetState extends State<_PopupFloatPageSheet> with TickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    if(widget.directShow)
      _animationController.value = 1;
    else
      _animationController.forward();

      _animationController.addStatusListener((AnimationStatus status){
        if(status == AnimationStatus.dismissed){
          closeRightView();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }


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

    // return Container(
    //   width: 100,
    //   height: 100,
    //   color: Colors.red,
    // );

    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget child) {
        final double animationValue = _animationController.value;
        return Semantics(
          scopesRoute: true,
          namesRoute: true,
          label: routeLabel,
          explicitChildNodes: true,
          child: ClipRect(
            child: CustomSingleChildLayout(
              delegate: _PopupFloatPageSheetLayout(animationValue),
              child: PopupFloatSheet(
                animationController: _animationController,
                onClosing: () {
                  // if (widget.route.isCurrent) {
                  //   AiRouter.pop(context);
                  // }
                  
                },
                child: widget.child
              ),
            ),
          ),
        );
      },
    );
  }

    void animateClose() {
      _animationController.reverse();
    }
  }
  
  class _PopupFloatPageSheetLayout extends SingleChildLayoutDelegate {
    _PopupFloatPageSheetLayout(
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
    bool shouldRelayout(_PopupFloatPageSheetLayout oldDelegate) {
      return progress != oldDelegate.progress;
    }
  }
  
  
  class PopupFloatSheet extends StatefulWidget {
    const PopupFloatSheet({
      Key key,
      this.animationController,
      @required this.onClosing,
      @required this.child,
    }) : assert(onClosing != null),
         super(key: key);
  
    final AnimationController animationController;
    final VoidCallback onClosing;
    final Widget child;
    @override
    _PopupFloatSheetState createState() => _PopupFloatSheetState();
    static AnimationController createAnimationController(TickerProvider vsync) {
      return AnimationController(
        duration: _sheetDuration,
        debugLabel: 'PopupFloatSheet',
        vsync: vsync,
      );
    }
  }
  
  class _PopupFloatSheetState extends State<PopupFloatSheet> {
    final GlobalKey _childKey = GlobalKey(debugLabel: 'PopupFloatSheet child');
    double get _childWidth {
      final RenderBox renderBox = _childKey.currentContext.findRenderObject();
      return renderBox.size.width;
    }
    bool get _dismissUnderway => widget.animationController.status == AnimationStatus.reverse;
    void _handleDragUpdate(DragUpdateDetails details) {
      if (_dismissUnderway)
        return;
      widget.animationController.value -= details.primaryDelta / (_childWidth ?? details.primaryDelta);
    }
    void _handleDragEnd(DragEndDetails details) {
      if (_dismissUnderway)
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
  
      if(notification is ScrollNotification){
        if(notification.metrics.axisDirection == AxisDirection.left){
          _isWorking = true;
        }
      }
  
      // print(notification);
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
      var sliderBorder = NotificationListener<DraggableScrollableNotification>(
              onNotification: extentChanged,
              child: Container(
                color: Color(0x01000000),
                width: 10,
                height: MediaQuery.of(context).size.height,
              )
            );
  
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
              )
            ),
            Align(
              alignment: Alignment(-1, 0),
              child: gesBorder,
            )
          ],
        )
      );
      return bodySheet;
    }
  }
  
  FloatPage _currentPage;
  void showRightView(BuildContext context,Widget child,[bool directShow = false]){
    if(_currentPage != null){
      _currentPage.close();
      _currentPage = null;
    }
    _currentPage = FloatPage(context,child,directShow);
    _currentPage.show();
  }
  void hideRightView(){
    _currentPage?.animateClose();
  }
  void closeRightView(){
    if(_currentPage != null){
      _currentPage.close();
      _currentPage = null;
    }
  }


//方案一: 无法点下一层
  class FloatPage extends PopupRoute {
  final BuildContext context;
  final Widget child;
  final double maxWidth;
  final double maxHeight;
  final bool directShow;
  FloatPage(this.context, this.child, [this.directShow = false]):
  maxWidth =MediaQuery.of(context).size.width,
  maxHeight =MediaQuery.of(context).size.height
  ;
  GlobalKey<_PopupFloatPageSheetState> _pageKey = GlobalKey();
  @override
  Color get barrierColor => null;
  @override
  bool get barrierDismissible => false;
  @override
  String get barrierLabel => '';
  @override
  Duration get transitionDuration => Duration(milliseconds: 300);
  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return _PopupFloatPageSheet(
        directShow: directShow,
        key: _pageKey,
        child: child,
    );
  }
  show(){
    AiRouter.pushWithRoute(context, this);
  }
  close(){
    AiRouter.pop(context);
  }
  animateClose(){
      _pageKey?.currentState?.animateClose();
  }
}

//方案二： 点水窗口弹不出来
//   class FloatPage{
//     final BuildContext context;
//     final Widget child;
//     final double maxWidth;
//     final double maxHeight;
//     OverlayEntry viewEntry;
//     FloatPage(this.context, this.child):
//     maxWidth =MediaQuery.of(context).size.width,
//     maxHeight =MediaQuery.of(context).size.height
//     ;
//     GlobalKey<_PopupFloatPageSheetState> _pageKey = GlobalKey();
//     show([bool directShow = false]){
//       viewEntry = new OverlayEntry(builder: (BuildContext context){
//         return Positioned(
//           top: 0,
//           right: 0,
//           child: Container(
//             color: Color(0x99000000),
//             width: maxWidth,
//             height: maxHeight,
//             child: _PopupFloatPageSheet(
//               directShow: directShow,
//               key: _pageKey,
//               child: child,
//             )
//           ),
//         );
//       });
//       Overlay.of(context).insert(viewEntry);
//       // ModalRoute.of(context).overlayEntries.
//     }
//     close(){
//       viewEntry.remove();
//     }
//     animateClose(){
//       _pageKey?.currentState?.animateClose();
//   }
// }

