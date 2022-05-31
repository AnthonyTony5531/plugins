import 'package:fast_ai/utils/ai_json.dart';

class ChampionLeagueLang {
  String gidm;
  Map champion; // 冠军数据

  ChampionLeagueLang({
    this.gidm,
    this.champion,
  });

  ChampionLeagueLang.fromJson(Map<String, dynamic> json) {
    AiJson aiJson = AiJson(json);
    gidm = aiJson.getString('gidm');
    champion = aiJson.getMap('champion');
  }

  void replaceNameWithChampionJson(Map e){
    AiJson json = AiJson(e);

    if(e.containsKey('champion')){
      e['champion'] = champion ?? json.getString('champion');
    }
  }
}
