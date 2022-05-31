import 'dart:convert';

import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/util/listeners/void_listener.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';

//颜色表
const Colors000 = const Color(0xFF000000);
const Colors333 = const Color(0xFF333333);
const Colors222 = const Color(0xFF222222);
const Colors666 = const Color(0xFF666666);
const Colors999 = const Color(0xFF999999);
const ColorsF56A = const Color(0xFFF5F6FA); //一般是背景或线
const ColorsF115 = const Color(0xFFF1F1F5);
const ColorsFFF = const Color(0xFFFFFFFF);
const Colors777 = const Color(0xFF777777);
const Colors888 = const Color(0xFF888888);
const ColorsF3F3 = const Color(0xFFF3F3F3);
const Colors1818 = const Color(0xFFBB1818);
const Colors8446 = const Color(0xFFFF8446);
const Colors9797 = const Color(0xFF979797);
const ColorsDDDD = const Color(0xFFDDDDDD);
const ColorsD964 = const Color(0xFF4CD964);

const Colors99 = const Color(0xFF999999);
const ColorsF3 = const Color(0xFFF3F3F3);
const ColorsE6 = const Color(0xFFE6E6E6);
const ColorsE8 = const Color(0xFFE8E8E8);

const ColorsF5 = const Color(0xFFF5F5F4);
const ColorsC7 = const Color(0xFFC7C7C7);
const Colors040 = const Color(0xFF040000);
const Colors84 = const Color(0xFF848484);
const Colors50 = const Color(0xFF505050);
const ColorsE2 = const Color(0xFFE2E2E2);
const ColorsD8 = const Color(0xFFD8D8D8);
const ColorsF2 = const Color(0xFFF2F2F2);

/// 背景色
const ColorsF8 = const Color(0xFFF8F8F8);
/// 字体颜色
const Colors22 = const Color(0xFF222222);
/// 主题色-黄
const ColorsThemeY = const Color(0xFF5078FF);
/// 主题色-红、盈利
const ColorsThemeR = const Color(0xFFF9544E);
/// 主题色-蓝
const ColorsThemeB = const Color(0xFF498DFD);


const ColorsWhite = Colors.white;
const ColorsBlack = Colors.black;
const ColorsTransparent = Colors.transparent;

//A#FF8446 B#505050  C#FFCC00
class ThemeColor188 {
  static LinearGradient get barLinear => LinearGradient(colors: [
    ThemeColor188.colorA,
    ThemeColor188.colorA,
    // Color(0xFFFF8446),
    // Color(0xFFFFB749),
  ]);

  static List<Color> get themeColorAs => [ThemeColor188.colorA, ThemeColor188.colorA];

  static void update({bool fromServer=false, Map<String, dynamic>theme}) {
    print('00-ThemeColor188-theme=${theme?.toString()}');
    var json = AiJson(theme);
    if(config.isNSports && theme != null) {
      themeStyle = json.getNum(themeStyleKey);
      print('11-ThemeColor188-themeStyle=$themeStyle, theme=$theme');
    }
    if(themeStyle == 1 && fromServer) return;

    if(theme == null || themeStyle == 0) { // 使用本地
      print('00-update');
      var themeString = ccCache.getString(themeCacheKey, '{}');
      if(themeString == '{}') return;

      theme = jsonDecode(themeString);
      json = AiJson(theme);
      print('11-update, themeString=$themeString');
      if(theme == null) return;
    }
    print('22-update-themeColor=${json.getString(themeColorKey)}, theme=${theme?.toString()}');

    _logo = json.getString(loginLogoKey);
    _colorA = hexToColor(json.getString(themeColorKey), defaultColor: ThemeColor188.colorA);
    _colorB = hexToColor(json.getString(auxiliaryColorKey), defaultColor: ThemeColor188.colorB);
    _colorC = hexToColor(json.getString(fontColorKey), defaultColor: ThemeColor188.colorC);
    if(config.isNSports) {
      print('00-themeColorChanged');
      _themeColorChanged.fire();
    }
    print('33-update-_logo=$_logo');
  }

  /// null或0-使用接口主题色，1-使用传入值【新体育专用】
  static int themeStyle;
  static const String themeCacheKey = 'live188ThemeCache';
  static const String themeStyleKey = 'themeStyle';
  static const String loginLogoKey = 'loginLogo';
  static const String themeColorKey = 'themeColor';
  static const String auxiliaryColorKey = 'auxiliaryColor';
  static const String fontColorKey = 'fontColor';

  static VoidListener _themeColorChanged = VoidListener();
  static VoidListener get themeColorChanged => _themeColorChanged;

  static String _logo;
  static String get logo => _logo;

  // themeColor
  static Color _colorA = Color(0xFFFF8446);
  static Color get colorA => _colorA;

  // auxiliaryColor
  static Color _colorB = Color(0xFF505050);
  static Color get colorB => _colorB;

  // fontColor
  static Color _colorC = Color(0xFFFFCC00);
  static Color get colorC => _colorC;
}
