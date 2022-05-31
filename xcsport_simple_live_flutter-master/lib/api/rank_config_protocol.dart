import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/utils/ai_json.dart';

class RankConfigReqProtocol extends HttpRequestProtocol<RankConfigRspProtocol>{

  String rankType = '1'; // 1. 主播排行入口 2.爆料排行入口
  RankConfigReqProtocol({this.rankType = '1'});

  @override
  Future<RankConfigRspProtocol> onRequest() {

    var params = {
      'rankType': rankType,
    };
    print('');
    return get(
        api: '/anchorConfig/api/c/anchor/getRankConfig',
        urlParams: params,
        responseProtocol: RankConfigRspProtocol()
    );
  }
}

class RankConfigRspProtocol extends HttpResponseProtocol {
  String picture = '';
  String rankUrl = '';
  String defaultPicture = 'assets/images/matchlist/img_live_rank.png';

  @override
  void onParse(data){
    if (data != null) {
//      picture = AiJson(data).getString('rankImg');
      rankUrl = AiJson(data).getString('rankAdd');
      print('');
    }
  }
}

