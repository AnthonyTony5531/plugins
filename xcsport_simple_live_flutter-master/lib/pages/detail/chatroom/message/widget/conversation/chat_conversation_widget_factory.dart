import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/text_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/conversation/chat_conversation_localAdmin.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/conversation/chat_conversation_user_like_widget.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/conversation/chat_conversation_gift_widget.dart';
import 'package:flutter/cupertino.dart';
import 'chat_conversation_system.dart';
import 'chat_conversation_user_widget.dart';
import 'chat_conversation_widget.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-29
 **********************************************************************
 */


//生产 ChatConversationWidget 工厂
class ChatConversationWidgetFactory{
  static ChatConversationWidget create(
      Message message,
      double uiMaxWidth,
      String anchorId, {bool isLiveMessage = false, bool isFreeAnchorListMessage = false, bool isShowLeftMessage = false}){
    var messageType  = message.messageType;
    Widget widget  = ChatConversationUserWidget(Message<TextMessageBody>(messageType: MessageType.unknown, messageBody: TextMessageBody.unknown(chatUser: message.messageBody?.chatUser)), uiMaxWidth, anchorId);
    switch(messageType){
      case MessageType.system:
        widget = ChatConversationSystemWidget(message, uiMaxWidth);
        break;
      case MessageType.conversation:
        break;
      case MessageType.conversation_chatroom:
        widget = ChatConversationUserWidget(
          message,
          uiMaxWidth,
          anchorId,
          isLiveMessage: isLiveMessage,
          isFreeAnchorListMessage: isFreeAnchorListMessage,
          isShowLeftMessage: isShowLeftMessage,);
        break;
      case MessageType.unknown:
        break;
      case MessageType.localAdmin:
        widget = ChatConversationLocalAdminWidget(message,uiMaxWidth);
        break;
      case MessageType.enterChatRoom:
        widget = ChatConversationUserWidget(message,uiMaxWidth, anchorId);
        break;
//      case MessageType.shareBet:
//        widget = ChatConversationShareBetWidget(message,uiMaxWidth);
//        break;
      case MessageType.likeBetOrder:
        widget = ChatConversationUserLikeWidget(message,uiMaxWidth);
        break;
      case MessageType.gift:
        widget = ChatConversationGiftWidget(message,uiMaxWidth);
        break;
    }
    return  widget;
  }

}