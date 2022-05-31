import 'package:flutter/material.dart';

class AiLevel {
  static Color getColorByLevel (int level) {
    Color color;
    switch (level) {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
        color = Colors.white;
        break;
      case 5:
        color = Color(0xffB26AD9);
        break;
      case 6:
        color = Color(0xff60A2FC);
        break;
      case 7:
        color = Color(0xffFF5B5B);
        break;
      default:
        color = Colors.white;
    }
    return color;
  }
}