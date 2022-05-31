

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class CircleClipperPath extends CustomClipper<Path>{

  List<CirclePosition> circles;

  CircleClipperPath({this.circles});

  @override
  getClip(Size size) {
    circles?.forEach((circle){
      if(circle.marginRight > circle.marginLeft){
        circle.centerX = size.width - circle.marginRight - circle.radius;
      } else {
        circle.centerX = circle.marginLeft + circle.radius;
      }

      if(circle.marginTop > circle.marginBottom){
        circle.centerY = circle.marginTop + circle.radius;
      } else {
        circle.centerY = size.height - circle.marginBottom - circle.radius;
      }

    });

    Path path = Path();
    path..moveTo(0, 0)
        ..lineTo(size.width,0);

    circles?.forEach((circle){
      path..lineTo(size.width, circle.centerY - circle.radius)
        ..arcTo(Rect.fromCenter(center: Offset(circle.centerX,circle.centerY),width: 2 * circle.radius,height: 2 * circle.radius), 2*pi,  -pi,false)
        ..arcTo(Rect.fromCenter(center: Offset(circle.centerX,circle.centerY),width: 2 * circle.radius,height: 2 * circle.radius), pi,  -pi,false)
        ..lineTo(size.width, circle.centerY - circle.radius);
    });

    path..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..lineTo(0, 0)
        ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }

}

///
class CirclePosition{

  double radius;

  double marginRight;
  double marginTop;
  double marginLeft;
  double marginBottom;

  double centerX;
  double centerY;

  ///
  CirclePosition({@required this.radius, this.marginTop = 0, this.marginBottom = 0, this.marginLeft = 0, this.marginRight = 0});
}