import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';

Widget shapeButton({Widget child, double width, double height, Alignment alignment, EdgeInsetsGeometry margin, EdgeInsetsGeometry padding}) {
  return Container(
      width: width,
      height: height,
      margin:margin,
      padding:padding,
      alignment: alignment,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: config.customStyle.themeLinearColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0xFFB7E0FF),
                offset: Offset(0, 1),
                blurRadius: 0.1),
            BoxShadow(
                color: Color(0xFFB7E0FF),
                offset: Offset(0, -1),
                blurRadius: 0.1),
            BoxShadow(
                color: Color(0xFFB7E0FF),
                offset: Offset(1, 0),
                blurRadius: 0.1),
            BoxShadow(
                color: Color(0xFFB7E0FF),
                offset: Offset(-1, 0),
                blurRadius: 0.1),
          ],
          // border: Border.all(
          //     width: 0.5, color: Color(0xFFB7E0FF)),
          borderRadius: BorderRadius.all(Radius.circular(19.0))),
      child: child);
}
