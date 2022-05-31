import 'dart:convert';
import 'package:fast_ai/api/protocols/chatroom/send_message_data.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-04
 **********************************************************************
 */

//房间发送消息
class SendRoomMessageData extends SendMessageData{
  String playerId;
  String msgType;
  String roomNo;
  String content;
  String token;


  SendRoomMessageData({this.token, this.playerId, this.msgType="1", this.roomNo, this.content});

  @override
  String build() {
    return jsonEncode({
      'token':token,
      ''
      'playerId':playerId,
      'msgType':msgType,
      'roomNo':roomNo,
      'content':content,
    });
  }


}