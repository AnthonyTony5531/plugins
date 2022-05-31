//**********************************************************************
//* author:Sam
//* date:2020-06-18
//**********************************************************************

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/chatroom.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/chatroom_bloc.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/filter/chains/send_message_intercepter_chain.dart';
import 'package:fast_ai/widgets/alert/text_explain_alert.dart';
import 'package:flutter/cupertino.dart';

class PermssionChain extends SendMessageInterceptChain{

  PermssionChain({SendMessageInterceptChain intercept}):super(intercept:intercept);

  @override
  String chain(BuildContext context, String content) {
    if(!ChatRoomBloc.hasPermission2SendMessage && ChatRoomBloc.bettingTotal>0 ){
      TextAlert.of(context).showAlert(message: '${config.langMap['baseLang']['detail']['chatroom']['permissionMessagePrefix']}${ChatRoomBloc.bettingTotal??1}${config.langMap['baseLang']['detail']['chatroom']['permissionMessageSuffix']}');
      return null;
    }
  return super.chain(context, content);
  }
}