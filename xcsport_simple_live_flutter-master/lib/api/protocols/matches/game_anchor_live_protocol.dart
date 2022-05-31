import 'package:dio/dio.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
//import 'package:fast_ai/models/common_topmenu.dart';
import 'package:fast_ai/utils/ai_json.dart';
//import 'package:fast_ai/utils/lang/ai_lang_handler.dart';

class GameAnchorLiveReqProtocol {
  String gameType;
  String page;
  String pageSize;
  String rbType;
  String videoType;
  String anchorId;
  bool hideSame;
  GameAnchorLiveReqProtocol({
    this.gameType = '',
    this.page = '1',
    this.pageSize = '80',
    this.rbType = '2', // 1:滚球直播 2:非滚球直播 为空全部
    this.videoType = '3', // 1:主播 2:视频 3:为空全部
    this.hideSame = true, // 隐藏相同
    this.anchorId = '',
  });

  Future<GameAnchorLiveRspProtocol> request({CancelToken cancelToken}) async {
    String gameTypeStr = gameType ?? '';
//    gameTypeStr = gameTypeStr == allSportType ? '' : gameTypeStr;
    String groupId = '${config.userInfo.sportPlatformId}';
    var url = 'game/anchorLiveList?groupId=$groupId&gameType=$gameTypeStr&page=$page&pageSize=$pageSize&rbType=$rbType&videoType=$videoType&hideSame=$hideSame&anchorId=$anchorId';
    var rst = await Net.get(url,cancelToken: cancelToken);
    var rstM = GameAnchorLiveRspProtocol();
    await rstM.parse(rst);
    if (rstM.code != 200 && rstM.code != 404) {
      throw Exception('${rstM.msg}');
    }
    return rstM;
  }
}

class GameAnchorLiveRspProtocol extends BaseModel {
  Map<String, dynamic> data = {};
  int total = 0; // 赛事直播总是
  int totalRooms = 0; // 自由播总数
  List liveRooms = []; // 自由播
  List anchorList = []; // 赛事直播

  Future parse(Map<String, dynamic> map) async {
    if (map == null || map.isEmpty) {
      return;
    }
    super.fromMap(map);
    AiJson json = AiJson(map);
    data = json.getMap('data');
    total = json.getNum('data.total');
    totalRooms = json.getNum('data.totalRooms');
    List datas = json.getArray('data.list');
    liveRooms = json.getArray('data.liveRooms');
    anchorList = datas;
  }

//  GameAnchorLiveRspProtocol.fromMap(Map<String, dynamic> map)
//      : super.fromMap(map) {
//    if (map == null || map.isEmpty) {
//      return;
//    }
//    data = AiJson(map).getMap('data');
//    total = AiJson(data).getNum('total');
//    anchorList = AiJson(data).getArray('list');
//  }
}
