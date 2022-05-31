import 'package:flutter/cupertino.dart';

/// ********************************************************************
/// author:Sam
/// date:2020-01-06
///*********************************************************************

//拦截任务链,对发送的内容进行过滤处理
abstract class SendMessageInterceptChain{
  final SendMessageInterceptChain intercept;
  SendMessageInterceptChain({this.intercept});
  String chain(BuildContext context, String content ){
    if(null == content)
      return null;
    if(null == intercept)
      return content;
    return intercept.chain(context,content);
  }
}