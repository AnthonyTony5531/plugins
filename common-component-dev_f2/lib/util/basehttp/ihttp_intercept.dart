/*
 * @Author: King 
 * @Date: 2021-07-28 15:13:56 
 * @Last Modified by: King
 * @Last Modified time: 2021-07-28 22:01:39
 */

import 'package:common_component/util/basehttp/http_response.dart';
import 'package:common_component/util/basehttp/http_response_body.dart';
import 'http_request.dart';
import 'http_request_body.dart';




///网络拦截器
abstract class IHttpIntercept{


  //请求之前
  Future  onRequest(HttpRequest body);


  //请求结束后
  Future onResponse(HttpResponse response);

  //网络异常
  Future onError( HttpResponse httpResponse);

   
}