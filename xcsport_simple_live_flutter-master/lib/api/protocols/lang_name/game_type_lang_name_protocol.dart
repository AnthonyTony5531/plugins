import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class GameTypeLangNameReqProtocol {
  List<String> gameTypes;// 支持多个gameType，用逗号隔开，例如：['FT','BK',...], 如查询则为空即可
  GameTypeLangNameReqProtocol({this.gameTypes = const []});

  Future<GameTypeLangNameRspProtocol> request() async {
    var url = "dataPageServer/api/c/game/leftMenuManyName?gameTypes=${gameTypes.join(',')}";
    var rst = await Net.get(url);
    var rstM = GameTypeLangNameRspProtocol.fromMap(rst);
    return rstM;
  }
}

class GameTypeLangNameRspProtocol extends BaseModel {
  Map<String,dynamic> gameTypeNames = {};// {'FT':'足球','BK':'籃球',...}
  GameTypeLangNameRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    gameTypeNames = AiJson(map).getMap("data");
  }
}