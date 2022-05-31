

/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-12-17
 * 表情文本
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/


import 'package:flutter/material.dart';

class AiEmojiText extends CustomPainter {
  final String data;
  final TextStyle style;
  final StrutStyle strutStyle;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;
  final TextWidthBasis textWidthBasis;
  const AiEmojiText(this.data, {
    Key key,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.center,
    this.textDirection = TextDirection.rtl,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var text = data ?? "";
    for (var i = 0; i < text.length; i++) {
      TextSpan span = new TextSpan(style: style,text: text[i]);
      TextPainter tp = TextPainter(
        text: span,
        textAlign: textAlign,
        textDirection: textDirection
      );
      tp.layout();
    }
  }

  String get text{
    return data ?? "";
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    var old = oldDelegate as AiEmojiText;
    return this.text != old.text;
  }
}

