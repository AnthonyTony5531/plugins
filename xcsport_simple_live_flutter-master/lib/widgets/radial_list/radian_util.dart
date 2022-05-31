import 'dart:math';

/// 弧度-角度转换工具
class RadianUtils {
  ///
  static double angle2Radian(double angle) {
    return angle * pi / 180;
  }

  ///
  static double radian2Angle(double radian) {
    return radian * 180 / pi;
  }
}
