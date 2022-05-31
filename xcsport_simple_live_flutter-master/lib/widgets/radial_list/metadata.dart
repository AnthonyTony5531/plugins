/// 坐标方位
enum CoordinatePosition { topLeft, topRight, bottomLeft, bottomRight }

/// 时钟方向
enum ClockDirection { clockwise, antiClockwise }

/// 坐标点
class Point {
  double x;
  double y;

  Point(this.x, this.y);
}

///
class ViewPortFactor {
  final double startAngle;
  final double endAngle;

  const ViewPortFactor({
    this.startAngle = 0,
    this.endAngle = 0,
  })  : assert(startAngle >= 0 && startAngle <= 180, "startAngle必须满足：0 <= startAngle <= 180"),
        assert(endAngle <= 0 && endAngle>= -180, "endAngle必须满足：0 >= endAngle >= -180");
}
