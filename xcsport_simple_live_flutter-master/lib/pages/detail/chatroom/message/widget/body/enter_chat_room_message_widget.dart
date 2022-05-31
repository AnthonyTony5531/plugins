import 'package:fast_ai/pages/detail/chatroom/message/bean/enter_chat_room_message_body.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'message_widget.dart';


/*
*********************************************************************
 * author:Wilson
 * date:2020-12-10
 **********************************************************************
 */

//用户进入聊天室消息视图
class EnterChatRoomMessageBodyWidget extends MessageBodyWidget<EnterChatRoomMessageBody>{
  EnterChatRoomMessageBodyWidget(Message<EnterChatRoomMessageBody> message) : super(message);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // margin: EdgeInsets.only(top: 2),
        child: Text(message.messageBody.text, style: AiTextStyle(
          color: config.skin.colors.fontColorRegular,
          fontSize: TextSize.contentTitle,
          fontFamily:  FontFamily.normal
        ),),
      ),
    );
  }

}
