//**********************************************************************
//* author:Sam
//* date:2020-05-21
//**********************************************************************

import 'dart:math';

import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArrowButton extends StatefulWidget {

  final ValueChanged<bool> onTap;

  const ArrowButton({Key key, this.onTap}) : super(key: key);


  @override
  ArrowButtonState createState() => ArrowButtonState();

}

class ArrowButtonState extends State<ArrowButton> with TickerProviderStateMixin{

  AnimationController animationController;

  Animation _animation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    _animation.addListener((){
      setState(() {

      });
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      up();
    });
  }

  void up(){
    isUp= true;
    animationController.forward();
  }

  void down(){
    isUp = false;
    animationController.reverse();
  }


  bool isUp = true;
  void tottle(){
    if(isUp){
      down();
    }else{
      up();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(widget.onTap != null){
          widget.onTap(!isUp);
        }
        tottle();
      },
      child: Transform.rotate(
        angle: pi*_animation.value,
        alignment: Alignment.center,
        child: AiSvgPicture.asset('assets/images/detail/icon_arrow_detail_h_down.svg'),
      ),
    );
  }
}
