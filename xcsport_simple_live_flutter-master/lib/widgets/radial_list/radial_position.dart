import 'package:flutter/material.dart';
import 'dart:math';

/// 径向列表子项位置组件
class RadialPositionWidget extends StatefulWidget {
  final double radius;
  final double angle;
  final Widget child;

  RadialPositionWidget({
    this.angle,
    this.child,
    this.radius,
  });

  @override
  RadialPositionWidgetState createState() => RadialPositionWidgetState();
}

class RadialPositionWidgetState extends State<RadialPositionWidget> {
  @override
  Widget build(BuildContext context) {
    final x = cos(widget.angle) * widget.radius;
    final y = sin(widget.angle) * widget.radius;

    return Transform(
      transform: new Matrix4.translationValues(x, y, 0.0),
      child: widget.child,
    );
  }
}
