//**********************************************************************
//* author:Sam
//* date:2020-02-20
//**********************************************************************


import 'package:flutter/cupertino.dart';

class AiImageManager {

  static void init(){
      imageCache.maximumSize = 400;
      imageCache.maximumSizeBytes = 20<<20;
  }

  static ImageCache  get imageCache => PaintingBinding.instance.imageCache;

}
