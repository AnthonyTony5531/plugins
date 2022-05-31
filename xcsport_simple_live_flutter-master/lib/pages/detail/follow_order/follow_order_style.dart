//跟单style
import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class FollowOrderStyle extends ViewStyle {
  TextStyle get titleStyle => AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: 12,
      color: Colors.white);
}
