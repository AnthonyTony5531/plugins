import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

import '../../net.dart';

class MerchantLiveInfoReqProtocol {
  MerchantLiveInfoReqProtocol();

  Future<MerchantLiveInfoRspProtocol> request() async {
    var url = "merchantAccountServer/api/c/merchant/liveInfo";
    var rst = await Net.get(url);
    var rstM = MerchantLiveInfoRspProtocol.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) throw Exception("${rstM.msg}");
    return rstM;
  }
}

class MerchantLiveInfoRspProtocol extends BaseModel {
  String liveName = '';
  String liveLogo = '';
  MerchantLiveInfoRspProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {
    final json = AiJson(map);
    Map<String, dynamic> data = json.getMap("data");

    try {
      if (data != null && data != {}) {
        liveName = json.getString('data.liveName');
        liveLogo = json.getString('data.liveLogo');
        print(11);
      }
    } catch (e) {
      print(e);
    }
  }
}
