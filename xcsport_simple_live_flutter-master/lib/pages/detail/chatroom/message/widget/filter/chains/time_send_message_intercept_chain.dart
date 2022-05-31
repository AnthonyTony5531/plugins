import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/filter/chains/send_message_intercepter_chain.dart';
import 'package:fast_ai/migrate_plugins/flushbar/flushbar.dart';

import 'package:flutter/cupertino.dart';

/// ********************************************************************
/// author:Sam
/// date:2020-01-06
///*********************************************************************


//发送时间间隔拦截器任务类，
class TimeSendMessageInterceptChain extends SendMessageInterceptChain{

  num time=-1;
  TimeSendMessageInterceptChain({SendMessageInterceptChain intercept}):super(intercept:intercept);

  @override
  String chain(BuildContext context, String content) {
    if(time<0){
      time = DateTime.now().millisecondsSinceEpoch;
    }else{
      num current = DateTime.now().millisecondsSinceEpoch;
      //发言间隔不能少于一秒
      if(current - time<1000){
        time = current;
        Flushbar(
          title: config.langMap['baseLang']['hint'],
          message: config.langMap['baseLang']['detail']['chatroom']['timeSendLimitMessage'],
          duration: Duration(seconds: 1),
        ).show(context);
        return null;
      }
      time = current;
    }
    return super.chain(context, content);
  }

}