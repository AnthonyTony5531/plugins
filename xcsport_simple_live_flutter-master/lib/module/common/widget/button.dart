import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

@immutable
class PButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final TextStyle textStyle;
  final Decoration decoration;
  final double height;
  final double borderRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;

  PButton({
    Key key,
    this.onTap,
    this.text,
    this.textStyle,
    this.height,
    this.decoration,
    this.borderRadius,
    this.margin,
    this.padding,
  });

  final _BtnStyle style = _BtnStyle();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: height ?? 44,
        alignment: Alignment.center,
        decoration: decoration ??
            BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFFFF8E70),
                Color(0xFFFF8BFB),
              ]),
              borderRadius: BorderRadius.circular(borderRadius ?? 22),
            ),
        margin:
            margin ?? EdgeInsets.only(top: 20, bottom: 30, left: 12, right: 12),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text ?? '确认',
          style: textStyle ?? style.btnTextStyle,
        ),
      ),
    );
  }
}

@immutable
class _BtnStyle {
  TextStyle get btnTextStyle => cmPackageRes.textCreator.style(
        fontSize: 14,
        color: Color(0xFFFFFFFF),
      );
}
