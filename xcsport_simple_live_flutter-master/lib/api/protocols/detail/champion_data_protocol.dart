import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

import '../../net.dart';

class ChampionDataReqProtocol{

  String leagueId;
  ChampionDataReqProtocol({
    this.leagueId,
    }
  );

  Future<ChampionDataRspProtocol> request()async{
    String groupId = '${config.userInfo.sportPlatformId}';
    String url = 'gameDetails/getChampionData?groupId=$groupId&leagueId=$leagueId';
    var result = await Net.get(url);
    var resultM = ChampionDataRspProtocol.fromMap(result);
    if(resultM.code != 200 && resultM.code != 404) throw Exception("${resultM.msg}");
    return resultM;
  }
}

class ChampionDataRspProtocol extends BaseModel{

  Map<String, dynamic> data = {};
  ChampionDataRspProtocol.fromMap(Map<String,dynamic>map) : super.fromMap(map){
    if(map == null){
      return;
    }
    data = AiJson(map).getMap('data');
  }
}