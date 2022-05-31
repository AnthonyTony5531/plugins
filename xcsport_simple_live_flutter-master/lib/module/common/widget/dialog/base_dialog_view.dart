import 'package:common_component/package/common_component_package.dart';
import 'package:flutter/material.dart';

class _DialogState {
  BuildContext context;
  bool isShow = false;
}

/// 自定义弹框 - 基类
/// 非188入口, show方法必须传BuildContext
abstract class BaseDialogView extends StatelessWidget {
  final _DialogState _state = _DialogState();

  @override
  Widget build(BuildContext context) {
    _state.context = context;
    return Material(
      color: Colors.transparent,
      child: builder(this, context),
    );
  }

  @protected
  Widget builder(BaseDialogView widget, BuildContext context);

  @protected
  Widget transitionBuilder(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.linear,
      ),
      child: ScaleTransition(alignment: Alignment.center, scale: animation, child: child),
    );
  }

  show({BuildContext context, bool isLoadBg, ValueChanged onCallBack}) {
    if (_state.isShow) return;
    _state.isShow = true;
    return _showAntDialog(
      context: context,
      isNotLoadBg: isLoadBg ?? false,
      pageBuilder: (context, animation, secondaryAnimation) => this,
      transitionBuilder: (_, animation, __, child) => transitionBuilder(animation, child),
    ).then((value) => onCallBack?.call(value)).whenComplete(() => _state.isShow = false);
  }

  dismiss({BuildContext context}) {
    if (_state.isShow) {
      if (context != null || _state.context != null) {
        Navigator.of(context ?? _state.context).pop();
      } else {
        ccRoute.navigator.pop();
      }
      _state.isShow = false;
    }
  }
}

Future<T> _showAntDialog<T>({
  BuildContext context,
  @required RoutePageBuilder pageBuilder,
  bool barrierDismissible = false,
  String barrierLabel = 'Dismiss',
  bool isNotLoadBg = false,
  Color barrierColor = const Color(0x80000000),
  Duration transitionDuration = const Duration(milliseconds: 300),
  RouteTransitionsBuilder transitionBuilder,
  bool useRootNavigator = true,
  RouteSettings routeSettings,
}) {
  assert(pageBuilder != null);
  assert(useRootNavigator != null);
  assert(!barrierDismissible || barrierLabel != null);
  final NavigatorState navigator =
      useRootNavigator ? context?.findRootAncestorStateOfType<NavigatorState>() : context?.findAncestorStateOfType<NavigatorState>();
  final dialogRoute = _NtDialogRoute<T>(
    pageBuilder: pageBuilder,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    barrierColor: barrierColor,
    isNotLoadBg: isNotLoadBg,
    transitionDuration: transitionDuration,
    transitionBuilder: transitionBuilder,
    settings: routeSettings,
  );
  // return Navigator.of(context).push(dialogRoute);
  // 引入全局的BuildContext , 避免Context出现空指针，无法弹框
  return navigator == null ? ccRoute.navigator.push(dialogRoute) : Navigator.of(context).push(dialogRoute);
}

class _NtDialogRoute<T> extends PopupRoute<T> {
  _NtDialogRoute({
    @required RoutePageBuilder pageBuilder,
    bool barrierDismissible,
    String barrierLabel,
    Color barrierColor,
    bool isNotLoadBg,
    Duration transitionDuration,
    RouteTransitionsBuilder transitionBuilder,
    RouteSettings settings,
  })  : assert(barrierDismissible != null),
        _pageBuilder = pageBuilder,
        _barrierDismissible = barrierDismissible,
        _barrierLabel = barrierLabel,
        _barrierColor = barrierColor,
        _transitionDuration = transitionDuration,
        _transitionBuilder = transitionBuilder,
        isNotLoadBg = isNotLoadBg,
        super(settings: settings);

  final RoutePageBuilder _pageBuilder;

  @override
  bool get barrierDismissible => _barrierDismissible;
  final bool _barrierDismissible;

  @override
  String get barrierLabel => _barrierLabel;
  final String _barrierLabel;

  @override
  Color get barrierColor => isNotLoadBg ? null : _barrierColor;
  final Color _barrierColor;

  @override
  Duration get transitionDuration => _transitionDuration;
  final Duration _transitionDuration;

  final RouteTransitionsBuilder _transitionBuilder;

  final bool isNotLoadBg;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Semantics(
      child: _pageBuilder(context, animation, secondaryAnimation),
      scopesRoute: true,
      explicitChildNodes: true,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (_transitionBuilder == null) {
      return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          ),
          child: child);
    } // Some default transition
    return _transitionBuilder(context, animation, secondaryAnimation, child);
  }
}
