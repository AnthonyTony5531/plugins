import 'dart:math';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoadingCircular extends StatefulWidget {
  final double size;

  LoadingCircular({Key key, this.size = 30}) : super(key: key);

  @override
  _LoadingCircularState createState() => _LoadingCircularState();
}

class _LoadingCircularState extends State<LoadingCircular> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _sizeAnimation;
  Animation<num> _radiansAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    _sizeAnimation = Tween(begin: widget.size, end: 0.0).animate(_controller);
    _radiansAnimation = Tween(begin: 0.0, end: pi).animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller?.repeat();
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller?.stop();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var image = 'assets/images/public/icon_loading_football_normal.svg';
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        double radians = _radiansAnimation.value;
//        if (!_forward) {
//          radians = 2 * pi - radians;
//        }
        var offset1 = pi * (0 + 0.1);
        var offset2 = pi * (1 - 0.1);
        var radians1 = (2 * pi - radians + offset1) % (2 * pi);
        var radians2 = (2 * pi - radians + offset2) % (2 * pi);

        return SizedBox(
          width: widget.size * 1.3,
          height: widget.size,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(sin(radians1), cos(radians1)),
                child: SizedBox(
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  child: child,
                ),
              ),
              Align(
                alignment: Alignment(sin(radians2), cos(radians2)),
                child: SizedBox(
                  width: widget.size - _sizeAnimation.value,
                  height: widget.size - _sizeAnimation.value,
                  child: child,
                ),
              )
            ],
          ),
        );
      },
      child: AiSvgPicture.asset(image),
    );
  }
}

//class CircularWidget extends StatelessWidget {
//  final double size;
//  final Color color;
//
//  const CircularWidget({Key key, this.size = 0, this.color}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: ClipOval(
//        child: Container(
//          width: this.size,
//          height: this.size,
//          color: this.color,
//        ),
//      ),
//    );
//  }
//}
//
//class HalfCircular1 extends Curve {
//  @override
//  double transform(double t) {
//    return t / 2;
//  }
//}
//
//class HalfCircular2 extends Curve {
//  @override
//  double transform(double t) {
//    return 1 - t / 2;
//  }
//}
