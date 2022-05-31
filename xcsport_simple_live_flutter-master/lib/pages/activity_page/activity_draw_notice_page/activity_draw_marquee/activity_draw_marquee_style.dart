import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class ActivityDrawMarqueeStyle extends ViewStyle {

  Color get moneyColor => Color(0xFFFF8400);

  TextStyle get textStyle => AiTextStyle(
      decoration: TextDecoration.none,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h6,
      color: config.skin.colors.bgColorLocal);

  TextStyle get moneyTextStyle => AiTextStyle(
      decoration: TextDecoration.none,
      fontWeight: config.skin.fontWeight.bold,
      fontSize: config.skin.fontSize.h6,
      color: moneyColor);

}