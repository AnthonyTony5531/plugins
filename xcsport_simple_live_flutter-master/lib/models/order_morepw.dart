import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';

class OrderMorePw extends BaseModel {
  _OrderMorePw data;
  dynamic s;
  dynamic t;
  OrderMorePw.fromMap(Map map): super.fromMap(map) {
    this.data = _OrderMorePw.fromMap(map['data']);
    try{
      if(map['data'] != null){
        this.s = map['data']['s'];
        this.t = map['data']['t'];
      }
    } catch(_){}
  }
}



class _OrderMorePw {
  List<OrderData> orderData;
  _OrderMorePw.fromMap(Map map) {
    if(map != null)
      this.orderData = map['orderData'].map<OrderData>((v)=>OrderData.fromMap(v)).toList();
  }
}

class OrderData {
  dynamic
    concede,
    errorCode,
    errorMsg,
    gameDate,
    gameId,
    gameType,
    gidm,
    goldMax,
    goldMin,
    ior,
    leagueId,
    leagueName,
    playType,
    ratio,
    ratioIpo,
    ratioType,
    score,
    strong,
    hstrong,
    eoIor,
    ratioKey,
    session,
    marketId,
    specifiers,
    optionId,
    betItem;
  OrderData.fromMap(Map map) {
    this.concede = map['concede'];
    this.errorCode = map['errorCode'];
    this.errorMsg = map['errorMsg'];
    this.gameDate = new AiJson(map).getTimestamp('gameDate');
    this.gameId = map['gameId'];
    this.gameType = map['gameType'];
    this.gidm = map['gidm'];
    this.goldMax = map['goldMax']==null || map['goldMax']=='' ? '0' : map['goldMax'];
    this.goldMin = map['goldMin']==null || map['goldMin']=='' ? '0' : map['goldMin'];
    this.ior = string(map['ior'], defaultVal: map['ioRatio']);
    this.leagueId = map['leagueId'];
    this.playType = map['playType'];
    this.ratio = map['ratio'];
    this.ratioIpo = map['ratioIpo'];
    this.ratioType = map['ratioType'];
    this.score = map['score'];
    this.strong = map['strong'];
    this.hstrong = map['hstrong'] ?? '';
    this.eoIor = map['eoIor'] ?? '';
    this.betItem = map['betItem'] ?? '';
    this.ratioKey = map['ratioKey'] ?? '';
    this.session = map['session'] ?? '';
    this.marketId = map['marketId'] ?? '';
    this.optionId = map['optionId'] ?? '';
    this.specifiers = map['specifiers'] ?? Map();
    if (config.isTwLang) {
      this.errorMsg = config.langConfig.transToTwText(cnString: this.errorMsg);
      this.betItem = config.langConfig.transToTwText(cnString: betItem);
    }
  }

}