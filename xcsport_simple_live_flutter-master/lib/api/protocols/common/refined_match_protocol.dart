import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class RefinedMatchReqProtocol {
  int refinedId;       //精选id
  String gidm;         //赛程id(切换方向时必传)
  String direction;    //切换方向 U:向上 D：向下(切换方向时必传)
  int sportPlatformId; //体育平台id
  String anchorId;     //主播id
  int anchorOrders;    //精选比赛详情一场比赛多个主播位置
  RefinedMatchReqProtocol({
    this.gidm,
    this.direction,
    this.refinedId,
    this.sportPlatformId,
    this.anchorId,
    this.anchorOrders,
  });

  Future<RefinedMatchRspProtocol> request() async {
    String platformId = sportPlatformId ?? '${config.userInfo.sportPlatformId}';
    var url = "getSlidingRefined";
    Map<String, dynamic> params = {
      'refinedId': refinedId,
      'gidm': gidm,
      'direction': direction,
      'sportPlatformId': platformId,
      'anchorId': anchorId,
      'anchorOrders': anchorOrders,
    };
    var rst = await Net.post(url,body: params);
    var rstM = RefinedMatchRspProtocol.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) throw Exception("${rstM.msg}");
    return rstM;
  }
}

class RefinedMatchRspProtocol extends BaseModel {
  Map<String, dynamic> data = {};
  RefinedMatchRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    try {
      if(map == null || map.isEmpty)return;
      data = AiJson(map).getMap('data');
    } catch (e) {
      print(e);
    }
  }
}
