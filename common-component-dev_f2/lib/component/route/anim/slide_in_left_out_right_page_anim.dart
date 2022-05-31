import 'package:common_component/component/route/route.dart';
import 'package:flutter/material.dart';

//从右向左滑进来，退出时候自左向右出去
class SlideInLeftOutRightPageAnim extends PageRouteBuilder {
  SlideInLeftOutRightPageAnim(
      {final Duration duration,
      final PageBuilder pageBuilder,
      final RouteSettings settings})
      : super(
          transitionDuration: duration ?? Duration(milliseconds: 500),
          reverseTransitionDuration: duration ?? Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                .animate(CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            )),
            child: child,
          ),
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              pageBuilder(context),
        );
}
