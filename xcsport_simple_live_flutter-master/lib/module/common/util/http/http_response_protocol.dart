import 'package:common_component/model/Imodel.dart';
import 'package:common_component/util/ai_json.dart';
import 'package:common_component/util/basehttp/http_response.dart';
import 'package:common_component/util/basehttp/net_error.dart';

import 'parser_adapter/parser_adapter.dart';

///@autho king
///@date 7/28/21
///
///

/// 无网络
const kNetUnreachableCode = -9999;

/// 服务器服务异常
const kServerError = -8999;

/// 其他异常
const kUnexpectedError = -7999;

/// 其他异常
const cancelError = -8659;

abstract class HttpResponseProtocol implements IModel, IParserAdapter {
  //为-1的时候，网络异常.为-2的时候，是服务器异常
  int code = 0;
  String msg; //服务器报错原因
  int tick; // pet服务器时间
  int systemTime; // ai 188服务器时间
  AiJson responseJson; //服务器返回的json
  dynamic data;
  //是否获取数据成功
  bool get isSuccess => 200 == code;
  //是否是服务器炸裂异常
  bool get isServerError => kServerError == code;
  //是否是用户的网络异常
  bool get isUserNetError => kNetUnreachableCode == code;
  bool get isError => !isSuccess;

  bool get isCancel => cancelError == code;

  @override
  void parse(dynamic httpData) {
    HttpResponse httpResponse = httpData as HttpResponse;
    if (200 == httpResponse.statusCode) {
      if (httpResponse.body.data is Map<String, dynamic>) {
        responseJson = AiJson(httpResponse.body.data);
        msg = responseJson.getString('message',
            defaultValue: responseJson.getString('msg', defaultValue: ''));
        code = responseJson.getNum('code');
        tick = responseJson.getNum('tick');
        systemTime = responseJson.getNum('systemTime');
        this.data = responseJson.getObject('data');
        //print('00-parse-data=${httpResponse.body.data}');
        onParse(this.data);
      } else {
        processNetError(NetError.RESPONSE);
        msg = "服务器返回格式不对";
        onParse(httpResponse.body.data);
      }
    } else {
      processNetError(httpResponse.netError);
      onParse(httpResponse.body.data);
    }
  }

  @override
  void onParse(dynamic data);

  void processNetError(NetError error) {
    code = kNetUnreachableCode;
    switch (error) {
      case NetError.Unknown:
        msg = "网络出错误啦～";
        break;
      case NetError.CONNECT_TIMEOUT:
        msg = "网络连接超时啦～";
        break;
      case NetError.RECEIVE_TIMEOUT:
        msg = "网络连接超时啦～";
        break;
      case NetError.SEND_TIMEOUT:
        msg = "网络连接超时啦～";
        break;
      case NetError.CANCEL:
        msg = "网络连接超时啦～";
        code = cancelError;
        break;
      case NetError.RESPONSE:
        msg = "服务器被外星人炸啦～";
        code = kServerError;
        break;
    }
  }
}
