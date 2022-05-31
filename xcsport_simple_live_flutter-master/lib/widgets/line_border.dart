
import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';

class LineBorder extends StatelessWidget {
  final LineDirection direction;
  final EdgeInsets padding;
  final Color color;
  final double size;
  const LineBorder({this.size = 1, Key key, this.direction = LineDirection.Horizontal, this.padding, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(direction == LineDirection.Horizontal){
      return Container(
        padding: padding,
        child: Container(
          width: double.infinity,
          height: size,
          color: color ?? config.skin.colors.deviderColor,
        ),
      );
    }else if(direction == LineDirection.Vertical){
      return Container(
        padding: padding,
        child: Container(
          height: double.infinity,
          width: size,
          color: color ?? config.skin.colors.deviderColor,
        ),
      );
    }
    return Container();
  }
}

enum LineDirection{
  Vertical,
  Horizontal
}
