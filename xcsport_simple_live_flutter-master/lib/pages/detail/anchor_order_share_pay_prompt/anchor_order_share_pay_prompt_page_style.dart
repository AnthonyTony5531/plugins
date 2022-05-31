import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class AnchorOrderSharePayPromptPageStyle extends ViewStyle{

  TextStyle get title => AiTextStyle(
    fontSize: 16,
    color: Colors222,
    fontWeight: FontWeight.normal,
  );


  TextStyle get message => AiTextStyle(
    fontSize: 12,
    color: Colors222,
    fontWeight: FontWeight.normal,
  );


  TextStyle get money => AiTextStyle(
    fontSize: 24,
    color: Colors222,
    fontWeight: FontWeight.w500,
  );

}