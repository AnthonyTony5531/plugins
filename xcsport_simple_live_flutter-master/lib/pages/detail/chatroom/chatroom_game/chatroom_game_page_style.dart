import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class ChatroomGamePageStyle extends ViewStyle{

  TextStyle get title => AiTextStyle(
    fontSize: 16,
    color: Colors222,
    fontWeight: FontWeight.normal,
  );

  TextStyle get history => AiTextStyle(
    fontSize: 12,
    color: Colors222,
    fontWeight: FontWeight.normal,
  );

  String get historyIcon =>
      'assets/images/detail/icon_details_news_history.svg';

  TextStyle get unselectedLabelStyle => AiTextStyle(
    fontSize: 16,
    color: Colors22.withOpacity(0.7),
    fontWeight: FontWeight.bold,
  );

  TextStyle get selectedLabelStyle => AiTextStyle(
    fontSize: 16,
    color: Colors22,
    fontWeight: FontWeight.bold,
  );
   get backgroundColor => ColorsWhite;

  Color get historyBackgroundColor => ColorsF3F3;

  Color get lineColor => ColorsF3F3;
}