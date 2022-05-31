/*
 * @Author: King 
 * @Date: 2021-07-28 15:14:01 
 * @Last Modified by: King
 * @Last Modified time: 2021-07-29 16:19:09
 */
import 'http_upload_file_body.dart';

///请求体
class HttpRequestBody {
  
  //响应时间超时，默认30秒
  int receiveTimeout = 30 * 1000;

  //请求发送数据的超时，默认30秒
  int sendTimeout = 30 * 1000;

  //建立链接的时候超时时间，默认30秒
  int connectTimeout = 30 * 1000;
  //请求链接
  String url;

  //请求json或xx=1;aa=2;
  dynamic data;

  //如content-type等, 需要小写
  Map<String, String> headers;

  //url的拼接参数
  Map<String, dynamic> urlParams;

  //上传文件需要用到的参数
  HttpUploadFileBody uploadFileBody;
}

