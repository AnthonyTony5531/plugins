import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class AnchorContributionItemStyle extends ViewStyle {

  List<Color> get firstColors => [Color(0xFFFADB1B), Color(0xFFC08A03)];
  List<Color> get secondColors => [Color(0xFFE1F8FB), Color(0xFF67D2D7)];
  List<Color> get thirdColors => [Color(0xFFFED5C6), Color(0xFFFF7D6E)];

  Color get firstNumColor => Color(0xFFC08A03);
  Color get secondNumColor => Color(0xFF67D2D7);
  Color get thirdNumColor => Color(0xFFFF7D6E);

  Color get decorationColor => Color(0xFF5078FF);
  Color get whiteColor => Color(0xFFF5F5F5);
  // 分割线颜色
  Color get dividerColor => Color(0xFFF5F5F5);

  String get topFansImg => "assets/images/detail/head/icon_detail_top_fans.png";

  Color get black => Colors.black.withOpacity(0.4);

  TextStyle get numStyle => AiTextStyle(
      color: Color(0xFF202F4C),
      fontWeight: config.skin.fontWeight.medium,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h4);

  TextStyle get titleStyle => AiTextStyle(
      color: Colors.black,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h4);

  TextStyle get attentionStyle => AiTextStyle(
      color: Colors.white,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5);

  TextStyle get contributionValueStyle => AiTextStyle(
      color: Color(0xFF202F4C),
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.money,
      fontSize: config.skin.fontSize.h4);
}
