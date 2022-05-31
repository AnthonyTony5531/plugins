import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';

class LeagueLangName {
  String leagueId;
  String leagueName; // 联赛名
  String leagueNameAbbr; // 联赛简称

  LeagueLangName({
    this.leagueId,
    this.leagueName,
    this.leagueNameAbbr,
  });

  LeagueLangName.fromJson(Map<String, dynamic> json) {
    AiJson aiJson = AiJson(json);
    leagueId = aiJson.getString('leagueId');
    leagueName = aiJson.getString('leagueName');
    leagueNameAbbr = aiJson.getString('leagueNameAbbr');
    if (config.isTwLang) {
      leagueName = config.langConfig.transToTwText(cnString: leagueName);
      leagueNameAbbr = config.langConfig.transToTwText(cnString: leagueNameAbbr);
    }
  }

  Map<String, dynamic> toJson(){
    return {
      'leagueId': leagueId,
      'leagueName': leagueName,
      'leagueNameAbbr': leagueNameAbbr,
    };
  }


  void replaceNameWithLeagueJson(Map e){
    AiJson json = AiJson(e);

    if(e.containsKey('leagueName')){
      e['leagueName'] = leagueName ?? json.getString('leagueName');
    }
    if(e.containsKey('leagueNameCn')){
      e['leagueNameCn'] = leagueName ?? json.getString('leagueNameCn');
    }
    if(e.containsKey('leagueNameAbbr')){
      e['leagueNameAbbr'] = leagueNameAbbr ?? json.getString('leagueNameAbbr');
    }
    if(e.containsKey('leagueShortName')){
      e['leagueShortName'] = leagueNameAbbr ?? json.getString('leagueShortName');
    }
    if(e.containsKey('leageShortName')){
      e['leageShortName'] = leagueNameAbbr ?? json.getString('leageShortName');
    }
    if(e.containsKey('leagueNameAbbrCn')){
      e['leagueNameAbbrCn'] = leagueNameAbbr ?? json.getString('leagueNameAbbrCn');
    }
  }
}
