import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class ChatroomConnectstatusStyle extends ViewStyle {

  TextStyle get statusPromptTextStyle => AiTextStyle(
        color: const Color(0xFFFE4028),
        fontSize: 12,
        fontFamily: config.skin.fontFimaly.pingFang,
      );

}
