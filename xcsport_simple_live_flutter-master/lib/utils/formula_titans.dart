//**********************************************************************
//* author:Sam
//* date:2020-03-25
//**********************************************************************
import 'dart:math' as Math;

import 'dart:ui';


class FormulaTitans{

  //将角度转弧度
 static double angleToRadian(double angle) =>angle/180*Math.pi;

 //获取圆上的点
 static  Offset circlePoint({Offset circleCenterPoint, double angle,  double radius}){
    return  Offset(
        circleCenterPoint.dx + radius*Math.cos(angleToRadian(angle)),
        circleCenterPoint.dy + radius*Math.sin(angleToRadian(angle))
    );
  }
}