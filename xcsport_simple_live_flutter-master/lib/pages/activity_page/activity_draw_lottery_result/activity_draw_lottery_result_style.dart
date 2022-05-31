import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class ActivityDrawResultStyle extends ViewStyle {
  Color _textColor = Color(0xFF8816FB);

  // 背景图
  String get backgroundImg => 'assets/images/activity/activity_draw_result.png';
  // 关闭按钮
  String get cancelImg => 'assets/images/detail/chatroom/redbag/redbag_pop_x.svg';
  // 知道了
  String get knownImg => 'assets/images/activity/activity_draw_button.png';

  Color get labelBackColor => Color(0xFF8816FB).withOpacity(0.1);

  // 标题
  TextStyle get titleTextStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: config.skin.fontSize.h3,
    color: _textColor,
    decoration: TextDecoration.none,
  );
  // big金额
  TextStyle get moneyTextStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.dINCondensed,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: 44.0,
    color: _textColor,
    decoration: TextDecoration.none,
  );

  TextStyle get failMoneyTextStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.dINCondensed,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: 30.0,
    color: _textColor,
    decoration: TextDecoration.none,
  );

  // small金额
  TextStyle get smallMoneyStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.dINCondensed,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: config.skin.fontSize.h3,
    color: _textColor,
    decoration: TextDecoration.none,
  );
  // 描述
  TextStyle get describeStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: config.skin.fontSize.h5,
    color: Color(0xFFCB80FF),
    decoration: TextDecoration.none,
  );

  // 钱包类型
  TextStyle get walletStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: config.skin.fontSize.h6,
    color: Color(0xFF8816FB),
    decoration: TextDecoration.none,
  );

  // 谢谢惠顾
  TextStyle get thankStyle => AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: 30,
    color: Color(0xFF8816FB),
    decoration: TextDecoration.none,
  );

}