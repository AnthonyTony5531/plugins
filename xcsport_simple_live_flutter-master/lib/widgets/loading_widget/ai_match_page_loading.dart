import 'dart:async';
import 'dart:math' as Math;

import 'package:flutter/material.dart';

// 获取斜线角度30°
final double _lineTanValue = Math.sqrt(3) / 3;

class AiMatchPageLoading extends StatefulWidget {
  final double width;
  final double height;
  final double bold;
  final double tanValue;
  final int lineCount;
  final int animateTime;
  final List<Color> colors;

  AiMatchPageLoading({Key key, @required this.width, @required this.height, this.colors, tanValue, bold, lineCount, animateTime})
      : bold = bold ?? 15.0,
        animateTime = animateTime ?? 2000,
        tanValue = tanValue ?? _lineTanValue,
        lineCount = lineCount ?? 5,
        super(key: key);

  @override
  State<AiMatchPageLoading> createState() => _AiMatchPageLoadingState();
}

class _AiMatchPageLoadingState extends State<AiMatchPageLoading> {

  ScrollController _controller;
  int _sliderTime;
  Timer _delayTimer;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    _controller.addListener(onScrollListener);

    _sliderTime = widget.animateTime;

    WidgetsBinding.instance.addPostFrameCallback((_) => _startAnimate());
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _controller?.removeListener(onScrollListener);
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  void onScrollListener() {
    if (_controller.position.pixels == 0.0) _startAnimate();
  }

  void _startAnimate() {
    if (_sliderTime != 0 && mounted && _controller != null) {
      _controller.jumpTo(_controller.position.maxScrollExtent);
      _delayTimer?.cancel();
      _delayTimer = Timer(const Duration(milliseconds: 20),(){
        _controller.animateTo(0.0, duration: Duration(milliseconds: _sliderTime), curve: Curves.linear);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildFixWidthView(context);
  }

  Widget _buildFixWidthView(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isFix = widget.width > screenWidth;

    return SizedBox(
      width: isFix ? screenWidth : widget.width,
      height: widget.height,
      child: AbsorbPointer(
        absorbing: true,
        child: SingleChildScrollView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          child: ClipPath(
            clipper: FixLineClipper(bold: widget.bold, lineCount: widget.lineCount),
            child: Container(
              width: isFix ? widget.width : widget.width * 2,
              height: widget.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: widget.colors ??
                      const [
                        Color(0xFF25E1FE),
                        Color(0x191B91FF),
                      ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FixLineClipper extends CustomClipper<Path> {
  final double bold;
  final int lineCount;

  FixLineClipper({@required this.bold, @required this.lineCount});

  @override
  Path getClip(Size size) {
    final tH = size.height;
    final tW = size.width;

    final space = (tW - (lineCount * bold)) / lineCount;

    Path path = Path();

    final xDis = tH * Math.sqrt(3);

    double start = 0;

    // 右侧
    for (int i = 0; i < lineCount; i++) {
      Offset pos1 = Offset(0 + start, tH);
      Offset pos2 = Offset(bold + start, tH);

      Offset pos3 = Offset(xDis + start, 0);
      Offset pos4 = Offset(xDis + start + bold, 0);

      path.moveTo(pos1.dx, pos1.dy);
      path.lineTo(pos2.dx, pos2.dy);
      path.lineTo(pos4.dx, pos4.dy);
      path.lineTo(pos3.dx, pos3.dy);

      start = start + bold + space;
    }

    // 左侧
    final leftCount = (xDis - space) ~/ (space + bold);
    start = xDis - space;

    for (int i = 0; i < leftCount; i++) {
      Offset pos1 = Offset(start, 0);
      Offset pos2 = Offset(start - bold, 0);

      final pos3H = start / Math.sqrt(3);
      final pos4H = (start - bold) / Math.sqrt(3);

      Offset pos3 = Offset(0, pos3H);
      Offset pos4 = Offset(0, pos4H);

      path.moveTo(pos1.dx, pos1.dy);
      path.lineTo(pos2.dx, pos2.dy);
      path.lineTo(pos4.dx, pos4.dy);
      path.lineTo(pos3.dx, pos3.dy);

      start = start - bold - space;
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
