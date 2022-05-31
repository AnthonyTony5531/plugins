import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

import '../../net.dart';

class MerchantChannelReqProtocol {
  MerchantChannelReqProtocol();

  Future<MerchantChannelRspProtocol> request() async {
    var url = "merchantConfig/api/c/getMerCurrentChannel";
    var rst = await Net.get(url);
    var rstM = MerchantChannelRspProtocol.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) throw Exception("${rstM.msg}");
    return rstM;
  }
}

class MerchantChannelRspProtocol extends BaseModel {
  int channelType = 1;
  MerchantChannelRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    try {
      Map<String ,dynamic> data = AiJson(map).getMap("data");
      channelType = AiJson(data).getNum('channelType');
    } catch (e) {
      print(e);
    }
  }
}
