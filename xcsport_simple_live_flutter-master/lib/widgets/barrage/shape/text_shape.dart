//**********************************************************************
//* author:Sam
//* date:2020-02-24
//**********************************************************************
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'barrage_shape.dart';

const   TextShapeSize = 14.0;

//文本弹幕
class TextShape extends BarrageShape{
  final String text;
  final int maxCount;
  final Color color;
  final Color backgroundColor;
  TextShape({Offset position, this.maxCount= 20, this.backgroundColor,  this.color=Colors.white, this.text}):super(position:position);

  @override
  Widget onShape() {
    String value = text;
    if(text.length > maxCount){
      value = "${value.substring(0,maxCount)}...";
    }
    return Container(
      padding: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
      decoration: BoxDecoration(color: backgroundColor??Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Text(value,
        style: TextStyle(
        fontSize: TextShapeSize,
        color: color,
        shadows: <Shadow>[
            Shadow(color: Color(0xFF4c4c4c), offset:Offset(1, 1)),
        ]
      ),),
    );
  }

}