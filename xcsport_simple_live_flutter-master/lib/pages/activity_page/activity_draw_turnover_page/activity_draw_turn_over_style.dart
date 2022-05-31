import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class ActivityDrawTurnOverStyle extends ViewStyle {

  // 提示
  TextStyle get hintTextStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: config.skin.fontSize.h6,
    color: config.skin.colors.bgColorLocal,
    decoration: TextDecoration.none,
  );


  TextStyle get failStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: config.skin.fontSize.h4,
    color: Colors.white,
    decoration: TextDecoration.none,
  );

}