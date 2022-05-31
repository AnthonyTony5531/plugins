import 'package:flutter/material.dart';


class UpDownAnimation extends StatefulWidget {

  final Widget child;
  final AnimationController animationController;
  final VoidCallback hidedCallback;
  final double height;
  final double offset;

  UpDownAnimation({Key key, @required this.child, this.animationController,this.hidedCallback,this.height,this.offset}):super(key:key);

  @override
  UpDownAnimationState createState() => UpDownAnimationState();

}

class UpDownAnimationState extends State<UpDownAnimation> with SingleTickerProviderStateMixin{

  Animation animation;
  AnimationController _animationController;



  @override
  void initState() {
    _animationController = widget.animationController ?? AnimationController(duration: Duration(milliseconds: 300),vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    if(widget.animationController == null){
      _animationController.forward();
    }

    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.dismissed){
        widget.hidedCallback?.call();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    if(widget.animationController == null){
      _animationController?.dispose();
    }
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context,Widget child){
        return Container(
          height: (animation?.value ?? 0.0)  * (widget.height ?? 0.0),
          width: MediaQuery.of(context).size.width,
          child: (animation?.value ?? 0.0) == 1.0 ? VerticalOffsetAnimation(
            child: child,
            offset: widget.offset,
            height: widget.height,
          ): Container(
            alignment: Alignment.topCenter,
            height: widget.height + widget.offset,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class VerticalOffsetAnimation extends StatefulWidget {

  final Widget child;
  final double offset;
  final double height;

  VerticalOffsetAnimation({Key key, @required this.child, this.offset, this.height}):super(key:key);

  @override
  VerticalOffsetAnimationState createState() => VerticalOffsetAnimationState();

}

class VerticalOffsetAnimationState extends State<VerticalOffsetAnimation> with SingleTickerProviderStateMixin{

  Animation animation;
  AnimationController _animationController;


  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(milliseconds: 500),vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _animationController.reverse(from: 1.0);
      } else if(status == AnimationStatus.dismissed){
        _animationController.forward();
      }
    });
    super.initState();
  }


  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context,Widget child){
        double topPadding = (animation?.value ?? 0.0)  * (widget.offset ?? 0.0);

        return Container(
          height: widget.height + widget.offset,
          padding: EdgeInsets.only(top: topPadding, bottom: widget.offset - topPadding),
          alignment: Alignment.topCenter,
          child: Container(
            height: widget.height,
            width: MediaQuery.of(context).size.width,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
