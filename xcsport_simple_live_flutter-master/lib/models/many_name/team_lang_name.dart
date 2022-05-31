import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';

class TeamLangName {
  String teamId;
  String teamName; // 队伍名
  String teamNameAbbr; // 队伍简称

  TeamLangName({
    this.teamId,
    this.teamName,
    this.teamNameAbbr,
  });

  TeamLangName.fromJson(Map<String, dynamic> json) {
    AiJson aiJson = AiJson(json);
    teamId = aiJson.getString('teamId');
    teamName = aiJson.getString('teamName');
    teamNameAbbr = aiJson.getString('teamNameAbbr');
    if (config.isTwLang) {
      teamName = config.langConfig.transToTwText(cnString: teamName);
      teamName = config.langConfig.transToTwText(cnString: teamNameAbbr);
    }

  }

  Map<String, dynamic> toJson(){
    return {
      'teamId': teamId,
      'teamName': teamName,
      'teamNameAbbr': teamNameAbbr,
    };
  }

  void replaceNameWithTeamJson(Map e){
    AiJson json = AiJson(e);

    if(e.containsKey('teamName')){
      e['teamName'] = teamName ?? json.getString('teamName');
    }
    if(e.containsKey('teamNameCn')){
      e['teamNameCn'] = teamName ?? json.getString('teamNameCn');
    }
    if(e.containsKey('teamNameAbbr')){
      e['teamNameAbbr'] = teamNameAbbr ?? json.getString('teamNameAbbr');
    }
    if(e.containsKey('teamNameAbbrCn')){
      e['teamNameAbbrCn'] = teamNameAbbr ?? json.getString('teamNameAbbrCn');
    }
  }
}
