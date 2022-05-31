import 'package:dio/dio.dart';
import 'dart:convert' as _convert;

class DioLogInterceptor extends Interceptor {

  bool printReqHeader;    //打印请求头
  bool printRspHeader;    //打印响应头
  bool printReqBody;      //打印请求体
  bool printRspBody;      //打印响应体
  bool interceptAllUri;   //打印所有请求
  bool formatPrint;       //输出是否需要json格式化

  List<String> interceptUris = [];


  DioLogInterceptor({
    this.printReqHeader = false,
    this.printReqBody = false,
    this.printRspHeader = false,
    this.printRspBody = false,
    this.interceptAllUri = false,
    this.formatPrint = true,
  });

  void addInterceptUri(String uri){
    interceptUris.add(uri);
  }

  bool _needIntercept(String uri){
    return interceptAllUri || interceptUris.any((element) => uri.contains(element));
  }

  @override
  void onRequest(RequestOptions options, handler) async {
    if(!_needIntercept(options.baseUrl + options.path)){
      return;
    }
    String requestStr = "\n==================== REQUEST ====================\n"
        "- URL:\n${options.baseUrl + options.path}\n"
        "- METHOD: ${options.method}\n";
    print(requestStr);

    if(printReqHeader) {
      if(formatPrint){
        requestStr = "- HEADER:\n${options.headers.mapToStructureString()}\n";
      } else {
        requestStr = "- HEADER:\n${options.headers}\n";
      }
      print(requestStr);
    }

    final data = options.data;
    if(formatPrint){
      if (data != null) {
        if (data is Map)
          requestStr = "- BODY:\n${data.mapToStructureString()}\n";
        else if (data is FormData) {
          final formDataMap = Map()..addEntries(data.fields)..addEntries(data.files);
          requestStr = "- BODY:\n${formDataMap.mapToStructureString()}\n";
        } else {
          var map = _convert.jsonDecode(data.toString());
          if(map is Map){
            requestStr = "- BODY:\n${map.mapToStructureString()}\n";
          } else {
            requestStr = "- BODY:\n${data.toString()}\n";
          }
        }
      }
    } else {
      requestStr = "- BODY:\n$data";
    }

    if(printReqBody){
      print(requestStr);
    }
    handler.next(options);
  }

  @override
  void onError(DioError err, handler) async {
    if(!_needIntercept(err.requestOptions.baseUrl + err.requestOptions.path)){
      return;
    }
    String errorStr = "\n==================== RESPONSE ====================\n"
        "- URL:\n${err.requestOptions.baseUrl + err.requestOptions.path}\n"
        "- METHOD: ${err.requestOptions.method}\n";

    errorStr += "- HEADER:\n${err.response.headers.map.mapToStructureString()}\n";
    if (err.response != null && err.response.data != null) {
      print('╔ ${err.type.toString()}');
      errorStr += "- ERROR:\n${_parseResponse(err.response)}\n";
    } else {
      errorStr += "- ERRORTYPE: ${err.type}\n";
      errorStr += "- MSG: ${err.message}\n";
    }
    print(errorStr);
    handler.next(err);
  }

  @override
  Future onResponse(Response response, handler) async {
    if(!_needIntercept(response.requestOptions.uri.toString())){
      return;
    }
    String responseStr = "\n==================== RESPONSE ====================\n"
        "- URL:\n${response.requestOptions.uri}\n";
    printWrapped(responseStr);

    if(printRspHeader){
      responseStr = "- HEADER:\n{";
      response.headers.forEach((key, list) => responseStr += "\n  " + "\"$key\" : \"$list\",");
      responseStr += "\n}\n";
      responseStr += "- STATUS: ${response.statusCode}\n";
      printWrapped(responseStr);
    }

    if(printRspBody){
      if (response.data != null) {
        if(formatPrint){
          responseStr = "- BODY:\n ${_parseResponse(response)}";
        } else {
          responseStr = "- BODY:\n ${response.data}";
        }

        printWrapped(responseStr);
      }
    }
    handler.next(response);
  }

  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  String _parseResponse(Response response) {
    String responseStr = "";
    var data = response.data;
    if (data is Map)
      responseStr += data.mapToStructureString();
    else if (data is List)
      responseStr += data.listToStructureString();
    else
      responseStr += response.data.toString();

    return responseStr;
  }
}

extension Map2StringEx on Map {
  String mapToStructureString({int indentation = 2}) {
    String result = "";
    String indentationStr = " " * indentation;
    if (true) {
      result += "{";
      this.forEach((key, value) {
        if (value is Map) {
          var temp = value.mapToStructureString(indentation: indentation + 2);
          result += "\n$indentationStr" + "\"$key\": $temp,";
        } else if (value is List) {
          result += "\n$indentationStr" + "\"$key\": ${value.listToStructureString(indentation: indentation + 2)},";
        } else if(value == null || value is int || value is double || value is bool){
          result += "\n$indentationStr" + "\"$key\": $value,";
        } else {
          result += "\n$indentationStr" + "\"$key\": \"$value\",";
        }
      });
      result = result.substring(0, result.length - 1);
      result += indentation == 2 ? "\n}" : "\n${" " * (indentation - 1)}}";
    }

    return result;
  }
}

extension List2StringEx on List {
  String listToStructureString({int indentation = 2}) {
    String result = "";
    String indentationStr = " " * indentation;
    if (true) {
      result += "${indentationStr.trimRight()}[";
      this.forEach((value) {
        if (value is Map) {
          var temp = value.mapToStructureString(indentation: indentation + 2);
          result += "\n$indentationStr" + "\"$temp\",";
        } else if (value is List) {
          result += value.listToStructureString(indentation: indentation + 2);
        } else {
          result += "\n$indentationStr" + "\"$value\",";
        }
      });
      result = result.substring(0, result.length - 1);
      result += "\n$indentationStr]";
    }
    result = result.replaceAll("\"{", "{").replaceAll("}\"", "}");
    return result;
  }
}
