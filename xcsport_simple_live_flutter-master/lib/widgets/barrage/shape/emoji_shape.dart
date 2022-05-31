//**********************************************************************
//* author:Sam
//* date:2020-02-24
//**********************************************************************


import 'dart:ui';

import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

import 'barrage_shape.dart';

class EmojiShape extends BarrageShape{
  final String path;
  EmojiShape({Offset position, this.path}):super(position:position);
  @override
  Widget onShape() {
    return SizedBox(
      width: 49,
      height: 49,
      child: AiImage.asset(path, fit:BoxFit.contain,),
    );
  }
}