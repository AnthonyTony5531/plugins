//**********************************************************************
//* author:Sam
//* date:2020-03-24
//**********************************************************************

import 'dart:ui' as ui;
import 'dart:ui';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/formula_titans.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../utils/ai_measure.dart';

//4个圈圈数据
class CircleWidget extends StatelessWidget {
  final String leftTopTitle;
  final String leftBottomTitle;
  final String rightTopTitle;
  final String rightBottomTitle;
  final String leftTopLevel;
  final String leftBottomLevel;
  final String rightTopLevel;
  final String rightBottomLevel;

  final String leftTopLevelNewChanges;
  final String leftBottomLevelNewChanges;
  final String rightTopLevelNewChanges;
  final String rightBottomLevelNewChanges;


  CircleWidget({

    this.leftTopTitle, this.leftBottomTitle, this.rightTopTitle, this.rightBottomTitle,
    this.leftTopLevel, this.leftBottomLevel, this.rightTopLevel,
    this.rightBottomLevel, this.leftTopLevelNewChanges,
    this.leftBottomLevelNewChanges, this.rightTopLevelNewChanges,
    this.rightBottomLevelNewChanges});



  @override
  Widget build(BuildContext context) {
    return  ClipRect(
      child: Container(
        child: CustomPaint(
            painter: CirclePainter(
              leftTopTitle: leftTopTitle,
              leftTopLevel: leftTopLevel,
              leftTopLevelNewChanges:leftTopLevelNewChanges,
              leftBottomTitle: leftBottomTitle,
              leftBottomLevelNewChanges: leftBottomLevelNewChanges,
              leftBottomLevel: leftBottomLevel,
              rightTopLevel: rightTopLevel,
              rightTopTitle: rightTopTitle,
              rightTopLevelNewChanges:rightTopLevelNewChanges ,
              rightBottomLevel: rightBottomLevel,
              rightBottomTitle:rightBottomTitle,
              rightBottomLevelNewChanges: rightBottomLevelNewChanges,
            ),
            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
        ),
      ),
    );
  }



}


//战绩画笔
class  CirclePainter extends CustomPainter{
   final String leftTopTitle;
   final String leftBottomTitle;
   final String rightTopTitle;
   final String rightBottomTitle;

   final String leftTopLevel;
   final String leftBottomLevel;
   final String rightTopLevel;
   final String rightBottomLevel;


   final String leftTopLevelNewChanges;
   final String leftBottomLevelNewChanges;
   final String rightTopLevelNewChanges;
   final String rightBottomLevelNewChanges;
   String defaultFontFamily = config.skin.fontFimaly.visbyCF;

   CirclePainter({this.leftTopTitle, this.leftBottomTitle, this.rightTopTitle, this.rightBottomTitle,this.leftTopLevel, this.leftBottomLevel, this.rightTopLevel, this.rightBottomLevel, this.leftTopLevelNewChanges, this.leftBottomLevelNewChanges, this.rightTopLevelNewChanges, this.rightBottomLevelNewChanges});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
        ..color = Color.fromRGBO(246,223,171,1)
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1;

    Paint fillWhitePaint = new Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    //外圈半径
    final outerR = 0.83*size.width/2;
    //中心点
    final centerPoint = Offset(size.width/2, size.height/2);

    //绘制最大的外圈
    canvas.drawCircle(centerPoint, outerR, paint);

    final pointRadius =  66/2;

    randerOuterCircle(canvas:canvas,title: leftTopTitle,angle: 180+18.0,
      level: leftTopLevel, levelChanges: leftTopLevelNewChanges,
      centerPoint: centerPoint,
      paint: paint,
      fillWhitePaint: fillWhitePaint,
      pointRadius: pointRadius,
      outerR: outerR,
    );

    randerOuterCircle(canvas:canvas,title: leftBottomTitle,angle: 180-18.0,
      level: leftBottomLevel, levelChanges:leftBottomLevelNewChanges,
      centerPoint: centerPoint,
      paint: paint,
      fillWhitePaint: fillWhitePaint,
      pointRadius: pointRadius,
      outerR: outerR,
    );

    randerOuterCircle(canvas:canvas,title: rightTopTitle,angle:-18.0,
      level: rightTopLevel, levelChanges:  rightTopLevelNewChanges,
      centerPoint: centerPoint,
      paint: paint,
      fillWhitePaint: fillWhitePaint,
      pointRadius: pointRadius,
      outerR: outerR,
    );

    randerOuterCircle(canvas:canvas,title:rightBottomTitle,angle:18.0,
      level:  rightBottomLevel, levelChanges: rightBottomLevelNewChanges,
      centerPoint: centerPoint,
      paint: paint,
      fillWhitePaint: fillWhitePaint,
      pointRadius: pointRadius,
      outerR: outerR,
    );




  }


  //绘制外圆的圈圈内容
  void randerOuterCircle({Canvas canvas, String title, double angle, String level, String levelChanges, double pointRadius,  Offset centerPoint, Paint paint,Paint fillWhitePaint, double outerR  }){

    final leftBottomOffset = circlePoint(circleCenterPoint: centerPoint, angle: angle,  radius: outerR);
    canvas.drawCircle(leftBottomOffset, pointRadius, fillWhitePaint);
    canvas.drawCircle(leftBottomOffset, pointRadius, paint);
    if(null != level && level.isNotEmpty){
      level = level.length>5?'10w+':level;
      var leftBottomLevelParagraph =  createTextParagraph(text: level, isBold:true, fontFamily: defaultFontFamily, fontSize: 14, textAlign:TextAlign.left ,canvas: canvas );
      var leftBottomLevelPreParagraph =  createTextParagraph(text: "NO.", fontFamily: defaultFontFamily,isBold:true, fontSize:8, textAlign: TextAlign.right, canvas: canvas );
      var leftBottomLevelNewParagraph =  createTextParagraph(text: levelChanges, isBold:true, fontFamily: defaultFontFamily,textColor: levelChanges.startsWith("+")?
      Color.fromRGBO(255,64,0,1):Color.fromRGBO(109,212,0,1), fontSize: 10, textAlign:TextAlign.left ,canvas: canvas );


      var leftBottomLevelOffset =  Offset(leftBottomOffset.dx-leftBottomLevelParagraph.width/2 +(leftBottomLevelPreParagraph.width)/2, leftBottomOffset.dy-leftBottomLevelParagraph.height/1.5);
      canvas.drawParagraph(leftBottomLevelParagraph,leftBottomLevelOffset);
      var leftBottomLevelPreOffset = Offset(leftBottomLevelOffset.dx-leftBottomLevelPreParagraph.width ,leftBottomLevelOffset.dy +leftBottomLevelParagraph.height-leftBottomLevelPreParagraph.height-3   );

      var leftBottomLevelNewOffset =  Offset(leftBottomOffset.dx - leftBottomLevelNewParagraph.width/2, leftBottomLevelOffset.dy-leftBottomLevelNewParagraph.height+2);
      if('0' != levelChanges){
        canvas.drawParagraph(leftBottomLevelNewParagraph,leftBottomLevelNewOffset);
      }
      canvas.drawParagraph(leftBottomLevelPreParagraph,leftBottomLevelPreOffset);
    }else{
      var leftBottomLevelEmptyParagraph =  createTextParagraph(text: "--",isBold:true,fontFamily: defaultFontFamily, fontSize:16, textAlign: TextAlign.center, canvas: canvas );
      canvas.drawParagraph(leftBottomLevelEmptyParagraph,Offset(leftBottomOffset.dx-leftBottomLevelEmptyParagraph.width/2, leftBottomOffset.dy-leftBottomLevelEmptyParagraph.height));
    }

    var leftBottomLevelTitleParagraph =  createTextParagraph(text: title,textColor: Colors.black.withOpacity(0.5), isBold:false, fontSize:10, textAlign: TextAlign.center, canvas: canvas ,txtWidth: 2*pointRadius,height: 1.0);
    canvas.drawParagraph(leftBottomLevelTitleParagraph,Offset(leftBottomOffset.dx-leftBottomLevelTitleParagraph.width/2,leftBottomOffset.dy +4 ));

  }




  Offset circlePoint({Offset circleCenterPoint, double angle,  double radius}){
    return  FormulaTitans.circlePoint(circleCenterPoint: circleCenterPoint,angle: angle,radius: radius);
  }

  double toRandians(double angle) =>FormulaTitans.angleToRadian(angle);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }



}

ui.Paragraph createTextParagraph ({String text, bool isBold=false, String fontFamily,  TextAlign textAlign = TextAlign.left,
  Color textColor=Colors.black, double fontSize=14,   Canvas canvas,double txtWidth,double height}){
  fontFamily = fontFamily ?? config.skin.fontFimaly.visbyCF;
  String pgFontFamily = fontFamily;
  if (pgFontFamily.startsWith("packages/${Config.ccPackage}/") ?? false) {
    pgFontFamily = pgFontFamily.replaceAll("packages/${Config.ccPackage}/", "");
  }
  ParagraphBuilder pb = ParagraphBuilder(
      ParagraphStyle(
        fontWeight:isBold?FontWeight.bold: FontWeight.normal,
        fontSize: fontSize,
        textAlign:textAlign,
        fontFamily: pgFontFamily,
        height: height,
      )
  );
  pb.pushStyle(ui.TextStyle(
    color: textColor,
  ));
  pb.addText(text);
  Size size = AiMeasure.measureText(text, AiTextStyle(
    fontSize: fontSize,
    fontFamily: pgFontFamily,
    color: textColor,
  ));
  if(pgFontFamily != fontFamily && txtWidth == null){
      txtWidth = 52.0;
  }
  ui.ParagraphConstraints pc = ui.ParagraphConstraints(width: txtWidth ?? size.width);
  return  pb.build()..layout(pc);
}