import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class RecordWatchLiveTimeReqProtocol {

  int second = 1;
  RecordWatchLiveTimeReqProtocol({this.second = 1});

  Future<RecordWatchLiveTimeRspProtocol> request() async {
    var url = "dataConfig/api/c/live/recordWatchLiveTime?second=$second";
    var rst = await Net.get(url);
    var resultM = RecordWatchLiveTimeRspProtocol.fromMap(rst);
    if (resultM.code != 200 && resultM.code != 404) throw Exception("${resultM.msg}");
    return resultM;
  }
}

class RecordWatchLiveTimeRspProtocol extends BaseModel {
  RecordWatchLiveTimeRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}