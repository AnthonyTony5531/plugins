import 'package:flutter/material.dart';

class TeamCircleStyle {
  
  TeamCircleStyle();

  //圆的半径
  var bigRadius = 38.0;
  var smallRadius = 25.0;
  
  //圆的边框大小
  var bigStokeWidth = 4.5;
  var smallStokeWidth = 3.5;

  //圆的边框进度
  //主队
  List<Color> circleColorsHome = [Color(0xFFF05050), Color(0xFFFC9393)];
  //和局
  List<Color> circleColorsDraw = [Color(0xFF7DFEAC), Color(0xFF34C85A)];
  //客队
  List<Color> circleColorsAway = [Color(0xFF4B90F9), Color(0xFF2557F2)];



}