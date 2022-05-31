import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class ActivityDrawLabelStyle extends ViewStyle {
  // black
  Color get blackColor => config.skin.colors.fontColorDark;

  // 奖
  TextStyle get lotteryTextStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h4,
    decoration: TextDecoration.none,
    color: Colors.amber,
  );
}