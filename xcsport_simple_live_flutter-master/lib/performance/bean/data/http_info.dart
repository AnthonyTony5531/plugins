import 'package:dio/dio.dart';
import 'package:fast_ai/performance/bean/port/i_data.dart';

/// @author grey
/// Function :  网络请求信息

class HttpInfo extends IData {
  String httpUrl = "";
  num serverTime = 0;
  num onRequestTime = 0;
  num onResponseTime = 0;
  DateTime _createTime = DateTime.now();
  bool state = false;

  RequestInfo requestInfo = RequestInfo();
  ResponseInfo responseInfo = ResponseInfo();
  ErrorInfo errorInfo = ErrorInfo();

  String get httpKey {
    if (httpUrl != null && httpUrl != '') {
      int index = httpUrl.lastIndexOf('?');
      if (index != -1) {
        return httpUrl.substring(0, index);
      }
      return httpUrl;
    }
    return null;
  }

  bool get checkData {
    return httpUrl != null && httpUrl != '';
  }

  String get createTime =>
      '${_createTime.year}-${_createTime.month}-${_createTime.day} ${_createTime.hour}:${_createTime.minute}:${_createTime.second}';

  String get httpUrlStr => '请求地址 : $httpUrl';

  String get serverTimeStr => '服务器耗时(ms) : $serverTime';

  String get requestTimeStr => '请求耗时(ms) : ${onResponseTime - onRequestTime}';

  @override
  getValue() {
    return 'RequestInfo : \n${requestInfo?.getInfo()}\nResponseInfo : \n${responseInfo?.getInfo()}\nErrorInfo : \n${errorInfo?.getInfo()}';
  }
}

class RequestInfo {
  String method;
  Uri uri;
  String path;
  Map<String, dynamic> parameter;
  Map<String, dynamic> headers;
  bool _hasData = false;
  dynamic body;

  bool get isHasData => _hasData;

  String getInfo() {
    String res = '';

    if (method != null && method.isNotEmpty) {
      res += '\n请求方式 : $method';
    }
    if (path != null && path.isNotEmpty) {
      res += '\n请求地址 : $path';
    }
    if (parameter != null && parameter.length != 0) {
      res += '\n请求参数 : ${parameter.toString()}';
    }
    if (headers != null && headers.length != 0) {
      res += '\nHeader : ${headers.toString()}';
    }
    if (body != null){
      res += '\nBody : ${body.toString()}';
    }
    return res.replaceFirst('\n', '');
  }

  void add(RequestOptions options) {
    if (options != null) {
      method = options.method;
      uri = options.uri;
      path = options.path;
      parameter = options.queryParameters;
      headers = options.headers;
      body = options.data;
      _hasData = true;
    }
  }
}

class ResponseInfo {
  int statusCode;
  Map<String, dynamic> headers;
  dynamic data;
  bool _hasData = false;

  bool get isHasData => _hasData;

  String getInfo() {
    String res = '';
    if (statusCode != null && !statusCode.isNaN) {
      res += '\n请求状态 : $statusCode';
    }
    if (headers != null && headers.length != 0) {
      res += '\nHeader : ${headers.toString()}';
    }
    if (data != null) {
      res += '\n返回数据 : ${data.toString()}';
    }
    return res.replaceFirst('\n', '');
  }

  void add(Response response) {
    if (response != null) {
      statusCode = response.statusCode;
      headers = response.headers.map;
      data = response.data;
      _hasData = true;
    }
  }
}

class ErrorInfo {
  DioErrorType type = DioErrorType.other;

  String message;

  dynamic responseData;

  bool _hasData = false;

  bool get isHasData => _hasData;

  String getInfo() {
    String res = '';
    if (type != null) {
      switch (type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          res += '\n错误类型 : 网络请求超时，请检查网络';
          break;
        case DioErrorType.response:
          res += '\n错误类型 : 服务器返回错误';
          break;
        case DioErrorType.cancel:
          res += '\n错误类型 : 请求取消';
          break;
        case DioErrorType.other:
          res += '\n错误类型 : DEFAULT';
          break;
        default:
          res += '\n错误类型 : 未知错误';
          break;
      }
    }
    if (message != null && message.isNotEmpty) {
      res += '\n失败信息 : $message';
    }
    if (responseData != null && responseData.isNotEmpty) {
      res += '\n返回数据 : $responseData';
    }
    return res.replaceFirst('\n', '');
  }

  void add(DioError error) {
    if (error != null) {
      type = error.type;
      message = error.toString();
      if (error.response != null) {
        responseData = error.response?.data;
      }
      _hasData = true;
    }
  }
}
