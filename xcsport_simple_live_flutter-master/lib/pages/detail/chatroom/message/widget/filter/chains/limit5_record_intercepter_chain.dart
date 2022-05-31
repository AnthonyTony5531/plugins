//**********************************************************************
//* author:Sam
//* date:2020-02-26
//**********************************************************************


import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/filter/chains/send_message_intercepter_chain.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/filter/chains/send_message_intercepter_chain.dart';
import 'package:fast_ai/widgets/flush_helper.dart';
import 'package:flutter/cupertino.dart';


//5秒内发送消息超过5条，提示:"发送过于频繁，请稍后再试"，等待10秒后可再次发送
class Limit5RecordIntercepterChain extends SendMessageInterceptChain{
  Limit5RecordIntercepterChain({SendMessageInterceptChain intercept}):super(intercept:intercept);


  List<int> records = new List();

  //标记开始禁言10秒的开始时间
  int banTime = 0;

  @override
  String chain(BuildContext context, String content) {
    //如果是频繁在五秒内发送
    if(DateTime.now().millisecondsSinceEpoch - banTime<10*1000){
      banTime = DateTime.now().millisecondsSinceEpoch;
      showFlush(context, msg: config.langMap['baseLang']['detail']['chatroom']['banMessage']);
      return null;
    }

    //禁言时间
    banTime = 0;

    var duraion = 0;
    print("${records.length}");
    var now = DateTime.now().millisecondsSinceEpoch;
    if(records.length>5){
      records.forEach((f){
        duraion += DateTime.now().millisecondsSinceEpoch -f;
      });


      print("$duraion");

      //如果小于5秒，那么开始禁言，记录开始禁言时间
      if(duraion<5*1000){
        banTime = DateTime.now().millisecondsSinceEpoch;
        showFlush(context, msg: config.langMap['baseLang']['detail']['chatroom']['banMessage']);
        return null;
      }
    }

    if(records.length>5){
      records.removeAt(0);
    }
    records.add(now);
    return super.chain(context, content);
  }


}