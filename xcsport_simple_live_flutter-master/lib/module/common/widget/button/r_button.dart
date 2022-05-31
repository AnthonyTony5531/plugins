import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

enum RButtonSize {
  large,
  normal,
  small,
}

enum RButtonStyle {
  white,
  gradient,
}

class RButton extends StatelessWidget {
  final double w;
  final RButtonSize size;
  final EdgeInsetsGeometry padding;
  final RButtonStyle style;
  final String title;
  final Function onTap;

  RButton({
    Key key,
    this.size = RButtonSize.normal,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.style = RButtonStyle.white,
    this.w,
    this.title = '',
    this.onTap,
  }) : super(key: key);

  /// 根据UI设计定义
  final Map<RButtonSize, double> heights = {
    RButtonSize.large: 50,
    RButtonSize.normal: 44,
    RButtonSize.small: 36,
  };

  final Map<RButtonSize, double> fonts = {
    RButtonSize.large: 15,
    RButtonSize.normal: 14,
    RButtonSize.small: 13,
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heights[size] ?? 44.0,
        width: w,
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          color: style == RButtonStyle.gradient ? null : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(99)),
          gradient: style == RButtonStyle.gradient
              ? LinearGradient(
                  colors: [beginColor, endColor],
                )
              : null,
        ),
        child: Text(
          title,
          style: style == RButtonStyle.gradient
              ? whiteTitleStyle
              : blackTitleStyle,
        ),
      ),
    );
  }

  Color get beginColor => Color(0xFFFF8E70);
  Color get endColor => Color(0xFFFF8BFB);

  TextStyle get blackTitleStyle => cmPackage.res.textCreator.style(
        fontSize: fonts[this.size] ?? 14,
        color: Color(0xFF666666),
      );

  TextStyle get whiteTitleStyle => cmPackage.res.textCreator.style(
        fontSize: fonts[this.size] ?? 14,
        color: Colors.white,
      );
}
