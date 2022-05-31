import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fast_ai/performance/bean/data/http_info.dart';
import 'package:fast_ai/performance/bean/http_kit.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';

class HttpInfoInterceptor extends Interceptor {
  HttpInfo _info = HttpInfo();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    _info.httpUrl = options.path;
    _info.onRequestTime = DateTime.now().millisecondsSinceEpoch;
    _info.requestInfo.add(options);
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    _info.onResponseTime = DateTime.now().millisecondsSinceEpoch;
    _info.state = false;
    _info.errorInfo.add(err);
    KitManager.instance.getKit<HttpKit>(KitRouter.KIT_HTTP).storage.save(_info);
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    _info.onResponseTime = DateTime.now().millisecondsSinceEpoch;
    _info.responseInfo.add(response);

    // TODO 需优化，根据Data,code状态判断请求是否成功
    if (response.statusCode == 200) {
      // 服务器耗时时长
      var list = response.headers.map['t'];
      if (list != null && list.length != 0) {
        _info.serverTime = num.tryParse(list.first) ?? 0;
      }
      _info.state = true;
    } else {
      _info.state = false;
    }
    KitManager.instance.getKit<HttpKit>(KitRouter.KIT_HTTP).storage.save(_info);
    handler.next(response);
  }
}
