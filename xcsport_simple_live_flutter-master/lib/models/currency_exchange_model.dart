import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class CurrencyExchangeModel extends BaseModel {

  CurrencyExchangeModel();

  List<CurrencyExchange> data;

  CurrencyExchangeModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.data = AiJson(map).getArray("data").map((e) => CurrencyExchange.fromMap(e)).toList();
  }
}

class CurrencyExchange{
  num id;
  num currencyIdA;
  num currencyIdB;
  num exchange;

  CurrencyExchange.fromMap(Map<String, dynamic> map){
     if(map == null || map.length == 0){
       return;
     }
     this.id = AiJson(map).getNum('id',defaultValue: 0);
     this.currencyIdA = AiJson(map).getNum('currencyIdA',defaultValue: 0);
     this.currencyIdB = AiJson(map).getNum('currencyIdB',defaultValue: 0);
     this.exchange = AiJson(map).getNum('exchange',defaultValue: 0);
  }
}
