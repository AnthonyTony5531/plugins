import 'package:flutter/material.dart';
import 'dart:math' as math;

class LeftRightRotationTransition extends AnimatedWidget {
  /// Creates a rotation transition.
  ///
  /// The [turns] argument must not be null.
  const LeftRightRotationTransition({
    Key key,
    @required Animation<double> turns,
    this.alignment = Alignment.center,
    this.child,
    this.radianAngle,
  }) : assert(turns != null),
        super(key: key, listenable: turns);

  /// The animation that controls the rotation of the child.
  ///
  /// If the current value of the turns animation is v, the child will be
  /// rotated v * 2 * pi radians before being painted.
  Animation<double> get turns => listenable as Animation<double>;

  /// The alignment of the origin of the coordinate system around which the
  /// rotation occurs, relative to the size of the box.
  ///
  /// For example, to set the origin of the rotation to top right corner, use
  /// an alignment of (1.0, -1.0) or use [Alignment.topRight]
  final Alignment alignment;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  final double radianAngle;

  double get radian => radianAngle ?? math.pi/2;

  @override
  Widget build(BuildContext context) {
    final double turnsValue = turns.value;
    double tv = 0;
    if(turnsValue >= 0 ){
      tv = math.min(turnsValue,0.25);
    }
    if(turnsValue >=0.25){
      tv += -(math.min(turnsValue,0.75) - 0.25);
    }
    if(turnsValue >=0.75 && turnsValue <= 1.0){
      tv += (turnsValue - 0.75);
    }
    final Matrix4 transform = Matrix4.rotationZ(tv * radian * 4);
    return Transform(
      transform: transform,
      alignment: alignment,
      child: child,
    );
  }
}