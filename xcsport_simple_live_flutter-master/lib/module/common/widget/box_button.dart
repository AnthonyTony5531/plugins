import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:flutter/material.dart';

class BoxButton extends StatelessWidget {
  final String text;
  final LinearGradient linearGradient;
  final TextStyle textStyle;
  final Color mainColor;
  final VoidCallback onTap;
  final EdgeInsets margin;
  final EdgeInsets midMargin;
  final double height;
  final Color midColor;
  final Widget prefixIcon;
  final Widget suffixIcon;

  BoxButton({
    this.text,
    this.linearGradient,
    this.textStyle,
    this.mainColor,
    this.onTap,
    this.margin,
    this.midMargin,
    this.height,
    this.midColor,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return linearGradient != null
        ? InkWell(
            onTap: onTap ?? () {},
            child: Container(
              height: height ?? 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: linearGradient,
              ),
              margin: this.margin,
              child: Container(
                color: midColor ?? Colors.white,
                alignment: Alignment.center,
                margin: /*midMargin ?? */const EdgeInsets.all(2),
                padding: midMargin ?? const EdgeInsets.all(3),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: linearGradient,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if(prefixIcon != null) prefixIcon,
                      Text(
                        text,
                        style: textStyle ??
                            cmPackageTextCreator.style(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14,
                            ),
                      ),
                      if(suffixIcon != null) suffixIcon,
                    ],
                  ),
                ),
              ),
            ),
          )
        : InkWell(
            onTap: onTap ?? () {},
            child: Container(
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: mainColor,
              ),
              margin: this.margin,
              child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(3),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 21,
                      child: Container(
                        color: Color(0xFFE0E0E0),
                      ),
                    ),
                    Positioned(
                      top: 21,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        color: mainColor,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if(prefixIcon != null) prefixIcon,
                          Text(
                            text,
                            style: textStyle ??
                                cmPackageTextCreator.style(
                                  color: Color(0xFF666666),
                                  fontSize: 14,
                                ),
                          ),
                          if(suffixIcon != null) suffixIcon,
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
