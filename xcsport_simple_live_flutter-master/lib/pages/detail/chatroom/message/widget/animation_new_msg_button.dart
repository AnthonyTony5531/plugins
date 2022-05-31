import 'package:flutter/material.dart';

enum OpacityStatus{
  Show2Hide,
  Hide2Show,
  Hide
}

class OpacityAnimationButton extends StatefulWidget {
  final ValueChanged<OpacityStatus> onPressed;
  final OpacityStatus opacityStatus;
  final Widget child;

  OpacityAnimationButton({Key key, @required this.onPressed, @required this.opacityStatus, @required this.child}):super(key:key);

  @override
  OpacityAnimationButtonState createState() => OpacityAnimationButtonState();

}

class OpacityAnimationButtonState extends State<OpacityAnimationButton> with SingleTickerProviderStateMixin{

  Tween<double> _tween;
  Animation _tweenAnimation;
  AnimationController _tweenAnimationController;

  double _animationFactor;
  OpacityStatus _opacityStatus;

  get opacityStatus => _opacityStatus ?? widget.opacityStatus;

  @override
  void initState() {
    _tweenAnimationController = AnimationController(duration: Duration(milliseconds: 600),vsync: this);
    _tween = Tween(begin: 0, end: 1);
    _tweenAnimation = CurvedAnimation(parent: _tweenAnimationController,curve: Curves.easeIn);
    _animationFactor = _tween?.evaluate(_tweenAnimation);
    _tweenAnimationController.addListener((){
      if(mounted){
        setState(() {
          _animationFactor = _tween.evaluate(_tweenAnimation);
        });
      }
    });
    _tweenAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _tweenAnimationController?.dispose();
    super.dispose();
  }


  void _showBtn(){
    _tweenAnimationController.forward(from: 0);
  }

  void _hideBtn(){
    _tweenAnimationController.reverse(from: 1);
  }



  update(OpacityStatus status){
    if(mounted){
      _opacityStatus = status;
      if(status == OpacityStatus.Show2Hide || status == OpacityStatus.Hide2Show){
        _showBtn();
      } else {
        _hideBtn();
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: _animationFactor == 0.0 ? Container() : Opacity(
        opacity: _animationFactor,
        child: widget.child,
      ),
    );
  }
}
