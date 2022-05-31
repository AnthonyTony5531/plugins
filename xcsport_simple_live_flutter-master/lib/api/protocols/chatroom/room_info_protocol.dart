import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/api/net_host.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-02
 **********************************************************************
 */

//进入房间
class RoomInfoReqProtocol extends BaseReqProtocol<RoomInfoRspProtocol> {
  RoomInfoReqProtocol({String systemId, String gidm, String anchorId, String liveId}) {
    param = {
      'systemId': systemId,
      'gidm': gidm,
      'anchorId': anchorId,
      'version': config.appInfo.versionName,
      'liveId': liveId,
    };
  }

  @override
  String get baseUrl => Api.baseMainUrl;

  @override
  String get apiUrl => "chat/intoRoom";

  @override
  RequestMethodType get requestType => RequestMethodType.get;

  @override
  Future<RoomInfoRspProtocol> result(Map<String, dynamic> map) async {
    return RoomInfoRspProtocol.fromIntoRoom(map);
  }
}

class RoomInfoRspProtocol extends BaseModel {
  static const AnchorTypePlatform = "1";
  static const AnchorTypeMerchant = "2";

  //未开赛
  bool get hasNotBegun => 203 == code;

  String playerId;
  String playerType;
  String loginName;
  String nickName;
  String headImg;
  int level;
  String roomNo;
  String systemId;
  String isSend; //"1"允许发消息："0"不允许发消息
  bool isAllowSendMsg;
  int onlineNum = 0;

  bool hasPemission2sendMesage;
  num bettingTotal;
  num channelType;
  String anchorType; //"1"平台主播："2"商户主播
  String forbidStatus; //0正常1禁用

  List<dynamic> dislikeOrderIds;
  List<dynamic> likeOrderIds;

  RoomInfoRspProtocol.fromIntoRoom(Map<String, dynamic> map)
      : super.fromMap(map) {
    isAllowSendMsg = false;
    if (isSuccess) {
      config.userInfo.isBetMoneyApiError = false;
      final json = AiJson(map);
      playerId = json.getString("data.playerId");
      playerType = json.getString("data.playerType");
      loginName = json.getString("data.loginName");
      nickName = json.getString("data.nickName");
      headImg = json.getString("data.headImg");
      systemId = json.getString("data.systemId");
      level = json.getNum("data.seasonLevel");
      hasPemission2sendMesage = "1" == json.getString("data.isSend");
      roomNo = json.getString("data.roomNo");
      bettingTotal = json.getNum("data.bettingTotal");
      bettingTotal = 0;
      hasPemission2sendMesage = true;
      if (config.userInfo.roomFirstBettingTotal == 0 || bettingTotal >= 0) {
        config.userInfo.roomFirstBettingTotal = bettingTotal;
        if(bettingTotal >= 0){
          config.userInfo.currLaunchAllBetGold = 0;
        }
      }
      if (!hasPemission2sendMesage) {
        if (config.userInfo.currLaunchAllBetGold >=
            config.userInfo.roomFirstBettingTotal) {
          hasPemission2sendMesage = true;
        }
      }

      channelType = json.getNum("data.channelType", defaultValue: 1);
      forbidStatus = json.getString("data.forbidStatus");
      anchorType = json.getString("data.anchorType");
      onlineNum = json.getNum('data.onlineNum');
      isSend = json.getString('data.isSend');
      isAllowSendMsg = isSend == '1';
      // isAllowSendMsg = false;
      dislikeOrderIds = json.getArray('data.dislikeOrderIds') ?? [];
      likeOrderIds = json.getArray('data.likeOrderIds') ?? [];
    }
    else{
      config.userInfo.isBetMoneyApiError = true;
    }
  }
}

//玩家类型
abstract class PlayerType {
  static const visitor = "2";
  static const user = "1";
}

//给后台记录退出房间
class ExitRoomReqProtocol extends BaseReqProtocol<ExitRoomRspProtocol> {
  ExitRoomReqProtocol(String roomNo) {
    param = {
      "roomNo": roomNo,
    };
  }

  @override
  String get apiUrl => "chat/exitRoom";

  @override
  String get baseUrl => Api.baseMainUrl;

  @override
  Future<ExitRoomRspProtocol> result(Map<String, dynamic> map) async {
    return ExitRoomRspProtocol(map);
  }
}

class ExitRoomRspProtocol extends BaseModel {
  ExitRoomRspProtocol(Map<String, dynamic> map) : super.fromMap(map);
}
