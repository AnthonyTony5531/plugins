import 'package:fast_ai/pages/detail/chatroom/message/bean/like_bet_order_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/body/message_body_like_target_name_factory.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/body/message_body_tail_image_factory.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/body/message_body_emoji_factory.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/body/message_body_txt_factory.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/body/message_body_widget_factory.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/body/message_header_img_factory.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/conversation/chat_conversation_holder.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../body/message_widget.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-29
 **********************************************************************
 */



//消息会话视图
abstract class ChatConversationWidget extends StatelessWidget {
  final Message message;
  final double uiMaxWidth;
  ChatConversationWidget(this.message,{this.uiMaxWidth});
  //消息会话数据内容视图
  MessageBodyWidget get messageBodyWidget => MessageBodyWidgetFactory.create(message);

  Widget get headerImg => MessageHeaderImgFactory.create(message, nameStyle: nameStyle, anchorNameStyle: anchorNameStyle);

  String get showName => ChatConversationHolder(message).showName;

  String get targetName => MessageBodyLikeTargetNameFactory.create(message);

  String get messageBodyTxt => MessageBodyTxtFactory.create(message);

  Widget get messageBodyEmoji => MessageBodyEmojiFactory.create(message);

  double get _emojiWidth => (messageBodyEmoji is SizedBox) ? 0 : 80;

  Widget get tailImage => MessageBodyTailImageFactory.create(message);

  double get _tailImageWidth => MessageBodyTailImageFactory.width(message);



  double get _headerImgWidth => MessageHeaderImgFactory.headerImageWidget(message, nameStyle: nameStyle, anchorNameStyle: anchorNameStyle);

  final TextStyle nameStyle = AiTextStyle(
    color: config.customStyle.themeColor,
    height: 1.4,
    fontSize: config.skin.fontSize.h5,
  );

  final TextStyle anchorNameStyle = AiTextStyle(
    color: Color(0xFFFD5A83),
    height: 1.4,
    fontSize: config.skin.fontSize.h5,
  );

  final TextStyle msgBodyStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    height: 1.4,
    color: config.skin.colors.fontColorWhite,
    fontSize: config.skin.fontSize.h5,
  );

  final TextStyle anchorMsgBodyStyle = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    height: 1.4,
    color: Color(0xFFFD5A83),
    fontSize: config.skin.fontSize.h5,
  );

  double getMessageBodyTxtWidth(){
    //print("getMessageBodyTxtWidth  ");
    if(message.messageBodyTxtWidth == null){
      message.messageBodyTxtWidth = AiMeasure.measureText(messageBodyTxt, msgBodyStyle).width;
      print("${message.hashCode}  getMessageBodyTxtWidth   messageBodyTxtWidth=${message.messageBodyTxtWidth}");
    }
    return message.messageBodyTxtWidth;
  }

  double getMessageTxtWidth(String text){
    if(isStrNullOrEmpty(text)){
      return 0.0;
    }
    return AiMeasure.measureText(text, msgBodyStyle).width;
  }

  double getShowNameWidth(){
    if(message.playNameWidth == null){
      message.playNameWidth = AiMeasure.measureText('$showName: ', nameStyle).width;
    }
    return message.playNameWidth;
  }

  double getTargetNameWidth(){
    if(!(message.messageBody is LikeBetOrderMessageBody)){
      return 0;
    }
    return AiMeasure.measureText(' $targetName', nameStyle).width;
  }

  // padding-r+l   _headerImgWidth  _headerImgWidth-right-margin    messageBodyTxt-width    showName-width    _emojiWidth
  double get msgViewWidth => 25 + _headerImgWidth + getMessageBodyTxtWidth() + getShowNameWidth() + _emojiWidth + getTargetNameWidth() + _tailImageWidth;

}
