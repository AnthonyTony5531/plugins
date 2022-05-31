import 'package:fast_ai/models/base_model.dart';


class OrderBetListNumModel extends BaseModel {

  OrderBetListNumModel() : super();

  int unsettledNum = 0;
  int cashoutNum = 0;


  OrderBetListNumModel.fromMap(Map map): super.fromMap(map) {
    if(map['data'] != null){
      try{
        unsettledNum = map['data']['unsettledNum'];
        cashoutNum = map['data']['cashoutNum'];
      } catch(_){}
    }
  }
}
