import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/utils/ai_json.dart';

class WishGiftReqProtocol extends HttpRequestProtocol<WishGiftRspProtocol>{

  String liveId;
  WishGiftReqProtocol({
    this.liveId = '0',
  });

  @override
  Future<WishGiftRspProtocol> onRequest() {
    var params = {
      'liveId': liveId,
    };
    return get(
        api: '/anchorConfig/api/c/anchor/getWishGiftByAnchorId',
        urlParams: params,
        responseProtocol: WishGiftRspProtocol()
    );
  }
}

class WishGiftRspProtocol extends HttpResponseProtocol {
  List giftData = [];

  @override
  void onParse(data){
    if (data != null) {
      AiJson json = AiJson(data);
      giftData = json.getArray('data');
      if(giftData.isEmpty){
        giftData = data;
      }
    }
  }
}



