import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/models/many_name/champion_league.dart';
import 'package:fast_ai/utils/ai_json.dart';

class ChampionLeagueLangReqProtocol {
  String gidms;// 支持多个league，用逗号隔开，例如：a123,a223,b12
  ChampionLeagueLangReqProtocol({this.gidms = ''});

  Future<ChampionLeagueLangRspProtocol> request() async {
    var url = "dataConfig/api/c/selectChampion?gidm=${gidms ?? ''}";
    var rst = await Net.get(url);
    var rstM = ChampionLeagueLangRspProtocol.fromMap(rst);
    return rstM;
  }
}

class ChampionLeagueLangRspProtocol extends BaseModel {
  Map<String,ChampionLeagueLang> champions = {};
  ChampionLeagueLangRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    var data = AiJson(map).getArray("data");
    if(data is List){
      data.forEach((element) {
        ChampionLeagueLang champion = ChampionLeagueLang.fromJson(element);
        champions[champion.gidm] = champion;
      });
    }
  }
}