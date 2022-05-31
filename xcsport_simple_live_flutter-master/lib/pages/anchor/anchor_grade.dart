import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnchorGrade extends StatelessWidget {

  final String anchorLevelIcon;
  final String anchorLevelTitle;
  AnchorGrade({Key key, this.anchorLevelTitle, this.anchorLevelIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          width: 64.0,
          height: 16.0,
          child: Container(
              child: Container(
                alignment:Alignment(-0.6, 0.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AiImage.assetImage(anchorLevelIcon ?? ''),
                      fit: BoxFit.contain
                  ),
                ),
                child: Text(anchorLevelTitle, style: anchorLevelTitleStyle(),),
              )
          ),
        ),
      ],
    );
  }

  TextStyle anchorLevelTitleStyle() {
    return AiTextStyle(
        color: Colors.white,
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h7,
        fontFamily: config.skin.fontFimaly.pingFang);
  }
}
