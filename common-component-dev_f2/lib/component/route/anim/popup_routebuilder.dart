
import 'package:flutter/material.dart';

Widget _defaultTransitionsBuilder(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  return child;
}


class PopupRouteBuilder<T> extends PopupRoute<T> {

  PopupRouteBuilder({
    RouteSettings settings,
    @required this.pageBuilder,
    this.transitionsBuilder = _defaultTransitionsBuilder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.reverseTransitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
    bool fullscreenDialog = false,
  }) : assert(pageBuilder != null),
        assert(transitionsBuilder != null),
        assert(opaque != null),
        assert(barrierDismissible != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        super(settings: settings);

  final RoutePageBuilder pageBuilder;

  final RouteTransitionsBuilder transitionsBuilder;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return pageBuilder(context, animation, secondaryAnimation);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return transitionsBuilder(context, animation, secondaryAnimation, child);
  }
}
