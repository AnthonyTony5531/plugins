import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class RefinedReqProtocol {
  String sportPlatformId;
  RefinedReqProtocol({this.sportPlatformId});

  Future<RefinedRspProtocol> request() async {
    String platformId = sportPlatformId ?? '${config.userInfo.sportPlatformId}';
    var url = "getRefinedByPlatformId?sportPlatformId=$platformId";
    var rst = await Net.get(url);
    var rstM = RefinedRspProtocol.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) throw Exception("${rstM.msg}");
    return rstM;
  }
}

class RefinedRspProtocol extends BaseModel {
  Map<String, dynamic> data = {};
  RefinedRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    try {
      if(map == null || map.isEmpty)return;
      data = AiJson(map).getMap('data');
    } catch (e) {
      print(e);
    }
  }
}
