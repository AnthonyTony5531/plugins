import 'package:fast_ai/models/base_model.dart';

class PlayBalance extends BaseModel {
  PlayBalance();

  _PlayBalance data = _PlayBalance();
  PlayBalance.fromMap(Map<String, dynamic> map) :super.fromMap(map) {
    print('PlayBalance $code');
    if(isSuccess || isUnRecharge){
      this.data = _PlayBalance.fromMap(map['data']??Map());
    }else{
      this.data.balance = '0.00';
      this.data.creditBalance = '0.00';
    }
  }
}

class _PlayBalance {
  _PlayBalance();

  String balance = "";
  String creditBalance = "";
  _PlayBalance.fromMap(Map<String, dynamic> map) {
    if(map == null) return;
    this.balance = map['balance']??"0.00";
    if(this.balance != null) {
      this.balance = double.tryParse(this.balance).toStringAsFixed(2);
    }
    this.creditBalance = map['creditBalance'];
  }
}