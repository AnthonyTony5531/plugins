import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/util.dart';

class MatchEventParseModel {

  String id = '';
  String matchId = '';
  String phase = '';
  String playerId = '';
  String playerId2 ='';
  String score = '';
  String sportId = '';
  String statusCode = '';
  String statusName =' ';// 上半场,下半场
  String team = '';
  String time = '';
  String timePlayed = '';
  String timePlayed2 = '';
  String timeRemain = '';
  String typeName = '';
  String typeId = '';
  int gameTime = 0;
  bool eventIsOvertime = false;

  MatchEventParseModel.fromMap(Map<String, dynamic> map) {

//    var baseLang = config.langMap['baseLang'];
//    String firstHalf = baseLang['detail']['firstHalf'];
//    String secondHalf = baseLang['detail']['secondHalf'];
    id = AiJson(map).getString('id');
    matchId = AiJson(map).getString('match_id');
    phase = AiJson(map).getString('phase');
    playerId = AiJson(map).getString('playerId');
    playerId2 = AiJson(map).getString('playerId2');
    score = AiJson(map).getString('score');
    sportId = AiJson(map).getString('sportId');
    statusCode = AiJson(map).getString('status_code');
    statusName = AiJson(map).getString('status_name');
    team = AiJson(map).getString('team');
    time = AiJson(map).getString('time');
    timePlayed = AiJson(map).getString('timePlayed');
    timePlayed2 = AiJson(map).getString('timePlayed2');
    timeRemain = AiJson(map).getString('timeRemain');
    typeName = AiJson(map).getString('typeName');
    typeId = AiJson(map).getString('type_id');
    if(!isStrNullOrEmpty(time)){
         int totalTime = 0;
         List<String> times = time.split(":");
         for(var i = 0; i < times?.length; i++) {
           switch(i) {
             case 0: totalTime += int.parse(times[i]) * 60 * 60;
              break;
             case 1: totalTime += int.parse(times[i]) * 60;
              break;
             case 2: totalTime += int.parse(times[i]);
             break;
           }
         }
         if (statusName == "下半场") {
           totalTime = totalTime - 20 * 60;
           if (totalTime < 48 * 60) {
             totalTime = 48 * 60;
           }
         }
         if (statusName == "上半场") {
           if (totalTime > 45 * 60) {
             totalTime = 45 * 60;
           }
         }
         totalTime = totalTime > 90 * 60 ? 90 * 60 : totalTime;
         gameTime = totalTime;
         // 加时
         eventIsOvertime = totalTime > 90 * 60;
    }
    if (config.isTwLang) {
      statusName = config.langConfig.transToTwText(cnString: statusName);
      team = config.langConfig.transToTwText(cnString: team);
      typeName = config.langConfig.transToTwText(cnString: typeName);
    }
  }
}