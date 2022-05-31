import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class BottombarViewStyle extends ViewStyle{
  TextStyle get titleNormalStyle => AiTextStyle(
    color: Colors222,
    fontSize: 10,
  );

   TextStyle get titleSelectedStyle => AiTextStyle(
    color: Color(0xFFFDAB39),
    fontSize: 10,
  );
}