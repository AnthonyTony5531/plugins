import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/filter/chains/send_message_intercepter_chain.dart';
import 'package:fast_ai/migrate_plugins/flushbar/flushbar.dart';

import 'package:flutter/cupertino.dart';

/// ********************************************************************
/// author:Sam
/// date:2020-01-06
///*********************************************************************


//校验字符串发送内容的隔拦截器任务类，
class ValidateSendMessageInterceptChain extends SendMessageInterceptChain{
  ValidateSendMessageInterceptChain({SendMessageInterceptChain intercept}):super(intercept:intercept);

  @override
  String chain(BuildContext context, String content) {
    if (content.isEmpty) {
      Flushbar(
        title: config.langMap['baseLang']['hint'],
        message: config.langMap['baseLang']['detail']['chatroom']['emptyValidateMessage'],
        duration: Duration(seconds: 1),
      ).show(context);
      return null;
    }
    if (content.length > 50) {
      Flushbar(
        title: config.langMap['baseLang']['hint'],
        message: config.langMap['baseLang']['detail']['chatroom']['lengthValidateMessage'],
        duration: Duration(seconds: 1),
      ).show(context);
      return null;
    }

    return super.chain(context, content);
  }

}