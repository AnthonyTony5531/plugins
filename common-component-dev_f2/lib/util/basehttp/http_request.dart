/*
 * @Author: King 
 * @Date: 2021-07-28 15:14:26 
 * @Last Modified by: King
 * @Last Modified time: 2021-07-29 16:44:52
 */

import 'package:common_component/util/basehttp/http_request_method.dart';
import 'package:common_component/util/basehttp/impl/http_request_stub.dart';

import 'http_response.dart';
import 'ihttp_intercept.dart';
import 'http_request_body.dart';

typedef OnUploadCallback = void Function(int progress, int len);
typedef OnDownloadCallback = void Function(int progress, int len);

///这是网络请求代理组件接口，目的是为了使用当前flutter版本优秀的网络框架去实现，如果有更好的网络框架，
///可以不动业务代码即可更换，只需要实现接口便可无缝对接。
abstract class HttpRequest {
  factory HttpRequest() => create();

  //请求方式
  HttpRequestMethod method;

  //当前请求的内容
  HttpRequestBody get requestBody;

  //响应对象
  HttpResponse get httpResponse;

  //抓包代理
  String proxy;

  //请求
  Future<HttpResponse> request();

  //添加拦截器
  void addIntercept(IHttpIntercept httpIntercept);

  //移除拦截器
  void removeIntercept(IHttpIntercept httpIntercept);

  //取消当前请求
  Future<void> cancel();

  void close();

  //设置支持https
  void https({bool support = false});

  //上传文件
  Future<HttpResponse> uploadFile(OnUploadCallback callback);

  //下载文件， path文件地址，start, end不为空是分段下载。
  Future<void> download(
      {String path, OnDownloadCallback callback, int start, int end});
}
