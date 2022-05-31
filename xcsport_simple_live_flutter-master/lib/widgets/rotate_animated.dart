import 'package:flutter/cupertino.dart';

typedef FnCallback = void Function(AnimationController controller);

//旋转动画
class RotationWidget extends StatefulWidget {
  RotationWidget({
    @required this.child,
    this.durationMs,
    this.initState,
    
    this.onTap
  });

  final Widget child;
  final int durationMs;
  final FnCallback initState;
  final FnCallback onTap;

  @override
  State<StatefulWidget> createState() {
    var state = _RotationWidgetState();
    return state;
  }
}

class _RotationWidgetState extends State<RotationWidget> with SingleTickerProviderStateMixin {
  
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: this.widget.durationMs ?? 1000),
      vsync: this
    );
    if(this.widget.initState != null)
      this.widget.initState(controller);
  }

  @override
  Widget build(BuildContext context) {
    if(this.widget.onTap == null) {
      return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(controller),
        child: this.widget.child,
      );
    } else {
      return GestureDetector(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(controller),
          child: this.widget.child,
        ),
        onTap: () { this.widget.onTap(controller); },
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}