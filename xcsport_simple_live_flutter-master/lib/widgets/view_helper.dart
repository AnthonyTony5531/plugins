import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/util/ai_measure.dart';
import "package:fast_ai/utils/ai_image.dart";
//--------------------------------------------------------------------------
// @author sam
// @Date 2019/11/7
//--------------------------------------------------------------------------

import 'package:fast_ai/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//文本辅助类
abstract class TextHelper {
  static Widget build(String text,
      {int textColor = 0x000000,
      double fontSize,
      List<Shadow> shadows,
      int maxLine = -1,
      String fontFamily,
      TextOverflow overflow = TextOverflow.ellipsis,
      bool isBold = false,
      double opacity = 1.0,
      textAlign: TextAlign.start,
      TextStyle style}) {
    fontSize = fontSize ?? TextSize.normal;
    fontFamily = fontFamily ?? FontFamily.normal;
    Text textWidget = maxLine > 0
        ? Text(
            text,
            maxLines: maxLine,
            overflow: overflow,
            textAlign: textAlign,
            style: style ??
                AiTextStyle(
                    fontSize: fontSize,
                    color: Color(textColor),
                    fontFamily: fontFamily,
                    shadows: shadows,
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          )
        : Text(
            text,
            overflow: overflow,
            textAlign: textAlign,
            style: style ??
                AiTextStyle(
                    fontSize: fontSize,
                    shadows: shadows,
                    color: Color(textColor),
                    fontFamily: fontFamily,
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          );
    return 1.0 == opacity
        ? textWidget
        : Opacity(
            child: textWidget,
            opacity: opacity,
          );
  }

  //小文本
  static Widget buildSmall(String text,
      {int textColor,
      bool isBold = false,
      int maxLine = -1,
      double opacity = 1.0,
      String fontFamily,
      TextOverflow overflow = TextOverflow.ellipsis,
      TextAlign textAlign,
      TextStyle style}) {
    return build(text,
        fontSize: TextSize.small,
        textColor: textColor ?? config.skin.colors.fontColorDisable.value,
        isBold: isBold,
        fontFamily: fontFamily,
        maxLine: maxLine,
        opacity: opacity,
        textAlign: textAlign,
        overflow: overflow,
        style: style);
  }

  //一般文本
  static Widget buildNormal(String text,
      {int textColor,
      bool isBold = false,
      int maxLine = -1,
      String fontFamily,
      double opacity = 1.0,
      TextOverflow overflow = TextOverflow.ellipsis,
      TextAlign textAlign,
      TextStyle style}) {
    return build(text,
        fontSize: TextSize.normal,
        textColor: textColor ?? config.skin.colors.fontColorRegular.value,
        isBold: isBold,
        fontFamily: fontFamily,
        maxLine: maxLine,
        opacity: opacity,
        overflow: overflow,
        textAlign: textAlign,
        style: style);
  }

  //内容的标题
  static Widget buildContentTitle(String text,
      {int textColor,
      bool isBold = false,
      String fontFamily,
      int maxLine = -1,
      double opacity = 1.0,
      TextOverflow overflow = TextOverflow.ellipsis,
      TextStyle style,
      TextAlign textAlign}) {
    return build(text,
        fontSize: TextSize.contentTitle,
        textColor: textColor ?? config.skin.colors.fontColorRegular.value,
        isBold: isBold,
        maxLine: maxLine,
        textAlign: textAlign,
        fontFamily: fontFamily,
        opacity: opacity,
        overflow: overflow,
        style: style);
  }

  //菜单栏的title
  static Widget buildBarTitle(String text,
      {int textColor,
      String fontFamily,
      bool isBold = true,
      int maxLine = -1,
      double opacity = 1.0,
      TextOverflow overflow = TextOverflow.ellipsis,
      TextStyle style}) {
    return build(text,
        fontSize: TextSize.barTitle,
        textColor: textColor ?? config.skin.colors.fontColorDark.value,
        isBold: isBold,
        maxLine: maxLine,
        fontFamily: fontFamily,
        opacity: opacity,
        overflow: overflow,
        style: style);
  }

  //超级大的标题
  static Widget buildLargeTitle(String text,
      {int textColor,
      bool isBold = true,
      int maxLine = -1,
      String fontFamily,
      double opacity = 1.0,
      TextOverflow overflow = TextOverflow.ellipsis,
      TextStyle style}) {
    return build(text,
        fontSize: TextSize.largeTitle,
        textColor: textColor ?? config.skin.colors.fontColorDark.value,
        isBold: isBold,
        fontFamily: fontFamily,
        maxLine: maxLine,
        opacity: opacity,
        overflow: overflow,
        style: style);
  }

  //超级大的内容字体
  static Widget buildLargeContent(String text,
      {int textColor,
      bool isBold = false,
      int maxLine = -1,
      String fontFamily,
      double opacity = 1.0,
      TextOverflow overflow = TextOverflow.ellipsis,
      TextStyle style}) {
    return build(text,
        fontSize: TextSize.largeConent,
        textColor: textColor ?? config.skin.colors.fontColorDark.value,
        isBold: isBold,
        fontFamily: fontFamily,
        maxLine: maxLine,
        opacity: opacity,
        overflow: overflow,
        style: style);
  }
}

//线辅助类
class LineHelper {
  static Container buildVLine(
      {double height = -1,
      double bold = 1,
      int color = 0xFFF5F5F5,
      double paddingLeft = 0,
      double paddingRight = 0}) {
    return height > 0
        ? Container(
            margin: EdgeInsets.only(left: paddingLeft, right: paddingRight),
            color: Color(color),
            height: height,
            width: bold,
          )
        : Container(
            margin: EdgeInsets.only(left: paddingLeft, right: paddingRight),
            color: Color(color),
            width: bold,
          );
  }

//横线
  static Container buildHLine(
      {double width = -1,
      double bold = 1,
      int color,
      double paddingLeft = 0,
      double paddingRight = 0,
      List<int> colors}) {
    color = color ?? config.skin.colors.deviderColor.value;
    return width > 0
        ? Container(
            margin: EdgeInsets.only(left: paddingLeft, right: paddingRight),
            color: null != colors ? null : Color(color),
            decoration: colors == null
                ? null
                : BoxDecoration(
                    gradient: LinearGradient(
                        colors: []..addAll(
                            colors.map<Color>((f) => Color(f)).toList()))),
            width: width,
            height: bold,
          )
        : Container(
            margin: EdgeInsets.only(left: paddingLeft, right: paddingRight),
            color: null != colors ? null : Color(color),
            decoration: colors == null
                ? null
                : BoxDecoration(
                    gradient: LinearGradient(
                        colors: []..addAll(
                            colors.map<Color>((f) => Color(f)).toList()))),
            height: bold,
          );
  }

  //过渡颜色线
  static Container buildRLine(
      {double width = -1,
      List<Color> colors,
      double bold = 20,
      BorderRadius borderRadius}) {
    return Container(
      width: width > 0 ? width : null,
      height: bold,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        shape: BoxShape.rectangle,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
    );
  }

  //虚线
  static Widget buildHBrokenLine(
      {double bold = 1, Color color, double breadth = 1, double width}) {
    return Container(
        height: bold,
        width: width,
        child: BrokenLine(
          color: color ?? config.skin.colors.deviderColor,
          breadth: breadth,
        ));
  }
}

class BrokenLine extends StatelessWidget {
  final Color color;
  final double breadth;

  BrokenLine({this.color = Colors.white, this.breadth = 1});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cst) {
        return CustomPaint(
          size: Size(
            cst.constrainWidth(),
            double.infinity == cst.constrainHeight()
                ? 1
                : cst.constrainHeight(),
          ),
          painter: _BrokenLinePainter(color: this.color, breadth: breadth),
        );
      },
    );
  }
}

class _BrokenLinePainter extends CustomPainter {
  final Color color;
  final double breadth;

  _BrokenLinePainter({this.color, this.breadth = 2});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint() // 创建一个画笔并配置其属性
      ..strokeWidth = 1 // 画笔的宽度
      ..isAntiAlias = true // 是否抗锯齿
      ..color = color; // 画笔颜色
    //绘制虚线
    double lineLeft = 0;
    while (lineLeft < size.width) {
      double right = lineLeft + 4;
      if (right > size.width) {
        right = size.width;
      }
      canvas.drawRect(Rect.fromLTRB(lineLeft, 0, right, size.height), paint);
      lineLeft = right + breadth;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

//间隔,类似margin用法，将view隔开
class InterValHelper {
  @deprecated
  static Container w(double width) {
    return Container(
      width: width,
    );
  }

  @deprecated
  static Container h(double height) {
    return Container(
      height: height,
    );
  }

  static Widget sw(double width) {
    return SizedBox(
      width: width,
    );
  }

  static Widget sh(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Widget fill() {
    return Expanded(
      child: Container(),
    );
  }

  static Container size(double width, double height) {
    return Container(
      width: width,
      height: height,
    );
  }
}

//文本尺寸
class TextSize {
  static final double small = config.skin.fontSize.h6;
  static final double normal = config.skin.fontSize.h5;
  static final double contentTitle = config.skin.fontSize.h4;
  static final double largeConent = config.skin.fontSize.h2_1;
  static final double barTitle = config.skin.fontSize.h3;
  static final double largeTitle = config.skin.fontSize.h2;
}

class FontFamily {
  static final normal = config.skin.fontFimaly.pingFang;
  static final number = config.skin.fontFimaly.liGothicMed;
  static final ratio = config.skin.fontFimaly.dINCondensed;
  static final money = config.skin.fontFimaly.money;
}

@deprecated
Widget w(double width) {
  return InterValHelper.w(width);
}

@deprecated
Widget h(double height) {
  return InterValHelper.h(height);
}

Widget sw(double width) {
  return InterValHelper.sw(width);
}

Widget sh(double height) {
  return InterValHelper.sh(height);
}

Widget safeTop() {
  return sh(AiMeasure.topOffset(ccRoute?.navigator?.context));
}

Widget safeBottom() {
  return  sh(AiMeasure.bottomOffset(ccRoute?.navigator?.context));
}

