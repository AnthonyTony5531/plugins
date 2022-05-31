import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'dart:convert' as _convert;

class PlayerTradeTypeEnumsModel extends BaseModel {

  List<TradeTypeEnums> data = [];
  PlayerTradeTypeEnumsModel.fromMap(Map map): super.fromMap(map) {
    List list = AiJson(map).getArray('data') ?? [];
    data = List.generate(list.length, (index){
      return TradeTypeEnums.fromMap(list[index]);
    }).toList();

  }
}

class TradeTypeEnums{

  String tradeType;
  String desc;
  String prefix;
  String pn;
  String type;
  Map<String,dynamic> manyName;
  
  TradeTypeEnums.fromMap(Map map) {
    if(map == null || map.length == 0){
      return;
    }
    try{
      this.tradeType = string(map['tradeType'],defaultVal: '');
      this.desc = string(map['desc'],defaultVal: '');
      this.prefix = string(map['prefix'],defaultVal: '');
      this.pn = string('${map['pn']}',defaultVal: '');
      this.type = string('${map['type']}',defaultVal: '');
      manyName = _convert.jsonDecode(string(map['manyName'], defaultVal: '{}'));
    } catch(_){}

  }

}