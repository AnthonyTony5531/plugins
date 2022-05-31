//所有的注单
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/util.dart';

class CashoutOrderModel extends BaseModel {
  CashoutOrder data;//1成功，2 等待中，3 失败

  CashoutOrderModel();

  CashoutOrderModel.fromMap(map) : super.fromMap(map) {
    if (this.code == 200) {
      this.data = CashoutOrder.fromMap(map['data']);
    }
  }
}


class CashoutOrdersModel extends BaseModel {
  List<CashoutOrder> data;//1成功，2 等待中，3 失败

  CashoutOrdersModel();

  CashoutOrdersModel.fromMap(map) : super.fromMap(map) {
    if (this.code == 200) {
      data = [];
      var list = map['data'] ?? [];
      List.generate(list?.length ?? 0, (index){
        data.add(CashoutOrder.fromMap(list[index]));
      });

    }
  }
}


class CashoutOrder{

  //String ticketId;
  String orderId;
  String dgCheck;
  String enableCashout;
  double goldMax;
  double goldMin;
  double cashoutMax;
  int status;//1=成功 2确认中，3失败

  CashoutOrder.fromMap(Map map){
    if(map == null || map.isEmpty) return;
    //this.ticketId = map['ticketId'] ?? '';
    this.orderId = map['orderId'] ?? '';
    this.dgCheck = map['dgCheck'] ?? 'Y';
    this.enableCashout = map['enableCashout'] ?? 'N';
    this.goldMax = toDouble(map['goldMax']) ?? 0.0;
    this.goldMin = toDouble(map['goldMin']) ?? 0.0;
    this.cashoutMax = toDouble(map['cashoutMax']) ?? 0.0;
    this.status = map['status'];
  }

}