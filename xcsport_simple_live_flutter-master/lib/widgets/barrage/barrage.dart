import 'dart:collection';
import 'barrage_data.dart';
import 'package:flutter/cupertino.dart';
import 'barrage_manager.dart';
import 'shape/barrage_shape.dart';
import 'shape/barrage_shape_factory.dart';
import 'shape/shape_type.dart';
import 'shape/text_shape.dart';

//弹幕视图
class Barrage extends StatefulWidget {
  final int paddingTop;
  final int paddingBottom;

  final int maxChannel;


  final double width;
  final double height;
  Barrage({this.paddingTop = 20, this.maxChannel, this.paddingBottom = 49, this.width, this.height, Key key})
      : super(key: key);

  @override
  BarrageState createState() => BarrageState();
}

class BarrageState extends State<Barrage> {
  bool _isStop = false;

  final List<BarrageShape> _barrageShapes = [];

  double width;
  double height;
  //记录每一个弹道最后一个弹幕的位置
  HashMap<int, BarrageData> channelLastBarragePosition = HashMap() ;


  int maxChannel;
  int paddingTop;

  @override
  void initState() {
    super.initState();
    width = widget.width;
    height = widget.height;
    paddingTop = widget.paddingTop;
    maxChannel = widget.maxChannel;
    Future.delayed(Duration(milliseconds: 500), () {
      start();
    });
  }


  void resize({double width, double height, int maxChannel, int paddingTop})async{
    if(null != width){
      this.width  = width;
    }

    if(null != width){
      this.height = height;
    }

    if(null != paddingTop){
      this.paddingTop = paddingTop;
    }

    if(null != maxChannel){
      this.maxChannel = maxChannel;
      BarrageManager.get().maxSize = maxChannel*10;
    }
  }


  int currentChannel=1;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: Stack(children: _barrageShapes));
  }

  //开始展示弹幕
  void start() async {
    _isStop = false;
    if (null == height) height = context.size.height;
    if (null == width) width = context.size.width;
    if(null == maxChannel){
      maxChannel =  height~/30.0-1;
    }
    BarrageManager.get().maxSize = maxChannel*10;
    while (!_isStop) {
      if(!BarrageManager.get().showable){
        channelLastBarragePosition.clear();

        if(BarrageManager.get().list.isNotEmpty){
          BarrageManager.get().clear();
        }
        if(_barrageShapes.isNotEmpty){
          _barrageShapes.clear();
          setState(() {
          });
        }
        await Future.delayed(Duration(milliseconds: 1000));
      }else{
        _barrageShapes.clear();
        BarrageManager.get().list.forEach((f) {
          if (null == f.position) {
            var positionY = this.paddingTop+ (currentChannel-1.0)*30.0;
            var positionX = width.toInt();

            final  thisChannellastBarragePosition = channelLastBarragePosition[currentChannel];
            if(null != thisChannellastBarragePosition){
              var widgetLen =  ShapeType.Emoji == thisChannellastBarragePosition.shapeType?49:thisChannellastBarragePosition.data.length*(TextShapeSize);
              if(width - (thisChannellastBarragePosition.position.dx+widgetLen)>20){
                f.position = Offset(positionX.toDouble(), positionY.toDouble());
                channelLastBarragePosition[currentChannel] = f;
                //记录当前弹道最后一个位置
              }
            }else{
              f.position = Offset(positionX.toDouble(), positionY.toDouble());
              channelLastBarragePosition[currentChannel] = f;
            }

            //计算下一个弹幕出现在弹道位置
            int nextChannel = currentChannel++;
            //如果下一个弹道计算的结果比最大弹道数目多，那么将弹道的位置跑到第一个位置。一次类推
            if(nextChannel>=maxChannel){
              currentChannel = 1;
            }
          } else {
            if (f.shapeType == ShapeType.Text) {
              //超过12个字符，让他加速
              if (f.data.length > 5) {
                f.position = Offset(
                    f.position.dx - f.data.length * 0.2-2 , f.position.dy);
              } else {
                f.position = Offset(f.position.dx - 2.0, f.position.dy);
              }
            } else {
              f.position = Offset(f.position.dx - 2.0, f.position.dy);
            }
          }

        });
        //移除超出屏幕的数据
        BarrageManager.get()
            .list
            .removeWhere((f) => null != f.position && f.position.dx < -width * 2);
        //生产弹幕视图

        BarrageManager.get().list.forEach((f) {
          //对于没有位置的视图，不创建视图
          if(null != f.position &&  null != f.position.dx ){
            _barrageShapes.add(BarrageShapeFactory.create(f));
          }

        });
        if (BarrageManager.get().list.isEmpty) {
          await Future.delayed(Duration(milliseconds: 1000));
        } else {
          setState(() {});
          await Future.delayed(Duration(milliseconds: 50));
        }

      }

    }
  }

  @override
  void dispose() {
    if (!_isStop) {
      stop();
    }
    super.dispose();
  }

  //停止弹幕
  void stop() {
    BarrageManager.get().clear();
    _isStop = true;
  }
}
