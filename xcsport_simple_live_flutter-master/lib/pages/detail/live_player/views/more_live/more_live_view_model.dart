


import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/time_watch.dart';
import 'package:fast_ai/utils/util.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view_model.dart';

class MoreLiveViewModel {

  final String currentGidm;
  MoreLiveViewModel(this.currentGidm);

  Set<String> _gidmSet = Set();
  List<MoreLiveCellModel> cellModels = [];
  TimeWatch _timeWatch = TimeWatch(Duration(seconds: 20));
  Future queryFromServe(String gameType, {String gameTypeSon=''}) async {
    // if(_timeWatch.canTodo()) {
      Map params0 = {'type' : 0, 'gameType': gameType, 'gameTypeSon': gameTypeSon??'', 'gameSort': config.userInfo.sort};
      Map params1 = {'type' : 1, 'gameType': gameType, 'gameTypeSon': gameTypeSon??'', 'gameSort': config.userInfo.sort};
      LiveVideosReqProtocol moreLiveReq0 = LiveVideosReqProtocol(params: params0);
      LiveVideosReqProtocol moreLiveReq1 = LiveVideosReqProtocol(params: params1);
      LiveVideosRespProtocol resp0 =  await moreLiveReq0.request();
      LiveVideosRespProtocol resp1 =  await moreLiveReq1.request();
      // if(!resp0.isResultSuccess && !resp1.isResultSuccess) {
      //   _timeWatch.reset();
      //   return;
      // }
      resp0.items.forEach((f) {
        if (!_gidmSet.contains(f.gidm) && currentGidm != f.gidm) {
          _gidmSet.add(f.gidm);
          cellModels.add(f);
        }
      });
      resp1.items.forEach((f) {  
        if (!_gidmSet.contains(f.gidm) && currentGidm != f.gidm) {
          _gidmSet.add(f.gidm);
          cellModels.add(f);
        } 
      });
    // }
    // else {
    //   _timeWatch.resetWithTimeout();
    // }
    print('live/videos count=${cellModels.length}');
  }

  clear(){
    cellModels = [];
    _timeWatch.reset();
  }
}

class LiveVideosReqProtocol extends BaseReqProtocol<LiveVideosRespProtocol> {
  LiveVideosReqProtocol({Map params}) {
    param = params??{};
  }

  @override
  String get apiUrl => 'live/videos';

  @override
  Future<LiveVideosRespProtocol> result(Map<String, dynamic > map) async{
    return LiveVideosRespProtocol.fromMap(map);
  }
}

class LiveVideosRespProtocol extends BaseModel {
  List<MoreLiveCellModel> items = [];
  LiveVideosRespProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map == null && map.length == 0) return;

    items = parseMoreLiveCellModels(map);
  }

  List<MoreLiveCellModel> parseMoreLiveCellModels(Map<String, dynamic> resp) {
    List<MoreLiveCellModel> models = [];

    List data = AiJson(resp).getArray('data');
    data.forEach((map) {
      map['showtype'] = 'RB';
      
      MoreLiveCellModel model = MoreLiveCellModel();
      model.showtype = 'RB';
      model.gidm = AiJson(map).getString('gidm');
      model.gameType = AiJson(map).getString('gameType');
      model.gameDate = AiJson(map).getTimestamp('gameDate');
      model.betNum = AiJson(map).getNum('betNum');
      model.homeTeam = AiJson(map).getString('homeTeamAbbr') ?? AiJson(map).getString('homeTeam');
      model.homeLogo = AiJson(map).getString('homeLogo');
      model.awayTeam = AiJson(map).getString('awayTeamAbbr') ?? AiJson(map).getString('awayTeam');
      model.awayLogo = AiJson(map).getString('awayLogo');
      model.league = AiJson(map).getString('leagueShortName') ?? AiJson(map).getString('leagueName');

      model.homeScore = AiJson(map).getString("gameInfo.sc_FT_H");
      model.awayScore = AiJson(map).getString("gameInfo.sc_FT_A");
      //篮球
      if(isNullOrEmpty(model.homeScore))model.homeScore = AiJson(map).getString("gameInfo.sc_FT_H");
      if(isNullOrEmpty(model.awayScore))model.awayScore = AiJson(map).getString("gameInfo.sc_FT_C");
      //棒球球
      if(isNullOrEmpty(model.homeScore))model.homeScore = AiJson(map).getString("gameInfo.sc_game_H");
      if(isNullOrEmpty(model.awayScore))model.awayScore = AiJson(map).getString("gameInfo.sc_game_A");
      //TN网球
      if(isNullOrEmpty(model.homeScore))model.homeScore = AiJson(map).getString("gameInfo.sc_set_game_H");
      if(isNullOrEmpty(model.awayScore))model.awayScore = AiJson(map).getString("gameInfo.sc_set_game_A");

//      model.timeModel.fromCommonMatchsProtocolWithGame(map);
      //以gidm来区分比赛进行去重。注：视频直播没有anchor节点数据
//      List anchors = AiJson(map).getArray('anchor');
//      for(int i = 0; i < anchors.length; i++) {
//        Map item = anchors[i];
//        if(i == 0) {
//          model.parseAnchor(item);
//          //models.add(model);
//        }
//        else {
//          MoreLiveCellModel newModel = MoreLiveCellModel();
//          newModel.clone(model, map);
//          newModel.parseAnchor(item);
//          //models.add(newModel);
//        }
//      }
      models.add(model);
    });

    return models;
  }
}

class MoreLiveCellModel {
  String name, icon, anchorId, cover;
  String rtmp, flv, m3u8;
  num anchorStatus, betNum, gameDate;
  String homeTeam, homeLogo, awayTeam, awayLogo, league, gidm, gameType, showtype, homeScore, awayScore, url;

//  TimeViewModel timeModel = TimeViewModel();

  void parseAnchor(Map<String, dynamic> map) {
    this.name = AiJson(map).getString('nickname') ?? AiJson(map).getString('name');
    this.icon = AiJson(map).getString('icon');
    this.anchorId = AiJson(map).getString('anchorId');
    this.betNum = AiJson(map).getNum('betNum');
    this.anchorStatus = AiJson(map).getNum('anchorStatus');
    this.rtmp = AiJson(map).getString('rtmp');
    this.flv = AiJson(map).getString('flv');
    this.m3u8 = AiJson(map).getString('m3u8');
    this.cover = AiJson(map).getString('cover');
    this.url = AiJson(map).getString('url');
  }

  void clone(MoreLiveCellModel model, Map map) {
    this.gidm = model.gidm;
    this.gameType = model.gameType;
    this.showtype = model.showtype;
    this.gameDate = model.gameDate;
    this.homeTeam = model.homeTeam;
    this.homeLogo = model.homeLogo;
    this.awayTeam = model.awayTeam;
    this.awayLogo = model.awayLogo;
    this.homeScore = model.homeScore;
    this.awayScore = model.awayScore;
    this.league = model.league;
    this.betNum = model.betNum;
//    this.timeModel.fromCommonMatchsProtocolWithGame(map);
  }
}