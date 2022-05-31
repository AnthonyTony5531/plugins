import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class AnchorMyContributionStyle extends ViewStyle {

  Color get dividerColor => Color(0xFFF5F5F5);

  TextStyle get numStyle => AiTextStyle(
      color: Colors.black.withOpacity(0.4),
      fontWeight: config.skin.fontWeight.medium,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h4);

  TextStyle get titleStyle => AiTextStyle(
      color: Colors.black,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5);

  TextStyle get attentionStyle => AiTextStyle(
      color: Colors.white,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h6);

  TextStyle get contributionValueStyle => AiTextStyle(
      color: Color(0xFF000000),
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.money,
      fontSize: config.skin.fontSize.h4);

  TextStyle get nameStyle => AiTextStyle(
      color: Color(0xFFFF4000),
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5);

  TextStyle get desStyle => AiTextStyle(
      color: Color(0xFF000000).withOpacity(0.4),
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h6
  );
}
