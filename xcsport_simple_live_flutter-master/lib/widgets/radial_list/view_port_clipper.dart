import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'metadata.dart';
import 'radian_util.dart';

class ViewPortClipper extends CustomClipper<Path> {
  final ViewPortFactor viewPortFactor;

  ViewPortClipper({this.viewPortFactor});

  @override
  Path getClip(Size size) {
    var path = Path();
    double r = size.width / 2;

    ///中点
    double cx = size.width / 2;
    double cy = size.height / 2;
    ///右上
    double trX = size.width;
    double trY = 0;
    ///上中
    double tcX = size.width / 2;
    double tcY = 0;
    ///左上
    double tlX = 0;
    double tlY = 0;
    ///左中
    double lcX = 0;
    double lcY = size.height / 2;
    ///左下
    double lbX = 0;
    double lbY = size.height;
    ///下中
    double bcX = size.width / 2;
    double bcY = size.height;
    ///右下
    double rbX = size.width;
    double rbY = size.height;
    ///右中
    double rcX = size.width;
    double rcY = size.height / 2;

    path..moveTo(lcX, lcY);
    path..lineTo(tlX, tlY);//左上
    if (viewPortFactor.startAngle > 0 && viewPortFactor.startAngle <= 45) {
      var px = r * cos(RadianUtils.angle2Radian(viewPortFactor.startAngle));
      var py = r * sin(RadianUtils.angle2Radian(viewPortFactor.startAngle));
      path..lineTo(r - px, r - py);//交点
    }
    if (viewPortFactor.startAngle > 45 && viewPortFactor.startAngle < 90) {
      var px = r * cos(RadianUtils.angle2Radian(viewPortFactor.startAngle));
      var py = r * sin(RadianUtils.angle2Radian(viewPortFactor.startAngle));
      path..lineTo(r - px, r-py);
    }
    if (viewPortFactor.startAngle == 90) {
      path..lineTo(tcX, tcY);//上中
      path..lineTo(trX, trY);//右上
    }
    if (viewPortFactor.startAngle > 90 && viewPortFactor.startAngle <= 135) {
      var px = r * cos(RadianUtils.angle2Radian(180 - viewPortFactor.startAngle));
      var py = r * sin(RadianUtils.angle2Radian(180 - viewPortFactor.startAngle));
      path..lineTo(trX, trY);//上中
      path..lineTo(r + px, r - py);//交点
    }
    if (viewPortFactor.startAngle > 135 && viewPortFactor.startAngle < 180) {
      var px = r * cos(RadianUtils.angle2Radian(180 - viewPortFactor.startAngle));
      var py = r * sin(RadianUtils.angle2Radian(180 - viewPortFactor.startAngle));
      path..lineTo(trX, trY);//上中
      path..lineTo(r + px, r - py);//交点
    }
    if (viewPortFactor.startAngle == 180) {
      path..lineTo(trX, trY);//上中
      path..lineTo(rcX, rcY);//上中
    }
    path..lineTo(cx, cy);

    if (viewPortFactor.endAngle < 0 && viewPortFactor.endAngle >= -45) {
      var px = r * cos(RadianUtils.angle2Radian(viewPortFactor.endAngle));
      var py = r * sin(RadianUtils.angle2Radian(viewPortFactor.endAngle));
      path..lineTo(r - px, r + py.abs());//交点
    }
    if (viewPortFactor.endAngle < -45 && viewPortFactor.endAngle > -90) {
      var px = r * cos(RadianUtils.angle2Radian(viewPortFactor.endAngle));
      var py = r * sin(RadianUtils.angle2Radian(viewPortFactor.endAngle));
      path..lineTo(r - px, r + py.abs());
    }
    if (viewPortFactor.endAngle == -90) {
      path..lineTo(bcX, bcY);//下中
    }
    if (viewPortFactor.endAngle < -90 && viewPortFactor.endAngle >= -135) {
      var px = r * cos(RadianUtils.angle2Radian(180 - viewPortFactor.endAngle));
      var py = r * sin(RadianUtils.angle2Radian(180 - viewPortFactor.endAngle));
      path..lineTo(r + px.abs(), r + py.abs());//交点
      path..lineTo(rbX, rbY);
    }
    if (viewPortFactor.endAngle < -135 && viewPortFactor.endAngle > -180) {
      var px = r * cos(RadianUtils.angle2Radian(180 - viewPortFactor.endAngle));
      var py = r * sin(RadianUtils.angle2Radian(180 - viewPortFactor.endAngle));
      path..lineTo(r + px.abs(), r + py.abs());//交点
      path..lineTo(rbX, rbY);
    }
    if (viewPortFactor.endAngle == -180) {
      path..lineTo(rcX, rcY);//上中
      path..lineTo(rbX, rbY);
    }

    path..lineTo(lbX, lbY);
     path..close();
    return path;
  }

  @override
  bool shouldReclip(ViewPortClipper oldClipper) {
    return oldClipper.viewPortFactor.startAngle != this.viewPortFactor.startAngle
        || oldClipper.viewPortFactor.endAngle != this.viewPortFactor.endAngle;
  }
}
