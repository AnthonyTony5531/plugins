import "package:fast_ai/utils/ai_image.dart";

import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {

  final Color bgColor;
  final Widget bgIcon;
  final Widget icon;
  final VoidCallback onTap;
  final int count;
  final bool showNum;
  final bool onRight;
  final bool isTopRightShowNum;

  CircleButton({
    Key key,
    this.bgColor,
    this.bgIcon,
    this.icon,
    this.onTap,
    this.count=0,
    this.showNum = false,
    this.onRight = true,
    this.isTopRightShowNum = false,
  }) :super(key : key);

  @override
  Widget build(BuildContext context) {
    return circleBtn(bgColor: bgColor,bgIcon: bgIcon,icon: icon,onTap: onTap,count: count,showNum: showNum,onRight: onRight);
  }

  Widget circleBtn({Color bgColor,Widget bgIcon,Widget icon,VoidCallback onTap,int count,bool showNum,bool onRight}){
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: onRight ? 0 : 6, left: onRight ? 6 : 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: bgIcon == null ? bgColor : Colors.transparent,
        ),
        child: Stack(
          children: <Widget>[
            bgIcon == null ? Container(color: Colors.transparent,) : bgIcon,
            Container(
              alignment: Alignment.center,
              width: 34,
              height: 34,
              child: icon,
            ),
            Positioned(
              right: showNum ? (isTopRightShowNum ? 0 : 4.0): 8,
              top: showNum ? (isTopRightShowNum ? 0 : 4.0) : 7,
              child: Offstage(
                offstage: count == 0,
                child: Container(
                  width: showNum ? 14 : 6,
                  height: showNum ? 14 : 6,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 1.2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(showNum ? 7 : 3),
                    color: Colors.red,
                  ),
                  child: showNum ? Text(
                    '${count > 99 ? '99' : count}',
                    style: AiTextStyle(
                      fontSize: config.skin.fontSize.h6,
                      fontFamily: config.skin.fontFimaly.liGothicMed,
                      color: config.skin.colors.fontColorWhite,
                    ),
                  ) : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
