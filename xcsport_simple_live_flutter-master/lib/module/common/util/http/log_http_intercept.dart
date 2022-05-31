import 'package:common_component/util/basehttp/http_request.dart';
import 'package:common_component/util/basehttp/http_response.dart';
import 'package:common_component/util/basehttp/ihttp_intercept.dart';
import 'package:common_component/util/log.dart';

///@autho king
///@date 8/9/21
///
class LogHttpIntercept implements IHttpIntercept {
  HttpRequest httpRequest;
  @override
  Future onError(HttpResponse httpResponse) {
    logger.info(
        '请求错误 [${httpRequest.requestBody.url}] [urlParams=${httpRequest.requestBody.urlParams} \n method =${httpRequest.method} \n  data=${httpRequest.requestBody.data} header=${httpRequest.requestBody.headers}] ',
        'statusCode=${httpResponse.statusCode} \ndata=${httpResponse.body.data}');
  }

  DateTime dateTime;

  @override
  Future onRequest(HttpRequest httpRequest) {
    this.httpRequest = httpRequest;
    httpRequest = httpRequest;
    dateTime = DateTime.now();
    // logger.info('请求信息 [${httpRequest.requestBody.url}]',
    //     'urlParams=${httpRequest.requestBody.urlParams} \n method =${httpRequest.method} \n  data=${httpRequest.requestBody.data} header=${httpRequest.requestBody.headers}');
  }

  @override
  Future onResponse(HttpResponse response) {
    if (response.body.data != null) {
      // num spand =
      //     DateTime.now().millisecond - (dateTime ?? DateTime.now()).millisecond;
      // logger.info('网络响应$spand ms [${httpRequest.requestBody.url}]',
      //     '${response.body.data}');
    }
  }
}
