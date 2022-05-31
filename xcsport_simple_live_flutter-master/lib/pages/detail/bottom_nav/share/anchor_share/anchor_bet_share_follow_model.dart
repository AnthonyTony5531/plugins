
import 'dart:convert' as _convert;


class AnchorBetShareFollowModel{

  String systemId;
  String merchantId;
  int action;
  String gidm;
  String anchorId;
  String roomNo;
  AnchorShareFollowBettingData data;

  AnchorBetShareFollowModel.from(Map map){
    if(map == null) return;
    systemId = map['systemId'];
    merchantId = map['merchantId'];
    action = map['action'];
    gidm = map['gidm'];
    anchorId = map['anchorId'];
    data = AnchorShareFollowBettingData.fromMap(map["data"][0]);
  }

}


class AnchorShareFollowBettingData{

  dynamic headIcon;
  dynamic gameType;
  dynamic rt;
  dynamic strong;
  dynamic awayTeam;
  dynamic betItem;
  dynamic leagueShortName;
  dynamic orderId;
  dynamic session;
  dynamic sGidm;
  dynamic hGid;
  dynamic ioRatio;
  dynamic homeTeamIcon;
  dynamic gold;
  dynamic leagueName;
  dynamic score;
  dynamic leagueId;
  dynamic loginName;
  dynamic betItem1;
  dynamic homeTeam;
  dynamic showType;
  dynamic gidm;
  dynamic hStrong;
  dynamic gameId;
  dynamic systemId;
  dynamic playerName;
  dynamic championType;
  dynamic ratioType;
  dynamic teamSuffix;
  dynamic awayTeamIcon;
  dynamic playType;
  dynamic fOrderId;
  dynamic ratio;

  dynamic gameTypeSon;
  dynamic ratio1;
  dynamic specifiers;
  dynamic optionId;
  dynamic sid;


  AnchorShareFollowBettingData.fromMap(Map map){
    if(map == null) return;

    this.headIcon = map['headIcon'];
    this.gidm = map['gidm'];
    this.sGidm = map['sGidm'];
    this.hGid = map['hGid'];
    this.gameId = map['gameId'];
    this.betItem = map['betItem'];
    this.orderId = map['orderId'];
    this.score = map['score'];
    this.playType = map['playType'];
    this.gameType = map['gameType'];
    this.gameTypeSon = map['gameTypeSon'];//
    this.ratio = map['ratio'];
    this.ratio1 = map['ratio1'];//
    //this.gameDate = new AiJson(map).getTimestamp('gameDate');//
    this.ioRatio = map['ioRatio'];
    this.ratioType = map['ratioType'];
    this.homeTeam = map['homeTeam'];
    this.awayTeam = map['awayTeam'];
    this.leagueId = map['leagueId'];
    this.leagueName = map['leagueName'];
    this.leagueShortName = map['leagueShortName'];
    this.strong = map['strong'];
    this.gold = map['gold'];
    //this.timestamp = map['timestamp'];
    this.session = map['session'];
    this.teamSuffix = map['teamSuffix'];
    this.specifiers = map['specifiers'] is String ? _convert.jsonDecode(map['specifiers']) : map['specifiers'];//
    this.championType = map['championType'];
    //this.groupId = map['groupId'];//
    this.rt = map['rt'];
    this.showType = map['showType'];
    //this.version = map['version'];//
    this.optionId = map['optionId'];//
    this.awayTeamIcon = map['awayTeamIcon'];
    this.homeTeamIcon = map['homeTeamIcon'];
    this.loginName = map['loginName'];
    this.hStrong = map['hStrong'];
    this.systemId = map['systemId'];
    this.playerName = map['playerName'];
    this.fOrderId = map['fOrderId'];
    this.sid = map['sid'];
  }





}