import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';

// 体育项名字(FT-足球)
var sportsName = config.langMap['sportsName'];
class SportsNameConfig{
 static String getSportsName(String gameType){
    return AiJson(sportsName).getString(gameType) ?? '';
  }
}

// 数据为空时提示标题统一描述
var commonText = config.langMap['commonText'];
class NoDataGameConfig{
//  //暂未投注过足球赛事！
//  static String getGameBetTitleDes(){
//    String name = SportsNameConfig.getSportsName(config?.userInfo?.sportType);
//    String titleHead = AiJson(commonText).getString('noData.gameBetTitle.gameBetTitleHead');
//    String titleTail = AiJson(commonText).getString('noData.gameBetTitle.gameBetTitleTail');
//    return '$titleHead''$name''$titleTail';
//  }
//  //这里暂时没有足球联赛！
//  static String getLeagueTitleDes(){
//    String name = SportsNameConfig.getSportsName(config?.userInfo?.sportType);
//    String titleHead = AiJson(commonText).getString('noData.LeagueTitle.LeagueTitleHead');
//    String titleTail = AiJson(commonText).getString('noData.LeagueTitle.LeagueTitleTail');
//    return '$titleHead''$name''$titleTail';
//  }
//  //这里暂时没有足球比赛！
//  static String getGameTitleDes(){
//    String name = SportsNameConfig.getSportsName(config?.userInfo?.sportType);
//    String titleHead = AiJson(commonText).getString('noData.gameTitle.gameTitleHead');
//    String titleTail = AiJson(commonText).getString('noData.gameTitle.gameTitleTail');
//    return '$titleHead''$name''$titleTail';
//  }
}

