import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class AnchorRankPageStyle extends ViewStyle{

  Color get selectedColor => Color(0xFF7A46FF);
  Color get normalColor => Color(0xFF222222).withOpacity(0.4);
  Color get whiteColor => Color(0xFFFFFFFF);

  TextStyle get nearlyStyle => AiTextStyle(
    color: Color(0xFF333333).withOpacity(0.4),
    fontSize: 10.0,
    decoration: TextDecoration.none,
  );

  TextStyle get selectedStyle => AiTextStyle(
    color: selectedColor,
    fontSize: 16.0,
    fontWeight: config.skin.fontWeight.medium,
    decoration: TextDecoration.none,
  );

  TextStyle get normalStyle => AiTextStyle(
    color: normalColor,
    fontSize: 16.0,
    fontWeight: config.skin.fontWeight.medium,
    decoration: TextDecoration.none,
  );

  String get charmImg => 'assets/images/new_rank/img_rank_bg_charm.jpg';

  String get ballImg => 'assets/images/new_rank/img_rank_bg_money.jpg';

  String get ruleImg => 'assets/images/new_rank/icon_rank_anchor_rule.svg';
}