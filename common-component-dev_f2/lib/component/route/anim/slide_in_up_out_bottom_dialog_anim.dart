import 'package:common_component/package/common_component_package.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../route.dart';

//从底部向上滑进来，退出时候自顶向下出去
class SlideInUpOutBottomDialogAnim extends PopupRoute {
  final RouteSettings settings;
  final PageBuilder pageBuilder;
  final Color barrierColor;
  final bool barrierDismissible;
  final Duration duration;
  final String barrierLabel;
  final bool isDismissible;
  final ui.ImageFilter filter;
  final Color backgroundColor;
  SlideInUpOutBottomDialogAnim({
    @required this.settings,
    @required this.pageBuilder,
    this.duration,
    this.barrierColor = Colors.transparent,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.filter,
    this.backgroundColor,
    this.isDismissible = true,
  }) : super(settings: settings, filter: filter);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final Widget child = pageBuilder(context);
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
          .animate(CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn,
      )),
      child: WillPopScope(
        onWillPop: () async {
          return isDismissible;
        },
        child: GestureDetector(
          onTap: () {
            if (!isDismissible) {
              return;
            }
            ccRoute.pop();
          },
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: MediaQuery.removePadding(
                  removeTop: true, context: context, child: child),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Duration get transitionDuration => duration ?? Duration(milliseconds: 300);

  @override
  Duration get reverseTransitionDuration => transitionDuration;
}
