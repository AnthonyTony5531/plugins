import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class SearchModel extends BaseModel {
  SearchModel();
  _SearchModel data = _SearchModel();

  SearchModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.data = map['data'] == null ? null : _SearchModel.fromMap(map['data']);
  }
}

class _SearchModel {
  List<SearchLeague> leagues =[];
  List<SearchGameInfo> gameInfos = [];
  num total = 0;
  _SearchModel();
  _SearchModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    total = map["total"]??0;
    print("total:$total");
    this.leagues = map['league'] != null ? map['league'].map<SearchLeague>((v) => SearchLeague.fromMap(v)).toList() : null;
    this.gameInfos = map['gameInfo'].map<SearchGameInfo>((v) => SearchGameInfo.fromMap(v)).toList();
  }
}

class SearchLeague {
  dynamic id, leagueNameAbbr, name, number, gameType;

  SearchLeague.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.id = map['id'];
    this.name = map['name'];
    this.leagueNameAbbr = map['leagueNameAbbr'];
    this.number = map['num'];
    this.gameType = map['gameType'];
    if (config.isTwLang) {
      this.name = config.langConfig.transToTwText(cnString: this.name);
      this.leagueNameAbbr = config.langConfig.transToTwText(cnString: this.leagueNameAbbr);
    }
  }
}

class SearchGameInfo {
  dynamic gidm, homeTeamAbbr, homeTeam, awayTeamAbbr, awayTeam, homeLogo, awayLogo, gameDate, gameType,status;
  SearchResultModel  result;
  SearchGameInfo.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.gidm = map['gidm'];
    this.homeTeamAbbr = map['homeTeamAbbr'];
    this.homeTeam = map['homeTeam'];
    this.awayTeamAbbr = map['awayTeamAbbr'];
    this.awayTeam = map['awayTeam'];
    this.homeLogo = map['homeLogo'];
    this.awayLogo = map['awayLogo'];
    this.gameDate = new AiJson(map).getTimestamp('gameDate');
    this.gameType = map['gameType'];
    this.status = map['status'];
    this.result = map['result'] != null ? SearchResultModel.fromMap(map['result']) : null;
    if (config.isTwLang) {
      this.homeTeamAbbr = config.langConfig.transToTwText(cnString: this.homeTeamAbbr);
      this.homeTeam = config.langConfig.transToTwText(cnString: this.homeTeam);
      this.awayTeamAbbr = config.langConfig.transToTwText(cnString: this.awayTeamAbbr);
      this.awayTeam = config.langConfig.transToTwText(cnString: this.awayTeam);
    }
  }
}

class SearchResultModel {
  dynamic gMc, gMh, hGMc, hGMh, date, gameID, leagueID, leagueName, numc, numh, ptype, teamc, teamh, time;
  SearchResultModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.gMc = map['GM_c'];
    this.gMh = map['GM_h'];
    this.hGMc = map['HGM_c'];
    this.hGMh = map['HGM_h'];
    this.date = map['date'];
    this.gameID = map['gameID'];
    this.leagueID = map['leagueID'];
    this.leagueName = map['leagueName'];
    this.numc = map['num_c'];
    this.numh = map['num_h'];
    this.ptype = map['ptype'];
    this.teamc = map['team_c'];
    this.teamh = map['team_h'];
    this.time = map['time'];
    if (config.isTwLang) {
      this.leagueName = config.langConfig.transToTwText(cnString: this.leagueName);
      this.teamc = config.langConfig.transToTwText(cnString: this.teamc);
    }
  }
}
