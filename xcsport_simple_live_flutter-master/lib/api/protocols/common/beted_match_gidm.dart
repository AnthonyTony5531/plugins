import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

import '../../net.dart';

class BetedMatchGidmReqProtocol {
  BetedMatchGidmReqProtocol();

  Future<BetedMatchGidmRspProtocol> request() async {
    var url = "match/betedMatchGidm";
    var rst = await Net.get(url);
    var rstM = BetedMatchGidmRspProtocol.fromMap(rst);
    // var rstM = BetedMatchGidmRspProtocol.fromMap({});
    if (rstM.code != 200 && rstM.code != 404) throw Exception("${rstM.msg}");
    return rstM;
  }
}

class BetedMatchGidmRspProtocol extends BaseModel {
  List<String> data = [];
  BetedMatchGidmRspProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {
    
    try {
      List<dynamic> dataFlag = AiJson(map).getArray("data");
      if (dataFlag != null && dataFlag != []) {
        data = dataFlag.cast<String>().toList();
      }
    } catch (e) {
      print(e);
    }
  }
}
