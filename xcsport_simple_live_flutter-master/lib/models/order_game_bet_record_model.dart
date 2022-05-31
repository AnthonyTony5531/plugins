import 'dart:core';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';


//游戏的注单
class OrderGameBetRecordModel extends BaseModel {
  GameBetRecordModel data;

  OrderGameBetRecordModel();
  OrderGameBetRecordModel.fromMap(map) : super.fromMap(map) {
    if (this.code == 200) this.data = GameBetRecordModel.fromMap(map['data']);
  }
}

class GameBetRecordModel {
  GameBetRecordModel(this.totalCount, this.pageDTOList);

  dynamic totalCount;
  List<GameOrder> pageDTOList = [];
  GameBetRecordModel.fromMap(Map map) {
    if (map == null) return;
    this.totalCount = map['totalCount'];
    if (map['pageDTOList'] != null) {
      map['pageDTOList'].forEach((pageDTO){
        pageDTO['orderList'].forEach((order){
          pageDTOList.add(GameOrder.from(order));
        });
      });
    }
  }
}

class PageDTO{
  dynamic betTimeGroup;
  int count;
  List<GameOrder> orderList;
  PageDTO();
}

class GameOrder{
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
  int betTime;
  int billTime;
  double betAmount;
  double payment;
  String betTimeGroup;

  bool showTimeLine = false;

  GameOrder();

  GameOrder.from(Map map){
    if(map == null || map.length == 0) return;
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
    this.betTime = map['betTime'] != null ? AiJson(map).getNum('betTime') : null;
    this.billTime = map['billTime'] != null ? AiJson(map).getNum('billTime') : null;
    this.betAmount = map['betAmount'] != null ? AiJson(map).getDouble('betAmount') : null;
    this.payment = map['payment'] != null ? AiJson(map).getDouble('payment') : null;
    this.betTimeGroup = map['betTimeGroup'] != null ? AiJson(map).getString('betTimeGroup') : '';
    if (config.isTwLang) {
      this.supplierName = config.langConfig.transToTwText(cnString: this.supplierName);
      this.gameName = config.langConfig.transToTwText(cnString: this.gameName);
    }
  }
}



