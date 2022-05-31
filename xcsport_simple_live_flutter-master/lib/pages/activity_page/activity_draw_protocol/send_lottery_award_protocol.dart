import 'dart:io';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_draw_lottery_model.dart';
// 发奖
class SendLotteryAwardRepProtocol
    extends HttpRequestProtocol<SendLotteryAwardRspProtocol> {
  final num id;

  SendLotteryAwardRepProtocol({this.id});

  @override
  Future<SendLotteryAwardRspProtocol> onRequest() {
    // id : 中奖ID
    String token = config.userInfo.token;
    String walletId = config.userInfo.walletId;
    Map<String, dynamic> params = {
      'id': id,
    };
    Map<String, String> headers = {
      'token': token,
      'walletId': walletId
    };

    return get(
        header: headers,
        api: "/activityService/api/c/sendLotteryAward",
        urlParams: params,
        responseProtocol: SendLotteryAwardRspProtocol());
  }
}

class SendLotteryAwardRspProtocol extends HttpResponseProtocol {
  ActivityDrawLotteryModel lotteryModel;

  @override
  void onParse(data) {
    if (data is Map) {
      lotteryModel = ActivityDrawLotteryModel.fromJson(data);
    }
  }
}
