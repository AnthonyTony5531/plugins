import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/body/emoji_message_widget.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/body/enter_chat_room_message_widget.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/body/text_message_widget.dart';
import 'package:flutter/cupertino.dart';

import 'message_widget.dart';


/*
*********************************************************************
 * author:Sam
 * date:2019-11-29
 **********************************************************************
 */
/*
 * 消息数据显示数据视图工厂
 */
class MessageBodyWidgetFactory{

  //根据消息生产MessageBodyWidget
  static MessageBodyWidget  create(Message message){
    final  messageBody = message.messageBody;
    final  messageBodyType = messageBody?.messageBodyType??MessageBodyType.text;
    Widget  widget;
    switch(messageBodyType){
      case MessageBodyType.text:
        widget = TextMessageBodyWidget(message);
        break;
      case MessageBodyType.emoji:
        widget = EmojiMessageBodyWidget(message);
        break;
      case MessageBodyType.enterChatRoom:
        widget = EnterChatRoomMessageBodyWidget(message);
        break;
      case MessageBodyType.shareBet:
        widget = SizedBox();
        break;
      case MessageBodyType.likeBetOrder:
        widget = SizedBox();
        break;
    }
    return widget??TextMessageBodyWidget(message);
  }


}