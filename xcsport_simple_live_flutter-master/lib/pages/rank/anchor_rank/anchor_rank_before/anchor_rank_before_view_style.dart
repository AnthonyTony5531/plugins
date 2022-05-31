import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class AnchorRankBeforeViewStyle extends ViewStyle{

  TextStyle get nameStyle => AiTextStyle(
    color: Color(0xFF222222),
    fontSize: 14.0,
    decoration: TextDecoration.none,
  );

  TextStyle get valueStyle => AiTextStyle(
    color: Color(0xFF8155F6),
    fontSize: 14.0,
    fontFamily: config.skin.fontFimaly.dINCondensed,
    decoration: TextDecoration.none,
  );

  TextStyle get wanStyle => AiTextStyle(
    color: Color(0xFF8155F6),
    fontSize: 10.0,
    fontFamily: config.skin.fontFimaly.dINCondensed,
    decoration: TextDecoration.none,
  );

  TextStyle get defaultStyle => AiTextStyle(
    color: Color(0xFF8155F6),
    fontSize: 9.0,
    decoration: TextDecoration.none,
  );

  TextStyle get teamNameStyle => AiTextStyle(
    color: Color(0xFFC77036),
    fontSize: 10.0,
    decoration: TextDecoration.none,
  );

  Color get teamBgColor => Color(0xFFFEEECC);


  String get loveImg => 'assets/images/new_rank/icon_rank_love.png';
  String get moneyImg => 'assets/images/new_rank/icon_rank_money.png';
  String get firstImg => 'assets/images/new_rank/icon_rank_first.png';

}