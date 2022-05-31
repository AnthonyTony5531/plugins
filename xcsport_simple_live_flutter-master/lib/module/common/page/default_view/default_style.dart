import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:common_component/theme/view_style.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

class DefaultStyle extends ViewStyle {
  TextStyle get refreshTxtTextStyle => cmPackage.res.textCreator.style(
        color: Color(0xFFFFFFFF),
        fontSize: 13,
      );

  TextStyle get txtTextStyle => cmPackage.res.textCreator.style(
        color: Color(0xFF666666),
        fontSize: 14,
      );
}
