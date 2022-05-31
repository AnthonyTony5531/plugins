import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class PlayerCapitalRecordModel extends BaseModel {

  _PlayerCapitalRecordModel data;
  String walletId;
  PlayerCapitalRecordModel.fromMap(Map map): super.fromMap(map) {
    if(map == null) return;
    this.data = _PlayerCapitalRecordModel.fromMap(map['data']);
    this.walletId = AiJson(map).getString('data.walletId');
  }
}


class _PlayerCapitalRecordModel {
  int total;
  List<_CapitalRecord> transferRecordRspList;

  _PlayerCapitalRecordModel.fromMap(Map map) {
    this.total = map['total'];
    if(map['transferRecordRspList'] != null) {
      this.transferRecordRspList = map['transferRecordRspList'].map<_CapitalRecord>((item) => _CapitalRecord.fromMap(item)).toList();
    }

  }
}

class _CapitalRecord{

  String payno;
  String recid;
  String payGold;
  //	0全部 ； 1充值，2提款，3注单结算；4投注消费；5活动优惠
  String payWay;
  String gold;
  String transferRemark;
  String transferType;
  String businessId;
  String tradeType;
  dynamic createTime,currency;

  _CapitalRecord.fromMap(Map map) {
    try{
      this.payno = map['payno'] ?? "0";
      this.recid = map['recid'] ?? "";
      this.payGold = map['payGold'] ?? "0";
      this.currency = map['currency'] ?? "";
      this.payWay = map['payWay'] ?? "";
      this.gold = map['gold'] ?? "0";
      this.businessId = map['businessId'] ?? "";
      this.tradeType = map['tradeType'] ?? "";
      this.transferRemark = map['transferRemark'] ?? "";
      this.createTime = new AiJson(map).getTimestamp('createTime')?? 0;
      this.transferType = map['transferType'] ?? "";
    } catch(_){}

  }

}