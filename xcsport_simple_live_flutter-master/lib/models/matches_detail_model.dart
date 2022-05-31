import 'dart:collection';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:sprintf/sprintf.dart';
import 'package:fast_ai/utils/ai_json.dart';

class MatchesDetailModel extends BaseModel {
  //是否已经关闭比赛
  bool isCloseMatch = false;

  MatchesDetailInfo data;

  MatchesDetailModel();

  bool get isHasData => data != null && data.isHasData;

  Future parse(Map<String, dynamic> map) async {
    super.fromMap(map);
    if (this.code == 200) {
      Map data = map['data'];
      this.data = MatchesDetailInfo.fromMap(data);
    }
  }

  Future parseMatchResult(Map<String, dynamic> map) async {
    super.fromMap(map);
    if (this.code == 200) {
      Map data = map['data'];
      this.data = MatchesDetailInfo.fromMatchResultMap(data);
    }
  }

//  MatchesDetailModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
//    if (this.code == 200) {
//      this.data = MatchesDetailInfo.fromMap(map['data']);
//    }
//  }
//
//  MatchesDetailModel.fromMatchResult(Map<String, dynamic> map)
//      : super.fromMap(map) {
//    if (this.code == 200) {
//      this.data = MatchesDetailInfo.fromMatchResultMap(map['data']);
//    }
//  }

  //数据是否来自本地
  bool get isDataFromNative => this.code == -8888;

  MatchesDetailModel.fromJumpParams(Map<String, dynamic> map) : super.fromMap(map) {
    this.code = -8888;
    this.data = MatchesDetailInfo.fromMap(map);
  }

  //剩余
  num remain() {
    return (data?.gameDate ?? 0) - (systemTime ?? 0);
  }

  bool get isShowDetail => data?.gameType == 'FT' || data?.gameType == 'BK';
}

class MatchesDetailInfo {
  String awayId;
  String awayLogo;
  String awayTeam;
  String awayTeamAbbr;
  int betNum;
  String connectGameId;
  String dataAnalysisUrl;
  num gameDate;
  String gameId;
  String gameImage;
  String gameType;
  String gameTypeSon;
  String gameTypeSonName;
  String gidm;
  String hgid;
  String homeId;
  String homeLogo;
  String homeTeam;
  String homeTeamAbbr;
  String homeTeamSuffix;
  String iconMp;
  String iconPc;
  String leagueBackgroundImage; // 联赛比赛背景
  String leagueColor;
  String leagueId;
  String leagueLogo;

  String leagueName;
  String leagueShortName;
  int playNum;
  String showtype;
  int status;
  String round;
  String season;
  String systemId;
  String phase = '';
  dynamic gameInfo;
  List<Detail> detail; //
  GameScene gameScene; //
  dynamic videoLives; //
  List<MatchesDetailInfo> subGameDetails;

  String version;

  bool get isHasData => gidm != null && gidm.length != 0;

  //List<_GameInfo> gameInfo;
  MatchesDetailInfo.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.version = map['version'];
    this.awayId = map['awayId'];
    this.awayLogo = map['awayLogo'];
    this.awayTeam = map['awayTeam'];
    this.awayTeamAbbr = map['awayTeamAbbr'];
    this.betNum = map['betNum'];

    this.round = map['round'];
    this.season = map['season'];
    this.systemId = map['systemId'];

    this.connectGameId = map['connectGameId'];
    this.dataAnalysisUrl = map['dataAnalysisUrl'];

//    this.gameDate = new AiJson(map).getTimestamp('gameDate');
    this.gameDate = new AiJson(map).getTimestamp('gameDate', convert2local: true);
    this.gameId = map['gameId'];
    this.gameImage = map['gameImage'];
    this.gameScene = map['gameScene'] != null ? GameScene.fromMap(map['gameScene']) : null;
    this.gameType = map['gameType'];
    this.gameTypeSon = map['gameTypeSon'];
    this.gameTypeSonName = map['gameTypeSonName'];
    this.gidm = map['gidm'];
    this.hgid = map['hgid'];
    this.homeId = map['homeId'];
    this.homeLogo = map['homeLogo'];
    this.homeTeam = map['homeTeam'];
    this.homeTeamAbbr = map['homeTeamAbbr'];
    this.homeTeamSuffix = map['homeTeamSuffix'];
    this.iconMp = map['iconMp'];
    this.status = map['status'];
    this.iconPc = map['iconPc'];

    this.leagueBackgroundImage = map['leagueBackgroundImage'];
    this.leagueColor = map['leagueColor'];
    this.leagueId = map['leagueId'];
    this.leagueLogo = map['leagueLogo'];
    this.leagueName = map['leagueName'];
    this.leagueShortName = string(map['leagueShortName'], defaultVal: leagueName);
    this.playNum = map['playNum'];
    this.videoLives = map['videoLives'];
    this.showtype = map['showtype'];
    this.phase = map['phase'];

    this.detail = map['detail'] == null ? null : map['detail'].map<Detail>((v) => Detail.fromMap(v, showtype, gameType, gameDate)).toList();
    this.subGameDetails =
        map['subGameDetails'] == null ? null : map['subGameDetails'].map<MatchesDetailInfo>((v) => MatchesDetailInfo.fromMap(v)).toList();
    if (config.isTwLang) {
      leagueName = config.langConfig.transToTwText(cnString: leagueName);
      leagueShortName = config.langConfig.transToTwText(cnString: leagueShortName);
      awayTeam = config.langConfig.transToTwText(cnString: awayTeam);
      awayTeamAbbr = config.langConfig.transToTwText(cnString: awayTeamAbbr);
      homeTeam = config.langConfig.transToTwText(cnString: homeTeam);
      homeTeamAbbr = config.langConfig.transToTwText(cnString: homeTeamAbbr);
    }
  }

  MatchesDetailInfo.fromMatchResultMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.version = map['version'];
    this.awayId = map['awayTeamId'];
    this.awayLogo = map['awayTeamLogo'];
    this.awayTeam = map['awayTeamName'];
    this.awayTeamAbbr = map['awayTeamName'];
    this.betNum = map['betNum'];
    this.connectGameId = map['connectGameId'];
    this.dataAnalysisUrl = map['dataAnalysisUrl'];

//    this.gameDate = map['matchTime'];
    this.gameDate = new AiJson(map).getTimestamp('matchTime', convert2local: true);
    this.gameId = map['gameId'];
    this.gameImage = map['gameImage'];
    this.gameScene = map['gameScene'] != null ? GameScene.fromMap(map['gameScene']) : null;
    this.gameType = map['gameType'];
    this.gameTypeSon = map['gameTypeSon'];
    this.gameTypeSonName = map['gameTypeSonName'];
    this.gidm = map['gidm'];
    this.hgid = map['hgid'];

    this.homeId = map['homeTeamId'];
    this.homeLogo = map['homeTeamLogo'];
    this.homeTeam = map['homeTeamName'];
    this.homeTeamAbbr = map['homeTeamName'];
    this.status = map['status'];

    this.homeTeamSuffix = map['homeTeamSuffix'];

    this.iconMp = map['iconMp'];
    this.iconPc = map['iconPc'];

    this.leagueColor = map['leagueColor'];
    this.leagueId = map['leagueId'];
    this.leagueLogo = map['leagueLogo'];
    this.leagueName = map['leagueName'];
    this.leagueShortName = map['leagueShortName'];

    this.playNum = map['playNum'];
    this.videoLives = map['videoLives']; //
    this.showtype = map['showtype'];

    if (config.isTwLang) {
      leagueName = config.langConfig.transToTwText(cnString: leagueName);
      leagueShortName = config.langConfig.transToTwText(cnString: leagueShortName);
      awayTeam = config.langConfig.transToTwText(cnString: awayTeam);
      awayTeamAbbr = config.langConfig.transToTwText(cnString: awayTeamAbbr);
      homeTeam = config.langConfig.transToTwText(cnString: homeTeam);
      homeTeamAbbr = config.langConfig.transToTwText(cnString: homeTeamAbbr);
    }
  }

  MatchesDetailInfo currMatchesDetailInfo;

  bool isHasSubGameDetails() {
    // 加时是否有子比赛数据
    List<MatchesDetailInfo> subGameDetailsFlag = [];
    if (this.subGameDetails != null && this.subGameDetails.length > 0) {
      subGameDetailsFlag = this.subGameDetails.where((item) {
        return item.phase == '1';
      }).toList();
    }
    return subGameDetailsFlag?.isNotEmpty;
  }

  Game get getGame {
    Game game;
    List<MatchesDetailInfo> subGameDetailsFlag = [];
    // phase:1 加时
    if (this.subGameDetails != null && this.subGameDetails.length > 0) {
      subGameDetailsFlag = this.subGameDetails.where((item) {
        return item.phase == '1';
      }).toList();
    }
    if (subGameDetailsFlag.length > 0) {
      game = subGameDetailsFlag[0].detail[0].game;
      currMatchesDetailInfo = subGameDetailsFlag[0];
    } else if (this.detail != null && this.detail.length > 0) {
      game = this.detail[0].game;
      currMatchesDetailInfo = this;
    }
    return game;
  }
}

class Detail {
  Detail();

  Game game;
  List<PlayData> playData;

  Detail.fromMap(Map map, String showType, String gameType, num gameDate) {
    this.game = map['game'] == null ? null : Game.fromMap(map['game'], showType, gameType, gameDate);
    this.playData = map['playData'] == null ? null : map['playData'].map<PlayData>((v) => PlayData.fromMap(v)).toList();
  }

  Detail.copy(Detail detail) {
    this.game = Game();
    this.game.copy(detail.game);
    playData = [];
  }
}

class Game {
  Game();

  dynamic dangerous,
      gOpen,
      gameId,
      halfTime,
      hgOpen,
      hgid,
      hrecv,
      hstrong,
      limitMax,
      limitMin,
      ptype,
      reTime,
      recv,
      redcardAway,
      redcardHome,
      session,
      suffix, //主动添加的(_card,_conner)
      strong,
      wDelay,
      gidm,
      mainGidm,
      mainGameId,
      championType;
  GameInfo gameInfo;

  bool get isHasData => gameId != null && gameId != '';

  Game.fromMap(Map map, String showType, String gameType, num gameDate) {
    if (map == null) return;
    this.dangerous = map['dangerous'];
    this.gOpen = map['gOpen'];
    this.gameId = map['gameId'];
    this.halfTime = map['halfTime'];
    this.hgOpen = map['hgOpen'];
    this.hgid = map['hgid'];
    this.hstrong = map['hstrong'];
    this.limitMax = map['limitMax'];
    this.limitMin = map['limitMin'];
    this.reTime = map['reTime'];
    this.recv = map['recv'];
    this.redcardAway = map['redcardAway'];
    this.redcardHome = map['redcardHome'];
    this.session = map['session'];
    this.strong = map['strong'];
    this.wDelay = map['wDelay'];
    this.gidm = map['gidm'];
    this.championType = map['championType'];
    this.gameInfo = GameInfo.fromMap(map['gameInfo'], showType, gameType, gidm);
  }

  Game.fromMap188(Map map) {
    if (map == null) return;
    this.dangerous = map['dangerous'];
    this.gOpen = map['gOpen'];
    this.gameId = map['gameId'];
    this.halfTime = map['halfTime'];
    this.hgOpen = map['hgOpen'];
    this.hgid = map['hgid'];
    this.hstrong = map['hstrong'];
    this.limitMax = map['limitMax'];
    this.limitMin = map['limitMin'];
    this.reTime = map['reTime'];
    this.recv = map['recv'];
    this.redcardAway = map['redcardAway'];
    this.redcardHome = map['redcardHome'];
    this.session = map['session'];
    this.strong = map['strong'];
    this.wDelay = map['wDelay'];
    this.gidm = map['gidm'];
    this.championType = map['championType'];
  }

  void copy(Game game) {
    if (game == null) return;
    if (game.dangerous != null) this.dangerous = game.dangerous;
    if (game.gOpen != null) this.gOpen = game.gOpen;
    if (game.gameId != null) this.gameId = game.gameId;
    if (game.halfTime != null) this.halfTime = game.halfTime;
    if (game.hgOpen != null) this.hgOpen = game.hgOpen;
    if (game.hgid != null) this.hgid = game.hgid;
    if (game.hstrong != null) this.hstrong = game.hstrong;
    if (game.limitMax != null) this.limitMax = game.limitMax;
    if (game.limitMin != null) this.limitMin = game.limitMin;
    if (game.reTime != null) this.reTime = game.reTime;
    if (game.recv != null) this.recv = game.recv;
    if (game.redcardAway != null) this.redcardAway = game.redcardAway;
    if (game.redcardHome != null) this.redcardHome = game.redcardHome;
    if (game.session != null) this.session = game.session;
    if (game.strong != null) this.strong = game.strong;
    if (game.wDelay != null) this.wDelay = game.wDelay;
    if (game.gidm != null) this.gidm = game.gidm;
    if (game.championType != null) this.championType = game.championType;
    if (game.gameInfo != null) {
      if (this.gameInfo == null) {
        this.gameInfo = GameInfo();
      }
      this.gameInfo.copy(game.gameInfo);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'dangerous': dangerous,
      'gOpen': gOpen,
      'gameId': gameId,
      'halfTime': halfTime,
      'hgOpen': hgOpen,
      'hgid': hgid,
      'hstrong': hstrong,
      'limitMax': limitMax,
      'limitMin': limitMin,
      'reTime': reTime,
      'recv': recv,
      'redcardAway': redcardAway,
      'redcardHome': redcardHome,
      'session': session,
      'strong': strong,
      'wDelay': wDelay,
      'gidm': gidm,
      'championType': championType,
      'gameInfo': gameInfo.toMap(),
    };
  }
}

class GameInfo {
  GameInfo();

  LinkedHashMap<int, String> roundHomeScores = LinkedHashMap();
  LinkedHashMap<int, String> roundAwayScores = LinkedHashMap();

  dynamic dangerous,
      reTimeUpdateTime,
      reTime,
      scFTC,
      scFTH,
      seNow,
      tCount,
      //网球start
      sc1stA,
      sc1stH,
      sc2ndA,
      sc2ndH,
      sc3thA,
      sc3thH,
      sc4thA,
      sc4thH,
      sc5thA,
      sc5thH,
      sc6thA,
      sc6thH,
      sc7thA,
      sc7thH,
      sc8thA,
      sc8thH,
      sc9thA,
      sc9thH,
      sc10thA,
      sc10thH,
      sc11thA,
      sc11thH,
      sc12thA,
      sc12thH,
      scAdv,
      scGameA,
      scGameH,
      scSetGameA,
      scSetGameH,
      sciwd, //是否停盘
      scsetA,
      scsetH, //网球end

      scFTA, //篮球
      scH1A,
      scH1H,
      scH2A,
      scH2H,
      scOTA,
      scOTH,
      scQ1A,
      scQ1H,
      scQ2A,
      scQ2H,
      scQ3A,
      scQ3H,
      scQ4A,
      scQ4H;
  String showType;
  String gameType;
  String gidm;
  String suffix; // -加时赛，点球等
  String suffixPlay; // _OT，_PS等
  //0是客队发球，1主队发球
  String scSer;
  String t_count;
  String scSetype;

  //获取的体育项配置列表，他的第几局，当前比分是通过计算出来的。
  static List<GameType> defaultGameTypeConfig() {
    return [GameType.OP_VB, GameType.OP_TN, GameType.BS, GameType.TN, GameType.BK];
  }

  //第几局
  String get whichRound {
//    var gameTypeE = parse2GameType(gameType);
//    if(GameInfo.defaultGameTypeConfig().contains(gameTypeE)){
//      return calculateCurrentSeNow();
//    }
    //如果没做处理，那么返回后台的。
//    if('0' == seNow)
//      return '1';
    return calculateCurrentSeNow();
  }

  //第几盘
  String get whichSet {
    return "${calculateCurrentSet()}";
  }

  //比赛进行的时间
  String get runningTime {
    var gameTypeE = parse2GameType(gameType);
    var baseLang = config.langMap['baseLang'];
    if (GameType.FT == gameTypeE) return _computeRBFTTime();
    if (GameType.BK == gameTypeE) return _computeRBBKTime();
    if (GameType.BK_AFT == gameTypeE) return _bk_aft();

    if (GameType.TN == gameTypeE) {
      if ("true" == sciwd) return baseLang['models']['timeout'];
      int round = calculateCurrentSeNowInt();
      var homeScore = roundHomeScores[round];
      var awayScore = roundAwayScores[round];
      String prefix = '${baseLang['models']['prefix']}${intStr(whichRound, defaultVal: '1')}${baseLang['models']['roundTn']}';
      if (config.isNotCnTwLang) {
        // 22481多语言网球改为set
        String round = intStr(whichRound, defaultVal: '1');
        num index = int.tryParse(round);
        prefix = 'set$index';
//        if(quarterList.length > index){
//          prefix = quarterList[index];
//        }
      }
      return "$prefix ${intStr(homeScore, defaultVal: '0')}:${intStr(awayScore, defaultVal: '0')}(${"A" == scGameH || parseInt(scGameH) > 40 ? "A" : intStr(scGameH, defaultVal: '0')}:${"A" == scGameA || parseInt(scGameA) > 40 ? "A" : intStr(scGameA, defaultVal: '0')})";
    }
    if (GameInfo.defaultGameTypeConfig().contains(gameTypeE)) {
      if (config.isNotCnTwLang) {
        return 'set${intStr(whichRound, defaultVal: '1')}';
      }
      if (isNullOrEmpty(whichRound)) {
        //没有返回第几局情况下
        return "";
      }
      return "${baseLang['models']['prefix']}${intStr(whichRound, defaultVal: '1')}${baseLang['models']['round']}";
    }

    return AiJson(baseLang).getString('models.RBFTTime.matchRuning'); //'比赛进行中';
  }

  //棒球分别是一垒有人，二垒有人，三垒有人
  bool scFb, scSb, scTb;

  //出局数目
  String scOut;

  //上下半局
  HalfStatus halfStatus;

  GameInfo.fromMap(Map map, String showType, String gameType, String gidm) {
    if (map == null) return;
    this.showType = showType;
    this.gameType = gameType;
    this.gidm = gidm;
    this.t_count = map['t_count'] ?? null;

    this.scFTA = map['sc_FT_A'] ?? null;
    this.scH1A = map['sc_H1_A'] ?? null;
    this.scH1H = map['sc_H1_H'] ?? null;
    this.scH2A = map['sc_H2_A'] ?? null;
    this.scH2H = map['sc_H2_H'] ?? null;
    this.scOTA = map['sc_OT_A'] ?? null;
    this.scOTH = map['sc_OT_H'] ?? null;
    this.scQ1A = map['sc_Q1_A'] ?? null;
    this.scQ1H = map['sc_Q1_H'] ?? null;
    this.scQ2A = map['sc_Q2_A'] ?? null;
    this.scQ2H = map['sc_Q2_H'] ?? null;
    this.scQ3A = map['sc_Q3_A'] ?? null;
    this.scQ3H = map['sc_Q3_H'] ?? null;
    this.scQ4A = map['sc_Q4_A'] ?? null;
    this.scQ4H = map['sc_Q4_H'] ?? null;
    this.sciwd = map['sc_iwd'] ?? null;
    this.dangerous = map['dangerous'];
    this.reTimeUpdateTime = map['reTime_updateTime'];
    this.reTime = map['re_time'] ?? null;
    this.scFTC = map['sc_FT_C'] ?? null;
    this.scFTH = map['sc_FT_H'] ?? null;
    this.seNow = map['se_now'] ?? null;
    // ai棒球
    if (isNotEmpty(map['inningNum']) && map['inningNum'] != '0') {
      this.seNow = map['inningNum'];
    }
    this.tCount = map['t_count'] ?? null;
    this.sc1stA = map['sc_1st_A'] ?? null;
    this.sc1stH = map['sc_1st_H'] ?? null;
    this.sc2ndA = map['sc_2nd_A'] ?? map['sc_2st_A'];
    this.sc2ndH = map['sc_2nd_H'] ?? map['sc_2st_H'];
    this.sc3thA = map['sc_3th_A'] ?? map['sc_3st_A'];
    this.sc3thH = map['sc_3th_H'] ?? map['sc_3st_H'];
    this.sc4thA = map['sc_4th_A'] ?? map['sc_4st_A'];
    this.sc4thH = map['sc_4th_H'] ?? map['sc_4st_H'];
    this.sc5thA = map['sc_5th_A'] ?? map['sc_5st_A'];
    this.sc5thH = map['sc_5th_H'] ?? map['sc_5st_H'];
    this.sc6thA = map['sc_6th_A'] ?? null;
    this.sc6thH = map['sc_6th_H'] ?? null;
    this.sc7thA = map['sc_7th_A'] ?? null;
    this.sc7thH = map['sc_7th_H'] ?? null;
    this.sc8thA = map['sc_8th_A'] ?? null;
    this.sc8thH = map['sc_8th_H'] ?? null;
    this.sc9thA = map['sc_9th_A'] ?? null;
    this.sc9thH = map['sc_9th_H'] ?? null;
    this.sc10thA = map['sc_10th_A'] ?? null;
    this.sc11thH = map['sc_10th_H'] ?? null;
    this.sc12thA = map['sc_11th_A'] ?? null;
    this.sc12thH = map['sc_12th_H'] ?? null;
    this.scAdv = map['sc_adv'] ?? null;
    this.scGameA = map['sc_game_A'] ?? null;
    if (!isStrNullOrEmpty(this.scGameA)) {
      this.scGameA = this.scGameA.toString().replaceAll('Adv', 'A');
    }
    this.scGameH = map['sc_game_H'] ?? null;
    if (!isStrNullOrEmpty(this.scGameH)) {
      this.scGameH = this.scGameH.toString().replaceAll('Adv', 'A');
    }

    this.scSetGameA = map['sc_set_game_A'] ?? null;
    this.scSetGameH = map['sc_set_game_H'] ?? null;
    this.scsetA = map['sc_set_A'] ?? null;
    this.scsetH = map['sc_set_H'] ?? null;
    this.scFb = "true" == map['sc_fb'] || true == map['sc_fb'] || map['base_1B'] == 'Y' ?? false;
    this.scSb = "true" == map['sc_sb'] || true == map['sc_sb'] || map['base_2B'] == 'Y' ?? false;
    this.scTb = "true" == map['sc_tb'] || true == map['sc_tb'] || map['base_3B'] == 'Y' ?? false;
    this.scOut = map['sc_ot'] ?? map['outCount'];
    this.scSer = map['sc_ser'];
    this.scSetype = map['sc_setype'];
    if (map['sc_half'] == '1' || map['inning'] == 'Bot') {
      halfStatus = HalfStatus.secondHalf;
      scSer = '1';
    }

    if (map['sc_half'] == '0' || map['inning'] == 'Top') {
      halfStatus = HalfStatus.firstHalf;
      scSer = '0';
    }

    roundHomeScores = new LinkedHashMap();

    if (parse2GameType(gameType) == GameType.BK) {
      roundHomeScores[1] = scQ1H;
      roundHomeScores[2] = scQ2H;
      roundHomeScores[3] = scQ3H;
      roundHomeScores[4] = scQ4H;
    } else {
      roundHomeScores[1] = sc1stH;
      roundHomeScores[2] = sc2ndH;
      roundHomeScores[3] = sc3thH;
      roundHomeScores[4] = sc4thH;
      roundHomeScores[5] = sc5thH;
      roundHomeScores[6] = sc6thH;
      roundHomeScores[7] = sc7thH;
      roundHomeScores[8] = sc8thH;
      roundHomeScores[9] = sc9thH;
      roundHomeScores[10] = sc10thH;
      roundHomeScores[11] = sc11thH;
      roundHomeScores[12] = sc12thH;
    }

    roundAwayScores = new LinkedHashMap();

    if (parse2GameType(gameType) == GameType.BK) {
      roundHomeScores[1] = scQ1A;
      roundHomeScores[2] = scQ2A;
      roundHomeScores[3] = scQ3A;
      roundHomeScores[4] = scQ4A;
    } else if (parse2GameType(gameType) == GameType.TN) {
      roundAwayScores[1] = sc1stA;
      roundAwayScores[2] = sc2ndA;
      roundAwayScores[3] = sc3thA;
      roundAwayScores[4] = sc4thA;
      roundAwayScores[5] = sc5thA;
      if (this.scGameH == '40' && this.scGameA == '40') {
        if (this.scAdv == '1') {
          this.scGameH = 'A';
        } else if (this.scAdv == '0') {
          this.scGameA = 'A';
        }
      }
    } else {
      roundAwayScores[1] = sc1stA;
      roundAwayScores[2] = sc2ndA;
      roundAwayScores[3] = sc3thA;
      roundAwayScores[4] = sc4thA;
      roundAwayScores[5] = sc5thA;
      roundAwayScores[6] = sc6thA;
      roundAwayScores[7] = sc7thA;
      roundAwayScores[8] = sc8thA;
      roundAwayScores[9] = sc9thA;
      roundAwayScores[10] = sc10thA;
      roundAwayScores[11] = sc11thA;
      roundAwayScores[12] = sc12thA;
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (this.dangerous != null) map['dangerous'] = this.dangerous;
    if (this.reTimeUpdateTime != null) map['reTime_updateTime'] = this.reTimeUpdateTime;
    if (this.reTime != null) map['re_time'] = this.reTime;
    if (this.scFTC != null) map['sc_FT_C'] = this.scFTC;
    if (this.scFTH != null) map['sc_FT_H'] = this.scFTH;
    if (this.seNow != null) map['se_now'] = this.seNow;
    if (this.tCount != null) map['t_count'] = this.tCount;
    if (this.sc1stA != null) map['sc_1st_A'] = this.sc1stA;
    if (this.sc1stH != null) map['sc_1st_H'] = this.sc1stH;
    if (this.sc2ndA != null) map['sc_2nd_A'] = this.sc2ndA;
    if (this.sc2ndH != null) map['sc_2nd_H'] = this.sc2ndH;
    if (this.sc3thA != null) map['sc_3th_A'] = this.sc3thA;
    if (this.sc3thH != null) map['sc_3th_H'] = this.sc3thH;
    if (this.sc4thA != null) map['sc_4th_A'] = this.sc4thA;
    if (this.sc4thH != null) map['sc_4th_H'] = this.sc4thH;
    if (this.sc5thA != null) map['sc_5th_A'] = this.sc5thA;
    if (this.sc5thH != null) map['sc_5th_H'] = this.sc5thH;
    if (this.sc6thA != null) map['sc_6th_A'] = this.sc6thA;
    if (this.sc6thH != null) map['sc_6th_H'] = this.sc6thH;
    if (this.sc7thA != null) map['sc_7th_A'] = this.sc7thA;
    if (this.sc7thH != null) map['sc_7th_H'] = this.sc7thH;
    if (this.sc8thA != null) map['sc_8th_A'] = this.sc8thA;
    if (this.sc8thH != null) map['sc_8th_H'] = this.sc8thH;
    if (this.sc9thA != null) map['sc_9th_A'] = this.sc9thA;
    if (this.sc9thH != null) map['sc_9th_H'] = this.sc9thH;
    if (this.sc10thA != null) map['sc_10th_A'] = this.sc10thA;
    if (this.sc10thH != null) map['sc_10th_H'] = this.sc10thH;
    if (this.sc11thA != null) map['sc_11th_A'] = this.sc11thA;
    if (this.sc11thH != null) map['sc_11th_H'] = this.sc11thH;
    if (this.sc12thA != null) map['sc_12th_A'] = this.sc12thA;
    if (this.sc12thH != null) map['sc_12th_H'] = this.sc12thH;
    if (this.scAdv != null) map['sc_adv'] = this.scAdv;
    if (this.scGameA != null) map['sc_game_A'] = this.scGameA;
    if (this.scGameH != null) map['sc_game_B'] = this.scGameH;
    if (this.scSetGameA != null) map['sc_set_game_A'] = this.scSetGameA;
    if (this.scSetGameH != null) map['sc_set_game_H'] = this.scSetGameH;
    if (this.sciwd != null) map['sc_iwd'] = this.sciwd;
    if (this.scsetA != null) map['sc_set_A'] = this.scsetA;
    if (this.scsetH != null) map['sc_set_H'] = this.scsetH;
    if (this.scFTA != null) map['sc_FT_A'] = this.scFTA;
    if (this.scH1A != null) map['sc_H1_A'] = this.scH1A;
    if (this.scH1H != null) map['sc_H1_H'] = this.scH1H;
    if (this.scH2A != null) map['sc_H2_A'] = this.scH2A;
    if (this.scH2H != null) map['sc_H2_H'] = this.scH2H;
    if (this.scOTA != null) map['sc_OT_A'] = this.scOTA;
    if (this.scOTH != null) map['sc_OT_H'] = this.scOTH;
    if (this.scQ1A != null) map['sc_Q1_A'] = this.scQ1A;
    if (this.scQ1H != null) map['sc_Q1_H'] = this.scQ1H;
    if (this.scQ2A != null) map['sc_Q2_A'] = this.scQ2A;
    if (this.scQ2H != null) map['sc_Q2_H'] = this.scQ2H;
    if (this.scQ3A != null) map['sc_Q3_A'] = this.scQ3A;
    if (this.scQ3H != null) map['sc_Q3_H'] = this.scQ3H;
    if (this.scQ4A != null) map['sc_Q4_A'] = this.scQ4A;
    if (this.scQ4H != null) map['sc_Q4_H'] = this.scQ4H;
    if (this.scSer != null) map['sc_ser'] = this.scSer;
    if (this.t_count != null) map['t_count'] = this.t_count;
    if (this.scSetype != null) map['sc_setype'] = this.scSetype;
    return map;
  }

  void copy(GameInfo info) {
    if (info == null) return;

    if (info.dangerous != null) this.dangerous = info.dangerous;
    if (info.reTimeUpdateTime != null) this.reTimeUpdateTime = info.reTimeUpdateTime;
    if (info.reTime != null) this.reTime = info.reTime;
    if (info.scFTC != null) this.scFTC = info.scFTC;
    if (info.scFTH != null) this.scFTH = info.scFTH;
    if (info.seNow != null) this.seNow = info.seNow;
    if (info.tCount != null) this.tCount = info.tCount;
    if (info.sc1stA != null) this.sc1stA = info.sc1stA;
    if (info.sc1stH != null) this.sc1stH = info.sc1stH;
    if (info.sc2ndA != null) this.sc2ndA = info.sc2ndA;
    if (info.sc2ndH != null) this.sc2ndH = info.sc2ndH;
    if (info.sc3thA != null) this.sc3thA = info.sc3thA;
    if (info.sc3thH != null) this.sc3thH = info.sc3thH;
    if (info.sc4thA != null) this.sc4thA = info.sc4thA;
    if (info.sc4thH != null) this.sc4thH = info.sc4thH;
    if (info.sc5thA != null) this.sc5thA = info.sc5thA;
    if (info.sc5thH != null) this.sc5thH = info.sc5thH;
    if (info.sc6thA != null) this.sc6thA = info.sc6thA;
    if (info.sc6thH != null) this.sc6thH = info.sc6thH;
    if (info.sc7thA != null) this.sc7thA = info.sc7thA;
    if (info.sc7thH != null) this.sc7thH = info.sc7thH;
    if (info.sc8thA != null) this.sc8thA = info.sc8thA;
    if (info.sc8thH != null) this.sc8thH = info.sc8thH;
    if (info.sc9thA != null) this.sc9thA = info.sc9thA;
    if (info.sc9thH != null) this.sc9thH = info.sc9thH;
    if (info.sc10thA != null) this.sc10thA = info.sc10thA;
    if (info.sc10thH != null) this.sc10thH = info.sc10thH;
    if (info.sc11thA != null) this.sc11thA = info.sc11thA;
    if (info.sc11thH != null) this.sc11thH = info.sc11thH;
    if (info.sc12thA != null) this.sc12thA = info.sc12thA;
    if (info.sc12thH != null) this.sc12thH = info.sc12thH;
    if (info.scAdv != null) this.scAdv = info.scAdv;
    if (info.scGameA != null) this.scGameA = info.scGameA;
    if (info.scGameH != null) this.scGameH = info.scGameH;
    if (info.scSetGameA != null) this.scSetGameA = info.scSetGameA;
    if (info.scSetGameH != null) this.scSetGameH = info.scSetGameH;
    if (info.sciwd != null) this.sciwd = info.sciwd;
    if (info.scsetA != null) this.scsetA = info.scsetA;
    if (info.scsetH != null) this.scsetH = info.scsetH;
    if (info.scFTA != null) this.scFTA = info.scFTA;
    if (info.scH1A != null) this.scH1A = info.scH1A;
    if (info.scH1H != null) this.scH1H = info.scH1H;
    if (info.scH2A != null) this.scH2A = info.scH2A;
    if (info.scH2H != null) this.scH2H = info.scH2H;
    if (info.scOTA != null) this.scOTA = info.scOTA;
    if (info.scOTH != null) this.scOTH = info.scOTH;
    if (info.scQ1A != null) this.scQ1A = info.scQ1A;
    if (info.scQ1H != null) this.scQ1H = info.scQ1H;
    if (info.scQ2A != null) this.scQ2A = info.scQ2A;
    if (info.scQ2H != null) this.scQ2H = info.scQ2H;
    if (info.scQ3A != null) this.scQ3A = info.scQ3A;
    if (info.scQ3H != null) this.scQ3H = info.scQ3H;
    if (info.scQ4A != null) this.scQ4A = info.scQ4A;
    if (info.scQ4H != null) this.scQ4H = info.scQ4H;
    if (info.showType != null) this.showType = info.showType;
    if (info.gameType != null) this.gameType = info.gameType;
    if (info.gidm != null) this.gidm = info.gidm;
    if (info.suffix != null) this.suffix = info.suffix;
    if (info.suffixPlay != null) this.suffixPlay = info.suffixPlay;
    if (info.scSer != null) this.scSer = info.scSer;
    if (info.t_count != null) this.t_count = info.t_count;
    if (info.scSetype != null) this.scSetype = info.scSetype;

    roundHomeScores = new LinkedHashMap();

    if (parse2GameType(gameType) == GameType.BK) {
      roundHomeScores[1] = scQ1H;
      roundHomeScores[2] = scQ2H;
      roundHomeScores[3] = scQ3H;
      roundHomeScores[4] = scQ4H;
    } else {
      roundHomeScores[1] = sc1stH;
      roundHomeScores[2] = sc2ndH;
      roundHomeScores[3] = sc3thH;
      roundHomeScores[4] = sc4thH;
      roundHomeScores[5] = sc5thH;
      roundHomeScores[6] = sc6thH;
      roundHomeScores[7] = sc7thH;
      roundHomeScores[8] = sc8thH;
      roundHomeScores[9] = sc9thH;
      roundHomeScores[10] = sc10thH;
      roundHomeScores[11] = sc11thH;
      roundHomeScores[12] = sc12thH;
    }

    roundAwayScores = new LinkedHashMap();

    if (parse2GameType(gameType) == GameType.BK) {
      roundHomeScores[1] = scQ1A;
      roundHomeScores[2] = scQ2A;
      roundHomeScores[3] = scQ3A;
      roundHomeScores[4] = scQ4A;
    } else if (parse2GameType(gameType) == GameType.TN) {
      roundAwayScores[1] = sc1stA;
      roundAwayScores[2] = sc2ndA;
      roundAwayScores[3] = sc3thA;
      roundAwayScores[4] = sc4thA;
      roundAwayScores[5] = sc5thA;
      if (this.scGameH == '40' && this.scGameA == '40') {
        if (this.scAdv == '1') {
          this.scGameH = 'A';
        } else if (this.scAdv == '0') {
          this.scGameA = 'A';
        }
      }
    } else {
      roundAwayScores[1] = sc1stA;
      roundAwayScores[2] = sc2ndA;
      roundAwayScores[3] = sc3thA;
      roundAwayScores[4] = sc4thA;
      roundAwayScores[5] = sc5thA;
      roundAwayScores[6] = sc6thA;
      roundAwayScores[7] = sc7thA;
      roundAwayScores[8] = sc8thA;
      roundAwayScores[9] = sc9thA;
      roundAwayScores[10] = sc10thA;
      roundAwayScores[11] = sc11thA;
      roundAwayScores[12] = sc12thA;
    }
  }

  //有发球ui,且发球方字段不为空
  bool get hasSer {
    var gt = parse2GameType(gameType);
    if (showType == "RB") {
      if (GameType.BS == gt || GameType.OP_TN == gt || GameType.OP_VB == gt || GameType.TN == gt) {
        return isNotEmpty(scSer);
      }
    }
    return false;
  }

  //获取网球第几垒有人的logo
  String get scBImg {
    if (scFb && scSb && scTb) {
      return "assets/images/detail/icon_baseball/icon_baseball_status_7.svg";
    }

    if (!scFb && scSb && scTb) {
      return "assets/images/detail/icon_baseball/icon_baseball_status_4.svg";
    }

    if (scFb && scSb && !scTb) {
      return "assets/images/detail/icon_baseball/icon_baseball_status_5.svg";
    }

    if (!scFb && !scSb && scTb) {
      return "assets/images/detail/icon_baseball/icon_baseball_status_2.svg";
    }

    if (scFb && !scSb && !scTb) {
      return "assets/images/detail/icon_baseball/icon_baseball_status_3.svg";
    }

    if (!scFb && scSb && !scTb) {
      return "assets/images/detail/icon_baseball/icon_baseball_status_1.svg";
    }

    if (scFb && !scSb && scTb) {
      return "assets/images/detail/icon_baseball/icon_baseball_status_6.svg";
    }

    if (!scFb && !scSb && !scTb) {
      return "assets/images/detail/icon_baseball/icon_baseball_status_8.svg";
    }
    return "";
  }

  String get scBImg188 {
    return scBImg.replaceFirst('assets', 'assets188');
  }

//  dynamic get homeScore {
//    if ('RB' != this.showType) {
//      return "";
//    }
//    if (parse2GameType(gameType) == GameType.BS) {
//      return intStr(string(scGameH, defaultVal: '0'));
//    }
//
//    if (parse2GameType(gameType) == GameType.TN) {
//      return intStr(string("${calculateCurrentHomeScore()}"));
//    }
//    return intStr(strings([scsetH, scFTH], defaultVal: 'RB' != this.showType ? '' : '0'));
//  }

//  dynamic get awayScore {
//    if ('RB' != this.showType) {
//      return "";
//    }
//    if (parse2GameType(gameType) == GameType.BS) {
//      return intStr(string(scGameA, defaultVal: '0'));
//    }
//
//    if (parse2GameType(gameType) == GameType.TN) {
//      return intStr("${calculateCurrentAwayScore()}");
//    }
//    return intStr(strings([scsetA, scFTA, scFTC], defaultVal: 'RB' != this.showType ? '' : '0'));
//  }

  int calculateCurrentHomeScore() {
    int homeScoreVal = 0;
    var set = calculateCurrentSeNowInt();

    for (int i = 1; i < set; i++) {
      var homeScoreValT = parseInt(intStr(roundHomeScores[i]), defaultVal: 0);
      var awayScoreValT = parseInt(intStr(roundAwayScores[i]), defaultVal: 0);
      if (homeScoreValT > awayScoreValT) {
        homeScoreVal++;
      }
    }
    return homeScoreVal;
  }

  int calculateCurrentAwayScore() {
    var set = calculateCurrentSeNowInt();
    int awayScoreVal = 0;
    for (int i = 1; i < set; i++) {
      var homeScoreValT = parseInt(intStr(roundHomeScores[i]), defaultVal: 0);
      var awayScoreValT = parseInt(intStr(roundAwayScores[i]), defaultVal: 0);
      if (awayScoreValT > homeScoreValT) {
        awayScoreVal++;
      }
    }
    return awayScoreVal;
  }

  //获取各种球总的最多局数
  int getMaxRound() {
    var gameTypeE = parse2GameType(gameType);
    if (gameTypeE == GameType.BK) {
      return 4;
    }
    if (gameTypeE == GameType.TN) {
      return 5;
    }
    if (gameTypeE == GameType.OP_TN) {
      return 7;
    }
    if (gameTypeE == GameType.OP_VB) {
      return 5;
    }
    return 4;
  }

  //计算第几局
  String calculateCurrentSeNow() {
    //棒球
    if (isNotEmpty(seNow) && "0" != seNow) {
      return intStr(seNow, defaultVal: '1');
    }

    if (parse2GameType(gameType) == GameType.BK_AFT) {
      var map = {
        "Q1": "1",
        "Q2": "2",
        "Q3": "3",
        "Q4": "4",
        "OT": "5",
        "q1": "1",
        "q2": "2",
        "q3": "3",
        "q4": "4",
        "ot": "5",
      };
      var set = map[seNow] ?? "1";
      return "$set";
    }

    if (parse2GameType(gameType) == GameType.TN) {
      int scSetypeInt = parseInt(intStr(scSetype, defaultVal: '5'), defaultVal: 5);
      int set = 1;
      for (int i = 0; i <= scSetypeInt; i++) {
        int homeScore = parseInt(intStr(roundHomeScores[i], defaultVal: '0'), defaultVal: 0);
        int awayScore = parseInt(intStr(roundAwayScores[i], defaultVal: '0'), defaultVal: 0);
        if ((homeScore == 7 || awayScore == 7) || ((homeScore == 6 || awayScore == 6) && (homeScore - awayScore).abs() >= 2)) {
          set += 1;
        }
      }
      return string("$set");
    }

    //其他
    int currentRound = 1;
    if (isNotEmpty(seNow) || seNow == "0") {
      currentRound = -1;
    }
    int maxRound = getMaxRound();
    for (int i = 1; i <= maxRound; i++) {
      if (isEmpty(string(roundHomeScores[i]).trim()) && isEmpty(string(roundAwayScores[i]).trim())) break;
      currentRound = i;
    }
    if (currentRound == -1) {
      return "";
    }
    return "$currentRound";
  }

  int calculateCurrentSeNowInt() {
    return parseInt(calculateCurrentSeNow(), defaultVal: 1);
  }

  //计算第几盘
  int calculateCurrentSet() {
    int round = calculateCurrentSeNowInt();
    int set = 0;
    var homeScore = roundHomeScores[round];
    var awayScore = roundAwayScores[round];
    var value = parseInt(intStr(homeScore)) + parseInt(intStr(awayScore));
    //如果分为0，那么代表在打
    set += value;
    return set + 1;
  }

//  //乒乓球
//  List<MatchEvent> ppEvents({String defaultVal = "-", String scoreMiddle = ':'}) {
//    List<MatchEvent> events = [];
//    String seNow = calculateCurrentSeNow();
//    int scSetypeInt = parseInt(intStr(scSetype, defaultVal: '7'), defaultVal: 7);
//    for (var i = 1; i <= scSetypeInt + 1; i++) {
//      MatchEvent ft = MatchEvent();
//      if (i == scSetypeInt + 1) {
//        ft.name = config.langMap['baseLang']['models']['totalScore'];
//        ft.type = config.langMap['baseLang']['models']['totalScore'];
//
//        int sc1h = int.tryParse(intStr(this.sc1stH)) ?? 0;
//        int sc2h = int.tryParse(intStr(this.sc2ndH)) ?? 0;
//        int sc3h = int.tryParse(intStr(this.sc3thH)) ?? 0;
//        int sc4h = int.tryParse(intStr(this.sc4thH)) ?? 0;
//        int sc5h = int.tryParse(intStr(this.sc5thH)) ?? 0;
//        int sc6h = int.tryParse(intStr(this.sc6thH)) ?? 0;
//        int sc7h = int.tryParse(intStr(this.sc7thH)) ?? 0;
//
//        int sc1a = int.tryParse(intStr(this.sc1stA)) ?? 0;
//        int sc2a = int.tryParse(intStr(this.sc2ndA)) ?? 0;
//        int sc3a = int.tryParse(intStr(this.sc3thA)) ?? 0;
//        int sc4a = int.tryParse(intStr(this.sc4thA)) ?? 0;
//        int sc5a = int.tryParse(intStr(this.sc5thA)) ?? 0;
//        int sc6a = int.tryParse(intStr(this.sc6thA)) ?? 0;
//        int sc7a = int.tryParse(intStr(this.sc7thA)) ?? 0;
//
//        int homeTotal = sc1h + sc2h + sc3h + sc4h + sc5h + sc6h + sc7h;
//        int awayTotal = sc1a + sc2a + sc3a + sc4a + sc5a + sc6a + sc7a;
//        int value = calculateCurrentSeNowInt();
//        if (1 == value && 0 == homeTotal && 0 == awayTotal) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        } else {
//          ft.score = "$homeTotal$scoreMiddle$awayTotal";
//        }
//      } else if (i == 1) {
//        ft.name = '1';
//        ft.type = '1';
//        ft.score = string(this.sc1stH, defaultVal: '0') + scoreMiddle + string(this.sc1stA, defaultVal: '0');
//      } else if (i == 2) {
//        ft.name = '2';
//        ft.type = '2';
//        ft.score = string(this.sc2ndH, defaultVal: '0') + scoreMiddle + string(this.sc2ndA, defaultVal: '0');
//        if (parseInt(seNow) < 2) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 3) {
//        ft.name = '3';
//        ft.type = '3';
//        ft.score = string(this.sc3thH, defaultVal: '0') + scoreMiddle + string(this.sc3thA, defaultVal: '0');
//
//        if (parseInt(seNow) < 3) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 4) {
//        if (scSetypeInt > 0) ft.name = '4';
//        ft.type = '4';
//        ft.score = string(this.sc4thH, defaultVal: '0') + scoreMiddle + string(this.sc4thA, defaultVal: '0');
//        if (parseInt(seNow) < 4) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 5) {
//        ft.name = '5';
//        ft.type = '5';
//        ft.score = string(this.sc5thH, defaultVal: '0') + scoreMiddle + string(this.sc5thA, defaultVal: '0');
//        if (parseInt(seNow) < 5) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 6) {
//        ft.name = '6';
//        ft.type = '6';
//        ft.score = string(this.sc6thH, defaultVal: '0') + scoreMiddle + string(this.sc6thA, defaultVal: '0');
//        if (parseInt(seNow) < 6) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 7) {
//        ft.name = '7';
//        ft.type = '7';
//        ft.score = string(this.sc7thH, defaultVal: '0') + scoreMiddle + string(this.sc7thA, defaultVal: '0');
//        if (parseInt(seNow) < 7) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      }
//      events.add(ft);
//    }
//    return events;
//  }

//  //棒球
//  List<MatchEvent> bsEvents({String defaultVal = "-", String scoreMiddle = ':'}) {
//    List<MatchEvent> events = [];
//    String seNow = calculateCurrentSeNow();
//
//    for (var i = 1; i <= 10; i++) {
//      MatchEvent ft = MatchEvent();
//      if (i == 1) {
//        ft.name = '1st';
//        ft.type = '1st';
//        ft.score = string(this.sc1stH, defaultVal: '0') + scoreMiddle + string(this.sc1stA, defaultVal: '0');
//      } else if (i == 2) {
//        ft.name = '2nd';
//        ft.type = '2nd';
//        ft.score = string(this.sc2ndH, defaultVal: '0') + scoreMiddle + string(this.sc2ndA, defaultVal: '0');
//        if (parseInt(seNow) < 2) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 3) {
//        ft.name = '3rd';
//        ft.type = '3rd';
//        ft.score = string(this.sc3thH, defaultVal: '0') + scoreMiddle + string(this.sc3thA, defaultVal: '0');
//        if (parseInt(seNow) < 3) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 4) {
//        ft.name = '4th';
//        ft.type = '4th';
//        ft.score = string(this.sc4thH, defaultVal: '0') + scoreMiddle + string(this.sc4thA, defaultVal: '0');
//        if (parseInt(seNow) < 4) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 5) {
//        ft.name = '5th';
//        ft.type = '5th';
//        ft.score = string(this.sc5thH, defaultVal: '0') + scoreMiddle + string(this.sc5thA, defaultVal: '0');
//        if (parseInt(seNow) < 5) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 6) {
//        ft.name = '6th';
//        ft.type = '6th';
//        ft.score = string(this.sc6thH, defaultVal: '0') + scoreMiddle + string(this.sc6thA, defaultVal: '0');
//        if (parseInt(seNow) < 6) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 7) {
//        ft.name = '7th';
//        ft.type = '7th';
//        ft.score = string(this.sc7thH, defaultVal: '0') + scoreMiddle + string(this.sc8thA, defaultVal: '0');
//        if (parseInt(seNow) < 7) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 8) {
//        ft.name = '8th';
//        ft.type = '8th';
//        ft.score = string(this.sc8thH, defaultVal: '0') + scoreMiddle + string(this.sc8thA, defaultVal: '0');
//        if (parseInt(seNow) < 8) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 9) {
//        ft.name = '9th';
//        ft.type = '9th';
//        ft.score = string(this.sc9thH, defaultVal: '0') + scoreMiddle + string(this.sc9thA, defaultVal: '0');
//        if (parseInt(seNow) < 9) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 10) {
//        ft.name = 'OT';
//        ft.type = 'OT';
//        ft.score = string(this.scOTH, defaultVal: defaultVal) + scoreMiddle + string(this.scOTA, defaultVal: defaultVal);
//      }
//
//      events.add(ft);
//    }
//
//    return events;
//  }

//  //网球
//  List<MatchEvent> tnEvents({String defaultVal = "-", String scoreMiddle = ':'}) {
//    List<MatchEvent> events = [];
//    String seNow = calculateCurrentSeNow();
//
//    int scSetypeInt = parseInt(intStr(scSetype, defaultVal: '5'), defaultVal: 5);
//    for (var i = 1; i <= scSetypeInt + 1; i++) {
//      MatchEvent ft = MatchEvent();
//      if (i == scSetypeInt + 1) {
//        ft.name = config.langMap['baseLang']['models']['totalScore'];
//        ft.type = config.langMap['baseLang']['models']['totalScore'];
//
//        int sc1h = int.tryParse(intStr(this.sc1stH)) ?? 0;
//        int sc2h = int.tryParse(intStr(this.sc2ndH)) ?? 0;
//        int sc3h = int.tryParse(intStr(this.sc3thH)) ?? 0;
//        int sc4h = int.tryParse(intStr(this.sc4thH)) ?? 0;
//        int sc5h = int.tryParse(intStr(this.sc5thH)) ?? 0;
//
//        int sc1a = int.tryParse(intStr(this.sc1stA)) ?? 0;
//        int sc2a = int.tryParse(intStr(this.sc2ndA)) ?? 0;
//        int sc3a = int.tryParse(intStr(this.sc3thA)) ?? 0;
//        int sc4a = int.tryParse(intStr(this.sc4thA)) ?? 0;
//        int sc5a = int.tryParse(intStr(this.sc5thA)) ?? 0;
//
//        int homeTotal = sc1h + sc2h + sc3h + sc4h + sc5h;
//        int awayTotal = sc1a + sc2a + sc3a + sc4a + sc5a;
//        int value = calculateCurrentSeNowInt();
//        if (1 == value && 0 == homeTotal && 0 == awayTotal) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        } else {
//          ft.score = "$homeTotal$scoreMiddle$awayTotal";
//        }
//      } else if (i == 1) {
//        ft.name = '1st';
//        ft.type = '1st';
//        ft.score = string(this.sc1stH, defaultVal: '0') + scoreMiddle + string(this.sc1stA, defaultVal: '0');
//      } else if (i == 2) {
//        ft.name = '2nd';
//        ft.type = '2nd';
//        ft.score = string(this.sc2ndH, defaultVal: '0') + scoreMiddle + string(this.sc2ndA, defaultVal: '0');
//        if (parseInt(seNow) < 2) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 3) {
//        ft.name = '3rd';
//        ft.type = '3rd';
//        ft.score = string(this.sc3thH, defaultVal: '0') + scoreMiddle + string(this.sc3thA, defaultVal: '0');
//        if (parseInt(seNow) < 3) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 4) {
//        ft.name = '4th';
//        ft.type = '4th';
//        ft.score = string(this.sc4thH, defaultVal: '0') + scoreMiddle + string(this.sc4thA, defaultVal: '0');
//        if (parseInt(seNow) < 4) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 5) {
//        ft.name = '5th';
//        ft.type = '5th';
//        ft.score = string(this.sc5thH, defaultVal: '0') + scoreMiddle + string(this.sc5thA, defaultVal: '0');
//        if (parseInt(seNow) < 5) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      }
//      events.add(ft);
//    }
//    return events;
//  }

//  List<MatchEvent> vbEvents({String defaultVal = "-", String scoreMiddle = ':'}) {
//    List<MatchEvent> events = [];
//    String seNow = calculateCurrentSeNow();
//    for (var i = 1; i <= 6; i++) {
//      MatchEvent ft = MatchEvent();
//      if (i == 1) {
//        ft.name = 'Q1';
//        ft.type = 'Q1';
//        ft.score = string(this.sc1stH, defaultVal: '0') + scoreMiddle + string(this.sc1stA, defaultVal: '0');
//      } else if (i == 2) {
//        ft.name = 'Q2';
//        ft.type = 'Q2';
//
//        ft.score = string(this.sc2ndH, defaultVal: '0') + scoreMiddle + string(this.sc2ndA, defaultVal: '0');
//        if (parseInt(seNow) < 2) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 3) {
//        ft.name = 'Q3';
//        ft.type = 'Q3';
//        ft.score = string(this.sc3thH, defaultVal: '0') + scoreMiddle + string(this.sc3thA, defaultVal: '0');
//
//        if (parseInt(seNow) < 3) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 4) {
//        ft.name = 'Q4';
//        ft.type = 'Q4';
//        ft.score = string(this.sc4thH, defaultVal: '0') + scoreMiddle + string(this.sc4thA, defaultVal: '0');
//        if (parseInt(seNow) < 4) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 5) {
//        ft.name = 'Q5';
//        ft.type = 'Q5';
//        ft.score = string(this.sc5thH, defaultVal: '0') + scoreMiddle + string(this.sc5thA, defaultVal: '0');
//        if (parseInt(seNow) < 5) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 6) {
//        ft.name = '总分';
//        ft.type = 'Total';
//        ft.score = string(this.scOTH, defaultVal: defaultVal) + scoreMiddle + string(this.scOTA, defaultVal: defaultVal);
//        int sc1h = int.tryParse(intStr(this.sc1stH)) ?? 0;
//        int sc2h = int.tryParse(intStr(this.sc2ndH)) ?? 0;
//        int sc3h = int.tryParse(intStr(this.sc3thH)) ?? 0;
//        int sc4h = int.tryParse(intStr(this.sc4thH)) ?? 0;
//        int sc5h = int.tryParse(intStr(this.sc5thH)) ?? 0;
//
//        int sc1a = int.tryParse(intStr(this.sc1stA)) ?? 0;
//        int sc2a = int.tryParse(intStr(this.sc2ndA)) ?? 0;
//        int sc3a = int.tryParse(intStr(this.sc3thA)) ?? 0;
//        int sc4a = int.tryParse(intStr(this.sc4thA)) ?? 0;
//        int sc5a = int.tryParse(intStr(this.sc5thA)) ?? 0;
//
//        ft.score = "${sc1h + sc2h + sc3h + sc4h + sc5h}" + scoreMiddle + "${sc1a + sc2a + sc3a + sc4a + sc5a}";
//      }
//      events.add(ft);
//    }
//    return events;
//  }

//  List<MatchEvent> bkAftEvents({String defaultVal = "-", String scoreMiddle = ':'}) {
//    List<MatchEvent> events = [];
//    String seNow = calculateCurrentSeNow();
//    for (var i = 1; i <= 5; i++) {
//      MatchEvent ft = MatchEvent();
//      if (i == 1) {
//        ft.name = 'Q1';
//        ft.type = 'Q1';
//        ft.score = string(this.scQ1H, defaultVal: '0') + scoreMiddle + string(this.scQ1A, defaultVal: '0');
//      } else if (i == 2) {
//        ft.name = 'Q2';
//        ft.type = 'Q2';
//
//        ft.score = string(this.scQ2H, defaultVal: '0') + scoreMiddle + string(this.scQ2A, defaultVal: '0');
//        if (parseInt(seNow) < 2) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 3) {
//        ft.name = 'Q3';
//        ft.type = 'Q3';
//        ft.score = string(this.scQ3H, defaultVal: '0') + scoreMiddle + string(this.scQ3A, defaultVal: '0');
//
//        if (parseInt(seNow) < 3) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 4) {
//        ft.name = 'Q4';
//        ft.type = 'Q4';
//        ft.score = string(this.scQ4H, defaultVal: '0') + scoreMiddle + string(this.scQ4A, defaultVal: '0');
//        if (parseInt(seNow) < 4) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      } else if (i == 5) {
//        ft.name = 'OT';
//        ft.type = 'OT';
//        ft.score = string(this.scOTH, defaultVal: '0') + scoreMiddle + string(this.scOTA, defaultVal: '0');
//        if (parseInt(seNow) < 5) {
//          ft.score = "$defaultVal$scoreMiddle$defaultVal";
//        }
//      }
//      events.add(ft);
//    }
//
//    return events;
//  }

  String _computeRBFTTime() {
    var _reTime = reTime;
    try {
      String suffixPlay = '';
      this.suffixPlay = '';
      if (!isStrNullOrEmpty(suffix)) {
        suffixPlay = config.fiexd.suffixNameToSuffixPlay(suffix);
        this.suffixPlay = suffixPlay;
      }
      // 点球
      if (suffixPlay == '_PS') {
        return AiJson(baseLang).getString('models.RBFTTime.kickWar');
      }
      // 中场
      if (_reTime == "HT^^") {
        // 加时
        if (config.isNotCnTwLang) {
          return suffixPlay == '_OT' ? 'OT' : 'HT';
        } else {
          if (suffixPlay == '_OT') {
            return AiJson(baseLang).getString('models.RBFTTime.otHalfTime');
          }
          return AiJson(baseLang).getString('models.RBFTTime.halfTime');
        }
      }
      // 暂停
      if (_reTime == "LIVE^0'") {
        return AiJson(baseLang).getString('models.RBFTTime.timeout');
      }

      String minStr = '0';
      String secStr = '0';
      String nhStr = '0';
      try {
        if (!isStrNullOrEmpty(_reTime)) {
          // var retime = _reTime.substring(0, _reTime.length - 1);
          var retime = _reTime.toString().replaceAll("'", "");
          List<String> items = retime?.split('^') ?? [];
          if (items.length > 0) {
            nhStr = items[0];
            if (items.length > 1) {
              List<String> item2 = items[1]?.split(':') ?? [];
              minStr = item2.length > 0 ? item2[0] : "";
              secStr = item2.length > 1 ? item2[1] : "";
            }
          }
        }
      } catch (e) {
        print('>>>>>>>>>>> computeRBFTTime error occored 异常原因：$e');
      }

      var min = int.tryParse(minStr);
      var sec = int.tryParse(secStr);
      // var sysdiff = (config.session.systemTime - _updateTime) ~/ 1000;
      var sysdiff = 0;

      sec = sec + sysdiff;
      var minadd = sec ~/ 60;
      min = min + minadd;
      sec = sec % 60;

      //计算阶段
      var stage = "";
      if (nhStr == "1H") {
        // 上半场
        if (config.isNotCnTwLang) {
          stage = suffixPlay == '_OT' ? 'OT' : '1H';
        } else {
          stage = AiJson(baseLang).getString('models.RBFTTime.firstHalf');
          if (suffixPlay == '_OT') {
            stage = AiJson(baseLang).getString('models.RBFTTime.firstHalf_OT');
          }
        }
      } else if (nhStr == "2H") {
        // 下半场
        if (config.isNotCnTwLang) {
          stage = suffixPlay == '_OT' ? 'OT' : '2H';
        } else {
          stage = AiJson(baseLang).getString('models.RBFTTime.secondHalf');
          if (suffixPlay == '_OT') {
            stage = AiJson(baseLang).getString('models.RBFTTime.secondHalf_OT');
          }
        }
      } else
        stage = "-:-";

      String ret = "";
      ret = sprintf("%s %02d^%02d", [stage, min, sec]);
      return ret;
    } catch (e) {
      logError(e);
      return _reTime;
    }
  }

  String _computeRBBKTime() {
    if (this.isSchoolBK) {
      return _computeRBBKTimeScholl();
    } else {
      return _computeRBBKTimeNomull();
    }
  }

  //是否为大学篮球
  bool get isSchoolBK {
    final isA = '0' == scQ1A?.toString();
    final isB = '0' == scQ1H?.toString();
    final isC = '0' != scFTH?.toString();
    final isD = '0' != scFTA?.toString();
    return isA && isB && isC && isD;
  }

  //走地-篮球
  String _computeRBBKTimeNomull() {
    var _tCount = t_count;
    try {
      var min = 0;
      var tcount = int.tryParse(_tCount);
      var sec = tcount;
      // var sysdiff = (config.session.systemTime - _updateTime) ~/ 1000;
      var sysdiff = 0;

      sec = sec - sysdiff;
      if (sec <= 0) sec = 0;
      var minadd = sec ~/ 60;
      min = min + minadd;
      sec = sec % 60;

      //计算阶段
      var stage = "";
      if (seNow == "Q1") {
        stage = config.isCnTwLang ? config.langMap['baseLang']['models']['RBBKTime']['firstQuarter'] : seNow;
      } else if (seNow == "Q2") {
        stage = config.isCnTwLang ? config.langMap['baseLang']['models']['RBBKTime']['secondQuarter'] : seNow;
      } else if (seNow == "Q3") {
        stage = config.isCnTwLang ? config.langMap['baseLang']['models']['RBBKTime']['thirdQuarter'] : seNow;
      } else if (seNow == "Q4") {
        stage = config.isCnTwLang ? config.langMap['baseLang']['models']['RBBKTime']['fourthQuarter'] : seNow;
      } else if (seNow == "HT") {
        stage = config.isCnTwLang ? config.langMap['baseLang']['models']['RBBKTimeScholl']['halfTime'] : seNow;
      } else if (seNow == "OT") {
        if (tcount < 300) {
          stage = config.langMap['baseLang']['models']['RBBKTime']['overtime'];
          if (sec == 0 && min == 0)
            stage = config.langMap['baseLang']['gameOver'];
          else
            stage = config.langMap['baseLang']['models']['RBBKTime']['overtime'];
        } else {
          stage = config.langMap['baseLang']['models']['RBBKTime']['fourthQuarter'];
          min = 0;
          sec = 0;
        }
        if (config.isNotCnTwLang) {
          if (sec == 0 && min == 0) {
            stage = config.langMap['baseLang']['gameOver'];
          } else {
            stage = seNow;
          }
        }
      }

      if (min == 0 && sec == 0)
        return sprintf("%s %02d^%02d", [stage, min, sec]);
      else
        return sprintf("%s %02d^%02d", [stage, min, sec]);
    } catch (e) {
      logError(e);
      return "$seNow $_tCount";
    }
  }

  //美式足球
  String _bk_aft() {
    var _tCount = t_count;
    try {
      var min = 0;
      var tcount = int.tryParse(_tCount);
      var sec = tcount;
      // var sysdiff = (config.session.systemTime - _updateTime) ~/ 1000;
      var sysdiff = 0;

      sec = sec - sysdiff;
      if (sec <= 0) sec = 0;
      var minadd = sec ~/ 60;
      min = min + minadd;
      sec = sec % 60;

      //计算阶段
      var stage = "";
      String quarter = (seNow ?? '')?.toString()?.toUpperCase();
      if (seNow == "Q1" || seNow == "q1") {
        stage = config.isCnTwLang ? config.langMap['baseLang']['models']['RBBKTime']['firstQuarter'] : quarter;
      } else if (seNow == "Q2" || seNow == "q2") {
        stage = config.isCnTwLang ? config.langMap['baseLang']['models']['RBBKTime']['secondQuarter'] : quarter;
      } else if (seNow == "Q3" || seNow == "q3") {
        stage = config.isCnTwLang ? config.langMap['baseLang']['models']['RBBKTime']['thirdQuarter'] : quarter;
      } else if (seNow == "Q4" || seNow == "q4") {
        stage = config.isCnTwLang ? config.langMap['baseLang']['models']['RBBKTime']['fourthQuarter'] : quarter;
      } else if (seNow == "OT" || seNow == "ot") {
        if (tcount < 300) {
          stage = config.langMap['baseLang']['models']['RBBKTime']['overtime'];
          if (sec == 0 && min == 0)
            stage = config.langMap['baseLang']['gameOver'];
          else
            stage = config.langMap['baseLang']['models']['RBBKTime']['overtime'];
        } else {
          stage = config.langMap['baseLang']['models']['RBBKTime']['fourthQuarter'];
          min = 0;
          sec = 0;
        }
        if (config.isNotCnTwLang) {
          if (sec == 0 && min == 0) {
            stage = config.langMap['baseLang']['gameOver'];
          } else {
            stage = quarter;
          }
        }
      }
      if (min == 0 && sec == 0)
        return sprintf("%s %02d^%02d", [stage, min, sec]);
      else
        return sprintf("%s %02d^%02d", [stage, min, sec]);
    } catch (e) {
      logError(e);
      return "$seNow $_tCount";
    }
  }

  //走地-大学篮球
  String _computeRBBKTimeScholl() {
    try {
      var min = 0;
      var tcount = int.tryParse(t_count);
      var sec = tcount;
      // var sysdiff = (config.session.systemTime - _updateTime) ~/ 1000;
      var sysdiff = 0;

      sec = sec - sysdiff;
      if (sec <= 0) sec = 0;
      var minadd = sec ~/ 60;
      min = min + minadd;
      sec = sec % 60;

      //计算阶段
      var stage = "";
      if (seNow == "H1") {
        stage = config.isCnTwLang ? config.langMap['baseLang']['models']['RBBKTimeScholl']['firstHalf'] : "1H";
      } else if (seNow == "H2") {
        stage = config.isCnTwLang ? config.langMap['baseLang']['models']['RBBKTimeScholl']['secondHalf'] : "2H";
      } else if (seNow == "HT") {
        stage = config.isCnTwLang ? config.langMap['baseLang']['models']['RBBKTimeScholl']['halfTime'] : seNow;
      } else if (seNow == "OT") {
        if (tcount < 300) {
          stage = config.langMap['baseLang']['models']['RBBKTimeScholl']['overtime'];
          if (sec == 0 && min == 0)
            stage = config.langMap['baseLang']['gameOver'];
          else
            stage = config.langMap['baseLang']['models']['RBBKTimeScholl']['overtime'];
        } else {
          stage = config.langMap['baseLang']['models']['RBBKTimeScholl']['overtime'];
          min = 0;
          sec = 0;
        }
        if (config.isNotCnTwLang) {
          if (sec == 0 && min == 0) {
            stage = config.langMap['baseLang']['gameOver'];
          } else {
            stage = seNow;
          }
        }
      }

      if (min == 0 && sec == 0)
        return sprintf("%s %02d^%02d", [stage, min, sec]);
      else
        return sprintf("%s %02d^%02d", [stage, min, sec]);
    } catch (e) {
      logError(e);
      return "$seNow $t_count";
    }
  }
}

// 新增,将盘口拆分了多个玩法和game合并对象
class GamePlayRatioData {
  dynamic dangerous,
      gOpen,
      gameId,
      halfTime,
      hgOpen,
      hgid,
      hrecv,
      hstrong,
      limitMax,
      limitMin,
      ptype,
      reTime,
      recv,
      redcardAway,
      redcardHome,
      session,
      suffix, //主动添加的(_card,_conner)
      strong,
      wDelay,
      gidm,
      mainGidm,
      mainGameId;
  dynamic playId, playType, sw, isMain, rt, championType;
  dynamic ior, ratio, ratioType, optionId;

  Map specifiers = {};

  GamePlayRatioData.create(Game game, PlayData playData, RatioData ratioData) {
    // game 参数
    dangerous = game.dangerous;
    gOpen = game.gOpen;
    gameId = game.gameId;
    halfTime = game.halfTime;
    hgOpen = game.hgOpen;
    hgid = game.hgid;
    hrecv = game.hrecv;
    hstrong = game.hstrong;
    limitMax = game.limitMax;
    limitMin = game.limitMin;
    ptype = game.ptype;
    reTime = game.reTime;
    recv = game.recv;
    redcardAway = game.redcardAway;
    redcardHome = game.redcardHome;
    session = game.session;
    suffix = game.suffix;
    strong = game.strong;
    wDelay = game.wDelay;
    gidm = game.gidm;
    mainGidm = game.mainGidm;
    mainGameId = game.mainGameId;
    // play参数
    playId = playData.id;
    playType = playData.playType;
    sw = playData.sw;
    isMain = playData.isMain;
    rt = playData.rt;
    championType = playData.championType;
    specifiers = playData.specifiers;

    // ratio参数
    ior = ratioData.ior;
    ratio = ratioData.ratio;
    ratioType = ratioData.ratioType;
    optionId = ratioData.optionId;
  }
}

class PlayData {
  // id : 玩法 + gameId
  String id;
  dynamic playType, sw, isMain, rt, championType;
  Map specifiers = {};
  List<RatioData> ratioData;

  bool get isHasData => playType != null && playType != '';

  PlayData.fromMap(Map map) {
    if (map == null) return;
    this.id = map['id'] ?? '';
    this.playType = map['playType'] ?? '';
    this.sw = map['sw'] ?? '';
    this.rt = map['rt'] ?? '';
    this.isMain = map['isMain'] ?? '';
    this.specifiers = map['specifiers'] ?? {};
    this.ratioData = map['ratioData'] == null ? null : map['ratioData'].map<RatioData>((v) => RatioData.fromMap(v)).toList();
  }

  PlayData.fromMap188(AiJson aiJson) {
    if (aiJson == null) return;
    this.id = aiJson.getString('id');
    this.playType = aiJson.getString('playType', defaultValue: null);
    this.sw = aiJson.getString('sw', defaultValue: null);
    this.rt = aiJson.getString('rt', defaultValue: null);
    this.isMain = aiJson.getString('isMain', defaultValue: null);
    this.championType = aiJson.getString('championType', defaultValue: null);
    this.specifiers = aiJson.getMap('specifiers');

    final array = aiJson.getArray('ratioData');
    if (array != null && array.length != 0) {
      ratioData = [];
      array.forEach((element) => ratioData.add(RatioData.fromMap188(AiJson(element))));
    }
  }

  void copy(PlayData dataPlay) {
    if (dataPlay == null) return;
    if (dataPlay.id != null) this.id = dataPlay.id;
    if (dataPlay.playType != null) this.playType = dataPlay.playType;
    if (dataPlay.sw != null) this.sw = dataPlay.sw;
    if (dataPlay.rt != null) this.rt = dataPlay.rt;
    if (dataPlay.isMain != null) this.isMain = dataPlay.isMain;
    if (dataPlay.specifiers != null) this.specifiers = dataPlay.specifiers;
    if (dataPlay.ratioData != null && ratioData.length != 0) {
      dataPlay.ratioData.forEach((dataRatio) {
        final ratioItem = this.ratioData?.firstWhere((element) => element.ratioType == dataRatio.ratioType, orElse: () => null);
        if (ratioItem != null) {
          ratioItem.copy(dataRatio);
        } else {
          this.ratioData.add(dataRatio);
        }
      });
    }
  }
}

class RatioData {
  dynamic ior, ratio, ratioType, sw, optionId;

  RatioData.fromMap(Map map) {
    if (map == null) return;
    this.ior = string(map['ior'], defaultVal: map['ioRatio']);
    this.ratio = map['ratio'] ?? '';
    this.ratioType = map['ratioType'] ?? '';
    this.sw = map['sw'] ?? '';
    this.optionId = map['id'];
  }

  RatioData.fromMap188(AiJson aiJson) {
    if (aiJson == null) return;
    this.ior = aiJson.getString('ior', defaultValue: aiJson.getString('ioRatio', defaultValue: ''));
    this.ratio = aiJson.getString('ratio', defaultValue: null);
    this.ratioType = aiJson.getString('ratioType', defaultValue: null);
    this.sw = aiJson.getString('sw', defaultValue: null);
    this.optionId = aiJson.getString('id', defaultValue: null);
  }

  Map<String, dynamic> toMap() {
    return {
      'ior': this.ior,
      'ratio': this.ratio,
      'ratioType': this.ratioType,
      'sw': this.sw,
      'id': this.optionId,
    };
  }

  void copy(RatioData data) {
    this.ior = data.ior ?? ''; // 空数据,表示锁盘
    if (data.sw != null) this.sw = data.sw;
    if (data.ratioType != null) this.ratioType = data.ratioType;
    if (data.ratio != null) this.ratio = data.ratio;
    if (data.optionId != null) this.optionId = data.optionId;
  }
}

class GameScene {
  Scene scene;

  GameScene.fromMap(Map map) {
    if (map == null) return;
    this.scene = map['scene'] == null ? null : Scene.fromMap(map['scene']);
  }
}

class Scene {
  dynamic liveWord;
  List<Statics> statics;
  Score score;
  List<int> redCard = [0, 0];
  List<int> yellowCard = [0, 0];
  List<int> conner = [0, 0];

  Scene.fromMap(Map map) {
    if (map == null) return;
    this.liveWord = map['liveWord'] ?? null;
    try{
      this.statics = map['statics'] == null
          ? null
          : map['statics'].map<Statics>((v) {
        var value = Statics.fromMap(v);
        List<int> data = [
          parseInt(value.team1, defaultVal: 0),
          parseInt(value.team2, defaultVal: 0),
        ];
        if (value.typeId == '14') {
          yellowCard = data;
        } else if (value.typeId == '15') {
          redCard = data;
        } else if (value.typeId == '2') {
          conner = data;
        }
        return value;
      }).toList();
      this.score = map['score'] != null ? Score.fromMap(map['score']) : null;
    }
    catch(e){
      print('数据类型报错---:${e.toString()}');
    }

  }
}

class Statics {
  dynamic team1, team2, typeCnName, typeEnName, typeId;

  Statics.fromMap(Map map) {
    if (map == null) return;
    this.team1 = map['team1'] ?? map['homeTeamTime'];
    this.team2 = map['team2'] ?? map['awayTeamTime'];
    this.typeCnName = map['type_cn_name'] ?? null;
    this.typeEnName = map['type_en_name'] ?? null;
    this.typeId = map['type_id'] ?? null;
  }
}

class Score {
  HalfScore halfScore;
  List<FullScore> fullScore;

  Score.fromMap(Map map) {
    if (map == null) return;
    this.halfScore = map['halfScore'] != null ? HalfScore.fromMap(map['halfScore']) : null;
    this.fullScore = map['fullScore'] == null ? null : map['fullScore'].map<FullScore>((v) => FullScore.fromMap(v)).toList();
  }
}

class HalfScore {
  String awayTeamHalfTimeScore, homeTeamHalfTimeScore;

  HalfScore.fromMap(Map map) {
    if (map == null) return;
    var json = AiJson(map);
    this.awayTeamHalfTimeScore = json.getString('awayTeamHalfTimeScore');
    this.homeTeamHalfTimeScore = json.getString('homeTeamHalfTimeScore');
  }
}

class FullScore {
  String matchId, team1, team2, type;

  FullScore.fromMap(Map map) {
    if (map == null) return;
    var json = AiJson(map);
    this.team1 = json.getString('team1');
    this.team2 = json.getString('team2');
    this.matchId = json.getString('match_id');
    this.type = json.getString('type');;
  }
}

const List<String> quarterList = ['1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th', '9th', '10th'];

//上下半局
enum HalfStatus {
  //上半局
  firstHalf,
  //下半局
  secondHalf,
}

enum Team {
  //主队
  Home,
  //客队
  Away,
}
