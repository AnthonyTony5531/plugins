import 'package:flutter/material.dart';

class DefaultImgPlaceWidget extends StatelessWidget {
  final double width;
  final double height;

  DefaultImgPlaceWidget({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      color: Color(0xffF1F1F5),
    );
  }
}
