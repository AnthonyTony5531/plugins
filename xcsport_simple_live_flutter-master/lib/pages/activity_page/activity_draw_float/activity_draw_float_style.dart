

import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class ActivityDrawFloatStyle extends ViewStyle {

  String get errorImg => 'assets/images/activity/img_floating_window_load.svg';

  // 提示抽奖
  TextStyle get textStyle => AiTextStyle(
    color: config.skin.colors.bgColorLocal,
    fontSize: config.skin.fontSize.h8,
    decoration: TextDecoration.none,
    fontFamily: config.skin.fontFimaly.dINCondensed,
  );


}