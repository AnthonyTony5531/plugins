import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/widgets/ai_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat_conversation_holder.dart';
import 'chat_conversation_widget.dart';

/*
*********************************************************************
 * author:Wilson
 * date:2020-12-14
 **********************************************************************
 */
bool showUserImage = false;

//普通用户注单点赞消息视图
class ChatConversationUserLikeWidget extends ChatConversationWidget {
  final Message message;

  ChatConversationUserLikeWidget(this.message,double uiMaxWidth) : super(message,uiMaxWidth: uiMaxWidth);


  @override
  Widget build(BuildContext context) {
    var childContent = <ChildContent>[];
    var holder = ChatConversationHolder(message);
    childContent.add(ChildContent(
        text: '$showName',
        style: nameStyle,
        canSplit: true,
        padding: EdgeInsets.only(top: showUserImage ? 3: 0)
    ));
    childContent.add(ChildContent(
        text: messageBodyTxt,
        style: holder.isAnchorMessage ? anchorMsgBodyStyle : msgBodyStyle,
        canSplit: true,
        padding: EdgeInsets.only(top: showUserImage ? 3: 0)
    ));
    childContent.add(ChildContent(
        text: '$targetName ',
        style: nameStyle,
        canSplit: true,
        padding: EdgeInsets.only(top: showUserImage ? 3: 0)
    ));

    var layout;
    if(msgViewWidth > MediaQuery.of(context).size.width * 0.8 - 20){
      layout = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
//              color: Colors.black.withOpacity(0.2),
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 9),
            margin: EdgeInsets.only(bottom: 3, left: 12, right: 12),
            child: AiWrap(
              header: headerImg,
              childContent: childContent,
              tail: tailImage,
            ),
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
//              color: Colors.black.withOpacity(0.2),
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 9),
            margin: EdgeInsets.only(bottom: 3, left: 12, right: 12),
            child: AiWrap(
              header: headerImg,
              childContent: childContent,
              tail: tailImage,
            ),
          ),
        ],
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      child: layout,
    );
  }
}

