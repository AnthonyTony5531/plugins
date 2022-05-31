import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/models/many_name/team_lang_name.dart';
import 'package:fast_ai/utils/ai_json.dart';

class TeamLangNameReqProtocol {
  String teamId;// 支持多个Team，用逗号隔开，例如：a123,a223,b12
  TeamLangNameReqProtocol({this.teamId = ''});

  Future<TeamLangNameRspProtocol> request() async {
    var url = "dataConfig/api/c/selectTeamManyName?teamId=$teamId";
    var rst = await Net.get(url);
    var rstM = TeamLangNameRspProtocol.fromMap(rst);
    return rstM;
  }
}

class TeamLangNameRspProtocol extends BaseModel {
  List<TeamLangName> teamsName = [];
  TeamLangNameRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    var data = AiJson(map).getArray("data");
    if(data is List){
      data.forEach((element) {
        TeamLangName teamLangName = TeamLangName.fromJson(element);
        teamsName.add(teamLangName);
      });
    }
  }
}