import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_draw_info_model.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert' as _convert;

/// 根据用户id集合查询用户信息
class ActivityUserRepProtocol extends HttpRequestProtocol<ActivityUserRspProtocol> {
  final List<String> playIds;
  ActivityUserRepProtocol({@required this.playIds});

  @override
  Future<ActivityUserRspProtocol> onRequest() {
    return post(
        api: "/playerAccountServer/api/c/player/queryByUserIds",
        data: '{"playerIdList": ${_convert.jsonEncode(playIds)}}',
        responseProtocol: ActivityUserRspProtocol());
  }
}

class ActivityUserRspProtocol extends HttpResponseProtocol {
  List<ActivityDrawInfoModel> modelList = [];

  @override
  void onParse(data) {
    if (data is List) {
      if (data.isNotEmpty) {
        modelList = data.map((e) => ActivityDrawInfoModel.fromJson(e)).toList() ?? [];
      }
    }
  }
}
