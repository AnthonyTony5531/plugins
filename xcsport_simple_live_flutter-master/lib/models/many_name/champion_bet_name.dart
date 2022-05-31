import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';

class ChampionBetName {
  String gidm;
  String ratioId;   // 投注Id
  String ratioName; // 名字

  ChampionBetName({
    this.gidm,
    this.ratioId,
    this.ratioName
  });

  ChampionBetName.fromJson(Map<String, dynamic> json) {
    AiJson aiJson = AiJson(json);
    gidm = aiJson.getString('gidm');
    ratioId = aiJson.getString('ratioId');
    ratioName = aiJson.getString('ratioName');
    if (config.isTwLang) {
      ratioName = config.langConfig.transToTwText(cnString: ratioName);
    }
  }
}
