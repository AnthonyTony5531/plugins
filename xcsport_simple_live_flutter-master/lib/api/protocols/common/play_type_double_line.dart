

import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

import '../../net.dart';

class PlayTypeDoubleLineReqProtocol {
  PlayTypeDoubleLineReqProtocol();

  Future<PlayTypeDoubleLineRspProtocol> request() async {
    var url = "getDoubleLineInfo";
    var rst = await Net.get(url);
    var rstM = PlayTypeDoubleLineRspProtocol.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) throw Exception("${rstM.msg}");
    return rstM;
  }
}

class PlayTypeDoubleLineRspProtocol extends BaseModel {
  List<String> ibo = [];
  List<String> sd = [];
  List<String> bti = [];
  List<String> halfR = [];
  List<String> r = [];
  PlayTypeDoubleLineRspProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {
    AiJson aiJson = AiJson(map);
    Map<String, dynamic> data = aiJson.getMap("data");
    try {
      if (data != null && data != {}) {
        List<dynamic> iboFlag = aiJson.getArray("data.ibo");
        ibo = iboFlag.cast<String>().toList();

        List<dynamic> sdFlag = aiJson.getArray("data.sd");
        sd = sdFlag.cast<String>().toList();

        List<dynamic> btiFlag = aiJson.getArray("data.bti");
        bti = btiFlag.cast<String>().toList();
        List<dynamic> halfRFlag = aiJson.getArray('data.halfR');
        halfR = halfRFlag.cast<String>().toList();
        List<dynamic> rFlag = aiJson.getArray('data.r');
        r = rFlag.cast<String>().toList();
        print(11);
      }
    } catch (e) {
      print(e);
    }
  }
}
