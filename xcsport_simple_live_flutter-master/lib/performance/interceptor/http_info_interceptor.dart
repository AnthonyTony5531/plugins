import 'package:dio/dio.dart';
import 'package:fast_ai/performance/bean/data/http_info.dart';
import 'package:fast_ai/performance/bean/http_kit.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';

/// @author grey
/// Function : 网络拦截，模板

class HttpInfoInterceptor extends Interceptor {
  HttpInfo _info = HttpInfo();

  @override
  void onRequest(RequestOptions options, handler) {
    _info.httpUrl = options.path;
    _info.onRequestTime = DateTime.now().millisecondsSinceEpoch;
    _info.requestInfo.add(options);
    handler.next(options);
  }

  @override
  void onError(DioError err, handler) {
    _info.onResponseTime = DateTime.now().millisecondsSinceEpoch;
    _info.state = false;
    _info.errorInfo.add(err);
    KitManager.instance.getKit<HttpKit>(KitRouter.KIT_HTTP).storage.save(_info);
    handler.next(err);
  }

  @override
  void onResponse(Response response, handler) {
    _info.onResponseTime = DateTime.now().millisecondsSinceEpoch;
    _info.responseInfo.add(response);
    if (response.statusCode == 200) {
      _info.state = true;
    } else {
      _info.state = false;
    }

    KitManager.instance.getKit<HttpKit>(KitRouter.KIT_HTTP).storage.save(_info);
    handler.next(response);
  }
}
