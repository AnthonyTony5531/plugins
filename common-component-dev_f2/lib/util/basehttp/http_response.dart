/*
 * @Author: King 
 * @Date: 2021-07-28 15:14:20 
 * @Last Modified by: King
 * @Last Modified time: 2021-07-28 22:02:24
 */
import 'package:common_component/util/basehttp/net_error.dart';

import 'http_response_body.dart';

//响应总报文
class HttpResponse {
  //状态码
  int statusCode;
  //如果状态码不是200的时候，那么这个字段就会让你有用
  NetError netError;
  //对应的响应体
  HttpResponseBody body = HttpResponseBody();

  void update({int statusCode, NetError error, HttpResponseBody body}) {
    this.statusCode = statusCode ?? this.statusCode;
    this.netError = error ?? this.netError;
    this.statusCode = statusCode ?? this.statusCode;
    this.body = body ?? this.body;
  }
}
