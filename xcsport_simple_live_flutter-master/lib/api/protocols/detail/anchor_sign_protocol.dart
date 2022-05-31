import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
//主播标签
class AnchorSignReqProtocol {

  Future<AnchorSignRspProtocol> request()async{
    var url = "player/anchorStarBusinessCard";
    var rst = await Net.get(url);
    var rstM = AnchorSignRspProtocol.fromMap(rst);
    return rstM;
  }
}

class AnchorSignRspProtocol extends BaseModel {

  List<String> banners = [];
  AnchorSignRspProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {

    banners = AiJson(map).getArray("data");
  }
}
