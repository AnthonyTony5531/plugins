import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/default_msg_talk_lang.dart';
import 'package:fast_ai/pages/detail/chatroom/common/message_helper.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/chat_user.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/utils/ai_json.dart';
//import 'package:fast_ai/utils/lang/lang_filed.dart';

//聊天室聊天历史
class ChatRoomHistoryListReqProtocol
    extends BaseReqProtocol<ChatRoomHistoryListRspProtocol> {
  //房间编号

  ChatRoomHistoryListReqProtocol({String roomNo, int pageSize = 20}) {
    param = {'roomNo': roomNo, 'page': 1, 'pageSize': pageSize, 'channelType': config.merchantChannel};
  }

  @override
  String get baseUrl => Api.baseMainUrl;

  @override
  String get apiUrl => "chat/findAllLastMessageByPage";

  @override
  RequestMethodType get requestType => RequestMethodType.get;

  @override
  Future<ChatRoomHistoryListRspProtocol> result(
      Map<String, dynamic> map) async {
    var protocol = ChatRoomHistoryListRspProtocol();
    await protocol.fromFindLastMessageList(map);
    return protocol;
  }
}

//
class ChatRoomHistoryListRspProtocol extends BaseModel {
  List<Message> histories = [];

  Future<ChatRoomHistoryListRspProtocol> fromFindLastMessageList(Map<String, dynamic> map)async {
    super.fromMap(map);
    var json = AiJson(map);
    var extra = AiJson(json.getMap("extra"));
    List<dynamic> hostoryList = extra.getArray("messageList");
     await Future.forEach( hostoryList.reversed, (f) async {
      try {
        var json = AiJson(f);
        String messageBody = json.getString("content");
        String msgType = json.getString("msgType");
        String chatId = json.getString("playerId");
        String showName = json.getString("nickName",
            defaultValue: json.getString("loginName"));
        String headerImage = json.getString("headImg");
        if (!headerImage.startsWith('http')) {
          headerImage = "${Api.baseImgUrl}/${json.getString("headImg")}";
        }
        String createDate = json.getDate("createDate");
        int playerType = json.getNum('playerType');
        int level = json.getNum('seasonLevel');
        String anchorId = json.getString('anchorId');
        var chatUser = ChatUser(
            showName: showName,
            chatId: chatId,
            headerUrl: headerImage,
            playerType: playerType,
            anchorId: anchorId,
            level: level
        );
        if (msgType == '2') {
          var content = AiJson(json.getMap("content"));
          Map map = content.getArray("bettingData")[0];
          if(map != null){
            map['walletId'] = content.getString('walletId');
            if (content.getNum('playerType') != null) {
              chatUser.playerType = content.getNum('playerType');
            }
          }
//          var langFiledMsgs = <LangFiled>[];
//          langFiledMsgs.add(LangFiled.from(
//            gidm: map["gidm"],
//            systemId: map["systemId"],
//            leagueShortName: map["leagueShortLangName"],
//            leagueName: map["leagueName"],
//            homeTeam: map["homeTeam"],
//            awayTeam: map["awayTeam"],
//          ));
//          map["leagueShortLangName"] = langFiledMsgs[0].leagueShortName;
//          map["leagueName"] = langFiledMsgs[0].leagueName;
//          map["homeTeam"] = langFiledMsgs[0].homeTeam;
//          map["awayTeam"] = langFiledMsgs[0].awayTeam;

          histories.addAll(MessageHelper.convertString2Message(
              chatUser: chatUser,
              createDate: content.getDate("createDate"),
              messageBody: msgTalkLang(content.getString("talkMsg")),
              map: map,
              messageType: MessageType.shareBet));
        } else {
          histories.addAll(MessageHelper.convertString2Message(
            chatUser: chatUser,
            createDate: createDate,
            messageBody: messageBody,
            messageType: MessageType.conversation_chatroom,
          ));
        }
      } catch (e) {
        print("hostoryList:" + e.toString());
      }
    });

  }
}
