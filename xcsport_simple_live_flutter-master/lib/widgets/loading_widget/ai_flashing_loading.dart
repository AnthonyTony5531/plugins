import 'package:flutter/material.dart';

class AiFlashingLoading extends StatefulWidget {
  final Widget child;
  final int animateTime;
  final bool isBlackStyle;

  AiFlashingLoading({Key key, @required this.child, animateTime, isBlackStyle})
      : animateTime = animateTime ?? 2000,
        isBlackStyle = isBlackStyle ?? false,
        super(key: key);

  @override
  State<AiFlashingLoading> createState() => _AiFlashingState();
}

class _AiFlashingState extends State<AiFlashingLoading> {
  ScrollController _controller;
  int _sliderTime;
  double _spaceHeight = 0;

  final List<Color> _backColors = const <Color>[
    Color(0x00000000),
    Color(0x40000000),
    Color(0x00000000),
    Color(0x40000000),
    Color(0x00000000),
  ];

  final List<Color> _whileColors = const <Color>[
    Color(0x00FFFFFF),
    Color(0x40FFFFFF),
    Color(0xFFFFFFFF),
    Color(0x40FFFFFF),
    Color(0x00FFFFFF),
  ];

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    _controller.addListener(onScrollListener);

    _sliderTime = widget.animateTime;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller?.jumpTo(_spaceHeight + 400.0);
      _controller?.animateTo(0.0, duration: Duration(milliseconds: _sliderTime), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    _controller?.removeListener(onScrollListener);
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  void onScrollListener() {
    if (_controller.position.pixels == 0.0) {
      _controller.jumpTo(_spaceHeight + 400.0);
      _controller.animateTo(0.0, duration: Duration(milliseconds: _sliderTime), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        _spaceHeight = constraints.maxHeight;
        if(_spaceHeight.isInfinite || _spaceHeight.isNaN){
          _spaceHeight = MediaQuery.of(context).size.height;
        }
        return Container(
          height: _spaceHeight,
          child: Stack(
            children: [
              widget.child ?? SizedBox.shrink(),
              Positioned.fill(child: _buildFlashingView()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFlashingView() {
    return AbsorbPointer(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: _spaceHeight + 200.0),
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.isBlackStyle ? _backColors : _whileColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            SizedBox(height: _spaceHeight),
          ],
        ),
      ),
    );
  }
}
