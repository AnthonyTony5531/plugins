import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_user_win_model.dart';
// 获取抽奖
class ActivityWinPrizeRepProtocol extends HttpRequestProtocol<ActivityWinPrizeRspProtocol> {

  @override
  Future<ActivityWinPrizeRspProtocol> onRequest() {
    String token = config.userInfo.token;

    var headers = {
      'token': token,
    };

    var url = "/activityService/api/c/queryWinPrizeUser";
    return get(
        header: headers,
        api: url,
        responseProtocol: ActivityWinPrizeRspProtocol());
  }
}

class ActivityWinPrizeRspProtocol extends HttpResponseProtocol {
  List<WinPrizeUserModel> winPrizeList = [];

  @override
  void onParse(data) {
    if (data is List) {
      if (data.isNotEmpty) {
        winPrizeList = data.map((e) => WinPrizeUserModel.fromJson(e)).toList();
      }
    }
  }
}