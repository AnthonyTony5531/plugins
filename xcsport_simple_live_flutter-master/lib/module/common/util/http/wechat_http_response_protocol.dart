import 'package:common_component/util/ai_json.dart';
import 'package:common_component/util/basehttp/http_response.dart';
import 'package:common_component/util/basehttp/net_error.dart';

import 'http_response_protocol.dart';

///@autho king
///@date 7/28/21
///
///
///微信协议
abstract class WeChatHttpResponseProtocol extends HttpResponseProtocol {
  bool get isSuccess => 0 == code;

  @override
  void parse(dynamic data) {
    HttpResponse httpResponse = data as HttpResponse;
    if (200 == httpResponse.statusCode) {
      if (httpResponse.body.data is Map<String, dynamic>) {
        responseJson = AiJson(httpResponse.body.data);
        msg = responseJson.getString('errmsg',);
        code = responseJson.getNum('errcode');
        data = httpResponse.body.data;
        //print('00-parse-data=${httpResponse.body.data}');
        onParse(data);
      } else {
        processNetError(NetError.RESPONSE);
        msg = "服务器返回格式不对";
        onParse(httpResponse.body.data);
      }
    }
    else {
      processNetError(httpResponse.netError);
      onParse(httpResponse.body.data);
    }
  }
}
