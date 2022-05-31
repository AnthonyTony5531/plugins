import 'dart:core';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

//最近20单
class CashoutStatusModel extends BaseModel {
  Map<String,CashoutStatus> data = Map();

  CashoutStatusModel.fromMap(map) : super.fromMap(map) {
    if (this.code == 200){
      List list = AiJson(map).getArray('data');
      List.generate(list.length, (index){
        CashoutStatus status = CashoutStatus.fromMap(list[index]);
        if(status != null){
          data[status.ticketId] = status;
        }
      });
    }
  }

}



class CashoutStatus {
  var ticketId,dcoubls,cashoutAvailableStake,cashouts;

  CashoutStatus.fromMap(Map map){
    if(map == null || map.length == 0) return;
    this.ticketId = AiJson(map).getString('ticketId');
    this.dcoubls = AiJson(map).getNum('dcoubls');
    this.cashoutAvailableStake = AiJson(map).getNum('cashoutAvailableStake');
    this.cashouts = Cashouts.fromMap(AiJson(map).getMap('cashouts'));
  }
}


class Cashouts{
  
  var stake,remainStake,winLoseStake,returnAmount,reason,cashoutType;

  Cashouts.fromMap(Map map){
    if(map == null || map.length == 0) return;
    
    this.stake = AiJson(map).getNum('stake');
    this.remainStake = AiJson(map).getNum('remainStake');
    this.winLoseStake = AiJson(map).getNum('winLoseStake');
    this.returnAmount = AiJson(map).getNum('returnAmount');
    this.reason = AiJson(map).getString('reason',defaultValue: '');
    if (config.isTwLang) {
      this.reason = config.langConfig.transToTwText(cnString: this.reason);
    }
    this.cashoutType = AiJson(map).getNum('cashoutType');
  }
}
