import "package:fast_ai/utils/ai_image.dart";
import 'dart:math';
import 'package:flutter/material.dart';
import './canvas_circle_base.dart';
import './turn_box.dart';

class GradientCircularProgressRoute extends StatefulWidget {
  @override
  GradientCircularProgressRouteState createState() {
    return new GradientCircularProgressRouteState();
  }
}

class GradientCircularProgressRouteState extends State<GradientCircularProgressRoute> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 2));
    bool isForward = true;
    // _animationController.addStatusListener((status) {
    //   if (status == AnimationStatus.forward) {
    //     isForward = true;
    //   } else if (status == AnimationStatus.completed ||
    //       status == AnimationStatus.dismissed) {
    //     if (isForward) {
    //       _animationController.reverse();
    //     } else {
    //       _animationController.forward();
    //     }
    //   } else if (status == AnimationStatus.reverse) {
    //     isForward = false;
    //   }
    // });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget child) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 104.0,
                      width: 100.0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Positioned(
                            height: 100.0,
                            top: 10,
                            child: TurnBox(
                              turns: 0.64,
                              child: GradientCircularProgressIndicator(
                                colors: [Color(0xFFF05050), Color(0xFFFC9393)],
                                radius: 45.0,
                                stokeWidth: 5.0,
                                value: 0.4, //_animationController.value,
                                totalAngle: 1.45 * pi,
                                strokeCapRound: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Text(
                              "HAHA",
                              style: AiTextStyle(
                                fontSize: 15.0,
                                color: Colors.blueGrey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
