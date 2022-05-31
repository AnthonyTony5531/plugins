import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayGroupNavStyle {
  PlayGroupNavStyle();

 var padding = EdgeInsets.only(left: 5);
  var margin = EdgeInsets.all(0);
  var width = double.infinity;
  var height = 54.0;
  var backgroundColor = Color(0xFFFFFFFF);
  var opacity = 0.5;
  var opacitySelected = 1.00;
  
  var lineColor = config.skin.colors.attentionColor1;

  // /标题未选中格式
  var titleStyle = TextLayout(
      textAlign : TextAlign.end,
      overflow: TextOverflow.clip,
      maxLines: 1,
      textScaleFactor: 1,
      style: AiTextStyle(
        color: config.skin.colors.fontColorWhite60,
        fontSize: 12,
        fontFamily: config.skin.fontFimaly.pingFang,
        letterSpacing: 0.23,
        wordSpacing: 0,
        //backgroundColor: Color(0xFFFFF000),
        fontWeight: config.skin.fontWeight.regular,
      )
  );



  // /计数未选中格式
  var countStyle = TextLayout(
    textAlign : TextAlign.left,
    overflow: TextOverflow.clip,
    maxLines: 1,
    textScaleFactor: 1,
    style: AiTextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 9,
      fontFamily: config.skin.fontFimaly.liGothicMed,
      letterSpacing: 0.17,
      wordSpacing: 0,
      fontWeight: FontWeight.w600
    )
  );

  var anchorStyle = TextLayout(
      textAlign : TextAlign.left,
      overflow: TextOverflow.clip,
      maxLines: 1,
      textScaleFactor: 1,
      style: AiTextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 9,
          fontFamily: config.skin.fontFimaly.liGothicMed,
          letterSpacing: 0.17,
          wordSpacing: 0,
          fontWeight: FontWeight.w600
      )
  );

  // /标题选中格式
  var titleStyleSelectd = TextLayout(    
    textAlign : TextAlign.end,
    overflow: TextOverflow.clip,
    maxLines: 1,
    textScaleFactor: 1,
    style: AiTextStyle(
      color: config.skin.colors.fontColorWhite,
      fontSize: 12,
      fontFamily: config.skin.fontFimaly.pingFang,
      letterSpacing: 0.27,
      wordSpacing: 0,
      fontWeight: config.skin.fontWeight.medium,
    )
  );

  // / 计数选中格式
  var countStyleSelected = TextLayout(
    textAlign : TextAlign.left,
    overflow: TextOverflow.clip,
    maxLines: 1,
    textScaleFactor: 1,
    flagColor: config.customStyle.themeColor,
    style: AiTextStyle(
      color: config.customStyle.themeIncludeFontColor,
      fontSize: 9,
      fontFamily: config.skin.fontFimaly.liGothicMed,
      letterSpacing: 0.31,
      wordSpacing: 0,
      fontWeight: FontWeight.w600
    )
  );

}

class TextLayout {
    TextAlign textAlign;
    TextOverflow overflow;
    int maxLines;
    double textScaleFactor;
    Color flagColor;
    TextStyle style;
    TextLayout({
      this.textAlign,
      this.overflow,
      this.maxLines,
      this.textScaleFactor,
      this.style,
      this.flagColor
    });
}
