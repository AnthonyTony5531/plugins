import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/models/many_name/match_lang_name.dart';
import 'package:fast_ai/utils/ai_json.dart';

class MatchLangNameReqProtocol {
  String gidms;// 支持多个比赛，用逗号隔开，例如：a123,a223,b12   systemId : '1233kk'
  MatchLangNameReqProtocol({this.gidms = ''});

  Future<MatchLangNameRspProtocol> request() async {
    var url = "dataPageServer/api/c/game/getGameManyInfo?gidms=$gidms";
    var rst = await Net.get(url);
    var rstM = MatchLangNameRspProtocol.fromMap(rst);
    return rstM;
  }
}

class MatchLangNameRspProtocol extends BaseModel {
  List<MatchLangName> matchsName = [];
  MatchLangNameRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    var data = AiJson(map).getArray("data");
    if(data is List){
      data.forEach((element) {
        MatchLangName matchLangName = MatchLangName.fromJson(element);
        matchsName.add(matchLangName);
      });
    }
  }
}