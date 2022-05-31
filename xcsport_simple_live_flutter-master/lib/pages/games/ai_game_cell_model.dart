//**********************************************************************
//* author:Sam
//* date:2020-05-11
//**********************************************************************

class AiGameCellModel{
  final String supplierId;
  final String img;
  final String gameKey;
  final String gameName;
  final String icon;
  String supplierName;
  String gameType;
  String url;
  String screen;
  bool isShowLock;
  String liveGame;
  String liveId;
  // 添加
  String roomNo;
  String anchorId;
  String tableId;

  AiGameCellModel({
    this.img,
    this.supplierId,
    this.gameKey,
    this.gameName,
    this.url,
    this.icon,
    this.isShowLock = false,
    this.supplierName,
    this.screen,
    this.gameType,
    this.liveGame,
    this.liveId,
    this.roomNo,
    this.anchorId,
    this.tableId,
  });


}