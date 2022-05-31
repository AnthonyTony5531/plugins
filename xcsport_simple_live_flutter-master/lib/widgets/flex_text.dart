//**********************************************************************
//* author:Sam
//* date:2020-04-10
//**********************************************************************

import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/cupertino.dart';

//自由伸缩文本组件。如果文字超过一行，显示另外一个样式
// ignore: must_be_immutable
class FlexText extends StatelessWidget {
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final String text;
  //正常一行的样式
  final TextStyle normalStyle;
  //超过一行显示的样式
  final TextStyle flexStyle;
  //第二个样式最大行树木
  final int maxLines;
  final Alignment alignment;
  FlexText(this.text, {this.normalStyle,this.alignment= Alignment.center,  this.flexStyle,this.maxLines,  this.textAlign, this.textDirection, this.locale, this.softWrap, this.overflow, this.textScaleFactor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth - AiMeasure.measureText(text,normalStyle).width<0){
          return Text(text, maxLines: maxLines,
            style: flexStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,);
        }
        return Text(text, style: normalStyle, textAlign: textAlign, textDirection: textDirection, locale: locale, softWrap:softWrap, overflow:overflow,
          textScaleFactor: textScaleFactor,);
      },
    );

  }


}



