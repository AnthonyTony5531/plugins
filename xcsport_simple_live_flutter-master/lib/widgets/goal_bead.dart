//**********************************************************************
//* author:Sam
//* date:2020-05-07
//**********************************************************************
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/widgets/circle_widget.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:ui';
import 'dart:math';
//进球珠连线
class GoalBead extends StatelessWidget {
  final List<int> list;

  const GoalBead({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,cst){
        return CustomPaint(
          size: Size(cst.constrainWidth(),double.infinity == cst.constrainHeight()?49:cst.constrainHeight(),),
          painter: _MyPainter(list),
        );
      },
    );
  }
}



class _MyPainter extends CustomPainter{
  final List<int> list;

  int paddingBottom = 2;
  _MyPainter(this.list);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint() // 创建一个画笔并配置其属性
      ..strokeWidth = 1 // 画笔的宽度
      ..isAntiAlias = true // 是否抗锯齿
      ..color = Colors.white.withOpacity(0.2); // 画笔颜色

    var topPa = createTextParagraph(text: '1+',fontSize: 10, textColor: Colors.white.withOpacity(0.5));
    canvas.drawParagraph(topPa, Offset(0,0));

    var bottomPa = createTextParagraph(text: '0',fontSize:10, textColor: Colors.white.withOpacity(0.5));

    canvas.drawParagraph(bottomPa, Offset(topPa.width/2-bottomPa.width/2,size.height-bottomPa.height));

    final lineLeft = topPa.width +4;


    var topLinePositionY = topPa.height/2;
    drawLine(lineLeft,size, canvas, paint, topLinePositionY);

    var bottomLinePositionY = size.height-bottomPa.height/2;

    drawLine(lineLeft,size,  canvas, paint, bottomLinePositionY);





//    LinearGradient linearGradient = new LinearGradient(colors: [
//      Color.fromRGBO(255,127,79,1),
//      Color.fromRGBO(234,86,59,1),
//    ]);

//    var shader = linearGradient.createShader(Rect.fromCenter(
//        center: Offset(size.width / 2, size.height / 2),
//        width: size.width,
//        height: size.height));

    var redPain = Paint() // 创建一个画笔并配置其属性
      ..isAntiAlias = true
      ..color = const Color(0xFFFF7F4F);

    var bluePain = Paint() // 创建一个画笔并配置其属性
      ..isAntiAlias = true
      ..color = const Color(0xFF533CFD);

    //半径
    double beadR = 3;
    final lineWidth = size.width-lineLeft-beadR;
    final beadCount = list.length;
    List<Offset> beadOffset=[];
    for(int i = 0;i < beadCount; i++){
      final value  =   list[i];
      if(value>0){
        beadOffset.add(Offset(lineLeft+i/(beadCount-1)*lineWidth,topLinePositionY ));
      }else{
        beadOffset.add(Offset(lineLeft+i/(beadCount-1)*lineWidth,bottomLinePositionY ));
      }
    }

    var paint2 = Paint() // 创建一个画笔并配置其属性
      ..strokeWidth = 1 // 画笔的宽度
      ..isAntiAlias = true // 是否抗锯齿
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFFF2F2F2); // 画笔颜色
    ui.Path path = new Path();
    final firstOffset = beadOffset[0];
    path.moveTo(firstOffset.dx, firstOffset.dy);
    beadOffset.forEach((f){
      path.lineTo(f.dx, f.dy);
    });
    canvas.drawPath(path, paint2);
    beadOffset.forEach((f){
      canvas.drawCircle(f, beadR, topLinePositionY== f.dy?bluePain:redPain);
    });

  }

  void drawLine(double startLeft , Size size, Canvas canvas, Paint paint, double top){
    //绘制虚线
    double lineLeft = startLeft;
    while(lineLeft<size.width){
      double right = lineLeft+4;
      if(right>size.width){
        right = size.width;
      }
      canvas.drawRect(Rect.fromLTRB(lineLeft, top, right, top+1), paint);
      lineLeft=right+2;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}