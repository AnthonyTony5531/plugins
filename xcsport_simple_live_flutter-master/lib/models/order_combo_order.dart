import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';

class OrderComboOrder extends BaseModel {

  OrderComboOrder() : super();

  List<OrderComboOrderData> data = [];
  dynamic t;
  dynamic s;
  OrderComboOrder.fromMap(Map map): super.fromMap(map) {
    if(map['data'] != null){
      data = map['data'].map<OrderComboOrderData>((v)=>OrderComboOrderData.fromMap(v)).toList();
      try{
        if(map['data'] != null && (map['data']?.length ?? 0) > 0){
          t = map['data'][0]['t'];
          s = map['data'][0]['s'];
        }
      } catch(_){}
    }

  }
}

class OrderComboOrderData {

  OrderComboOrderData();

  var errorCode,
    errorFlag,
    errorIds,
    goldGmax,
    goldGmin;
    List<ComboOrderData> orderData = [];
    List<ComboBodyVOS> bodyVOS = [];
  OrderComboOrderData.fromMap(Map map) {
    if(map == null) return;
    errorCode = map['errorCode'];
    errorFlag = map['errorFlag'];
    errorIds = map['errorIds'];
    goldGmax = map['goldGmax'];
    goldGmin = map['goldGmin'];
    try{
      orderData = map['orderData'].map<ComboOrderData>((v) => ComboOrderData.fromMap(v)).toList();
      bodyVOS = map['bodyVOS'].map<ComboBodyVOS>((v) => ComboBodyVOS.fromMap(v)).toList();
    }catch(e){
    }
  }
}

class ComboOrderData {
  var
    concede,
    gameId,
    gidm,
    ior,
    leagueId,
    playType,
    betItem,
    ratio,
    ratioIpo,
    ratioType,
    score,
    showType,
    strong,
    eoIor,
    session,
    marketId,
    optionName;  //投注时候使用， 后赋值
  ComboOrderData.fromMap(Map map) {
    if(map == null) return ;
    concede = map['concede'];
    gameId = map['gameId'];
    gidm = map['gidm'];
    this.ior = string(map['ior'], defaultVal: map['ioRatio']);
    leagueId = map['leagueId'];
    playType = map['playType'];
    betItem = map['betItem'];
    ratio = map['ratio'];
    ratioIpo = map['ratioIpo'];
    ratioType = map['ratioType'];
    score = map['score'];
    showType = map['showType'];
    strong = map['strong'];
    eoIor = map['eoIor'] ?? '';
    session = map['session'] ?? '';
    marketId = map['marketId'] ?? '';
    if (config.isTwLang) {
      betItem = config.langConfig.transToTwText(cnString: betItem);
    }
  }
}


class ComboBodyVOS {
  var mbType,mbSubType,mbCount,ior,goldGmin,goldGmax,maxcredit;
  ComboBodyVOS.fromMap(Map map) {
    if(map == null) return ;
    this.mbType = map['mbType'];//("串关类型")M串N的M
    this.mbSubType = map['mbSubType'];//("串关类型")M串N的N
    this.mbCount = map['mbCount'];//("串关注数")
    this.ior = string(map['ior'], defaultVal: '${map['ioRatio']}');
    this.goldGmin = map['goldGmin'];//("最小投注金额")
    this.goldGmax = map['goldGmax'];//("最大投注金额")
    this.maxcredit = map['maxcredit'];//("可用額度")
  }
}