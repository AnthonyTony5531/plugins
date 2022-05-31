import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HorizontalPlayNavStyle {
  HorizontalPlayNavStyle();

  var padding = EdgeInsets.only(left: 5);
  var margin = EdgeInsets.all(0);
  var width = double.infinity;
  var height = 43.0;
  var backgroundColor = config.skin.colors.bgColorGloabl; //Color(0xFFFFFFFF);
  var opacity = 0.5;
  var opacitySelected = 1.00;

  var lineColor = Colors.transparent;

  // /标题未选中格式
  var titleStyle = TextLayout(
      textAlign: TextAlign.end,
      overflow: TextOverflow.clip,
      maxLines: 1,
      textScaleFactor: 1,
      style: AiTextStyle(
          color: Color.fromRGBO(255,255,255,0.7),
          fontSize: 14,
          fontFamily: config.skin.fontFimaly.pingFang,
          letterSpacing: 0.27,
          wordSpacing: 0,
          //backgroundColor: Color(0xFFFFF000),
          fontWeight: FontWeight.w600));

  // /计数未选中格式
  var countStyle = TextLayout(
      textAlign: TextAlign.left,
      overflow: TextOverflow.clip,
      maxLines: 1,
      textScaleFactor: 1,
      style: AiTextStyle(
          color: Color(0xFF030A22),
          fontSize: 9,
          fontFamily: config.skin.fontFimaly.liGothicMed,
          letterSpacing: 0.17,
          wordSpacing: 0,
          fontWeight: FontWeight.w600));

  var anchorStyle = TextLayout(
      textAlign: TextAlign.left,
      overflow: TextOverflow.clip,
      maxLines: 1,
      textScaleFactor: 1,
      style: AiTextStyle(
          color: Color(0xFF030A22),
          fontSize: 9,
          fontFamily: config.skin.fontFimaly.liGothicMed,
          letterSpacing: 0.17,
          wordSpacing: 0,
          fontWeight: FontWeight.w600));

  // /标题选中格式
  var titleStyleSelectd = TextLayout(
      textAlign: TextAlign.end,
      overflow: TextOverflow.clip,
      maxLines: 1,
      textScaleFactor: 1,
      style: AiTextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: config.skin.fontFimaly.pingFang,
          letterSpacing: 0.31,
          wordSpacing: 0,
          fontWeight: FontWeight.w600));

  // / 计数选中格式
  var countStyleSelected = TextLayout(
      textAlign: TextAlign.left,
      overflow: TextOverflow.clip,
      maxLines: 1,
      textScaleFactor: 1,
      flagColor: config.customStyle.themeColor,
      style: AiTextStyle(
          color: Color(0xFF000000),
          fontSize: 9,
          fontFamily: config.skin.fontFimaly.liGothicMed,
          letterSpacing: 0.31,
          wordSpacing: 0,
          fontWeight: FontWeight.w600));
}

class TextLayout {
  TextAlign textAlign;
  TextOverflow overflow;
  int maxLines;
  double textScaleFactor;
  Color flagColor;
  TextStyle style;
  TextLayout({this.textAlign, this.overflow, this.maxLines, this.textScaleFactor, this.style, this.flagColor});
}
