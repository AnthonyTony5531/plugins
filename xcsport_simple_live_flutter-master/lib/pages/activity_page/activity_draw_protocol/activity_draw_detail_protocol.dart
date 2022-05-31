import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_picture_model.dart';
import 'package:flutter/material.dart';

// 获取图片地址
class ActivityPictureRepProtocol extends HttpRequestProtocol<ActivityPictureRspProtocol> {
  final num lotteryId;
  ActivityPictureRepProtocol({@required this.lotteryId});

  @override
  Future<ActivityPictureRspProtocol> onRequest() {

    var param = {
      'lotteryId': this.lotteryId, // 活动id
    };
    var url = "/activityService/api/c/queryLotteryImage";
    return get(
        api: url,
        urlParams: param,
        responseProtocol: ActivityPictureRspProtocol());
  }
}

class ActivityPictureRspProtocol extends HttpResponseProtocol {
  List<ActivityPictureModel> pictureList = [];
  @override
  void onParse(data) {
    if (data is List) {
      if (data.isNotEmpty) {
        pictureList = data.map((e) => ActivityPictureModel.fromJson(e)).toList();
      }
    }
  }
}

