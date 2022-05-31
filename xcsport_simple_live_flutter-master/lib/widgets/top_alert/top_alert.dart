import "package:fast_ai/utils/ai_image.dart";
/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-11-3
 * 说明：数据提示，定时收起
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/


import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';

class TopAlert extends StatefulWidget {
  //提示信息,为null或为‘’时关闭
  final String msg;
  //提示时间
  final double seconds = 0.5;
  //提示完成时的回调
  final VoidCallback onFinished;
  TopAlert({Key key, this.msg, this.onFinished}) : super(key: key);

  @override
  _TopAlertState createState() => _TopAlertState();
}

class _TopAlertState extends State<TopAlert> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _animation;
  String _msg = "";

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration:Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0.0 , end:32).animate(_controller);
    _controller.addStatusListener(statusChange);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    updateMsg(widget.msg??"");
    return AnimatedBuilder(
      animation: _animation, 
      builder: (BuildContext context, Widget child) {
        return Container(
            width: double.infinity,
            height: _animation.value,
            color: Color(0xDDFFF7E0),
            alignment: Alignment(0, 0),
            child: Text(_msg,style: AiTextStyle(
              fontFamily: config.skin.fontFimaly.pingFang,
              fontSize: 12,
              color: Color(0xFFA37C4A),
              letterSpacing: 0.23
            ),),
        );
      },
    );
  }

  statusChange(AnimationStatus status){
    if(status == AnimationStatus.dismissed && widget.onFinished != null){
      try{
        _msg = "";
        widget.onFinished();
      }catch(e){
        logError(e);
      }
    }
  }

  Future updateMsg(String msg)async{
    if(msg.isNotEmpty && msg != _msg){
      _msg = msg;
      startTimer();
    }else if(msg.isEmpty && msg != _msg){
      _msg = "";
    }
  }

  DateTime _startTime; 
  Future startTimer()async{
    if(_startTime != null){
      _startTime = DateTime.now();
      return;
    }
    if(mounted)_controller.forward();
    _startTime = DateTime.now();
    while(true){
      await sleep(200);
      if(_msg.isEmpty){
        if(mounted)_controller.reverse();
        _startTime = null;
        break;
      }
      var diff = DateTime.now().difference(_startTime).inMilliseconds;
      if(diff > widget.seconds * 1000){
        if(mounted)_controller.reverse();
        _startTime = null;
        break;
      }
    }
  }
}

