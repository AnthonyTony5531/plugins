//**********************************************************************
//* author:Sam
//* date:2020-05-26
//**********************************************************************

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/ai_image.dart';

//圆形Image
class CircleImage extends StatelessWidget {

  final double size;
  final double bold;
  final double padding;
  final BoxFit fit;
  final String url;
  final Color backgroundColor;
  final Color boldColor;

  final String error;

  CircleImage({Key key, this.size = 54, this.error, this.boldColor, this.bold=1, this.padding=2, this.fit=BoxFit.cover, this.url,  this.backgroundColor= Colors.white }) : super(key: key);


  @override
  Widget build(BuildContext context) {
//    return SizedBox(
//      width: size,
//      height: size,
//      child: Stack(
//        children: [
//          Container(
//            padding: EdgeInsets.all(padding),
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//                color: backgroundColor,
//                border: Border.all(color: boldColor??const Color(0xFFF6DFAB),width:bold )
//            ),
//            child: ClipOval(
//              child: AiImage.fromUrl(url, error, BoxFit.cover,size, size),
//            ),
//          ),
//        ],
//      ),
//    );
  return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: <Widget>[
          Positioned(
            width: size,
            height: size,
            child: Container(
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  color: backgroundColor,
                  border: Border.all(color: boldColor??const Color(0xFFF6DFAB),width:bold )
              ),
              child: ClipOval(
                child: AiImage.fromUrl(
                      url,
                      error,
                      BoxFit.cover),
                ),
              )
          ),
        ],
      ),
    );
  }

}
