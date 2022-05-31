import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/rank/broke_rank_model.dart';
import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_page_view_model.dart';
import 'package:flutter/material.dart';

class BrokeRankRepProtocol extends HttpRequestProtocol<BrokeRankRspProtocol> {
  TitleType titleType;
  int page;
  int pageSize;
  BrokeRankRepProtocol({@required this.titleType,this.page,this.pageSize});

  @override
  Future<BrokeRankRspProtocol> onRequest() {

    String url = '';
    if (titleType == TitleType.winType) { // 胜率
      url = '/tipOffWinOrProfitRate/winRateRank';
    } else if (titleType == TitleType.returnType) { // 返还率
      url = '/tipOffWinOrProfitRate/profitRateRank';
    }

    var params = {
      "wid":config.userInfo.walletId,
      "page":page,
      "pageSize":pageSize,
    };

//    int merchantChannel = 1; // 频道类型：1.世界频道、2商户频道
    if (config.merchantChannel == 2) {
      params["merchantId"] = config.userInfo?.account?.data?.merchantId ?? '';
    }

    return post(
        api: url,
        preApi:'/ai',
        data: params,
        responseProtocol: BrokeRankRspProtocol());
  }
}

class BrokeRankRspProtocol extends HttpResponseProtocol {
  BrokeRankModel brokeRankModel = BrokeRankModel();
  @override
  void onParse(data) {
    if (data is Map) {
      brokeRankModel = BrokeRankModel()..onParse(data);
    }
  }
}
