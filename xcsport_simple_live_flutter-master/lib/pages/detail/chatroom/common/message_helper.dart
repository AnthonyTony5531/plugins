import 'dart:ui';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/skins/custom_style.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/chat_user.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/emoji_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/enter_chat_room_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/like_bet_order_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/share_bet_follow_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/gift_message_body.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/text_message_body.dart';
import 'package:fast_ai/pages/detail/gift/gift_info_model.dart';
import 'package:fast_ai/widgets/barrage/barrage_data.dart';
import 'package:fast_ai/widgets/barrage/shape/shape_type.dart';
import 'package:flutter/material.dart';

import 'emoji_config.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-03
 **********************************************************************
 */

//消息工具类
class MessageHelper {
  //含有表情
  static bool containEmoji(String messageBody) {
    return messageBody.contains(RegExp(emojiRegExp));
  }

  //是否是存在的表情
  static bool existEmoji(String emoji) {
    return defualtEmojiMessage2EmojiAssetSwitcher.containsKey(emoji);
  }

  //解析提取表情中的文字
  static List<String> parse2TextMessage(String messageBody) {
    List<String> list = [];
    messageBody.split(RegExp(emojiRegExpSearch)).forEach((f) {
      if (f.isNotEmpty) {
        list.add(f);
      }
    });
    return list;
  }

  //解析提取表情中的文字
  static List<String> parse2EmojiMessage(String messageBody) {
    List<String> list = [];
    int index = 0;
    while (-1 != index) {
      int position = messageBody.indexOf(RegExp(emojiRegExpSearch), index);
      if (-1 != position) {
        //目前表情字符长度为10
        int emojiEndPosition = position + 10;
        list.add(messageBody.substring(position, emojiEndPosition));
        index = emojiEndPosition - 1;
      } else {
        break;
      }
    }
    return list;
  }

  static String parseFirstEmoji(String messageBody) {
    List<String> list = parse2EmojiMessage(messageBody);
    if (list == null || list.length <= 0) {
      return "";
    }
    return list[0];
  }

  static String parseFirstText(String messageBody) {
    List<String> list = parse2TextMessage(messageBody);
    if (list == null || list.length <= 0) {
      return "";
    }
    return list[0];
  }

  //鸡几发送的戏黄色，其他人发送的戏白色啦
  static Color gainBarrageTextColor({ChatUser chatUser}) {
    return (config.userInfo?.playerId ?? "") == chatUser.chatId
        ? Colors.yellow
        : Colors.white;
  }

  static Color gainBarrageTextBackgroundColor({ChatUser chatUser}) {
    return (config.userInfo?.playerId ?? "") == chatUser.chatId
        ? config.customStyle.themeColor.withOpacity(0.3)
        : Colors.black.withOpacity(0.1);
  }

  //将内容转成消息类型
  static List<Message> convertString2Message(
      {ChatUser chatUser,
      String messageBody,
      String createDate,
      MessageType messageType,
      String contentType,
      Map map}) {
    List<Message> messages = [];
    if (contentType == "2002") {
      messages.add(Message<EnterChatRoomMessageBody>(
          createDate: createDate,
          messageType: MessageType.enterChatRoom,
          messageBody:
              EnterChatRoomMessageBody(messageBody, chatUser: chatUser)));
    } else if (contentType == "2003") {
      messages.add(Message<LikeBetOrderMessageBody>(
          createDate: createDate,
          messageType: MessageType.likeBetOrder,
          messageBody:
              LikeBetOrderMessageBody(messageBody, map, chatUser: chatUser)));
    } else if (messageType == MessageType.shareBet) {
      messages.add(Message<ShareBetMessageBody>(
          createDate: createDate,
          messageType: MessageType.shareBet,
          messageBody:
              ShareBetMessageBody(map, messageBody, chatUser: chatUser)));
    } else if (messageType == MessageType.gift) {
      messages.add(Message<GiftMessageBody>(
          createDate: createDate,
          messageType: MessageType.gift,
          messageBody: GiftMessageBody(GiftInfoModel.fromMap(map), chatUser: chatUser)));
    } else if (MessageHelper.containEmoji(messageBody)) {
//      MessageHelper.parse2TextMessage(messageBody).forEach((text) {
//        messages.add(Message<TextMessageBody>(
//            createDate: createDate,
//            messageType: messageType,
//            messageBody: TextMessageBody(text, chatUser: chatUser)));
//
//
//
//      });
//      MessageHelper.parse2EmojiMessage(messageBody).forEach((emojiText) {
//        messages.add(Message<EmojiMessageBody>(
//            createDate: createDate,
//            messageType: messageType,
//
//            messageBody: EmojiMessageBody(emojiText, chatUser: chatUser)));
//
//      });
      messages.add(Message<EmojiMessageBody>(
          createDate: createDate,
          messageType: messageType,
          messageBody: EmojiMessageBody(parseFirstEmoji(messageBody),
              conTxt: parseFirstText(messageBody), chatUser: chatUser)));
    } else {
      messages.add(Message<TextMessageBody>(
          createDate: createDate,
          messageType: messageType,
          messageBody: TextMessageBody(messageBody, chatUser: chatUser)));
    }
    return messages;
  }

  //将内容转成消息类型
  static List<BarrageData> convertString2BarrageData(
      {ChatUser chatUser,
      String messageBody,
      String createDate,
      MessageType messageType}) {
    List<BarrageData> messages = [];
    if (MessageHelper.containEmoji(messageBody)) {
      MessageHelper.parse2TextMessage(messageBody).forEach((text) {
        messages.add(
          BarrageData(
              data: text,
              shapeType: ShapeType.Text,
              color: gainBarrageTextColor(chatUser: chatUser),
              backgroundColor:
                  gainBarrageTextBackgroundColor(chatUser: chatUser)),
        );
      });
      MessageHelper.parse2EmojiMessage(messageBody).forEach((emojiText) {
        messages.add(
          BarrageData(
              data: defualtEmojiMessage2EmojiAssetSwitcher[emojiText],
              shapeType: ShapeType.Emoji),
        );
      });
    } else {
      messages.add(
        BarrageData(
            data: messageBody,
            shapeType: ShapeType.Text,
            color: gainBarrageTextColor(chatUser: chatUser)),
      );
    }
    return messages;
  }
}
