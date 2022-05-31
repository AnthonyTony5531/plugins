//**********************************************************************
//* author:Sam
//* date:2020-02-20
//**********************************************************************


import 'package:flutter/cupertino.dart';

typedef SlideFreshCallback = void Function(SlideDirection);
typedef HorizontalDragCallBack = void Function(HorizontalDragType,dynamic);

enum HorizontalDragType{
  start,
  update,
  end,
  cancel,
}

// ignore: must_be_immutable
class XcSlide extends StatefulWidget {
  final Widget child;
  final SlideFreshCallback slideFreshCallback;
  final HorizontalDragCallBack horizontalDragCallBack;
  XcSlide({Key key, this.child, this.slideFreshCallback,this.horizontalDragCallBack}) : super(key: key);

  @override
  _XcSlideState createState() => _XcSlideState();
}

class _XcSlideState extends State<XcSlide>  with TickerProviderStateMixin{
  Offset currentPosition = Offset(0.0, 0.0);

  Offset onHorizontalDragStartPosition = Offset(0.0, 0.0);

  double lastWidth = 0.0;

  bool freshable = false;

  double result   = 0;

  AnimationController _animationController;

  Animation<double> animation;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onHorizontalDragStart: (details) {
        if(widget?.horizontalDragCallBack != null){
          widget?.horizontalDragCallBack(HorizontalDragType.start,details);
        }
        print("${details.globalPosition.dx}");
        if(null != _animationController && _animationController.isAnimating)
          return;
        freshable  = false;
        onHorizontalDragStartPosition =
            Offset(details.globalPosition.dx, details.globalPosition.dy);
      },
      onHorizontalDragUpdate: (details) {
        if(widget?.horizontalDragCallBack != null){
          widget?.horizontalDragCallBack(HorizontalDragType.update,details);
        }
        if(null != _animationController && _animationController.isAnimating)
          return;

        result = details.globalPosition.dx-onHorizontalDragStartPosition.dx;
        freshable = result.abs()>50;
//        currentPosition = Offset(result,  0);
        setState(() {

        });
      },
      onHorizontalDragEnd: (details) {
        if(widget?.horizontalDragCallBack != null){
          widget?.horizontalDragCallBack(HorizontalDragType.end,details);
        }
        processDragger();
      },
      onHorizontalDragCancel: (){
        if(widget?.horizontalDragCallBack != null){
          widget?.horizontalDragCallBack(HorizontalDragType.cancel,null);
        }
        processDragger();

      },
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: currentPosition,
            child: widget.child,
          ),
        ],
      ),
    );
  }

  void processDragger(){
       if(freshable){
          widget.slideFreshCallback(result<0?SlideDirection.left:SlideDirection.right);
        }
    else{
          widget.slideFreshCallback(SlideDirection.cancel);
        }
//    if(null != _animationController){
//      _animationController.stop(canceled: true);
//      _animationController.dispose();
//    }
//
//    if(!freshable){
//      _animationController = AnimationController(duration: Duration(milliseconds: 100),vsync: this);
//      animation = Tween<double>(begin:currentPosition.dx, end: 0 ).animate(_animationController);
//    }else{
//      if(result<0){
//        _animationController = AnimationController(duration: Duration(milliseconds: 300),vsync: this);
//        animation = Tween<double>(begin:currentPosition.dx, end: -MediaQuery.of(context).size.width ).animate(_animationController);
//      }
//      else{
//        _animationController = AnimationController(duration: Duration(milliseconds: 300),vsync: this);
//        animation = Tween<double>(begin:currentPosition.dx, end: MediaQuery.of(context).size.width ).animate(_animationController);
//      }
//    }
//
//    animation.addListener(run);
//    animation.addStatusListener((status){
//      if(AnimationStatus.completed == status){
//        if(freshable){
//          widget.slideFreshCallback(result<0?SlideDirection.left:SlideDirection.right);
//        }
//        else{
//          widget.slideFreshCallback(SlideDirection.cancel);
//        }
//        currentPosition =Offset(0, 0);
//        freshable = false;
//        setState(() {
//        });
//      }
//    });
//    _animationController.forward();
  }


  void run(){
    if(mounted){
      currentPosition = Offset(animation.value, 0);
      setState(() {

      });
    }
  }

  @override
  void dispose() {
    if(null != _animationController){
      _animationController.dispose();
    }
    super.dispose();
  }

}

enum SlideDirection{
  left,//
  right,
  cancel
}