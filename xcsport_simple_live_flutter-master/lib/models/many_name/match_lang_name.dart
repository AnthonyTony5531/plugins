import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';

class MatchLangName {
  String gidm;
  String leagueId;
  String leagueName; // 联赛名
  String leagueShortName; // 联赛简称
  String homeId;
  String homeTeam; // 队伍名
  String homeTeamAbbr; // 队伍简称
  String awayId; // 队伍简称
  String awayTeam; // 队伍简称
  String awayTeamAbbr; // 队伍简称

  MatchLangName({
    this.gidm,
    this.leagueId,
    this.leagueName,
    this.leagueShortName,
    this.homeId,
    this.homeTeam,
    this.homeTeamAbbr,
    this.awayId,
    this.awayTeam,
    this.awayTeamAbbr,
  });

  MatchLangName.fromJson(Map<String, dynamic> json) {
    AiJson aiJson = AiJson(json);
    gidm = aiJson.getString('gidm');
    leagueId = aiJson.getString('leagueId');
    leagueName = aiJson.getString('leagueName');
    leagueShortName = aiJson.getString('leagueShortName');
    homeId = aiJson.getString('homeId');
    homeTeam = aiJson.getString('homeTeam');
    homeTeamAbbr = aiJson.getString('homeTeamAbbr');
    awayId = aiJson.getString('awayId');
    awayTeam = aiJson.getString('awayTeam');
    awayTeamAbbr = aiJson.getString('awayTeamAbbr');
    if (config.isTwLang) {
      leagueName = config.langConfig.transToTwText(cnString: leagueName);
      leagueShortName = config.langConfig.transToTwText(cnString: leagueShortName);
      homeTeam = config.langConfig.transToTwText(cnString: homeTeam);
      homeTeamAbbr = config.langConfig.transToTwText(cnString: homeTeamAbbr);
      awayTeam = config.langConfig.transToTwText(cnString: awayTeam);
      awayTeamAbbr = config.langConfig.transToTwText(cnString: awayTeamAbbr);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'gidm': gidm,
      'leagueId': leagueId,
      'leagueName': leagueName,
      'leagueShortName': leagueShortName,
      'homeId': homeId,
      'homeTeam': homeTeam,
      'homeTeamAbbr': homeTeamAbbr,
      'awayId': awayId,
      'awayTeam': awayTeam,
      'awayTeamAbbr': awayTeamAbbr,
    };
  }

  void replaceNameWithMatchJson(Map e) {
    AiJson json = AiJson(e);
    // 联赛
    if (e.containsKey('leagueName')) {
      e['leagueName'] = leagueName ?? json.getString('leagueName');
    }
    if (e.containsKey('tournamentName')) {
      e['tournamentName'] = leagueName ?? json.getString('tournamentName');
    }
    if (e.containsKey('leagueShortName')) {
      e['leagueShortName'] =
          leagueShortName ?? json.getString('leagueShortName');
    }
    if (e.containsKey('leagueNameSort')) {
      e['leagueNameSort'] = leagueShortName ?? json.getString('leagueNameSort');
    }
    if (e.containsKey('tournamentAlias')) {
      e['tournamentAlias'] =
          leagueShortName ?? json.getString('tournamentAlias');
    }
    if (e.containsKey('leagueNameCn')) {
      e['leagueNameCn'] = leagueName ?? json.getString('leagueName');
    }
    if (e.containsKey('leagueNameAbbrCn')) {
      e['leagueNameAbbrCn'] = leagueShortName ?? json.getString('leagueName');
    }

    // 主队
    if (e.containsKey('homeTeam')) {
      e['homeTeam'] = homeTeam ?? json.getString('homeTeam');
    }
    if (e.containsKey('homeTeamName')) {
      e['homeTeamName'] = homeTeam ?? json.getString('homeTeamName');
    }
    if (e.containsKey('homeTeamAbbr')) {
      e['homeTeamAbbr'] = homeTeamAbbr ?? json.getString('homeTeamAbbr');
    }
    if (e.containsKey('homeTeamSort')) {
      e['homeTeamSort'] = homeTeamAbbr ?? json.getString('homeTeamSort');
    }
    if (e.containsKey('homeTeamShort')) {
      e['homeTeamShort'] = homeTeamAbbr ?? json.getString('homeTeamShort');
    }
    if (e.containsKey('homeTeamAlias')) {
      e['homeTeamAlias'] = homeTeamAbbr ?? json.getString('homeTeamAlias');
    }
    if (e.containsKey('homeTeamCn')) {
      e['homeTeamCn'] = homeTeamAbbr ?? json.getString('homeTeamCn');
    }
    if (e.containsKey('homeTeamNameCn')) {
      e['homeTeamNameCn'] = homeTeam ?? json.getString('homeTeamName');
    }
    if (e.containsKey('homeTeamNameAbbrCn')) {
      e['homeTeamNameAbbrCn'] = homeTeamAbbr ?? json.getString('homeTeamCn');
    }

    // 客队
    if (e.containsKey('awayTeam')) {
      e['awayTeam'] = awayTeam ?? json.getString('awayTeam');
    }
    if (e.containsKey('awayTeamName')) {
      e['awayTeamName'] = awayTeam ?? json.getString('awayTeamName');
    }
    if (e.containsKey('awayTeamAbbr')) {
      e['awayTeamAbbr'] = awayTeamAbbr ?? json.getString('awayTeamAbbr');
    }
    if (e.containsKey('awayTeamSort')) {
      e['awayTeamSort'] = awayTeamAbbr ?? json.getString('awayTeamSort');
    }
    if (e.containsKey('awayTeamShort')) {
      e['awayTeamShort'] = awayTeamAbbr ?? json.getString('awayTeamShort');
    }
    if (e.containsKey('awayTeamAlias')) {
      e['awayTeamAlias'] = awayTeamAbbr ?? json.getString('awayTeamAlias');
    }
    if (e.containsKey('awayTeamCn')) {
      e['awayTeamCn'] = awayTeamAbbr ?? json.getString('awayTeamCn');
    }
    if (e.containsKey('awayTeamNameCn')) {
      e['awayTeamNameCn'] = awayTeam ?? json.getString('awayTeamName');
    }
    if (e.containsKey('awayTeamNameAbbrCn')) {
      e['awayTeamNameAbbrCn'] = awayTeamAbbr ?? json.getString('awayTeamCn');
    }
  }
}
