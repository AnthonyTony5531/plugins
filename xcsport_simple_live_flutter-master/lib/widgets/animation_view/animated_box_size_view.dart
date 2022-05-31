import 'package:flutter/material.dart';

/// 盒子大小变化 - 动画

class AnimatedSizeBoxView extends StatefulWidget {
  final Widget child;
  final double boxWidth;
  final double boxHeight;
  final Duration duration;
  final AnimatedBoxSizeController controller;
  final VoidCallback onShowCallBack;
  final VoidCallback onDismissCallBack;

  AnimatedSizeBoxView({
    Key key,
    @required this.child,
    @required this.boxWidth,
    @required this.boxHeight,
    @required this.controller,
    this.onShowCallBack,
    this.onDismissCallBack,
    this.duration,
  }) : super(key: key);

  @override
  _AnimatedSizeBoxState createState() {
    return _AnimatedSizeBoxState();
  }
}

class _AnimatedSizeBoxState extends State<AnimatedSizeBoxView> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  AnimatedBoxSizeController _boxSizeController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration ?? Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _controller.addListener(_onAnimationUpdate);
    _boxSizeController = widget.controller;
    _boxSizeController?.addListener(_onControllerListener);
  }

  @override
  void dispose() {
    _boxSizeController?.removeListener(_onControllerListener);
    _boxSizeController = null;
    _controller?.stop();
    _controller?.removeListener(_onAnimationUpdate);
    _controller = null;
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedSizeBoxView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      _boxSizeController?.removeListener(_onControllerListener);
      _boxSizeController = null;
      _boxSizeController = widget.controller;
      _boxSizeController?.addListener(_onControllerListener);
    }
//    _controller.removeListener(_onAnimationUpdate);
//    if(oldWidget.showTime != widget.showTime){
//      _controller.duration = widget.showTime;
//      _controller.stop();
//    }
  }

  void _onAnimationUpdate() {
    if (mounted) {
      setState(() {});
    }
  }

  void _onControllerListener() {
    if (!_controller.isAnimating && _boxSizeController != null) {
      if (_boxSizeController.isShow && _controller.isDismissed) {
        widget.onShowCallBack?.call();
        _controller.forward();
        return;
      }

      if (!_boxSizeController.isShow && _controller.isCompleted) {
        widget.onDismissCallBack?.call();
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          SizedBox(
            width: _width,
            height: _height,
            child: widget.child ?? SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  double get _width => (widget?.boxWidth ?? 0) * (_animation?.value ?? 0);

  double get _height => (widget?.boxHeight ?? 0) * (_animation?.value ?? 0);
}

class AnimatedBoxSizeController extends ChangeNotifier {
  bool _displayState = false;

  bool get isShow => _displayState;

  void showBox() {
    if (!_displayState) {
      _displayState = true;
      notifyListeners();
    }
  }

  void dismissBox() {
    if (_displayState) {
      _displayState = false;
      notifyListeners();
    }
  }
}
