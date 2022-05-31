import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class ActivityDrawProgressStyle extends ViewStyle {

  // 倒计时时间
  TextStyle get timeStyle => AiTextStyle(
    // color: config.skin.colors.bgColorLocal,
    color: Colors.black,
    fontSize: config.skin.fontSize.h8,
    decoration: TextDecoration.none,
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
  );

  List<Color> get colors => [Color(0xFFFE6C52),Color(0xFFFF9D3C)];

  Color get backColor => Color(0xFFDDC2B0);
}