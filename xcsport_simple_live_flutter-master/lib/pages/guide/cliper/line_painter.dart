
import 'dart:math';

import 'package:fast_ai/pages/guide/cliper/circle_cliper_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class DashLinePainter extends CustomPainter{
  List<CirclePosition> circles;

  DashLinePainter({this.circles});

  @override
  void paint(Canvas canvas, Size size) {
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
    Paint paint = Paint();
    paint..color = Colors.white
         ..strokeWidth = 1.2
         ..style = PaintingStyle.stroke;

    circles?.forEach((circle){
      Path path= Path()
        ..moveTo(circle.centerX+circle.radius, circle.centerY)
        ..arcTo(Rect.fromCenter(center: Offset(circle.centerX,circle.centerY),width: 2 * circle.radius,height: 2 * circle.radius), 2*pi,  -pi,false)
        ..arcTo(Rect.fromCenter(center: Offset(circle.centerX,circle.centerY),width: 2 * circle.radius,height: 2 * circle.radius), pi,  -pi,false);
      canvas.drawPath(dashPath(path, dashArray: CircularIntervalList<double>(<double>[5.0, 2.5],)), paint);
    });
    if((circles?.length ?? 0) >= 1 && circles[0] != null){
      Path topLine = Path()
        ..moveTo(circles[0].centerX-circles[0].radius, circles[0].centerY)
        ..lineTo(size.width/2, circles[0].centerY)
        ..lineTo(size.width/2, circles[0].centerY + 100);
      canvas.drawPath(dashPath(topLine, dashArray: CircularIntervalList<double>(<double>[5.0, 2.5],)), paint);
    }

    if((circles?.length ?? 0) >= 2 && circles[1] != null) {
      Path bottomLine = Path()
        ..moveTo(circles[1].centerX, circles[1].centerY-circles[1].radius)
        ..lineTo(circles[1].centerX, circles[1].centerY-circles[1].radius - 100)
        ..lineTo(circles[1].centerX + 80, circles[1].centerY-circles[1].radius - 100);
      canvas.drawPath(dashPath(bottomLine, dashArray: CircularIntervalList<double>(<double>[5.0, 2.5],)), paint);
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}