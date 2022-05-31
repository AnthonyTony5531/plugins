import 'dart:convert';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';

class DynamicListModel extends BaseModel {
  DynamicListModel();
  _DynamicListModel data;

  DynamicListModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.data = map['data'] == null ? null : _DynamicListModel.fromMap(map['data']);
  }
}

class _DynamicListModel {
  int totalCount;
  List<DynamicModel> dynamicMsgList;

  _DynamicListModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.totalCount = map['totalCount'] ?? 0;
    this.dynamicMsgList = map['dynamicMsgList'] == null
        ? null
        : map['dynamicMsgList'].map<DynamicModel>((v) => DynamicModel.fromMap(v)).toList();
  }
}

class DynamicModel {
  dynamic headImg,
      playerId,
      uid,
      showName,
      homeTeam,
      homeTeamSort,
      gameId,
      leagueId,
      leagueName,
      leagueNameSort,
      gameType,
      awayTeam,
      awayTeamSort,
      homeLogo,
      awayLogo,
      strong,
      gidm,
      systemId,
      type,
      showtype,
      dynamicType,
      gameDate,
      sgidm,
      pgidm,
      optionId,
      score,
      rt,
      ratio1,
      gameTypeSon,
      isBet;
  String sw;

  int daynamicTime;
  DaynamicData daynamicData;
  DynamicModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.headImg = map['headImg'];
    this.playerId = map['playerId'];
    this.dynamicType = map['dynamicType'];
    this.gameDate = new AiJson(map).getTimestamp('gameDate');

    this.uid = map['uid'];
    this.showName = strings([map['name'],map['nickName']]);
    this.homeTeam = map['homeTeam'];
    this.homeTeamSort = map['homeTeamSort'];
    this.gameId = map['gameId'];
    this.strong = map['strong'];
    this.leagueId = map['leagueId'];
    this.leagueName = map['leagueName'];
    this.leagueNameSort = map['leagueNameSort'];
    if(isStrNullOrEmpty(this.leagueNameSort)){
      this.leagueNameSort = this.leagueName;
    }
    this.gameType = map['gameType'];
    this.awayTeam = map['awayTeam'];
    this.awayTeamSort = map['awayTeamSort'];
    this.homeLogo = map['homeLogo'];
    this.awayLogo = map['awayLogo'];
    this.gidm = map['gidm'];
    this.systemId = map['systemId'];
    this.type = map['type'];
    this.isBet = map['isBet'];
    this.showtype = map['showtype'];
    this.daynamicTime = new AiJson(map).getTimestamp('daynamicTime');
    this.optionId = map['optionId'];
    this.score =  map['score'];
    this.rt =  map['rt'];
    this.ratio1 =  map['ratio1'];
    this.gameTypeSon =  map['gameTypeSon'];
    this.pgidm =  map['pgidm'];
    this.daynamicData = map['daynamicData'] != null ? DaynamicData.fromMap(map['daynamicData']) : null;
    if (config.isTwLang) {
      this.homeTeam = config.langConfig.transToTwText(cnString: this.homeTeam);
      this.homeTeamSort = config.langConfig.transToTwText(cnString: this.homeTeamSort);
      this.leagueName = config.langConfig.transToTwText(cnString: this.leagueName);
      this.leagueNameSort = config.langConfig.transToTwText(cnString: this.leagueNameSort);
      this.awayTeam = config.langConfig.transToTwText(cnString: this.awayTeam);
      this.awayTeamSort = config.langConfig.transToTwText(cnString: this.awayTeamSort);
    }
  }
}

class DaynamicData {
  dynamic playType,
      betItem,
      version,
      gold,
      ratio,
      ratioType,
      ior,
      optionId,
      eventCode,
      scFTH,
      scFTA,
      oddfType,
      anchorImg,
      reTime,
      session,
      viewLiveNum,
      teamSuffix;
  Map<String, dynamic> specifiers;

  DaynamicData.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.playType = map['playType'];
    this.betItem = map['betItem'];
    this.version = map['version'];
    this.ratio = map['ratio'];
    this.ratioType = map['ratioType'];
    this.ior = string(map['ior'], defaultVal: map['ioRatio']);
    this.optionId = map['id'];
    this.eventCode = map['eventCode'];
    this.scFTH = map['sc_FT_H'];
    this.scFTA = map['sc_FT_A'];
    this.anchorImg = map['anchorImg'];
    this.reTime = map['reTime'];
    this.session = map['session'];
    this.viewLiveNum = map['viewLiveNum'];
    this.teamSuffix = map['teamSuffix'];
    this.oddfType = map['oddfType'];
    this.session = map['session'];
    this.gold = map['gold'];
    var specifiersData  = map['specifiers'];
    if( specifiersData is String ){
      try{
        this.specifiers = jsonDecode(specifiersData);
      }catch(e){
      }
    }else if(specifiersData is Map){
      this.specifiers = specifiersData;
    }
    if (config.isTwLang) {
      this.betItem = config.langConfig.transToTwText(cnString: this.betItem);
    }
  }
}
