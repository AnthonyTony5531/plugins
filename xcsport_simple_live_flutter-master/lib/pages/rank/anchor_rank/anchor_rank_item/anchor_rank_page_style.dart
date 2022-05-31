import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class AnchorRankItemViewStyle extends ViewStyle{

  Color get blackColor => Color(0xFF000000);

  List<Color> get colors => [Color(0xFFFC92B4),Color(0xFFF74C86)];

  TextStyle get rankStyle => AiTextStyle(
    fontSize: 14.0,
    color: blackColor.withOpacity(0.3),
    fontFamily: config.skin.fontFimaly.dINCondensed,
    decoration: TextDecoration.none,
  );

  TextStyle get nameStyle => AiTextStyle(
    fontSize: 14.0,
    color: Color(0xFF222222),
    decoration: TextDecoration.none,
  );

  TextStyle get valueStyle => AiTextStyle(
    fontSize: 14.0,
    color: Color(0xFF8155F6),
    fontFamily: config.skin.fontFimaly.dINCondensed,
    decoration: TextDecoration.none,
  );

  TextStyle get defaultStyle => AiTextStyle(
    fontSize: 10.0,
    color: Color(0xFF8155F6),
    decoration: TextDecoration.none,
  );

  TextStyle get wanStyle => AiTextStyle(
    color: Color(0xFF8155F6),
    fontSize: 10.0,
    fontFamily: config.skin.fontFimaly.dINCondensed,
    decoration: TextDecoration.none,
  );


  String get playImg => 'assets/images/square/icon_live.gif';
}