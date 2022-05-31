import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'net.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-02
 **********************************************************************
 */

//规范化协议
abstract class BaseReqProtocol<T> {
  dynamic _param = {};
  //服务器地址
  String get baseUrl=>null;

  //api方法地址
  String get apiUrl;

  //请求方式
  RequestMethodType get requestType =>  RequestMethodType.get;


  //动态设置参数
  set param (dynamic param){
    _param = param;
  }


  CancelToken _cancelToken = new CancelToken();


  void cancel(){
    _cancelToken?.cancel();
  }

  //请求
  Future<T> request({Map<String, String> headers, String cacheKey }) async {
    _cancelToken = new CancelToken();
    if( RequestMethodType.post == requestType){
     var resp =  await _post(headers: headers);
     return result(resp);
    }
    var resp =  await _get(headers: headers, cacheKey: cacheKey);
    return result(resp);
  }

  //相应
  Future<T> result(Map<String,dynamic> map) ;


  Future<dynamic> _post({Map<String, String> headers}) async {

    Map<String, String> body  =  {} ;
    _param.forEach((key, value){
      body[key]= value.toString();
    });
    //print("post:request->>>>>>$apiUrl>>>>>>>$_param");
    var rsp =   await Net.post(apiUrl,headers:headers,body: json.encode(_param??{}),preUrl: wrapUrl(baseUrl));
    //print("post:request->>>>>>$apiUrl>>>>>>>$_param\nresp=$rsp");
    return rsp is Map<String, dynamic>? rsp: Map<String, dynamic>();
  }


  String wrapUrl(String baseUrl){
    String url = baseUrl;
    if(null != url){
      if(! url.endsWith("/")){
        url+="/";
      }
    }

    return url;
  }

  Future<dynamic> _get({Map<String, String> headers, String cacheKey,CancelToken cancelToken})async {
    String url = this.apiUrl;
    if (_param.isNotEmpty) {
      url += "?";
    }
    _param.forEach((key, value) {
      if(null != value){
        url += "$key=$value&";
      }
    });
    if (url.endsWith("&")) {
      url = url.substring(0, url.length - 1);
    }
    //print("get:request->>>>>>$apiUrl");
    var rsp =  await Net.get(url, headers: headers, preUrl: wrapUrl(baseUrl), cancelToken:  cancelToken);
    //print("get:request->>>>>>$apiUrl>>>>>>>$_param\nresp=$rsp\n\n\n");
    if(cacheKey != null) {
      try{
        AiCache.get().setString(cacheKey, rsp.toString());
        print('rsp.data type is string=${rsp is String}  is map=${rsp is Map}');
      }
      catch(e) {
        print('cacheKey=$cacheKey, error=$e');
      }
    }
    return rsp is Map<String, dynamic>? rsp: Map<String, dynamic>();
  }
}


//使用示例
class Sample{

  void test()async{
    var rsp = await TestReqProtocol().request();
    if(rsp.isSuccess){
      // print("");
    }
  }
}

class TestReqProtocol extends BaseReqProtocol<TestRspProtocol>{

  TestReqProtocol(){
    param = {
      "参数1":1,
      "参数2":"asdfas",
    };
  }

  //服务器地址，可以不传，
//  @override
//  String get baseUrl;

  //请求接口地址
  @override
  String get apiUrl => "detail/collect";

  //get 或 post请求
  @override
  RequestMethodType get requestType => RequestMethodType.post;

  @override
  Future<TestRspProtocol> result(Map<String,dynamic > map)async {
    return TestRspProtocol.fromXXX(map);
  }

}

class  TestRspProtocol extends BaseModel{
  TestRspProtocol.fromXXX(Map<String,dynamic > map):super.fromMap(map);
}



//请求方法方式
enum RequestMethodType {
  get,
  post,
}




