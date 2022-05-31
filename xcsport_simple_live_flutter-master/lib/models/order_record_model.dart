import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';

class OrderRecordModel extends BaseModel{

  List<OrderRecordItemModel> data;

  OrderRecordModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if(map == null || map['data'].length < 0) return;
    List d = map['data'] == null ? [] : AiJson(map).getArray('data');
    this.data = List.generate(d.length, (index){
      return OrderRecordItemModel.fromMap(d[index]);
    }).toList();
  }

}

class OrderRecordItemModel{

  String merId;
  String merName;
  String parentMerId;
  String parentMerName;
  String playerId;
  String playerName;
  String userId;
  String userName;
  String remoteIp;
  String orderId;
  String orderGroup;
  String gameType;
  String ticketId;
  int parlayNum;
  String addDate;
  dynamic gold;
  dynamic winGold;
  dynamic winGoldD;
  int state;
  int creditState;
  int resultDate;
  String resultDetail;
  String createDate;
  String terminalType;
  int betUserType;
  int betType;
  dynamic winAndLossGold;
  String isCredit;
  String gidm;
  String gameId;
  String gameTypeSon;
  String allowFollow;
  String oddfType;
  String remarks;
  String sgidm;
  String version;
  List<_BetDto> betDTOList;
  String systemId;

  OrderRecordItemModel.fromMap(Map map) {
    this.merId = map['merId'] ?? "0";
    this.version = map['version'] ?? "";
    this.merName = map['merName'] ?? "";
    this.parentMerId = map['parentMerId'] ?? "0";
    this.parentMerName = map['parentMerName'] ?? "";
    this.playerId = map['playerId'] ?? "";
    this.playerName = map['playerName'] ?? "0";
    this.userId = map['userId'] ?? "";
    this.userName = map['userName'] ?? "";
    this.remoteIp = map['remoteIp'] ?? "";
    this.orderId = map['orderId'] ?? "";
    this.orderGroup = map['orderGroup'] ?? "";
    this.gameType = map['gameType'] ?? "";
    this.ticketId = map['ticketId'] ?? "";
    this.parlayNum = int.parse(map['parlayNum']??'0');
    this.addDate = map['addDate'] ?? "";
    this.gold = map['gold'] ==null ? "0.00" : map['gold'].toStringAsFixed(2);
    this.winGoldD = map['winGoldD'] ?? 0.0;
    this.winGold = map['winGold'] == null ? "0.00" : map['winGold'].toStringAsFixed(2);
    this.state = map['state'] ?? "";
    this.creditState = map['creditState'] ?? 0;
    this.resultDate =new AiJson(map).getTimestamp('resultDate') ?? '';
    this.resultDetail = map['resultDetail'] ?? '';
    this.createDate = new AiJson(map).getDate('createDate');
    this.terminalType = map['terminalType'] ?? '';
    this.betUserType = map['betUserType'] ?? 0;
    this.betType = map['betType'] ?? 0;
    this.winAndLossGold = map['winAndLossGold'] == null ? "0.00" : map['winAndLossGold'].toStringAsFixed(2);
    this.isCredit = map['isCredit'];
    this.gidm = map['gidm'] ?? '';
    this.gameId = map['gameId'] ?? '';
    this.gameTypeSon = map['gameTypeSon'] ?? '';
    this.allowFollow = map['gameTypeSon'] ?? '';
    this.oddfType = map['oddfType'] ?? '';
    this.remarks = map['remarks']??'';
    this.sgidm = map['sgidm'] ?? '';
    this.systemId = map['systemId'] ?? '';
    if(map['betDTOList'] != null) {
      this.betDTOList = map['betDTOList'].map<_BetDto>((item) => _BetDto.fromMap(item)).toList();
    }
  }

}
//投注项
class _BetDto{
  String showType;
  String gameType;
  String gameId;
  String playType;
  String ratioType;
  String strong;
  int gameDate;
  String gameTime;
  String awayId;
  String homeId;
  String awayTeam;
  String homeTeam;
  String leagueId;
  String leagueName;
  String leagueShortName;
  String leagueLogo;
  String score;
  String playName;
  dynamic delayTime;
  String ior;
  String ratio;
  String maxCredit;
  String resultScore;
  String gidm;
  String betItem;
  String betResultDetail;
  dynamic session;
  String teamSuffix;
  String hstrong;
  String championType;
  String rt;
  String ratio1;
  String gameTypeSon;
  Map<String,dynamic> specifiers;
  String systemId;

  _BetDto.fromMap(Map map) {
    this.hstrong = map['hstrong'] ?? "0";
    this.resultScore = map['resultScore'] ?? "0";
    this.gidm = map['gidm'] ?? "";
    this.betItem = map['betItem'] ?? "";
    this.betResultDetail = map['betResultDetail'] ?? "";
    this.session = map['session'] ?? "";
    this.teamSuffix = map['teamSuffix'] ?? "0";

    this.score = map['score'] ?? "0";
    this.playName = map['playName'] ?? "";
    this.delayTime = map['delayTime'] ?? "0";
    this.ior = string(map['ior'], defaultVal: map['ioRatio']);
    this.ratio = map['ratio'] ?? "";
    this.maxCredit = map['maxCredit'] ?? "0";

    this.showType = map['showType'] ?? "0";
    this.gameType = map['gameType'] ?? "";
    this.gameId = map['gameId'] ?? "0";
    this.playType = map['playType'] ?? "";
    this.ratioType = map['ratioType'] ?? "";
    this.strong = map['strong'] ?? "0";
    this.gameDate = new AiJson(map).getTimestamp('gameDate') ?? 0;
    this.gameTime = map['gameTime'] ?? "";
    this.awayId = map['awayId'] ?? "";
    this.homeId = map['homeId'] ?? "";
    this.awayTeam = map['awayTeam'] ?? "";
    this.homeTeam = map['homeTeam'] ?? "";
    this.leagueId = map['leagueId'] ?? "";
    this.leagueName = map['leagueName'] ?? "";
    this.leagueShortName = map['leagueShortName'] ?? "";
    this.leagueLogo = map['leagueLogo'] ?? "";
    this.championType = map['championType'] ?? "";

    this.specifiers = AiJson(map).getMap('specifiers');
    this.rt = AiJson(map).getString('rt');
    this.ratio1 = AiJson(map).getString('ratio1');
    this.gameTypeSon = AiJson(map).getString('gameTypeSon');
    this.systemId = map['systemId'] ?? '';
    if(isEmpty(this.awayTeam)){
      this.awayTeam = map['awayLangTeam'] ?? '';
    }
    if(isEmpty(this.homeTeam)){
      this.homeTeam = map['homeLangTeam'] ?? '';
    }
    if(isEmpty(this.leagueName)){
      this.leagueName = map['leagueShortLangName'] ?? '';
    }

    if (config.isTwLang) {
      this.awayTeam = config.langConfig.transToTwText(cnString: this.awayTeam);
      this.homeTeam = config.langConfig.transToTwText(cnString: this.homeTeam);
      this.leagueName = config.langConfig.transToTwText(cnString: this.leagueName);
      this.leagueShortName = config.langConfig.transToTwText(cnString: this.leagueShortName);
      this.betItem = config.langConfig.transToTwText(cnString: this.betItem);
    }
  }
}


//class _OrderRecord{
//  String merId;
//  String merName;
//  String parentMerId;
//  String parentMerName;
//  String playerId;
//  String playerName;
//  String userId;
//  String userName;
//  String remoteIp;
//  String orderId;
//  String orderGroup;
//  String gameType;
//  String ticketId;
//  String parlayNum;
//  String addDate;
//  dynamic gold;
//  dynamic winGold;
//  dynamic winGoldD;
//  int state;
//  int creditState;
//  String resultDate;
//  String resultDetail;
//  String createDate;
//  String terminalType;
//  int betUserType;
//  int betType;
//  dynamic winAndLossGold;
//  String isCredit;
//  String gidm;
//  String gameId;
//  String gameTypeSon;
//  String allowFollow;
//  String oddfType;
//  List<_BetDto> betDTOList;
//
//  _OrderRecord.fromMap(Map map) {
//    this.merId = map['merId'] ?? "0";
//    this.merName = map['merName'] ?? "";
//    this.parentMerId = map['parentMerId'] ?? "0";
//    this.parentMerName = map['parentMerName'] ?? "";
//    this.playerId = map['playerId'] ?? "";
//    this.playerName = map['playerName'] ?? "0";
//    this.userId = map['userId'] ?? "";
//    this.userName = map['userName'] ?? "";
//    this.remoteIp = map['remoteIp'] ?? "";
//    this.orderId = map['orderId'] ?? "";
//    this.orderGroup = map['orderGroup'] ?? "";
//    this.gameType = map['gameType'] ?? "";
//    this.ticketId = map['ticketId'] ?? "";
//    this.parlayNum = map['parlayNum'] ?? "";
//    this.addDate = map['addDate'] ?? "";
//    this.gold = map['gold'] ?? "";
//    this.winGoldD = map['winGoldD'] ?? 0;
//    this.winGold = map['winGold'] ?? 0;
//    this.state = map['state'] ?? "";
//    this.creditState = map['creditState'] ?? 0;
//
//
//    if(map['betDTOList'] != null) {
//      this.betDTOList = map['betDTOList'].map<_BetDto>((item) => _BetDto.fromMap(item)).toList();
//    }
//  }
//}

