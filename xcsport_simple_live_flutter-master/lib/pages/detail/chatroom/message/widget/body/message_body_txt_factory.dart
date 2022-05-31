import 'package:fast_ai/pages/detail/chatroom/message/bean/emoji_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/enter_chat_room_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/like_bet_order_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/share_bet_follow_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/text_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/conversation/chat_conversation_holder.dart';


///
///
///
class MessageBodyTxtFactory{
  static String create(Message message){
    var holder = ChatConversationHolder(message);
    switch(holder.messageBodyType){
      case MessageBodyType.text:
        return (message.messageBody as TextMessageBody)?.text;
        break;
      case MessageBodyType.emoji:
        return (message.messageBody as EmojiMessageBody)?.text ?? "";
        break;
      case MessageBodyType.enterChatRoom:
        return (message.messageBody as EnterChatRoomMessageBody)?.text ?? "";
        break;
      case MessageBodyType.shareBet:
        return (message.messageBody as ShareBetMessageBody).txtMsg ?? "";
        break;
      case MessageBodyType.likeBetOrder:
        return (message.messageBody as LikeBetOrderMessageBody)?.text ?? "";
        break;
    }
    return '';
  }
}