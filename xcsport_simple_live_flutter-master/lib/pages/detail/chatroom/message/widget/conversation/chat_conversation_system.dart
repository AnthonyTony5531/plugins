import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/widgets/ai_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_conversation_widget.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-04
 **********************************************************************
 */
bool showUserImage = false;


//系统消息视图
class ChatConversationSystemWidget extends ChatConversationWidget {
  final Message message;
  double width;

  ChatConversationSystemWidget(this.message,double uiMaxWidth) : super(message,uiMaxWidth: uiMaxWidth);

  final TextStyle style = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    color: config.skin.colors.fontColorWhite,
    fontSize: config.skin.fontSize.h5,
  );

  final TextStyle nameStyle = AiTextStyle(
    color: config.customStyle.themeColor,
    fontSize: config.skin.fontSize.h5,
  );

  @override
  Widget build(BuildContext context) {
    if(width == null){
      width = MediaQuery.of(context).size.width*0.8;
    }

    var child = Container(
      width: width,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
//        color: Colors.black.withOpacity(0.2),
       color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 9),
      margin: EdgeInsets.only(bottom: 3, left: 12, ),
      child: AiWrap(

        header: showUserImage?Container(
          width: 24,
          height: 24,
          margin: EdgeInsets.only(right: 5),
          color: Colors.transparent,
          child: AiSvgPicture.asset("assets/images/detail/chatroom/chatroom_helper.svg"),
        ) : SizedBox(width: 0, height: 0,),
        childContent: [
          ChildContent(
              text: '$showName：',
              style: nameStyle,
              canSplit: true,
              padding: EdgeInsets.only(top: showUserImage ? 3: 0)
          ),
          ChildContent(
              text: messageBodyTxt,
              style: style,
              canSplit: true,
              padding: EdgeInsets.only(top: showUserImage ? 3: 0)
          ),
        ],
      ),
    );

    if(msgViewWidth > MediaQuery.of(context).size.width - 20){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          child,
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          child,
        ],
      );
    }
  }
}
