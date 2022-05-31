import 'package:flutter/material.dart';

class RotateAnimation extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  RotateAnimation({Key key, this.child, this.onTap}) : super(key: key);

  @override
  _RotateAnimationState createState() => _RotateAnimationState();
}

class _RotateAnimationState extends State<RotateAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      child: InkWell(
        onTap: (){
          if(_controller.status == AnimationStatus.dismissed){
            widget?.onTap?.call();
            _controller.forward();
          }
        },
        child: widget.child,
      ),
      turns: _controller
        ..addStatusListener(
          (status) {
            if(status == AnimationStatus.completed){
              _controller.reset();
            }
          },
        ),
    );
  }
}
