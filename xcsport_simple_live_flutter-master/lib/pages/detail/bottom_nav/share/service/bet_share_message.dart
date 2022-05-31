
class BetShareMessage {
  String playerName;
  String talkMsg;
  String playerId;
  String anchorId;
  String orderId;
  String sid;
  String icon;
  String roomNo;
  // 自由播新增
  String confidenceLevel;

  BetShareMessage({this.playerId, this.anchorId, this.orderId, this.sid, this.playerName, this.talkMsg, this.icon, this.roomNo, this.confidenceLevel});

  @override
  String toString() {
    return 'BetShareMessage{playerName: $playerName, talkMsg: $talkMsg, playerId: $playerId, anchorId: $anchorId, orderId: $orderId, sid: $sid, icon: $icon, roomNo: $roomNo}';
  }

}

//class AnchorGameMessage{
//  String liveGame;
//  String liveId;
//  String gameKey;
//  String gameName;
//  String gameNameRaw;
//  String gameType;
//  String icon;
//  String img;
//  String order;
//  String screen;
//  String supplierId;
//
//  AnchorGameMessage({
//    this.liveGame = '',
//    this.liveId = '',
//    this.gameKey = '',
//    this.gameName = '',
//    this.gameNameRaw = '',
//    this.gameType = '',
//    this.icon = '',
//    this.img = '',
//    this.order = '',
//    this.screen = '',
//    this.supplierId = ''
//  });
//}
