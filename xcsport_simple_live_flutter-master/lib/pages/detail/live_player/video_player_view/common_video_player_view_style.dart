import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class CommonVideoPlayerViewStyle extends ViewStyle{
  TextStyle get textStyle => AiTextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: config.skin.fontWeight.medium,
    fontFamily: config.skin.fontFimaly.pingFang,
  );

  TextStyle get liveTextStyle => AiTextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: config.skin.fontWeight.medium,
    fontFamily: config.skin.fontFimaly.pingFang,
  );

  TextStyle get anchorLabelStyle => AiTextStyle(
    color: Colors.white,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: config.skin.fontSize.h6,
    fontFamily: config.skin.fontFimaly.pingFang
  );
}