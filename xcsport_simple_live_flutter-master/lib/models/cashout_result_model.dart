//所有的注单
import 'package:fast_ai/models/base_model.dart';

class CashoutResultModel extends BaseModel {
  String status;//1成功，2 等待中，3 失败
  double cashoutGold;
  CashoutResultModel();

  CashoutResultModel.fromMap(map) : super.fromMap(map) {
    if (this.code == 200) {
      var dataMap = map['data'];
      this.status = dataMap['status'] == null ? '3' : '${dataMap['status']}';
    }
  }
}