import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'dart:convert' as _convert;

/// 爆料列表返回数据model
class GameTypeModel extends BaseModel {

  List<GameTypeInfo> list;
  String listJsonStr;

  GameTypeModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if(map == null || map.length == 0) return;

    var json = AiJson(map);
    list = json.getArray('data')?.map((e) => GameTypeInfo.fromMap(e))?.toList() ?? [];
    listJsonStr = _convert.jsonEncode(json.getArray('data'));
  }
}

class GameTypeInfo {
  String gameKey;
  String gameName;
  String gameNameRaw;

  GameTypeInfo.fromMap(Map<String, dynamic> map){
    if(map == null || map.isEmpty) return;
    var json = AiJson(map);
    gameKey = json.getString('gameKey');
    gameName = json.getString('gameName');
    gameNameRaw = json.getString('gameNameRaw');
  }
}