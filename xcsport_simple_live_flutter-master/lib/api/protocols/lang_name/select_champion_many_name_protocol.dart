import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/models/many_name/champion_bet_name.dart';
import 'package:fast_ai/utils/ai_json.dart';

class SelectChampionManyNameReqProtocol {
  String gidm;// 只支持1个gidm
  SelectChampionManyNameReqProtocol({this.gidm = ''});

  Future<SelectChampionManyNameRsqProtocol> request() async {
    var url = "dataConfig/api/c/selectChampionManyName?gidm=${gidm ?? ''}";
    var rst = await Net.get(url);
    var rstM = SelectChampionManyNameRsqProtocol.fromMap(rst);
    return rstM;
  }
}

class SelectChampionManyNameRsqProtocol extends BaseModel {
  List<ChampionBetName> championBetNames = [];
  SelectChampionManyNameRsqProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    var datas = AiJson(map).getArray("data");
    for(var data in datas){
      ChampionBetName betName = ChampionBetName.fromJson(data);
      championBetNames.add(betName);
    }
  }
}
