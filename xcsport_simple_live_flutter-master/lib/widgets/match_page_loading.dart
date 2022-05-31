//**********************************************************************
//* author:Sam
//* date:2020-08-28
//**********************************************************************
import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef LoadingTimer = void Function(Timer timer);

//比赛加载页。
@Deprecated('use AiMatchPageLoading')
class MatchPageLoading extends StatefulWidget {
  final double height;
  final List<Color> colors;
  final double distance;
  final double width;
  final double bold;
  final LoadingTimer loadingTimer;
  final bool hasAnimation;

  const MatchPageLoading(
      {Key key,
      this.height = 100,
      this.width = 200,
      this.bold = 10,
      this.distance = 49,
      this.colors,
      this.loadingTimer,
      this.hasAnimation = true,})
      : super(key: key);

  @override
  PageLoadingState createState() => PageLoadingState();
}

class PageLoadingState extends State<MatchPageLoading> {
  final List<double> lineStartX = [];
  Timer timer;
  static const len = 400;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final screenWidth = MediaQuery.of(context).size.width;
      for (int i = 0; i < len; i++) {
        lineStartX.add(screenWidth - (i + 1) * widget.distance);
      }
      if(widget.hasAnimation){
        timer?.cancel();
        timer = Timer.periodic(Duration(milliseconds: 130), (timer) {
          if (mounted) {
            for (int i = 0; i < len - 1; i++) {
              var startX = lineStartX[i];
              if (startX - widget.width <= screenWidth) {
                lineStartX[i] = startX + widget.bold;
              } else {
                lineStartX[i] = lineStartX[len - 1] +
                    widget.distance +
                    widget.width +
                    widget.bold;
              }
            }
            if (mounted && timer.isActive) {
              setState(() {});
            }
          }
        });
        if (widget.loadingTimer != null) {
          widget.loadingTimer(timer);
        }
      } else {
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        child: CustomPaint(
          size: Size(double.infinity, widget.height),
          painter: _Painter(
              lineWidth: widget.width,
              lineHeight: widget.height,
              bold: widget.bold,
              lineStartX: lineStartX,
              colors: widget.colors),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

class _Painter extends CustomPainter {
  final double lineHeight;
  final List<double> lineStartX;
  final List<Color> colors;
  final double lineWidth;
  final double bold;
  var _paint = Paint();

  _Painter(
      {this.lineHeight,
      this.lineWidth,
      this.bold,
      this.lineStartX,
      this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    LinearGradient linearGradient = new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: colors ??
            [
             Color(0xFF25E1FE),
             Color(0xFF1B91FF).withOpacity(0.1),
            ]);
    var shader = linearGradient.createShader(Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height));
    _paint
      ..style = PaintingStyle.fill //线
      ..shader = shader
      ..strokeWidth = 1.0;

    lineStartX.forEach((element) {
      canvas.drawPath(createPath(element), _paint);
    });
  }

  Path createPath(double startX) {
    Path path = new Path();
    path.moveTo(startX, 0);
    path.lineTo(startX + bold, 0);
    path.lineTo(startX - lineWidth, lineHeight);
    path.lineTo(startX - lineWidth - bold, lineHeight);
    path.lineTo(startX, 0);
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
