/*
 * @Author: King 
 * @Date: 2021-07-28 15:22:18 
 * @Last Modified by: King
 * @Last Modified time: 2021-07-29 16:44:20
 */

import 'dart:io';

import 'package:common_component/util/basehttp/http_request_body.dart';
import 'package:common_component/util/basehttp/http_request.dart';
import 'package:common_component/util/basehttp/ihttp_intercept.dart';
import 'package:common_component/util/basehttp/http_request_method.dart';
import 'package:common_component/util/basehttp/http_response.dart';
import 'package:common_component/util/basehttp/matedata/http_header.dart';
import 'package:common_component/util/log.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../net_error.dart';

///Dio网络框架实现的网络请求。
class DioHttpRequest implements HttpRequest {
  final _dio = new Dio();
  CancelToken _cancelToken;
  final httpResponse = new HttpResponse();
  final _httpRequestBody = new HttpRequestBody();

  @override
  HttpRequestMethod method;

  final _intercepts = Map<IHttpIntercept, _DioHttpIntercept>();

  @override
  void addIntercept(IHttpIntercept httpIntercept) {
    _DioHttpIntercept value = new _DioHttpIntercept(
        httpResponse: httpResponse,
        intercept: httpIntercept,
        httpRequest: this);
    _intercepts[httpIntercept] = value;
    _dio.interceptors.add(value);
  }

  @override
  Future<void> cancel() {
    _cancelToken?.cancel();
    return null;
  }

  @override
  void removeIntercept(IHttpIntercept httpIntercept) {
    _intercepts.remove(httpIntercept);
    _dio.interceptors.remove(_intercepts[httpIntercept]);
  }

  @override
  Future<HttpResponse> request() async {
    _cancelToken = CancelToken();
    configProxy(_dio);
    assert(requestBody != null, 'request body should not be null ');
    Response response;
    try {
      if (method == HttpRequestMethod.Get) {
        response = await _doGet();
      } else if (method == HttpRequestMethod.Post) {
        response = await _doPost();
      }
    } catch (e, s) {
      var error = e;
      if (error is DioError) {
        if (_cancelToken?.isCancelled ?? false) {
          var value = error as DioError;
          error = DioError(
              type: DioErrorType.cancel,
              error: value.error,
              requestOptions: value.requestOptions,
              response: value.response);
        }
        httpResponse.netError = _convert2NetError(error);
        _convert2HttpResponse(error.response, httpResponse);
      }
      logger.error(
          'HttpRequest',
          'do ${method == HttpRequestMethod.Get ? 'get' : 'post'} request $error',
          s);
    } finally {
      _convert2HttpResponse(response, httpResponse);
    }
    return httpResponse;
  }

  void configProxy(Dio dio) {
    if (this.proxy == null) return;
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (url) {
        return this.proxy;
      };

      ///忽略证书
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }

  BaseOptions _createOption() {
    return BaseOptions(
      headers: {}..addAll(requestBody.headers ?? {}),
      queryParameters: {}..addAll(requestBody.urlParams ?? {}),
      receiveTimeout: requestBody.receiveTimeout,
      sendTimeout: requestBody.sendTimeout,
      connectTimeout: requestBody.connectTimeout,
    );
  }

  Future<Response> _doGet() {
    _dio.options = _createOption();
    return _dio.get(
      requestBody.url,
      cancelToken: _cancelToken,
    );
  }

  Future<Response> _doPost() {
    _dio.options = _createOption();
    return _dio.post(
      requestBody.url,
      data: requestBody.data,
      cancelToken: _cancelToken,
    );
  }

  @override
  HttpRequestBody get requestBody => _httpRequestBody;

  @override
  String proxy;

  @override
  Future<HttpResponse> uploadFile(callback) async {
    assert(requestBody.uploadFileBody != null);
    assert(requestBody.uploadFileBody.filePath != null);
    _dio.options = _createOption();
    var resp = await _dio.post(requestBody.url,
        cancelToken: _cancelToken,
        data: FormData.fromMap({
          requestBody.uploadFileBody.key: await MultipartFile.fromFile(
            requestBody.uploadFileBody.filePath,
            filename: requestBody.uploadFileBody.fileName,
          )
        }), onSendProgress: (int count, int total) {
      if (null != callback) {
        callback.call(count, total);
      }
    });
    _convert2HttpResponse(resp, httpResponse);
    return httpResponse;
  }

  @override
  Future<void> download({String path, callback, int start, int end}) async {
    if (start != null) {
      var headers = requestBody.headers ?? {};
      headers[HttpHeader.Rang] = '$start-$end';
    }
    _dio.options = _createOption();
    await _dio.download(requestBody.url, path, onReceiveProgress: (count, len) {
      callback.call(count, len);
    });
  }

  @override
  void https({bool support = false}) {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        !support
            ? null
            : (client) {
                client.badCertificateCallback = (cert, host, port) {
                  return true;
                };
              };
  }

  @override
  void close() {
    _dio.close();
  }
}

class _DioHttpIntercept implements Interceptor {
  final IHttpIntercept intercept;
  final HttpRequest httpRequest;
  final HttpResponse httpResponse;

  _DioHttpIntercept(
      {@required this.intercept,
      @required this.httpRequest,
      @required this.httpResponse});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    httpResponse.netError = _convert2NetError(err);
    _convert2HttpResponse(err.response, httpResponse);
    intercept.onError(httpResponse);
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    intercept.onRequest(httpRequest);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _convert2HttpResponse(response, httpResponse);
    intercept.onResponse(httpResponse);
    handler.next(response);
  }
}

void _convert2HttpResponse(Response response, HttpResponse httpResponse) {
  if (response == null) return;
  httpResponse.statusCode = response.statusCode;
  httpResponse.body.data = response.data;
  if (null != response.headers) {
    response.headers.forEach((name, values) {
      if (values.length == 1) {
        httpResponse.body.headers[name] = values[0];
      } else {
        httpResponse.body.headers[name] = values;
      }
    });
  }
}

NetError _convert2NetError(DioError error) {
  NetError netError = NetError.Unknown;
  switch (error.type) {
    case DioErrorType.connectTimeout:
      netError = NetError.CONNECT_TIMEOUT;
      break;
    case DioErrorType.sendTimeout:
      netError = NetError.SEND_TIMEOUT;
      break;
    case DioErrorType.receiveTimeout:
      netError = NetError.RECEIVE_TIMEOUT;
      break;
    case DioErrorType.response:
      netError = NetError.RESPONSE;
      break;
    case DioErrorType.cancel:
      netError = NetError.CANCEL;
      break;
    case DioErrorType.other:
      netError = NetError.Unknown;
      break;
  }
  return netError;
}
