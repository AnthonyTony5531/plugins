//**********************************************************************
//* author:Sam
//* date:2020-03-25
//**********************************************************************

import 'package:flutter/cupertino.dart';

class GradientText extends StatelessWidget {
  final String text;
  final List<Color> colors;
  final TextStyle textStyles;

  GradientText({@required this.text, @required this.colors, this.textStyles, });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds){
        return RadialGradient(colors:colors,
            center: Alignment.bottomLeft,
            radius: 1.0,
            tileMode: TileMode.mirror
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: Text(text,
        style: textStyles,),
    );
  }
}
