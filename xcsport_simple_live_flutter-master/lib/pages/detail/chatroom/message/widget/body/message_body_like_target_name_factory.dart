import 'package:fast_ai/pages/detail/chatroom/message/bean/like_bet_order_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/conversation/chat_conversation_holder.dart';


///
///
///
class MessageBodyLikeTargetNameFactory{
  static String create(Message message){
    var holder = ChatConversationHolder(message);
    switch(holder.messageBodyType){
      case MessageBodyType.text:
        break;
      case MessageBodyType.emoji:
        break;
      case MessageBodyType.enterChatRoom:
        break;
      case MessageBodyType.shareBet:
        break;
      case MessageBodyType.likeBetOrder:
        return (message.messageBody as LikeBetOrderMessageBody)?.targetName ?? "";
        break;
      default:
        return '';
    }
    //return '';
  }
}