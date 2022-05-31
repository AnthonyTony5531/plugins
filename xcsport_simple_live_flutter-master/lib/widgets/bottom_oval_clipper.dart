import 'dart:math';

import 'package:flutter/cupertino.dart';

class BottomOvalClipper extends CustomClipper<Path> {
  final double height;

  BottomOvalClipper({this.height});

  @override
  Path getClip(Size size) {
    Path path = Path();
//    path
//      ..moveTo(0, 0)
//      ..lineTo(size.width, 0)
//      ..lineTo(size.width, size.height - 20)
//      ..addArc(
//          Rect.fromLTRB(0, size.height - 40, size.width, size.height), 0, pi)
//      ..lineTo(0, size.height - 20)
//      ..lineTo(0, 0)
//      ..close();

    path
      ..moveTo(size.width, 20)
    ..addArc(Rect.fromLTRB(0, 0, size.width, 40), 0, pi)
    ..lineTo(0, size.height)
    ..lineTo(size.width, size.height)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
