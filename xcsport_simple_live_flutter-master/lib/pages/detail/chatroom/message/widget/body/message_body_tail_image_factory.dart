import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/conversation/chat_conversation_holder.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';


///
///
///
class MessageBodyTailImageFactory{
  static Widget create(Message message){
    var holder = ChatConversationHolder(message);
    switch(holder.messageBodyType){
      case MessageBodyType.likeBetOrder:
        return AiImage.asset('assets/images/like.gif',width: 42, height: 24, userInternational: true);
        break;
      default:
        break;
    }
    return SizedBox();
  }

  static double width(Message message){
    var holder = ChatConversationHolder(message);
    switch(holder.messageBodyType){
      case MessageBodyType.likeBetOrder:
        return 24;
        break;
      default:
        break;
    }
    return 0;
  }
}
