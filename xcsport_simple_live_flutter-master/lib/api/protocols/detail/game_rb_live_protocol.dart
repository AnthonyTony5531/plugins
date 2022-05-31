import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class GameRBLiveReqProtocol{
  
  String gameType;
  String page;
  String pageSize;
  bool hideSame;
  String videoType;
  GameRBLiveReqProtocol({
    this.gameType = '',
    this.page = '1',
    this.pageSize = '20',
    this.hideSame = true,
    this.videoType = '',
  });

  Future<GameRBLiveRspProtocol> request()async{
    // gameType = config.userInfo.sportType;
    // 10/30 hank去掉体育项
    String groupId = '${config.userInfo.sportPlatformId}';
//    gameType = config.userInfo.requestGameType;
    var url = 'game/rbLiveList?groupId=$groupId&gameType=$gameType&page=$page&pageSize=$pageSize&hideSame=$hideSame&videoType=$videoType';

    var rst = await Net.get(url);
    var rstM = GameRBLiveRspProtocol();
    await rstM.parse(rst);
    if(rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
    return rstM;
  }
}

class GameRBLiveRspProtocol extends BaseModel {
  Map<String, dynamic> data = {};
  int total = 0;
  List anchorList = [];

  Future parse(Map<String, dynamic> map) async {
    if(map == null || map.isEmpty){
      return;
    }
    super.fromMap(map);

    AiJson json = AiJson(map);
    data = json.getMap('data');
    total = json.getNum('data.total');
    List datas = json.getArray('data.list');
    anchorList = datas;
  }

//  GameRBLiveRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map){
//    if(map == null || map.isEmpty){
//      return;
//    }
//    data = AiJson(map).getMap('data');
//    total = AiJson(data).getNum('total');
//    anchorList = AiJson(data).getArray('list');
//  }
}