import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_page_protocol.dart';

//分页请求
abstract class HttpRequestPageProtocol<T extends HttpResponsePageProtocol>
    extends HttpRequestProtocol<T> {
  int page = 1;
  int size = 10;

  HttpRequestPageProtocol({this.page = 1, this.size = 10});
}
