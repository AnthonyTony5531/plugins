import 'package:flutter/material.dart';

import '../../lux_creater.dart';

/// * ClassName: text_style_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/18 15:24

class TextStyleCreater extends LuxCreater {

  @override
  create(BuildContext context, Map script) {
    return TextStyle(
      color: LuxCreater.parseColor(script, "color"),
      fontSize: LuxCreater.parseDouble(script, "fontSize"),
      fontStyle: LuxCreater.parseEnum(script, "fontStyle"),
      fontWeight: LuxCreater.parseEnum(script, "fontWeight"),
      letterSpacing: LuxCreater.parseDouble(script, "letterSpacing"),
      wordSpacing: LuxCreater.parseDouble(script, "wordSpacing"),
      textBaseline: LuxCreater.parseEnum(script, "textBaseline"),
      height: LuxCreater.parseDouble(script, "height"),
      decoration: LuxCreater.parseEnum(script, "decoration"),
      decorationColor: LuxCreater.parseColor(script, "decorationColor"),
      decorationStyle: LuxCreater.parseEnum(script, "decorationStyle"),
      package: LuxCreater.parseString(script, "package"),
    );
  }

  @override
  String get lux => 'TextStyle';

  @override
  Map get sample => {
        'lux': 'TextStyle',
        'color': '0xFFFF000000',
        'fontSize': '14.0',
        'fontStyle': 'FontStyle.normal',
        'fontWeight': 'FontWeight.normal',
        'textBaseline': 'TextBaseline.alphabetic',
        'decoration': 'TextDecoration.underline',
        'decorationColor': '0xFFFF000000',
      };
}
