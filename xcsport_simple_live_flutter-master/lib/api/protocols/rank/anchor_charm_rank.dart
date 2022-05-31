// 魅力榜 球王榜 打赏榜
import 'package:fast_ai/models/rank/anchor_rank_model.dart';
import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:flutter/cupertino.dart';

class AnchorCharmRepProtocol extends HttpRequestProtocol<AnchorCharmRspProtocol> {

  final String url;
  final Map<String,dynamic> params;
  AnchorCharmRepProtocol({@required this.url,this.params});

  @override
  Future<AnchorCharmRspProtocol> onRequest() {
    return get(
        api: url,
        urlParams: this.params == null ? {} : this.params,
        responseProtocol: AnchorCharmRspProtocol());
  }
}

class AnchorCharmRspProtocol extends HttpResponseProtocol {
  List<AnchorRankModel> dataList = [];
  @override
  void onParse(data) {
    if (data is List) {
      if (data.isNotEmpty) {
        dataList = data.map((e) => AnchorRankModel()..onParse(e)).toList();
      }
    }
  }
}
