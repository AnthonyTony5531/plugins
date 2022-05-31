import 'package:flutter/material.dart';

enum ViewState {
  VISIBLE,
  INVISIBLE,
  GONE,
}

/// 當需要對 Widget 的可見狀態進行改變時，以 [VisibilityWidget] 包覆即可。
///
/// ViewState 共有三種顯示元件的方式：
/// [ViewState.VISIBLE] 子元件可見。
/// [ViewState.INVISIBLE] 子元件不可見，但仍佔據空間。
/// [ViewState.GONE] 子元件不可見，且不佔據空間。
class VisibilityWidget extends StatefulWidget {
  const VisibilityWidget({
    Key key,
    @required this.child,
    @required this.visible,
  }) : super(key: key);

  final Widget child;
  final ViewState visible;

  @override
  VisibilityWidgetState createState() => VisibilityWidgetState();
}

class VisibilityWidgetState extends State<VisibilityWidget> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: widget.child,
      visible: widget.visible == ViewState.VISIBLE,
      maintainSize: widget.visible == ViewState.INVISIBLE,
      maintainAnimation: widget.visible == ViewState.INVISIBLE,
      maintainState: widget.visible == ViewState.INVISIBLE,
    );
  }
}
