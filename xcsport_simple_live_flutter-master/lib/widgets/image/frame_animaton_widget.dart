//**********************************************************************
//* author:Sam
//* date:2020-04-22
//**********************************************************************


import 'package:fast_ai/utils/util.dart';
import 'package:flutter/cupertino.dart';

typedef FrameAnimationChildWidgetBuilder = Widget Function(BuildContext context, String path);

//帧动画布局
class FrameAnimationWidget extends StatefulWidget {
  final List<dynamic> data;
  final int speed;

  final FrameAnimationChildWidgetBuilder builder;

  final FrameAnimationWidgetController controller;

  FrameAnimationWidget({@required this.data, this.speed= 50,this.builder, this.controller }):super(key:controller?.key);



  @override
  _FrameAnimationWidgetState createState() => _FrameAnimationWidgetState();
}


class FrameAnimationWidgetController {
  GlobalKey<_FrameAnimationWidgetState> key  = new GlobalKey();

  void replay(){
    key.currentState?.play();
  }

}




class _FrameAnimationWidgetState extends State<FrameAnimationWidget> with AutomaticKeepAliveClientMixin{

  int currentPlayIndex=0;
  bool isStop = false;
  String path ;

  @override
  void initState() {
    super.initState();
    play();
  }

  void play(){

    Future(()async{
      while(!isStop){
        if(mounted){
          if(currentPlayIndex+1>widget.data.length-1){
            break;
          }
          currentPlayIndex++;
          setState(() {
          });
          await sleep(widget.speed);
        }else{
          break;
        }
      }
    });
  }

  @override
  void dispose() {
    isStop =true;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.data[currentPlayIndex]);
  }

  @override
  bool get wantKeepAlive => true;


}
