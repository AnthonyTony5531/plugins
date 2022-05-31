// 关注
import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:flutter/material.dart';

class FollowRepProtocol extends HttpRequestProtocol<FollowRspProtocol> {
  String playerId;
  int followType;
  int follow;

  FollowRepProtocol(
      {@required this.playerId,
      @required this.followType,
      @required this.follow});

  @override
  Future<FollowRspProtocol> onRequest() {
    var params = {
      'playerId': this.playerId,
      'followType': this.followType, // 关注类型-1.大神 2.主播
      'follow': this.follow, //关注/取消关注	-1.关注 2.取消关注
    };

    return get(
      api: '/player/playerFollow',
      urlParams: params,
      responseProtocol: FollowRspProtocol(),
    );
  }
}

class FollowRspProtocol extends HttpResponseProtocol {
  @override
  void onParse(data) {

  }
}
