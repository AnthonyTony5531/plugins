import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/models/many_name/champion_detail.dart';
import 'package:fast_ai/utils/ai_json.dart';

class ChampionDetailLangReqProtocol {
  String gidm;// 只支持1个gidm
  ChampionDetailLangReqProtocol({this.gidm = ''});

  Future<ChampionDetailLangRspProtocol> request() async {
    var url = "dataConfig/api/c/selectChampionByGidm?gidm=${gidm ?? ''}";
    var rst = await Net.get(url);
    var rstM = ChampionDetailLangRspProtocol.fromMap(rst);
    return rstM;
  }
}

class ChampionDetailLangRspProtocol extends BaseModel {
  ChampionDetailLang championDetail;
  ChampionDetailLangRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    var data = AiJson(map).getMap("data");
    championDetail = ChampionDetailLang.fromJson(data);
  }
}