import 'package:fast_ai/pages/detail/chatroom/message/bean/emoji_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/conversation/chat_conversation_holder.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';


///
///
///
class MessageBodyEmojiFactory{
  static Widget create(Message message){
    var holder = ChatConversationHolder(message);
    switch(holder.messageBodyType){
      case MessageBodyType.emoji:
        return AiImage.asset(
          (message.messageBody as EmojiMessageBody)?.emoji,
          width: 80,
          height: 80,
          fit: BoxFit.fill,
        );
        break;
      default:
        break;
    }
    return SizedBox();
  }
}
