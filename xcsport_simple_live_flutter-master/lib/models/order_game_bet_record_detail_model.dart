import 'dart:convert';
import 'dart:core';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';


//体育注单详情
class OrderGameBetRecordDetailModel extends BaseModel {
  GameBetRecordDetailModel data;

  OrderGameBetRecordDetailModel.fromMap(map) : super.fromMap(map) {
    if (this.code == 200) this.data = GameBetRecordDetailModel.fromMap(map['data']);
  }
}

class GameBetRecordDetailModel {

  String id;
  String playerId;
  String playerName;
  String supplierId;
  String supplierName;
  String gameKey;
  String gameName;
  String orderId;
  String setId;
  String creditStatus;
  String ticketStatus;
  String tradeStatus;
  int count;
  int betTime;
  int billTime;
  double betAmount;
  double payment;
  String isFree;
  String betTimeGroup;
  List<NameHtml> displayData;


  GameBetRecordDetailModel.fromMap(Map map) {
    if (map == null || map.length == 0) return;
    this.id = map['id'] != null ? AiJson(map).getString('id') : '';
    this.playerId = map['playerId'] != null ? AiJson(map).getString('playerId') : '';
    this.playerName = map['playerName'] != null ? AiJson(map).getString('playerName') : '';
    this.supplierId = map['supplierId'] != null ? AiJson(map).getString('supplierId') : '';
    this.supplierName = map['supplierName'] != null ? AiJson(map).getString('supplierName') : '';
    this.gameKey = map['gameKey'] != null ? AiJson(map).getString('gameKey') : '';
    this.gameName = map['gameName'] != null ? AiJson(map).getString('gameName') : '';
    this.orderId = map['orderId'] != null ? AiJson(map).getString('orderId') : '';
    this.setId = map['setId'] != null ? AiJson(map).getString('setId') : '';
    this.creditStatus = map['creditStatus'] != null ? AiJson(map).getString('creditStatus') : '';
    this.ticketStatus = map['ticketStatus'] != null ? AiJson(map).getString('ticketStatus') : '';
    this.tradeStatus = map['tradeStatus'] != null ? AiJson(map).getString('tradeStatus') : '';
    this.count = AiJson(map).getNum('count');
    this.betTime = AiJson(map).getNum('betTime');
    this.billTime = AiJson(map).getNum('billTime');
    this.betAmount = AiJson(map).getDouble('betAmount');
    this.payment = AiJson(map).getDouble('payment');
    this.isFree = map['isFree'] != null ? AiJson(map).getString('isFree') : '';
    this.betTimeGroup = map['betTimeGroup'] != null ? AiJson(map).getString('betTimeGroup') : '';
    List list = map['displayData'] != null ? AiJson(map).getArray('displayData') : [];
    this.displayData = List.generate(list?.length ?? 0, (index){
      return NameHtml.from(list[index]);
    }).toList();
    if (config.isTwLang) {
      this.supplierName = config.langConfig.transToTwText(cnString: this.supplierName);
      this.gameName = config.langConfig.transToTwText(cnString: this.gameName);
    }
  }
}

class NameHtml{
  String name;
  String html;

  NameHtml.from(String object){
    this.name = JsonDecoder().convert(object)["name"];
    this.html = JsonDecoder().convert(object)["html"];
  }
}



