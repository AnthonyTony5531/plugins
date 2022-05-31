
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AiMeasure {

  static Size measureText(String text, TextStyle style){
    TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text:text,style: style)
    );
    textPainter.layout();
    return textPainter.size;
  }

  static Size measureTextSize(String text, double textSize){
    TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text:text,style: TextStyle(
          fontSize: textSize
        ))
    );
    textPainter.layout();
    return textPainter.size;
  }


  static double topOffset(BuildContext context){
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double topPadding = window.padding.top / pixelRatio;
    return topPadding;
  }

  static double bottomOffset(BuildContext context){
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double topPadding = window.padding.bottom / pixelRatio;
    return topPadding;
  }

  static double rightOffset(BuildContext context){
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double topPadding = window.padding.right / pixelRatio;
    return topPadding;
  }

  static bool measureTextLineIsExceed(String text, TextStyle style, double width,int maxLines){
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(text:text,style: style),
      maxLines: maxLines,
    );
    textPainter.layout(maxWidth: width);
    return textPainter.didExceedMaxLines;
  }

  static double measureTextWidth(String text, TextStyle style){
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(text:text,style: style),
      maxLines: 1,
    );
    textPainter.layout();
    return textPainter.width;
  }

  static bool measureTextOneLineIsExceed(String text, double textSize, double width){
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(text:text,style: TextStyle(
        fontSize: textSize,
      )),
      maxLines: 1,
    );
    textPainter.layout(maxWidth: width);
    return textPainter.didExceedMaxLines;
  }

  static double screenWidth(BuildContext context)=>MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context)=>MediaQuery.of(context).size.height;

}


