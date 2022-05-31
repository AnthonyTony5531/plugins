import 'package:flutter/cupertino.dart';


//弹幕的视图
abstract class BarrageShape extends StatelessWidget {

  Offset position;
  BarrageShape({this.position});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(offset: position,
      child: onShape(),
    );
  }


  //弹幕显示的图形
  Widget onShape();





}







