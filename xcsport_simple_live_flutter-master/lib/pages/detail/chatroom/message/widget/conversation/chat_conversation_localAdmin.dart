import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat_conversation_widget.dart';

//系统消息视图
class ChatConversationLocalAdminWidget extends ChatConversationWidget {
  final Message message;

  ChatConversationLocalAdminWidget(this.message, double uiMaxWidth) : super(message, uiMaxWidth: uiMaxWidth);

  double width;

  @override
  Widget build(BuildContext context) {
    if (width == null) {
      width = MediaQuery.of(context).size.width * 0.8 + 12;
    }
    final defaultSystemMsg = config.langMap['baseLang']['detail']['chatroom']['welcomeMessage'];
    final isDefault = defaultSystemMsg == messageBodyTxt;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 9),
            margin: EdgeInsets.only(bottom: 3, left: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: <Widget>[
                    Text(
                      messageBodyTxt,
                      style: AiTextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: config.skin.fontSize.h5,
                      ),
                    ),
                  ],
                ),
                if (isDefault)
                  Text(
                    config.langMap['baseLang']['detail']['chatroom']['rightScrollToBet'],
                    textAlign: TextAlign.start,
                    style: AiTextStyle(
                      color: Color(0xFFFD5A83),
                      fontSize: config.skin.fontSize.h5,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
