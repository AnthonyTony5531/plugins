
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_draw_progress_model.dart';
/// 获取所有中奖用户
class ActivityLotteryListRepProtocol extends HttpRequestProtocol<ActivityLotteryListRspProtocol> {
  @override
  Future<ActivityLotteryListRspProtocol> onRequest() {
    var headers = {
      'token': config.userInfo.token,
    };
    return get(
        header: headers,
        api: "/activityService/api/c/queryAllWinPrizeUser",
        responseProtocol: ActivityLotteryListRspProtocol());
  }
}

class ActivityLotteryListRspProtocol extends HttpResponseProtocol {
  List<PrizePoolModel> modelList = [];

  @override
  void onParse(data) {
    if (data is List) {
      if (data.isNotEmpty) {
        modelList = data.map((e) => PrizePoolModel.fromMap(e)).toList();
      }
    }
  }
}
