import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class UserCardProtocol extends BaseReqProtocol<UserCardRespProtocol> {
  String playerId;
  UserCardProtocol([String playerId]) {
    param = {'playerId' : playerId ?? ''};
  }

  @override
  String get apiUrl => 'player/anchorStarBusinessCard';

  @override
  Future<UserCardRespProtocol> result(Map<String, dynamic> map) async {
    return UserCardRespProtocol.fromMap(map);
  }
}


class UserCardRespProtocol extends BaseModel {
  UserCardModel model = UserCardModel();
  UserCardRespProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map == null && map.length == 0) return;
    model = UserCardModel.fromJson(AiJson(map).getMap('data'));
  }
}


class UserCardModel {
  /// 不null或空-普通用户或大咖，否则-为主播
  String anchorId;
  String playerId;
  String mobileCover;
  String name;
  String nickname;
  String introduce;
  int fans;
  int followNum;
  List<UserCardLeagueStatistics> leagueStatistics;
  Map titles;
  int level;
  String levelName;
  int levelRank;
  int rank;
  int star;
  num sp;
  /// 是否匹配运营账号状态
  bool matchFlag;

  UserCardModel(
      {this.anchorId='',
        this.playerId='',
        this.mobileCover='',
        this.name='',
        this.nickname='',
        this.introduce='',
        this.fans=0,
        this.followNum=0,
        this.leagueStatistics= const <UserCardLeagueStatistics>[],
        this.titles,
        this.level=0,
        this.levelName='',
        this.levelRank=0,
        this.rank=0,
        this.star=0,
        this.sp=0,
        this.matchFlag=false,
      });

  UserCardModel.fromJson(Map<String, dynamic> map) {
    titles = {};
    anchorId = AiJson(map).getString('anchorId');
    playerId = AiJson(map).getString('playerId');
    mobileCover = AiJson(map).getString('mobileCover');
    name = AiJson(map).getString('name');
    nickname = AiJson(map).getString('nickname');
    introduce = AiJson(map).getString('introduce');
    fans = AiJson(map).getNum('fans');
    followNum = AiJson(map).getNum('followNum');
    level = AiJson(map).getNum('level');
    levelName = AiJson(map).getString('levelName');
    levelRank = AiJson(map).getNum('levelRank');
    rank = AiJson(map).getNum('rank');
    star = AiJson(map).getNum('star');
    sp = AiJson(map).getNum('sp');
    matchFlag = AiJson(map).getBool('matchFlag');

    leagueStatistics = AiJson(map).getArray('leagueStatistics').map((map)=>UserCardLeagueStatistics.fromJson(map)).toList();

    // 取前三
    if(leagueStatistics.length > 3) leagueStatistics = leagueStatistics.sublist(0, 2);
    titles = AiJson(map).getMap('titles');

    if (config.isTwLang) {
      levelName = config.langConfig.transToTwText(cnString: levelName);
    }
    print('00-- 解析结束 --, titles=$titles');
  }
}

class UserCardLeagueStatistics {
  String leagueName;
  String leagueLogo;
  String leagueId;
  String leagueNameAbbr;
  double winRatio;

  UserCardLeagueStatistics(
      {this.leagueName='',
        this.leagueLogo='',
        this.leagueId='',
        this.leagueNameAbbr='',
        this.winRatio=0.0});

  UserCardLeagueStatistics.fromJson(Map<String, dynamic> map) {
    leagueName = AiJson(map).getString('leagueName');
    leagueLogo = AiJson(map).getString('leagueLogo');
    leagueId = AiJson(map).getString('leagueId');
    leagueNameAbbr = AiJson(map).getString('leagueNameAbbr');
    winRatio = AiJson(map).getDouble('winRatio');
    if (config.isTwLang) {
      leagueName = config.langConfig.transToTwText(cnString: leagueName);
      leagueNameAbbr = config.langConfig.transToTwText(cnString: leagueNameAbbr);
    }
  }
}