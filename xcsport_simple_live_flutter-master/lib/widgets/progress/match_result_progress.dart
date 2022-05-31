import "package:fast_ai/utils/ai_image.dart";
//**********************************************************************
//* author:Sam
//* date:2020-03-20
//**********************************************************************

import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

//赛况进度展示
class MatchResultProgress extends StatelessWidget {
  final double progress;
  double width;
  String path;
  final height = 70.0;
  final count = 6;
  //箭头路径
  final String arrowPath;
  final Map<int, MatchResultProgressData> param;

  MatchResultProgress(
      {Key key,
      this.progress = 0,
      this.path,
      this.width,
      this.arrowPath = "assets/images/progress/icon_arrow_line_up.svg",
      @required this.param})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (null == width) {
      width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.left-MediaQuery.of(context).padding.right;
      print("MatchResultProgress $width");
    }
    List<Widget> children = [];
    children.add(backgroundLine());
    children.add(progressLine(context));
    children.addAll(buildDot(context));
    children.addAll(buildResult(context));
    return Container(
      height: height,
      color: Colors.white,
      child: Stack(
        children: children,
      ),
    );
  }

  //画底线
  Widget backgroundLine() {
    return Align(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFCCCCCC),
          borderRadius: BorderRadius.circular(30.0),
        ),
        height: 2.0,
      ),
    );
  }

  //画进度条线
  Widget progressLine(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: width * progress,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(255, 157, 3, 1),
              Color.fromRGBO(255, 39, 0, 1)
            ])),
        height: 2,
      ),
    );
  }

  //画点
  List<Widget> buildDot(BuildContext context) {
    double dotSize = 10.0;
    List<Widget> children = [];
    int index = 1;
    while (index < count) {
      double positionx = (index++ / count) * width;
      children.add(Transform.translate(
        offset: Offset(positionx-dotSize/2, height / 2.0 - dotSize / 2.0),
        child: ClipOval(
          child: Container(
            color: Colors.white,
            height: dotSize,
            width: dotSize,
            child: Align(
              child: ClipOval(
                child: Container(
                  width: 5.0,
                  height: 5.0,
                  color: positionx <= width * progress
                      ? Color.fromRGBO(255, 39, 0, 1)
                      : Color(0xFFCCCCCC),
                ),
              ),
            ),
          ),
        ),
      ));
    }
    return children;
  }

  //绘制结果
  List<Widget> buildResult(BuildContext context) {


    final iconSize = 6.0;
    double pictureSize = 16.0;
    List<Widget> children = [];

    children.add(Transform.translate(
      offset: Offset(width/2-20/2+1, height/2-26),
      child: Container(
        width: 20,
        height: 30,
        alignment: Alignment.center,
        child: Text("HT", style: AiTextStyle(
          fontSize: 10,
          color: Color(0xFFCCCCCC),

        ),
        ),
      )
    ),
      );

    children.add(Transform.translate(
        offset: Offset(width-20, height/2-26),
        child: Container(
          alignment: Alignment.centerRight,
          width: 20,
          height: 30,
          child: Text("FT", style: AiTextStyle(
            fontSize: 10,
            color: Color(0xFFCCCCCC),

          ),
          ),
        )
    ),
    );

    final average = width / count;
    int index = 1;
    while (index <= count) {
      final MatchResultProgressData data = param[index - 1];

      double positionx = (index++ / count) * width - average / 2.0;
      final progressPosistionX = progress*width;

      //如果进度条的位置比即将展示位置小并且不在当前格子.屏蔽
      //if(progressPosistionX<positionx && positionx - progressPosistionX> average/2  ) break;

      double pictureSizeTop = height / 2.0 - pictureSize / 2.0;
      double pictureSizeBottom = height / 2.0 + pictureSize / 2.0;

      bool hasTop = null != data && null != data.topTitle;
      bool hasBottom = null != data && null != data.bottomTitle;

      if (hasTop || hasBottom) {
        children.add(Transform.translate(
            offset: Offset(positionx - pictureSize / 2, pictureSizeTop),
            child: Container(
              color: Colors.white,
              width: pictureSize,
              height: pictureSize,
              padding: EdgeInsets.only(left: 1, right: 1),
              child: Container(
                width: 13,
                height: 13,
                child: AiSvgPicture.asset(
                  this.path,
                ),
              ),
            )));

        final topArrowBottom = pictureSizeTop - iconSize / 2.0 - 4.0;
        final topArrowTop = topArrowBottom - 6;

        if (hasTop) {
          //绘制上面箭头
          children.add(Transform.translate(
            offset: Offset(positionx - 6 / 2, topArrowBottom),
            child: AiSvgPicture.asset(
              arrowPath,
              width: 6,
              height: 4,
              fit: BoxFit.cover,
            ),
          ));

          children.add(Transform.translate(
            offset: Offset(positionx - 50 / 2, topArrowTop - 32 / 2 - 2),
            child: Container(
              height: 32,
              width: 50,
              child: Align(
                child: Text(
                  data.topTitle,
                  style: AiTextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ));
        }

        if (hasBottom) {
          final bottomArrowTop = pictureSizeBottom - iconSize / 2.0 - 4.0;
          final bottomArrowBottom = bottomArrowTop + 6;

          //绘制下面箭头
          children.add(Transform.translate(
            offset: Offset(positionx - 6 / 2, pictureSizeBottom + 4.0),
            child: Transform.rotate(
              angle: math.pi,
              origin: Offset(0, 0),
              child: AiSvgPicture.asset(
                arrowPath,
                width: 6,
                height: 4,
                fit: BoxFit.cover,
              ),
            ),
          ));

          children.add(Transform.translate(
            offset: Offset(positionx - 50 / 2, bottomArrowBottom + 2),
            child: Container(
              height: 32,
              width: 50,
              child: Align(
                child: Text(
                  data.bottomTitle,
                  style: AiTextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ));
        }
      }
    }
    return children;
  }
}

class MatchResultProgressData {
   String topTitle;
   String bottomTitle;
  MatchResultProgressData({this.topTitle, this.bottomTitle});
}
