//--------------------------------------------------------------------------
// @author sam
// @Date 2019/11/18
//--------------------------------------------------------------------------


import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//已到底
class BottomWidget extends StatelessWidget {

  int lineColor;
  BottomWidget({int  lineColor}):this.lineColor = lineColor??config.skin.colors.fontColorRegular.value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LineHelper.buildHLine(width: 80, bold:0.5,color: lineColor),
          InterValHelper.w(30),
          TextHelper.buildNormal("${config.langMap['baseLang']['widgets']['reachedBottom']}", ),
          InterValHelper.w(30),
          LineHelper.buildHLine(width: 80, bold:0.5,color: lineColor),
        ],

      ),
    );
  }
}
