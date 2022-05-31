import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';

class LeagueGroupLangName {
  String groupId;
  String groupName; // 联赛分组名

  LeagueGroupLangName({
    this.groupId,
    this.groupName,
  });

  LeagueGroupLangName.fromJson(Map<String, dynamic> json) {
    AiJson aiJson = AiJson(json);
    groupId = aiJson.getString('groupId');
    groupName = aiJson.getString('groupName');
    if (config.isTwLang) {
      groupName = config.langConfig.transToTwText(cnString: groupName);
    }
  }

  Map<String, dynamic> toJson(){
    return {
      'groupId': groupId,
      'groupName': groupName,
    };
  }

  void replaceNameWithLeagueGroupJson(Map e){
    AiJson json = AiJson(e);

    if(e.containsKey('groupName')){
      e['groupName'] = groupName ?? json.getString('groupName');
    }

  }
}