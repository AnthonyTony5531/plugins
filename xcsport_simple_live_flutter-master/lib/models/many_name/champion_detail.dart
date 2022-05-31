import 'package:fast_ai/utils/ai_json.dart';

class ChampionDetailLang {
  String gidm;
  List detail; // 冠军详细列表数据

  ChampionDetailLang({
    this.gidm,
    this.detail,
  });

  ChampionDetailLang.fromJson(Map<String, dynamic> json) {
    AiJson aiJson = AiJson(json);
    gidm = aiJson.getString('gidm');
    detail = aiJson.getArray('detail');
  }

  void replaceNameWithDetailJson(Map e){
    AiJson json = AiJson(e);

    if(e.containsKey('detail')){
      e['detail'] = detail ?? json.getString('detail');
    }
  }
}