

/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-12-17
 * 加载的骨架动画
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/


import 'package:flutter/material.dart';


@Deprecated('use AiFlashingLoading')
class AiSkeletonLoading extends StatefulWidget {
  final Widget child;
  final duration;
  final bool isBlackStyle;
  AiSkeletonLoading({Key key, @required  this.child, this.duration, this.isBlackStyle = false}) : super(key: key);

  @override
  _AiSkeletonLoadingState createState() => _AiSkeletonLoadingState();
}

class _AiSkeletonLoadingState extends State<AiSkeletonLoading> with TickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: widget.duration ?? 1500));
    _controller.addStatusListener((AnimationStatus state){
      if(state == AnimationStatus.completed){
        _controller.reset();
        _controller.forward();
      }else if(state == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double shapHeight = 200;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        oneAnimatedBuilder(),
        oneAnimatedBuilder(shapHeight + 80),
        // oneAnimatedBuilder((shapHeight + 80) * 2)
      ],
    );
  }

  AnimatedBuilder oneAnimatedBuilder([double startOffset = 0]){
    return AnimatedBuilder(
        animation: _controller, 
        builder: (BuildContext context, Widget child) {
          double maxHeight = MediaQuery.of(context).size.height;
          double offset = ((maxHeight) * _controller.value + startOffset);
          return Positioned(
            top: offset,
            child: ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  gradient : LinearGradient(
                      colors: 
                      widget.isBlackStyle 
                      ?  <Color>[
                          Color(0x00000000),
                          Color(0x40000000),
                          Color(0x00000000),
                          Color(0x40000000),
                          Color(0x00000000),
                        ]
                      : <Color>[
                        Color(0x00FFFFFF),
                        Color(0x40FFFFFF),
                        Color(0xFFFFFFFF),
                        Color(0x40FFFFFF),
                        Color(0x00FFFFFF),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)
                ),
                height: shapHeight,
                width: MediaQuery.of(context).size.width,
                // color:  Colors.red,
              ),
              clipper: _SkeletonShodowClipper(0),
            ),
          );
        }
      );
  }
}

class _SkeletonShodowClipper extends CustomClipper<Path>{
  final double heightOffset;
  _SkeletonShodowClipper(this.heightOffset);

  @override
  Path getClip(Size size) {
    double heightOffset = this.heightOffset;
    Path path = Path();
    path.moveTo(0, heightOffset);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - heightOffset);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(_SkeletonShodowClipper oldClipper) {
    return this.heightOffset != oldClipper.heightOffset;
  }
}

