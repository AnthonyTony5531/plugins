import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class HomePageSettingsReqProtocol {
  HomePageSettingsReqProtocol();
  Future<HomePageSettingsRsqProtocol> request() async {
    var url = "merchantConfig/api/c/getMerHomePageSettings";
    var rst = await Net.get(url);
    var rstM = HomePageSettingsRsqProtocol.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) throw Exception("${rstM.msg}");
    return rstM;
  }
}

class HomePageSettingsRsqProtocol extends BaseModel {
  String homePageSettings = '0';  // 0:热门  1:精选
  HomePageSettingsRsqProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    try {
      if(map == null || map.isEmpty)return;
      homePageSettings = AiJson(map).getString('data.homePageSettings');
    } catch (e) {
      print(e);
    }
  }
}
