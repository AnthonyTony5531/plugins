import "package:fast_ai/utils/ai_image.dart";

//**********************************************************************
//* author:Sam
//* date:2020-03-24
//**********************************************************************

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/formula_titans.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/string_util.dart';
import 'gradient_text.dart';

//战绩进度条
class CombatGainsProgress extends StatelessWidget {
  final double progress;
  final double size;

  CombatGainsProgress({this.size, this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(this.size, this.size),
            painter: _Pointer(progress ?? 0),
          ),
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                null == progress
                    ? TextHelper.buildNormal('--')
                    : GradientText(
                        text: "${(progress * 100).toInt()}%",
                        colors: [
                          Color.fromRGBO(255, 157, 3, 1),
                          Color.fromRGBO(255, 39, 0, 1),
                        ],
                        textStyles: AiTextStyle(fontSize: 22, fontFamily: FontFamily.ratio),
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    config.langMap['baseLang']['page']['rate'],
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: AiTextStyle(
                        fontSize: 10,
                        fontFamily: config.skin.fontFimaly.pingFang,
                        fontWeight: config.skin.fontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Pointer extends CustomPainter {
  final double progress;

  _Pointer(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final centerOffset = Offset(size.width / 2, size.height / 2);

    Paint bitPaintGay = new Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..strokeCap = StrokeCap.butt
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Paint smallPaintGray = new Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..strokeCap = StrokeCap.butt
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawArc(Rect.fromCenter(center: centerOffset, width: size.width, height: size.height), FormulaTitans.angleToRadian(0),
        FormulaTitans.angleToRadian(360), false, bitPaintGay);

    canvas.drawArc(
        Rect.fromCenter(
            center: centerOffset,
            width: size.width - 4 - smallPaintGray.strokeWidth - bitPaintGay.strokeWidth,
            height: size.height - 4 - smallPaintGray.strokeWidth - bitPaintGay.strokeWidth),
        FormulaTitans.angleToRadian(0),
        FormulaTitans.angleToRadian(360),
        false,
        smallPaintGray);

    LinearGradient linearGradient = new LinearGradient(colors: [
      Color.fromRGBO(255, 157, 3, 1),
      Color.fromRGBO(255, 39, 0, 1),
    ]);
    var shader =
        linearGradient.createShader(Rect.fromCenter(center: Offset(size.width / 2, size.height / 2), width: size.width, height: size.height));

    Paint bitPaint = new Paint()
      ..color = Color.fromRGBO(246, 223, 171, 1)
      ..strokeCap = StrokeCap.butt
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..shader = shader
      ..strokeWidth = 4;

    Paint smallPaint = new Paint()
      ..color = Color.fromRGBO(246, 223, 171, 1)
      ..strokeCap = StrokeCap.butt
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..shader = shader
      ..strokeWidth = 1;

    canvas.drawArc(Rect.fromCenter(center: centerOffset, width: size.width, height: size.height), FormulaTitans.angleToRadian(90),
        FormulaTitans.angleToRadian(progress * 360), false, bitPaint);

    canvas.drawArc(
        Rect.fromCenter(
            center: centerOffset,
            width: size.width - 4 - smallPaint.strokeWidth - bitPaint.strokeWidth,
            height: size.height - 4 - smallPaint.strokeWidth - bitPaint.strokeWidth),
        FormulaTitans.angleToRadian(90),
        FormulaTitans.angleToRadian(progress * 360),
        false,
        smallPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
