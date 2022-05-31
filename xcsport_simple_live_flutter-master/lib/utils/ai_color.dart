import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AIColor {
  static Color red1 = Color.fromRGBO(255, 0, 0, 1);
  static Color red2 = Color.fromRGBO(200, 0, 0, 1);
  static Color red3 = Color.fromRGBO(150, 0, 0, 1);

  static Color bule1 = Color.fromRGBO(0, 0, 255, 1);
  static Color bule2 = Color.fromRGBO(0, 0, 200, 1);
  static Color bule3 = Color.fromRGBO(0, 0, 150, 1);
  
  static Color clear = Color(0);
  static List<Color> clearLinear = [Color(0),Color(0)];
  static List<Color> linearTransparent = [Colors.transparent,Colors.transparent];
  static List<Color> linearWhite = [Colors.white,Colors.white];
  static List<Color> linearWhite10 = [Colors.white10,Colors.white10];

  /// 16进制字符串转color, replaceColors: 例部分区域用其他颜色代替白色
  static Color fromHex(String hexStr, {Map<String,String> replaceColors, String defaultColor = '#43003F'}){
    if(replaceColors != null){
      String value = replaceColors[hexStr];
      value = replaceColors[hexStr.toUpperCase()];
      if(value != null) hexStr = value;
    }
    if ((hexStr?.length ?? 0) <= 0) {
      hexStr = defaultColor;
    }
    String replaceStr = hexStr;
    if (hexStr.contains('#')) {
      replaceStr = hexStr.replaceFirst('#', 'ff');
    }
    int value = int.tryParse(replaceStr,radix: 16) ?? 0;
    return Color(value);
  }
}