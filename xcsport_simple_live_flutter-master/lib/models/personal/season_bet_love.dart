import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';

//获取当前赛季个人擅长投注联赛、投注项
class SeasonBetLove extends BaseModel {
  _SeasonBetLove data;
  SeasonBetLove.fromMap(map): super.fromMap(map) {
    this.data = _SeasonBetLove.fromMap(map['data']);
  }

}

class _SeasonBetLove {
  List<_TricksStatistics> tricksStatistics;
  List<_LeagueStatistics> leagueStatistics;
  _SeasonBetLove.fromMap(Map map) {
    if(map == null) return;
    this.tricksStatistics = map['TricksStatistics'].map<_TricksStatistics>((c)=>_TricksStatistics.fromMap(c)).toList();
    this.leagueStatistics = map['leagueStatistics'].map<_LeagueStatistics>((c)=>_LeagueStatistics.fromMap(c)).toList();
  }
}

class _TricksStatistics {
  var trickType,
  winRatio;
  _TricksStatistics.fromMap(Map map) {
    if(map == null) return;
    trickType = map['trickType'];
    winRatio = map['winRatio']  * 100 ~/ 1;
  }
}

class _LeagueStatistics {
  var leagueName,
  leagueLogo,
  leagueId,
  leagueNameAbbr,
  winRatio;
  _LeagueStatistics.fromMap(Map map) {
     if(map == null) return;
     leagueName = map['leagueName'];
      leagueLogo  = map['leagueLogo'];
      leagueId  = map['leagueId'];
      leagueNameAbbr  = map['leagueNameAbbr'];
      winRatio = map['winRatio'] * 100 ~/ 1;
      if (config.isTwLang) {
        leagueName = config.langConfig.transToTwText(cnString: leagueName);
        leagueNameAbbr = config.langConfig.transToTwText(cnString: leagueNameAbbr);
      }
  }
}