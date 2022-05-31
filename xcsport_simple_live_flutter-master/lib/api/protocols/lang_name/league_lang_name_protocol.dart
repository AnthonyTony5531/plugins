import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/models/many_name/league_lang_name.dart';
import 'package:fast_ai/utils/ai_json.dart';

class LeagueLangNameReqProtocol {
  String leagueId;// 支持多个league，用逗号隔开，例如：a123,a223,b12
  LeagueLangNameReqProtocol({this.leagueId = ''});

  Future<LeagueLangNameRspProtocol> request() async {
    var url = "dataConfig/api/c/selectLeagueManyName?leagueId=${leagueId ?? ''}";
    var rst = await Net.get(url);
    var rstM = LeagueLangNameRspProtocol.fromMap(rst);
    return rstM;
  }
}

class LeagueLangNameRspProtocol extends BaseModel {
  List<LeagueLangName> leaguesName = [];
  LeagueLangNameRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    var data = AiJson(map).getArray("data");
    if(data is List){
      data.forEach((element) {
        LeagueLangName leagueLangName = LeagueLangName.fromJson(element);
        leaguesName.add(leagueLangName);
      });
    }
  }
}