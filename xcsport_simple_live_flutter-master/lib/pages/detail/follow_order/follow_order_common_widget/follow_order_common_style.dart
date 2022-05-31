import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class FollowOrderCommonStyle extends ViewStyle {

  // 标签背景
  Color get labelBackColor => Color(0xFFFF505D).withOpacity(0.1);
  Color get rankBackColor => Color(0xFFACDAFF).withOpacity(0.1);

  // 名称
  TextStyle get nameTextStyle => AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      color: Colors.white.withOpacity(0.4));

  // 标签字体
  TextStyle get labelTextStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h6,
    color: Color(0xFFFF505D),
  );

  TextStyle get rankTextStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h6,
    color: Color(0xFF008DFF),
  );

  // 描述字体
  TextStyle get describeTextStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontSize: config.skin.fontSize.h4,
    color: Color(0xFFFFFFFF).withOpacity(0.7),
  );
}