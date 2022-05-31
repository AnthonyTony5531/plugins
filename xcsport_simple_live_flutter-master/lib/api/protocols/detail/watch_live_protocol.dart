import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class WatchLiveReqProtocol {

  WatchLiveReqProtocol();

  Future<WatchLiveRspProtocol> request() async {
    var url = "dataConfig/api/c/live/watchLive";
    var rst = await Net.get(url);
    var resultM = WatchLiveRspProtocol.fromMap(rst);
    if (resultM.code != 200 && resultM.code != 404) throw Exception("${resultM.msg}");
    return resultM;
  }
}

class WatchLiveRspProtocol extends BaseModel {
  int second = -1; // -1:观看视频没有限制 大于0:限制观看时长
  WatchLiveRspProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {
    if (map == null || map.isEmpty) {
      config.userInfo.watchLiveTime = -1;
      return;
    }
    AiJson aiJson = AiJson(map);
    second = aiJson.getNum('data.second');
    config.userInfo.watchLiveTime = second;
  }
}