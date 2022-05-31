import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/models/many_name/league_group_lang_name.dart';
import 'package:fast_ai/utils/ai_json.dart';

class LeagueGroupLangNameReqProtocol {
  String groupId;// 支持多个groupId，用逗号隔开，例如：a123,a223,b12
  LeagueGroupLangNameReqProtocol({this.groupId = ''});

  Future<LeagueGroupLangNameRspProtocol> request() async {
    var url = "dataConfig/api/c/selectLeagueGroupManyName?groupId=${groupId ?? ''}";
    var rst = await Net.get(url);
    var rstM = LeagueGroupLangNameRspProtocol.fromMap(rst);
    return rstM;
  }
}

class LeagueGroupLangNameRspProtocol extends BaseModel {
  List<LeagueGroupLangName> leagueGroupsName = [];
  LeagueGroupLangNameRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    var data = AiJson(map).getArray("data");
    if(data is List){
      data.forEach((element) {
        LeagueGroupLangName leagueLangName = LeagueGroupLangName.fromJson(element);
        leagueGroupsName.add(leagueLangName);
      });
    }
  }
}