import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

///
/// 玩家标签
///
class PlayerTitleWidget extends StatelessWidget {

  final String title;
  final double marginRight;
  final double marginBottom;

  Color bgColor;
  TextStyle style;


  PlayerTitleWidget({this.title, this.marginRight = 4, this.marginBottom = 4, TitleStyle titleStyle}){
    if(titleStyle == TitleStyle.red) {
      bgColor = config.skin.colors.rankBGRedColor;
      style = AiTextStyle(
        fontFamily: config.skin.fontFimaly.pingFang,
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h6,
        color: Color(0xFFFF0000),
      );
    } else {
      bgColor = Color(0xFFE4E8F6);
      style = AiTextStyle(
        fontFamily: config.skin.fontFimaly.pingFang,
        fontWeight: config.skin.fontWeight.regular,
        fontSize: config.skin.fontSize.h6,
        color: Color(0xFF4E77FF),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      margin: EdgeInsets.only(right: marginRight,bottom: marginBottom),
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
      child: Text(title,style: style,),
    );
  }
}

enum TitleStyle{
  red,blue,
}