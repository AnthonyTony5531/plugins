import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:common_component/util/basehttp/http_request.dart';
import 'package:common_component/util/basehttp/http_request_method.dart';
import 'package:common_component/util/basehttp/http_response.dart';
import 'package:common_component/util/basehttp/http_upload_file_body.dart';
import 'package:common_component/util/basehttp/matedata/http_header.dart';
import 'package:common_component/util/log.dart';
import 'package:fast_ai/api/net_proxy.dart';
import 'package:fast_ai/config/api_config.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/http/system_repaired_intercept.dart';
import 'package:fast_ai/module/common/util/http/token_intercept.dart';
import 'package:fast_ai/module/wallet/config/flutter_wallet_centerconfig.dart';
import 'package:fast_ai/utils/app_util.dart';
//import 'package:fast_ai/utils/app_util.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:intl/intl.dart';

import 'http_response_protocol.dart';
import 'log_http_intercept.dart';

///@autho king
///@date 7/28/21
///
//
abstract class HttpRequestProtocol<T extends HttpResponseProtocol> {
  final httpRequest = HttpRequest();
  LogHttpIntercept logHttpIntercept;
  TokenHttpIntercept tokenHttpIntercept;
  SystemRepairedIntercept systemRepairedIntercept;
  T responseModel;
  bool get isSuccess => responseModel?.isSuccess??false;
  //在这做代理实现。比如说统计时间什么的。
  Future<T> request() async {
    if (logHttpIntercept == null) {
      logHttpIntercept = LogHttpIntercept();
       httpRequest.addIntercept(logHttpIntercept);
    }
    if (null == tokenHttpIntercept && config.isGbet) {
      tokenHttpIntercept = TokenHttpIntercept();
      httpRequest.addIntercept(tokenHttpIntercept);
    }
    if (null == systemRepairedIntercept && config.isGbet ) {
      systemRepairedIntercept = SystemRepairedIntercept();
      httpRequest.addIntercept(systemRepairedIntercept);
    }

    if (isRelease() && NetProxySetting.enable) {
      httpRequest.proxy = NetProxySetting.proxyUlr;
    }

    try {
      final T t = await onRequest();
      responseModel = t;
      return t;
    } catch (e, s) {
      logger.error(
          'HttpRequestProtocol',
          "$runtimeType 请求出问题了，url=${httpRequest.requestBody.url} request $e",
          s);
    }
    return null;
  }

  Future<T> onRequest();

  Future<void> cancel() {
    if (httpRequest.httpResponse.statusCode == null) {
      return httpRequest?.cancel();
    }
    return null;
  }

  Future<T> get({
    @required String api,
    String serverUrl,
    String preApi,
    Map<String, String> header,
    @required T responseProtocol,
    Map<String, dynamic> urlParams,
  }) async {
    assert(api != null);
    assert(
        !api.contains(
          'http',
        ),
        "api 没有http开头");
    assert(api.startsWith('/'), 'api必须用/开头');
    if (serverUrl == null) {
      serverUrl = cmPackageConfig.serverUrlConfig.betServer;
    }
    if (preApi == null) {
      preApi = '/ai/mobile';
    }
    String url = "$serverUrl$preApi$api";
    httpRequest.method = HttpRequestMethod.Get;

    httpRequest.requestBody.url = url;
    httpRequest.requestBody.urlParams = urlParams;
    httpRequest.requestBody.headers = createHeader(header);

    HttpResponse response;
    try {
      if (!networkReachable) {
        response = _errorResponse();
      } else {
        response = await httpRequest.request();
      }
    } catch (e, s) {
      response = _errorResponse(errorType: 1, message: '${e.toString()}');
      logger.error('get 请求响应出错', e, s);
    }
    responseProtocol.parse(response);
    return responseProtocol;
  }

  Future<T> post(
      {final String api,
      String serverUrl,
      String preApi,
      Map<String, String> header,
      @required T responseProtocol,
      Map<String, dynamic> urlParams,
      @required dynamic data,
      T t}) async {
    assert(api != null);
    assert(
        !api.contains(
          'http',
        ),
        "api 没有http开头");
    assert(api.startsWith('/'), 'api必须用/开头');
    if (serverUrl == null) {
      serverUrl = cmPackageConfig.serverUrlConfig.betServer;
    }
    if (preApi == null) {
      preApi = '/ai/mobile';
    }
    String url = "$serverUrl$preApi$api";
    httpRequest.method = HttpRequestMethod.Post;
    httpRequest.requestBody.url = url;
    httpRequest.requestBody.urlParams = urlParams;
    httpRequest.requestBody.headers = createHeader(header);
    if (serverUrl.startsWith('https')) {
      httpRequest.https(support: true);
    }
    if (data is String) {
      httpRequest.requestBody.data = data;
    } else if (data is Map) {
      httpRequest.requestBody.data = jsonEncode(data);
    }

    HttpResponse response;
    try {
      if (!networkReachable) {
        response = _errorResponse();
      } else {
        response = await httpRequest.request();
      }
    } catch (e, s) {
      response = _errorResponse(errorType: 1, message: '${e.toString()}');
      logger.error('post 请求响应出错', e, s);
    }
    responseProtocol.parse(response);
    return responseProtocol;
  }

  Future<T> upload({
    @required String api,
    String serverUrl,
    String preApi,
    Map<String, String> header,
    @required T responseProtocol,
    @required HttpUploadFileBody fileBody,
    Map<String, dynamic> urlParams,
    OnUploadCallback uploadProgress,
  }) async {
    assert(api != null);
    assert(
        !api.contains(
          'http',
        ),
        "api 没有http开头");
    assert(api.startsWith('/'), 'api必须用/开头');
    if (serverUrl == null) {
      serverUrl = cmPackageConfig.serverUrlConfig.betServer;
    }
    if (preApi == null) {
      preApi = '/ai/mobile';
    }
    String url = "$serverUrl$preApi$api";
    assert(fileBody != null);
    assert(fileBody.filePath != null);
    if (serverUrl.startsWith('https')) {
      httpRequest.https(support: true);
    }
    httpRequest.method = HttpRequestMethod.Post;
    httpRequest.requestBody.url = url;
    httpRequest.requestBody.urlParams = urlParams;
    httpRequest.requestBody.uploadFileBody = fileBody;
    Map<String, String> _header = createHeader(header);
    header[HttpHeader.ContentType] = 'multipart/form-data';
    httpRequest.requestBody.headers = _header;

    HttpResponse response;
    try {
      if (!networkReachable) {
        response = _errorResponse();
      } else {
        response = await httpRequest.uploadFile(uploadProgress);
      }
    } catch (e, s) {
      response = _errorResponse(errorType: 1, message: '${e.toString()}');
      logger.error('uploadFile 请求响应出错', e, s);
    }
    responseProtocol.parse(response);
    return responseProtocol;
  }

  /// errorType：0-无网络异常，1-不可预期异常
  HttpResponse _errorResponse({int errorType = 0, String message}) {
    var response = HttpResponse();
    response.statusCode = kNetUnreachableCode;
    response.body.data = {
      'tick': '${DateTime.now().millisecondsSinceEpoch}',
      'code': errorType == 0 ? kNetUnreachableCode : kUnexpectedError,
      'message': errorType == 0 ? '当前网络不可用' : message ?? '未知异常',
      'data': {},
    };
    return response;
  }

//  static const num apiVer = 4.04;

  Map<String, String> createHeader(Map<String, String> header) {
    if(!config.isGbet){
      return config.apiConfig.headers..addAll(header??{});
    }
    var _header = Map<String, String>();
    if (_header.isEmpty) {
      _header['Referer'] = cmPackageConfig.serverUrlConfig.betServer;
      _header['Content-Type'] = 'application/json';
      _header['terType'] = Platform.isAndroid ? "7" : "6";

      _header['User-Agent'] =
          'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.25 Mobile Safari/537.36';
    }
    if (!cmPackageConfig.live188tokenConfig.isLogout()) {
      _header['token'] = cmPackageConfig.live188tokenConfig.token;
    }
    _header['lang'] = Translations.langCode;
    _header['apiVer'] = '${ApiConfig.apiVer}';
    _header['groupId'] = '1';
    _header['wid'] = '${walletCenterConfig.walletConfig.walletId}';
    _header['groupId'] = '1';
    // 商户类型，1=AI-SDK，2=AI-新体育,3=188新体育，4=188SDK
    _header['merchantType'] = config.isFastAiSdk ? '3' : '4';
    // String version = config?.appInfo?.appVersion ?? '';
    // if (version.isNotEmpty && version != '1.1.0') {
    //   if (config.isFastAiSdk) {
    //     _header['version'] =
    //         config.appInfo.appVersion + '|' + config.userInfo.fastAIVersion;
    //   } else {
    //     _header['version'] = config.appInfo.appVersion;
    //   }
    // }
    _header['version'] = config.appInfo.gBetVersion;

    String randomStr = randomNumber(len: 16);
    DateTime dateTime = DateTime.now();
    var fmt = DateFormat("yyyyMMddHHmmss");
    String dateStr = randomStr.substring(1, 6) +
        fmt.format(dateTime) +
        dateTime.millisecondsSinceEpoch.toString() +
        randomStr.substring(1, 8);
    String guid = dateStr.substring(0, 36);
    _header['reqId'] = guid;
    if (null != header) {
      _header.addAll(header);
    }
    return _header;
  }

  //随机数字
  static String randomNumber({int len = 5}) {
    StringBuffer stringBuffer = StringBuffer();
    for (int i = 0; i < len; i++) {
      int number;
      //首位不能为零
      if (0 == i) {
        number = Random().nextInt(8) + 1;
      } else {
        number = Random().nextInt(9);
      }
      stringBuffer.write(number);
    }
    return stringBuffer.toString();
  }
}
