import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';
class AnchorInfoPage extends StatelessWidget {
  final String text;
  const AnchorInfoPage({Key key,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.0,vertical: 2.0),
        color: Color(0xFFEAEAEA),
        child: Text(
          text,
          style: AiTextStyle(
            fontFamily: config.skin.fontFimaly.pingFang,
            fontSize: config.skin.fontSize.h6,
            color: Color(0xFF000000).withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
