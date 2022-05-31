import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';

class BottomLine extends StatelessWidget {
  final Color textColor;
  const BottomLine({Key key,this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = this.textColor ?? config.skin.colors.fontColorDisable;
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
          child: Divider(
            color: color,
          ),
          margin: EdgeInsets.only(left: 20, right: 20),
        )),
        Text("${config.langMap['baseLang']['widgets']['bottomContent']}...",style: AiTextStyle(color: color),),
        Expanded(
            child: Container(
          child: Divider(color: color),
          margin: EdgeInsets.only(left: 20, right: 20),
        ))
      ],
    );
  }
}
