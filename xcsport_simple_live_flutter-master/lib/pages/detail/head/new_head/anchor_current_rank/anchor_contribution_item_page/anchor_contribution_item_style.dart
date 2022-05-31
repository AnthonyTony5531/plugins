import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class AnchorCurrentContributionItemStyle extends ViewStyle {

  // 头像边框
  Color get iconBorderColor => Color(0xFFFADB1B);
  Color get iconBorderColorF => Color(0xFFC08A03);

  Color get iconBorderColorS => Color(0xFFE1F8FB);
  Color get iconBorderColorSs => Color(0xFF67D2D7);

  Color get iconBorderColorT => Color(0xFFFED5C6);
  Color get iconBorderColorTt => Color(0xFFFF7D6E);

  // 背景色
  Color get itemBackColorF => Color(0xFFFC5555);
  Color get itemBackColorFf => Color(0xFFFFB853);

  Color get itemBackColorS => Color(0xFF09B17E);
  Color get itemBackColorSs => Color(0xFFE1F8FB);

  Color get itemBackColorT => Color(0xFF767F9E);
  Color get itemBackColorTt => Color(0xFFAFBADA);


  // 关注背景色
  Color get followBackColor => Color(0xFF5078FF);

  Color get blackColor => config.skin.colors.fontColorDark;
  Color get whiteColor => config.skin.colors.bgColorLocal;

  // 分割线颜色
  Color get dividerColor => Color(0xFFF5F5F5);

  // 排名图片
  String configRankImg(int index){
    return 'assets/images/rank/icon_detail_bet_$index.png';
  }

  String get fansImg => "assets/images/detail/head/icon_detail_top_fans.png";

  // 名字
  TextStyle get nameStyle => AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      color: blackColor);
  TextStyle get whiteNameStyle => AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h5,
      color: whiteColor);

  // 金额
  TextStyle get moneyStyle => AiTextStyle(
      fontFamily: config.skin.fontFimaly.money,
      fontSize: config.skin.fontSize.h4,
      color: blackColor);

  // 名次
  TextStyle get indexStyle => AiTextStyle(
      fontFamily: config.skin.fontFimaly.yakuHei,
      fontSize: config.skin.fontSize.h4,
      color: blackColor.withOpacity(0.4));

  // 关注
  TextStyle get followStyle => AiTextStyle(
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h6,
      color: blackColor);

}
