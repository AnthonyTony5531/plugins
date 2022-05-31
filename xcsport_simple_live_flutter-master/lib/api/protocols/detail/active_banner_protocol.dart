import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class ActiveBannerReqProtocol {

  Future<ActiveBannerRspProtocol> request()async{
    var url = "hot/getActiveBanners";
    var rst = await Net.get(url);
    var rstM = ActiveBannerRspProtocol.fromMap(rst);
    return rstM;
  }
}

class ActiveBannerRspProtocol extends BaseModel {

  List<dynamic> banners = [];
  ActiveBannerRspProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {

    banners = AiJson(map).getArray("data");
  }
}
