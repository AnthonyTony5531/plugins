import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class ActivityDrawLabelItemStyle extends ViewStyle {

  // money
  TextStyle get moneyTextStyle => AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      fontSize: config.skin.fontSize.h8,
      decoration: TextDecoration.none,
      color: config.skin.colors.bgColorLocal);

}