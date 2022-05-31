import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';

class WatchAnchorLiveReqProtocol extends HttpRequestProtocol<WatchAnchorRspProtocol>{

  String liveId;
  WatchAnchorLiveReqProtocol({
    this.liveId = '0',
  });

  @override
  Future<WatchAnchorRspProtocol> onRequest() {
    var params = {
      'liveId': liveId,
    };
    return get(
        api: '/anchorConfig/api/c/anchor/watchAnchorLive',
        urlParams: params,
        responseProtocol: WatchAnchorRspProtocol()
    );
  }
}

class WatchAnchorRspProtocol extends HttpResponseProtocol {

  @override
  void onParse(data){}
}

