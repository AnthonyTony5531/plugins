import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/filter/chains/send_message_intercepter_chain.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'package:fast_ai/migrate_plugins/flushbar/flushbar.dart';

import 'package:flutter/cupertino.dart';

/// ********************************************************************
/// author:Sam
/// date:2020-01-06
///*********************************************************************

//发送内容时，网络检测任务链
class NetCheckInterceptChain extends SendMessageInterceptChain{
  NetCheckInterceptChain({SendMessageInterceptChain intercept}):super(intercept:intercept);
  @override
  String chain(BuildContext context, String content) {
    if (!XCStompClient.ins.isConnected || config.isNotConnect) {
      Flushbar(
        title: '${config.langMap['baseLang']['hint']}',
        message: '${config.langMap['baseLang']['networkError']['networkAbnormal']}',
        duration: Duration(seconds: 1),
      ).show(context);
      return null;
    }
    return super.chain(context, content);
  }

}