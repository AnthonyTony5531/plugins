// 获取抽奖活动详情
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_draw_progress_model.dart';

class ActivityDetailRepProtocol extends HttpRequestProtocol<ActivityDetailRspProtocol> {
  @override
  Future<ActivityDetailRspProtocol> onRequest() {
    var headers = {
      'token': config.userInfo.token,
    };
    var url = "/activityService/api/c/queryAwardPoolInfo";
    return get(
        header: headers,
        api: url,
        responseProtocol: ActivityDetailRspProtocol());
  }
}

class ActivityDetailRspProtocol extends HttpResponseProtocol {
  ActivityDrawProgressModel activityDrawProgressModel = ActivityDrawProgressModel();

  @override
  void onParse(data) {
    if (data is Map) {
      activityDrawProgressModel = ActivityDrawProgressModel.fromJson(data);
    }
  }
}

