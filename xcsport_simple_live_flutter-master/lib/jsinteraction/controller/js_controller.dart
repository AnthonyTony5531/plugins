import 'dart:convert';

import 'package:fast_ai/jsinteraction/xc_js_controller_mananger.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-09
 **********************************************************************
 */

//js控制器,用来接收js调用过来请求的参数
abstract class JsController {
  String get name;
  XCJSControllerManager manager;
  Future<JsResponseData> process(String method, Map<String, dynamic> params);

}

class JsResponseData {
  final int code;
  final String message;
  final Map<String,dynamic> data;

  JsResponseData({this.code = SuccessCode, this.message, this.data});

  Map<String, dynamic> toMap() {
    return {
      'code':code,
      'message':message??'',
      'data':data,
    };
  }
}

//响应js
String responseJs(Map<String,dynamic> data){
  var json = jsonEncode(data);
  return 'xcFlutterJSSDKCallback($json)';
//  var base64data = base64Encode(utf8.encode(json));
//  return 'xcFlutterJSSDKCallback("$base64data")';
}