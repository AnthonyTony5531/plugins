import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class FreeAnchorRankViewStyle extends ViewStyle{

  TextStyle get rankStyle => AiTextStyle(
    color: ColorsFFF,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
    fontFamily: config.skin.fontFimaly.pingFang
  );
}