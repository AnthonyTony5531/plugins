import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/pages/detail/chatroom/common/message_helper.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/chat_user.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/utils/ai_json.dart';

class SendMessageReqProtocol extends BaseReqProtocol<SendMessageRspProtocol> {

  SendMessageReqProtocol({String playerId, String msgType = "1", String roomNo, String content}) {
    param = {
      'playerId': playerId,
      'msgType': msgType,
      'roomNo': roomNo,
      'content':content
    };
  }


  @override
  String get baseUrl => Api.baseMainUrl;


  @override
  String get apiUrl => 'chat/sendMsg';

  @override
  Future<SendMessageRspProtocol> result(Map<String, dynamic> map)async {
    return SendMessageRspProtocol.fromSendMsg(map);
  }

}

class SendMessageRspProtocol extends BaseModel {
  List<Message> messages = [];

  SendMessageRspProtocol.fromSendMsg(Map<String, dynamic> map) : super.fromMap(map) {
    if (isSuccess) {
      final json = AiJson(map);
      String playerId = json.getString("data.playerId");
      String nickName = json.getString("data.nickName", defaultValue: json.getString("data.loginName"));
      String headImg = json.getString("data.headImg");
      String content = json.getString("data.content");
      String createDate = json.getString("data.createDate");
      String anchorId = json.getString('anchorId');
      messages.addAll(
        MessageHelper.convertString2Message(
            chatUser: ChatUser(
              chatId: playerId,
              headerUrl: "${Api.baseMainUrl}/$headImg",
              showName: nickName,
              anchorId: anchorId,
            ),
            createDate: createDate,
            messageBody: content,
            messageType: MessageType.conversation_chatroom),
      );
    }
  }
}