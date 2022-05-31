import "package:fast_ai/utils/ai_image.dart";




import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AiMeasure {

  static Size getTextSize(String text, {TextStyle style, double fontSize, double maxWidth}) {
    assert(!(style == null && fontSize == null));

    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(text:text, style: style ?? AiTextStyle(
        fontSize: fontSize ?? 10,
        fontWeight: FontWeight.w400,
      ))
    );
    if(maxWidth != null) textPainter.layout(maxWidth: maxWidth);
    else textPainter.layout();
    return textPainter.size;
  }

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
        text: TextSpan(text:text,style: AiTextStyle(
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


  static double videoPortraitHeight(BuildContext context){
    return  0.562512 * MediaQuery.of(context).size.width;
  }

  static double animationPortraitHeight(BuildContext context){
    return  653.0/1307.0  * MediaQuery.of(context).size.width ;
  }

   static double animationPortraitWidth(BuildContext context){
    return  1307.0/653.0  * MediaQuery.of(context).size.height;
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
    bool value = textPainter.didExceedMaxLines;
    return value;
  }

  static Size measureTextCondition(String text, TextStyle style, double width,int maxLines){
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(text:text,style: style),
      maxLines: maxLines,
    );
    textPainter.layout(maxWidth: width);
    return textPainter.size;
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
      text: TextSpan(text:text,style: AiTextStyle(
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


