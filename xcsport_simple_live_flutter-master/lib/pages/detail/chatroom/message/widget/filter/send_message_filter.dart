import 'package:fast_ai/pages/detail/chatroom/message/widget/filter/chains/limit5_record_intercepter_chain.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/filter/chains/send_message_intercepter_chain.dart';
import 'package:flutter/cupertino.dart';

import 'chains/net_check_intercept_chain.dart';
import 'chains/permission_chain.dart';
import 'chains/time_send_message_intercept_chain.dart';
import 'chains/validate_send_message_intercept_chain.dart';

/*
*********************************************************************
 * author:Sam
 * date:2020-01-06
 **********************************************************************
 */


//消息过滤器，按责任链设计来进行流程过滤处理
class SendMessageFilter{
  SendMessageInterceptChain _interceptChain;
  SendMessageFilter(){
    SendMessageInterceptChain interceptChain = ValidateSendMessageInterceptChain();
    interceptChain=  NetCheckInterceptChain(intercept: interceptChain);
    interceptChain = TimeSendMessageInterceptChain(intercept: interceptChain);
    interceptChain = PermssionChain(intercept: interceptChain);
    _interceptChain =  Limit5RecordIntercepterChain(intercept: interceptChain);

    //拦截处理顺序:
    //发送时间间隔->网络校验->输入字符校验->1秒时间->5秒内数据校验
  }

  //过滤消息传递内容，返回空表示中断
  String filters(BuildContext context, String content) {
    content = _interceptChain.chain(context, content);
    return content;
  }

}



