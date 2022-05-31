import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class AnchorRankRulePageStyle extends ViewStyle{
  Color get textColor => Color(0xFF222222);
  Color get backColor => Color(0xFFF8F8F7);

  TextStyle get listStyle => AiTextStyle(
    fontSize: 14.0,
    color: textColor,
    height: 1.5,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  );

  TextStyle get contentStyle => AiTextStyle(
    fontSize: 14.0,
    color: textColor,
    height: 1.5,
    decoration: TextDecoration.none,
  );

  TextStyle get titleStyle => AiTextStyle(
    fontSize: 16.0,
    color: textColor,
    fontWeight: config.skin.fontWeight.medium,
    decoration: TextDecoration.none,
  );

}