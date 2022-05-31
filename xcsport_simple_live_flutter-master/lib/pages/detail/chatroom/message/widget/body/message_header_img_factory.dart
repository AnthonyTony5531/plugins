import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/chat_image.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/conversation/chat_conversation_holder.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/visibility_widget.dart';
import 'package:flutter/material.dart';

class MessageHeaderImgFactory {
  static Widget create(Message message,{ TextStyle nameStyle, TextStyle anchorNameStyle,}){
    var holder = ChatConversationHolder(message);
    Widget  widget;
    switch(holder.messageType){
      case MessageType.system:
        widget = Container(
          width: 24,
          height: 24,
          margin: EdgeInsets.only(right: 5),
          color: Colors.transparent,
          child: AiSvgPicture.asset("assets/images/detail/chatroom/chatroom_helper.svg"),
        );
        break;
      case MessageType.conversation:
        break;
      case MessageType.conversation_chatroom:
        widget = Container(
            margin: EdgeInsets.only(right: holder.isAnchorMessage || holder?.chatUser?.level != 0 ? 5 : 0),
            child: holder.isAnchorMessage ? anchorHead(holder) : ChatImage.levelHeadBuild(holder.chatUser?.level ?? 0, width: 18, height: 18)
        );
        break;
      case MessageType.localAdmin:
        break;
      case MessageType.unknown:
        break;
      case MessageType.enterChatRoom:
        widget = Container(
          width: AiMeasure.measureText(config.langMap['baseLang']['detail']['chatroom']['welcome'], nameStyle).width,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 3),
          child: Text(config.langMap['baseLang']['detail']['chatroom']['welcome'],
            style: nameStyle,
            textAlign: TextAlign.center,
          ));
        break;
      case MessageType.shareBet:
        if (holder.chatUser != null) {
          if (holder.isAnchorMessage) {
            widget = Padding(padding: EdgeInsets.only(right: 4), child: anchorHead(holder));
          } else {
            widget = ClipOval(
              child: holder.chatUser?.level == 0 ? Container() : Container(
                width: 18,
                height: 18,
                child: ChatImage.levelHeadBuild(holder.chatUser?.level ?? 0, width: 18, height: 18), // ChatImage.levelHeadBuild(holder.chatUser.level),
                margin: EdgeInsets.only(right: 5),
              ),
            );
          }
        } else {
          widget = Container();
        }
        break;
      case MessageType.likeBetOrder:
        break;
    }
    return widget??SizedBox();
  }


  static double headerImageWidget(Message message,{ TextStyle nameStyle, TextStyle anchorNameStyle }){
    var holder = ChatConversationHolder(message);
    double width = 0;
    switch(holder.messageType){
      case MessageType.system:
        width = 24;
        break;
      case MessageType.conversation:
        break;
      case MessageType.conversation_chatroom:
        if (holder?.chatUser?.level == 0 || holder?.chatUser?.level == null) {
          width = 0;
          break;
        }
        width = holder.isAnchorMessage
          ? 68
          : 24;
        break;
      case MessageType.localAdmin:
        break;
      case MessageType.unknown:
        break;
      case MessageType.enterChatRoom:
        width = AiMeasure.measureText(config.langMap['baseLang']['detail']['chatroom']['welcome'], nameStyle).width;
        break;
      case MessageType.shareBet:
        width = holder.isAnchorMessage ? 24 : holder?.chatUser?.level == 0 ? 0 : 24;
        break;
      case MessageType.likeBetOrder:
        break;
    }
    return width;
  }


  static Widget anchorHead (holder) {
    return VisibilityWidget(
      visible: holder.isAnchor ? ViewState.VISIBLE : ViewState.GONE,
      child: AiImage.svgLogo('assets/images/message/icon_detail_tag_anchor.svg',width: 37.0,height: 15.0, userInternational: true),
    );
  }
}