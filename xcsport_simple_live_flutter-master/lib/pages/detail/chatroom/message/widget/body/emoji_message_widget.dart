import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/emoji_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

import 'message_widget.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-28
 **********************************************************************
 */

//表情内容视图.
class EmojiMessageBodyWidget extends MessageBodyWidget<EmojiMessageBody> {
  EmojiMessageBodyWidget(Message<EmojiMessageBody> message) : super(message);

  @override
  Widget build(BuildContext context) {
    //如果不支持表情，那么转成文字的显示布局
//    if (!MessageHelper.existEmoji(message.messageBody.emoji)) {
//      return TextMessageBodyWidget(Message<TextMessageBody>(
//          messageBody: TextMessageBody(message.messageBody.text,
//              chatUser: message.messageBody.chatUser),
//          messageType: message.messageType,
//          createDate: message.createDate));
//    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          message.messageBody.text ?? "",
          style: AiTextStyle(
              color: config.skin.colors.fontColorRegular,
              fontSize: TextSize.largeConent,
              fontFamily: FontFamily.normal),
        ),
        AiImage.asset(
          message.messageBody.emoji,
          width: 80,
          height: 80,
          fit: BoxFit.fill,
        )
      ],
    );
  }
}
