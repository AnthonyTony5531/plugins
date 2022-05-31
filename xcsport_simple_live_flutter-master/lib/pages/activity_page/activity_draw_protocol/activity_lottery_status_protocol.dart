import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';

/// 获取抽送活动状态
class LotteryStatusRepProtocol extends HttpRequestProtocol<LotteryStatusRspProtocol> {
  @override
  Future<LotteryStatusRspProtocol> onRequest() {
    var headers = {
      'token': config.userInfo.token,
    };
    return get(
        header: headers,
        api: "/activityService/api/c/getLotteryStatus",
        responseProtocol: LotteryStatusRspProtocol());
  }
}

class LotteryStatusRspProtocol extends HttpResponseProtocol {
  num status = 0;

  @override
  void onParse(data) {
    // 判断数据源类型，否则不一致报错
    if (data != null && data is num) {
      status = data ?? 0;
    }
  }
}
