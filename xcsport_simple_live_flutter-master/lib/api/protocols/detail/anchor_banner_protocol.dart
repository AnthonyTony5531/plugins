import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class AnchorBannerReqProtocol {

  Future<AnchorBannerRsqProtocol> request()async{
    var url = "hot/getAdvertAdminBanners";
    var rst = await Net.get(url);
    var rstM = AnchorBannerRsqProtocol.fromMap(rst);
    return rstM;
  }
}

class AnchorBannerRsqProtocol extends BaseModel {

  List<dynamic> banners = [];
  AnchorBannerRsqProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {

    banners = AiJson(map).getArray("data");
  }
}
