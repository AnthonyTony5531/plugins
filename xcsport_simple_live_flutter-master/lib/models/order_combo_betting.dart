import 'dart:convert';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';

class OrderComboBetting extends BaseModel {
  ComboBetModel data;
  OrderComboBetting.fromMap(Map map): super.fromMap(map) {
    data = map['data'] == null ? null : ComboBetModel.fromMap(map['data']);
  }

}

class ComboBetModel {
  List<BetData> betData;
  List<ComboInfo> comboInfo;
  String walletId;
  ComboBetModel.fromMap(Map map) {
    betData = map['betData'].map<BetData>((v)=>BetData.fromMap(v)).toList();
    comboInfo = map['comboInfo'].map<ComboInfo>((v)=>ComboInfo.fromMap(v)).toList();
    walletId = map['walletId'] == null ? '' : '${map['walletId']}';
  }
}

class BetData {
  var awayId,
      betItem,
      version,
      gameId,
      gameType,
      gidm,
      homeId,
      ior,
      leagueShortName,
      playType,
      ratio,
      ratio1,
      rt,
      gameTypeSon,
      ratioType,
      session,
      strong,
      accRatio,
      teamSuffix;

   Map<String, dynamic> specifiers;


  BetData.fromMap(Map map) {
    awayId = map['awayId'];
    betItem = map['betItem'];
    version = map['version'];
    gameId = map['gameId'];
    gameType = map['gameType'];
    gidm = map['gidm'];
    homeId = map['homeId'];
    ior = map['ior'];
    leagueShortName = map['leagueShortName'];
    playType = map['playType'];
    ratio = map['ratio'];
    ratio1 = map['ratio1'];
    rt = map['rt'];
    gameTypeSon = map['gameTypeSon'] ?? null;
    ratioType = map['ratioType'];
    session = map['session'];
    strong = map['strong'];
    teamSuffix = map['teamSuffix'];
    var specifiersJsonStr = new AiJson(map).getString('specifiers');
    if(isNotEmpty(specifiersJsonStr)){
      try{
        this.specifiers = jsonDecode(specifiersJsonStr);
      }catch(e){
      }
    }
    if (config.isTwLang) {
      leagueShortName = config.langConfig.transToTwText(cnString: leagueShortName);
      betItem = config.langConfig.transToTwText(cnString: betItem);
    }
  }
}

class ComboInfo {
  var betNo,//: "AIM19110417541401056"
      betTime,//: 1572861254068
      combo,//: 2
      comboName,//: "961097_RH|967003_RH"
      errorCode,//: ""
      errorFlag,//: ""
      gold,//: "10.0"
      betCount,//
      ior,//
      ioRatio,//
      ballAct,//危险球投注
      status;//: 1
  ComboInfo.fromMap(Map map) {
    betNo = map['betNo'];
    betTime = map['betTime'];
    combo = map['combo'];
    comboName = map['comboName'];
    errorCode = map['errorCode'];
    errorFlag = map['errorFlag'];
    gold = map['gold'];
    status = map['status'];
    betCount = map['betCount'];
    ior = string(map['ior'], defaultVal: map['ioRatio']);
    ioRatio = string(map['ioRatio'], defaultVal: '0');
    ballAct = string(map['ballAct'], defaultVal: '');
  }
}