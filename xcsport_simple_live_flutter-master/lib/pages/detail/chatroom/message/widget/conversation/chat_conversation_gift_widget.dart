import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/widgets/ai_wrap.dart';
import 'package:fast_ai/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat_conversation_holder.dart';
import 'chat_conversation_widget.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/pages/detail/chatroom/message/bean/gift_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/conversation/chat_conversation_holder.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/pages/detail/head/new_head/user_card.dart';
import 'package:fast_ai/widgets/popup_box.dart';

/*
*********************************************************************
 * author:Wilson
 * date:2020-12-14
 **********************************************************************
 */

//普通用户注单点赞消息视图
class ChatConversationGiftWidget extends ChatConversationWidget {
  final Message message;

  ChatConversationGiftWidget(this.message,double uiMaxWidth) : super(message,uiMaxWidth: uiMaxWidth);

  var _style = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.fontColorWhite,
    fontSize: config.skin.fontSize.h5,
  );

  double msgWidth;
  double nameWidth;

  String startsText = config.langMap['baseLang']['detail']['chatroom']['giftStartText'];
  String sendText = ' ${config.langMap['baseLang']['detail']['chatroom']['giftSend']} ';

  @override
  Widget build(BuildContext context) {
    var childContent = <ChildContent>[];
    var holder = ChatConversationHolder(message);
    if(nameWidth == null){
      nameWidth = AiMeasure.measureText(showName, nameStyle).width;
    }
    if(msgWidth == null){
      msgWidth = AiMeasure.measureText(startsText, _style).width +
          AiMeasure.measureText(showName, nameStyle).width +
          AiMeasure.measureText(sendText, _style).width +
          AiMeasure.measureText('${(message.messageBody as GiftMessageBody).giftDesc}', _style).width +
          55;
    }

    childContent.add(ChildContent(
        text: sendText,
        style: _style,
        canSplit: true,
        padding: EdgeInsets.only(top: 0)
    ));

    var height = (AiMeasure.measureText("中文", nameStyle).height*MediaQuery.of(context).textScaleFactor);
    GiftMessageBody messageBody = message.messageBody;
    var contentWidget = AiWrap(
      header: Text(startsText, style: _style),
      header2: Container(
        width: nameWidth,
        height: height,
        // child: InkWell(
        //   onTap: (){
        //     if(Hooks.ins.isBlocked(HookName.ClickChatRoomUser , {}))return;
        //     showPopup(context, UserCard(playerId: holder.chatUser.chatId,));
        //   },
        //   child: Text(showName,style: nameStyle,),
        // ),
        child: Text(showName, style: nameStyle,),
        alignment: Alignment.bottomCenter,
      ),
      childContent: childContent,
      tail: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${messageBody.giftDesc}', style: nameStyle),
          Container(
            padding: EdgeInsets.only(left: 5),
            height: height,
            child: AiImage.fromUrlWithXcFadeInImage(messageBody.messageImage, ''),
          )
        ],
      ),//文本后面加个全角的中文空格可对齐英文
    );

    var layout;
    if(msgWidth > MediaQuery.of(context).size.width * 0.8 - 20){
      layout = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 9),
            margin: EdgeInsets.only(bottom: 3, left: 12, right: 12),
            child: contentWidget,
          ),
        ],
      );
    } else {
      layout = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 9),
            margin: EdgeInsets.only(bottom: 3, left: 12, right: 12),
            child: contentWidget,
          ),
        ],
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      child: 
      InkWell(
          onTap: (){
            if(Hooks.ins.isBlocked(HookName.ClickChatRoomUser , {}))return;
            showPopup(context, UserCard(playerId: holder.chatUser.chatId,));
          },
          child: layout,
        ),
    );
  }
}

