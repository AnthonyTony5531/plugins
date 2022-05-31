//**********************************************************************
//* author:Sam
//* date:2020-02-24
//**********************************************************************


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'shape/shape_type.dart';


class BarrageData{
  Offset position;
  final ShapeType shapeType;
  final String data;
  final Color  color;
  final Color backgroundColor;
  BarrageData({this.position, this.data,this.color=Colors.white,   this.shapeType = ShapeType.Text, this.backgroundColor});

}