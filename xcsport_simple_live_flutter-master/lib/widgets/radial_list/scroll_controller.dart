import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'metadata.dart';
import 'radian_util.dart';

/// 径向列表滚动控制器
abstract class RadialScrollController {

  bool get scrollable;

  RadialScrollDirection get scrollDirection;

  void bindStatus({double localCenterX,double localCenterY,double baseAngle,Function(double angle) callback}){
    this.localCenterX = localCenterX;
    this.localCenterY = localCenterY;
    this.baseAngle = baseAngle;
    this.updateAngleFunc = callback;
  }

  /// 中心坐标
  double localCenterX = 0;
  double localCenterY = 0;
  /// 上一次点标的坐标点
  double lastX = 0;
  double lastY = 0;
  /// 初始基准角度
  double baseAngle = 0;
  /// 最近一次滚动角度
  double lastDAngle = 0;

  Function(double angle) updateAngleFunc;

  /// 计算当前点相对-x轴的的弧度
  double getCurrentAngle(Point curPoint) {
    double x = curPoint.x;
    double y = curPoint.y;

    double dx = x - localCenterX;
    double dy = y - localCenterY;
    double r = sqrt(pow(dx, 2) + pow(dy, 2));
    double dAngle = asin(dx / r);
    double angle = RadianUtils.radian2Angle(dAngle);
    return angle;
  }

  ///
  void updateAngle(details) {
    var currentPoint = Point(details.localPosition.dx, details.localPosition.dy);
    double currentAngle = getCurrentAngle(currentPoint);
    double dAngle = currentAngle.abs() - lastDAngle.abs();

    var lastPoint = Point(lastX, lastY);
    var centerPoint = Point(localCenterX, localCenterY);
    var clock = getScrollClockDirection(currentPoint, lastPoint, centerPoint);

    // print("x:${formatDouble(x)}  y:${formatDouble(y)}  "
    //     "baseAngle:${formatDouble(baseAngle)}   lastDAngle:${formatDouble(lastDAngle)}  dAngle.abs():${formatDouble(dAngle)}   "
    //     "clock:$clock");

    if (clock == ClockDirection.clockwise) {
      baseAngle += dAngle.abs();
    } else if (clock == ClockDirection.antiClockwise) {
      baseAngle += -(dAngle.abs());
    }
    if (currentAngle.abs() > 0) {
      if (clock == ClockDirection.clockwise) {
        lastDAngle = currentAngle.abs();
      } else if (clock == ClockDirection.antiClockwise) {
        lastDAngle = -(currentAngle.abs());
      }
    }
    baseAngle = baseAngle % 360;

    updateAngleFunc?.call(baseAngle);

    lastX = currentPoint.x;
    lastY = currentPoint.y;
  }

  /// 计算当前点在坐标系中的位置
  CoordinatePosition getPosition(Point currentPoint, Point centerPoint) {
    if (currentPoint.x >= centerPoint.x && currentPoint.y > centerPoint.y) {
      return CoordinatePosition.bottomRight;
    } else if (currentPoint.x > centerPoint.x && currentPoint.y <= centerPoint.y) {
      return CoordinatePosition.topRight;
    } else if (currentPoint.x <= centerPoint.x && currentPoint.y < centerPoint.y) {
      return CoordinatePosition.topLeft;
    } else if (currentPoint.x < centerPoint.x && currentPoint.y >= centerPoint.y) {
      return CoordinatePosition.bottomLeft;
    }
    return CoordinatePosition.topLeft;
  }

  /// 计算滚动方向
  ClockDirection getScrollClockDirection(Point currentPoint, Point lastPoint, Point centerPoint) {
    var coordinatePosition = getPosition(currentPoint, centerPoint);
    double dx = currentPoint.x - lastPoint.x;
    double dy = currentPoint.y - lastPoint.y;

    if (coordinatePosition == CoordinatePosition.topLeft) {
      //print("dx:$dx  dy:$dy");
      if (dx < 0 && dy >= 0) {
        /// ← ←
        /// ↓
        //print("dx:$dx  dy:$dy   CoordinatePosition.topLeft  ClockDirection.antiClockwise");
        return ClockDirection.antiClockwise;
      } else if (dx >= 0 && dy < 0) {
        /// → →
        /// ↑
        //print("dx:$dx  dy:$dy   CoordinatePosition.topLeft  ClockDirection.clockwise");
        return ClockDirection.clockwise;
      }
    } else if (coordinatePosition == CoordinatePosition.topRight) {
      if (dx > 0 && dy >= 0) {
        /// → →
        ///    ↓
        //print("dx:$dx  dy:$dy   CoordinatePosition.topRight  ClockDirection.clockwise");
        return ClockDirection.clockwise;
      } else if (dy < 0 && dx <= 0) {
        /// ← ←
        ///    ↑
        //print("dx:$dx  dy:$dy   CoordinatePosition.topRight  ClockDirection.antiClockwise");
        return ClockDirection.antiClockwise;
      }
    } else if (coordinatePosition == CoordinatePosition.bottomRight) {
      if (dy > 0 && dx <= 0) {
        ///    ↓
        /// ← ←
        //print("dx:$dx  dy:$dy   CoordinatePosition.bottomRight  ClockDirection.clockwise");
        return ClockDirection.clockwise;
      } else if (dx > 0 && dy <= 0) {
        ///    ↑
        /// → →
        //print("dx:$dx  dy:$dy   CoordinatePosition.bottomRight  ClockDirection.antiClockwise");
        return ClockDirection.antiClockwise;
      }
    } else if (coordinatePosition == CoordinatePosition.bottomLeft) {
      if (dx < 0 && dy <= 0) {
        /// ↑
        ///  ← ←
        //print("dx:$dx  dy:$dy   CoordinatePosition.bottomLeft  ClockDirection.clockwise");
        return ClockDirection.clockwise;
      } else if (dx >= 0 && dy > 0) {
        /// ↓
        ///  → →
        //print("dx:$dx  dy:$dy   CoordinatePosition.bottomLeft  ClockDirection.antiClockwise");
        return ClockDirection.antiClockwise;
      }
    }
    return null;
  }

  Widget scroll(Widget child){
    return Listener(
      onPointerMove: (event) {
        //print('event.position.distance:${event.position.distance}');
      },
      child: GestureDetector(
        onPanDown: (details) {
          lastX = details.localPosition.dx;
          lastY = details.localPosition.dy;
          lastDAngle = getCurrentAngle(Point(details.localPosition.dx, details.localPosition.dy));
        },
        onPanUpdate: updateAngle,
        onPanCancel: () {},
        onPanEnd: (details) async {
          //print("-----");
        },
        child: child,
      ),
    );
  }
}

enum RadialScrollDirection {
  ///循环滚动
  cycle,

  ///线性滚动
  linear,

  ///无滚动
  none,
}

///不滚动
class NeverRadialScrollController extends RadialScrollController {
  @override
  RadialScrollDirection get scrollDirection => RadialScrollDirection.none;

  @override
  bool get scrollable => false;

  @override
  Widget scroll(Widget child) {
    return child;
  }
}

/// 循环滚动控制器
class CycleRadiaScrollController extends RadialScrollController {


  @override
  RadialScrollDirection get scrollDirection => RadialScrollDirection.cycle;

  @override
  bool get scrollable => true;
}
