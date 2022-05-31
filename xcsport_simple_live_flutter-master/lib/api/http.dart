import 'dart:async';
import 'dart:convert' as _convert;
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:fast_ai/api/interceptor/http_info_interceptor.dart';
import 'package:fast_ai/api/net_proxy.dart';
import 'package:fast_ai/api/protocols/system/system_maintain_Info_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/sdk_params.dart';
import 'package:fast_ai/flutter_sdk/fast_ai_sdk.dart';
import 'package:fast_ai/flutter_sdk/flutter_sdk.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/pages/ai_module/ai_apge_sport.dart';
import 'package:fast_ai/pages/login/system_app_page.dart';
import 'package:fast_ai/pages/system_repair/system_repair_page.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_date.dart';
import 'package:fast_ai/utils/ai_navigator_observer.dart';
import 'package:fast_ai/utils/app_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/popup_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as _http;
import 'package:quiver/collection.dart';
import 'package:synchronized/synchronized.dart' as _sync;

import 'api.dart';
import 'net.dart';

class HttpRequest {
  final lang;
  String merchantid = '';
  bool loginShow = false;
  bool appIsForbid = false;
  static LinkedLruHashMap<String, CancelToken> cancelTokenMap = LinkedLruHashMap(maximumSize: 120);

  HttpRequest(this.lang);

  dynamic errorResponse() {
     var bm = BaseModel(msg: 'App 即将被释放，取消待请求并忽略所有请求');
     return bm.toMap();
  }

  Future<dynamic> get(String uri,
      {Map<String, String> headers,
      params,
      String preUrl,
      bool needLogin = true,
      int timeout,
      CancelToken cancelToken}) async {
    if(config.sdkWillExit) return errorResponse();

    var bUrl = preUrl ?? Api.baseUrl;
    try {
      headers = headers ?? Map();

      String paramsStr = '';
      if (params != null) {
        params.forEach((String key, dynamic value) {
          if (paramsStr == '') {
            paramsStr = paramsStr + '?$key=$value';
          } else {
            paramsStr = paramsStr + '&$key=$value';
          }
        });
      }
      //如果接口没有添加groupId的给个默认值groupId=0,用于后台兼容低版本的前端
      if (!uri.contains('groupId=') && !paramsStr.contains('groupId=')) {
        if (uri.contains('?')) {
          if (!uri.contains('walletmanager/api/')) {
            uri = uri + '&groupId=0';
          }
        } else {
          if (uri.contains('walletmanager/api/')) {
          } else if (paramsStr == '') {
            paramsStr = paramsStr + '?groupId=0';
          } else {
            paramsStr = paramsStr + '&groupId=0';
          }
        }
      }

      var reqUrl = '$bUrl$uri$paramsStr';
      await _init(uri, headers, needLogin, param: params);
      if(reqUrl.contains('common/businessConfig') && config.isGbet) { // 有些接口传了header 在188中后续的接口terType会设置不正确，导致接口返回异常
        headers['terType'] = Platform.isAndroid ? "7" : "6";
        //print('00-common/businessConfig, is188=${config.isGbet}, isAi=${config.isAi}, header.terType=${headers['terType']}');
      }
      if(!isStrNullOrEmpty(reqUrl)){
        if(cancelToken == null){
          cancelToken = CancelToken();
        }
        cancelTokenMap['$reqUrl'] = cancelToken;
      }
      Dio dio = Dio();
      // dio.interceptors.add(DioLogInterceptor());
      dio.interceptors.add(HttpInfoInterceptor());
      configProxy(dio);
      int receiveTimeout = timeout ?? 25000;
      int sendTimeout = timeout ?? 10000;
      Response res = await dio.get(
        reqUrl,
        options: Options(
            headers: headers,
            contentType: "multipart/form-data",
            receiveTimeout: receiveTimeout,
            sendTimeout: sendTimeout),
        cancelToken: cancelToken,
      );
      //print('http------ get url=$reqUrl ------ finish');

      BaseModel error = BaseModel.fromMap(Map());
      if (!await _checkResponse(res, errorMsg: error, reqHeaders: headers)) {
        config.fastAiSdkParams.onDomainBlocked();
        return error.toMap();
      }
      return res.data;
    } on Exception catch (e, stack) {
      config.fastAiSdkParams.onDomainBlocked();
      return _checkError(e, reqHeaders: headers);
    }
  }

  void configProxy(Dio dio) {
    if (isRelease() && !NetProxySetting.releaseModelEnable) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      };
      return;
    }
    if (!NetProxySetting.enable) return;
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (url) {
        ///设置代理 电脑ip地址
        //return "PROXY 10.20.11.235:8888"; // 单个IP端口
        //return "PROXY 10.20.11.235:8888; PROXY 10.20.11.236:8889; DIRECT" // 多IP端口
        return NetProxySetting.proxyUlr;
      };

      ///忽略证书
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }

  Future<dynamic> post(String uri,
      {Map<String, String> headers,
      body,
      String preUrl,
      bool needLogin = true,
      int timeout,
      CancelToken cancelToken}) async {
    if(config.sdkWillExit) return errorResponse();

    var bUrl = preUrl ?? Api.baseUrl;
    try {
      headers = headers ?? Map();
      await _init(uri, headers, needLogin);

      //如果接口没有添加groupId的给个默认值groupId=0,用于后台兼容低版本的前端
//      Map decodeBody;
//      if (body is String) {
//        decodeBody = _convert.jsonDecode(body) ?? Map();
//      } else {
//        decodeBody = body;
//      }
//      if (decodeBody != null) {
//        if (!decodeBody.containsKey('groupId')) {
//          decodeBody['groupId'] = '0';
//        }
//      }
      var decodeBody;
      if (body is String) {
        decodeBody = _convert.jsonDecode(body) ?? Map();
      } else {
        decodeBody = body;
      }
      if (decodeBody != null) {
        if (decodeBody is Map) {
          if (!decodeBody.containsKey('groupId')) {
            decodeBody['groupId'] = '0';
          }
        } else if (decodeBody is List) {
          decodeBody.forEach((element) {
            if (element is Map) {
              if (!element.containsKey('groupId')) {
                element['groupId'] = '0';
              }
            }
          });
        }
      }
      body = _convert.jsonEncode(decodeBody);

      if(!isStrNullOrEmpty(uri)){
        if(cancelToken == null){
          cancelToken = CancelToken();
        }
        cancelTokenMap['$uri'] = cancelToken;
      }
      // headers['Content-Type'] = 'application/x-www-form-urlencoded';
      Dio dio = Dio();
      // dio.interceptors.add(DioLogInterceptor());
      dio.interceptors.add(HttpInfoInterceptor());
      configProxy(dio);
      int receiveTimeout = timeout ?? 25000;
      int sendTimeout = timeout ?? 10000;
      Response res = await dio.post(
        '$bUrl$uri',
        data: body,
        options: Options(
            headers: headers,
            receiveTimeout: receiveTimeout,
            sendTimeout: sendTimeout),
        cancelToken: cancelToken,
      );
      print('http------post url=$bUrl$uri ------ finish');
      // if(uri.contains('bet/order/morePW') || uri.contains('c/odds/update')) {
      //   print('http-post-uri=$uri, body=${body.toString()}, data=${res?.data.toString()}');
      // }
      BaseModel error = BaseModel.fromMap(Map());
      if (!await _checkResponse(res, errorMsg: error, reqHeaders: headers)) {
        config.fastAiSdkParams.onDomainBlocked();
        return error.toMap();
      }
      return res.data;
    } on Exception catch (e, stack) {
      config.fastAiSdkParams.onDomainBlocked();
      return _checkError(e, reqHeaders: headers);
    }
  }

  Future<FormData> formData(String imagePath) async {
    var name =
        imagePath.substring(imagePath.lastIndexOf('/') + 1, imagePath.length);
    var formData = FormData();
    formData.files.add(MapEntry(
        'files', await MultipartFile.fromFile(imagePath, filename: name)));
    return formData;
  }

  void showTokenOverduePage() {
    if (config.isGbet || config.isNSports || config.isVs || config.is365) {
      return;
    }
    AiRouter.pushWithoutContext('TokenOverduePage');
  }

  Future<dynamic> uploadImage(String uri, String imagePath) async {
    if (uri?.length == 0 ||
        uri == null ||
        imagePath?.length == 0 ||
        imagePath == null) {
      return '';
    }
    if(config.sdkWillExit) return errorResponse();

    Dio dio = Dio();
    configProxy(dio);

    try {
      String path = Api.baseMainUrl + '/ai/' + uri;
      Map<String, String> headers = Map();
      headers.addAll(config.apiConfig.headers);
      headers['Content-Type'] = 'multipart/form-data';
      dio.options.headers = headers;
      dio.options.connectTimeout = 20000;
      dio.options.sendTimeout = 20000;
      Response response = await dio.post(path, data: await formData(imagePath),
          onSendProgress: (received, total) {
        if (total != -1) {
          print((received / total * 100).toStringAsFixed(2) + "%");
        }
      });
      if (response.statusCode == 200) {
        print('上传成功');
        print('statusCode is ${response.statusCode}');
        print('response is ${response.data}');
        return response.data;
      } else {
        print('上传失败');
      }
    } on Exception catch (e) {
      return _checkError(e);
    }
  }

  var _lock = _sync.Lock();
  var _autoChangeLock = _sync.Lock();

  //处理返回的数据错误情况
  Future _checkResponse(Response res,
      {BaseModel errorMsg, Map<String, String> reqHeaders}) async {
    //print('00-_checkResponse-res.data.toString()=${res.data.toString()}');
    if(config.isDeleteInternationalAppointModule){
      // 运维维护替换中文
      var checkBody = res?.data;
      if((checkBody is String) && (checkBody.contains('运维') || checkBody.contains('运营'))){
        checkBody.replaceAll('运维', 'Msg');
        checkBody.replaceAll('运营', 'Msg');
      }
    }
    switch (res.statusCode) {
      case 200:
        {
          if (res.requestOptions.uri.path.contains(Api.LOGIN)) {
            loginShow = false;
          }
          var body = res.data;
          BaseModel baseModel;
          if (body is String) {
            baseModel = BaseModel.fromMap(_convert.jsonDecode(res.data));
          } else {
            baseModel = BaseModel.fromMap(body);
          }
          if (baseModel.is503) {
            print('baseModel.is503 ----> ${baseModel.is503}');
            XcSdkApi.systemRepair(baseModel.msg, baseModel.whTime);
            if (!config.isApp && config.sdkParams.handledSysRepair) {
              // 商户处理系统维护，SDK不做处理
              print('>>>>>> 商户在SDK外处理系统维护，SDK不做处理 <<<<<<');
            } else if (!config.userInfo.showSystemRepairPage &&
                !res.requestOptions.uri.path.contains(Api.LOGIN) &&
                !isNullOrEmpty(baseModel.msg)) {
              bool didDownloadSdkAssets =
                  AiCache.get().getString(AiCache.app_version) ==
                      config.appInfo.appVersion;
              print('>>>>>>  数据源维护 msg=${baseModel.msg} <<<<<<');
              List<String> params = baseModel.msg.split(',');
              String whTime;
              String platformId;
              bool allSystemRepair = false;
              bool isServiceRepair;
              if (params.length >= 4) {
                isServiceRepair = false;
                // 数据源维护
                whTime =
                    '${AiDate.getFormatDate(params[1], format: 'HH:mm')}-${AiDate.getFormatDate(params[2], format: 'HH:mm')}';
                allSystemRepair = '${params[3]}' == 'true';
                platformId = params[0];
                if (didDownloadSdkAssets &&
                    !allSystemRepair &&
                    config.sdkParams.page != TabSdkPage.betList &&
                    config.userInfo.isFirstTimeEntryApp) {
                  return true;
                }
              } else {
                // 我们自己运维维护 数据结构：{"msg":"维护中","code":"503","whTime":"12:00-16:16"}
                print('>>>>>> 我们自己运维维护 <<<<<<');
                whTime = baseModel.whTime;
                platformId = '${config.userInfo.sportPlatformId}';
                isServiceRepair = true;
              }
              if (didDownloadSdkAssets ||
                  config.isFlutterSdk ||
                  config.isFastAiSdk) {
                _showSystemRepairPage(whTime, platformId, allSystemRepair,
                    isServiceRepair: isServiceRepair);
              }
            }
          } else if (baseModel.code == 401 || baseModel.code == 405) {
            //如果FlutterSdk不需要显示登录界面
            if (config.isFlutterSdk || config.isFastAiSdk) {
              FlutterSdk.tokenVaildProc(reqHeaders["token"]);
            } else {
              appIsForbid = false;
              print(">>>>401, loginShow=$loginShow");
              if (!loginShow) {
                print("_checkResponse isApp:${config.isApp}");
                loginShow = true;
                config.userInfo.logout();
                if (!isRelease() && config.isApp) {
                  if (!config.isGbet) {
                    AiRouter.pushAndRemoveUtilWithoutContext(
                        AiRouter.AiLoginPage);
                  }
                } else {
                  showTokenOverduePage();
                }
              }
            }
            throw Exception("code=${baseModel.code},msg=${baseModel.msg}");
          } else if (baseModel.isMerchantForbit || baseModel.isAppForbit) {
            // 禁用商户/禁用App
            if (!appIsForbid) {
              appIsForbid = true;
              BuildContext context =
                  AiNavigatorObserver.getInstance().navigator.overlay.context;
              showPageSheet(context, SystemAppPage(), PopAnimate.Right, true);
            }
          } else {
            appIsForbid = false;
          }
          break;
        }
      case 401:
        {
          if (config.isFlutterSdk || config.isFastAiSdk) {
            FlutterSdk.tokenVaildProc(reqHeaders["token"]);
          } else {
            if (!loginShow) {
              loginShow = true;
              config.userInfo.logout();
              showTokenOverduePage();
            }
          }
          break;
        }
      case 460:
        {
          print('【${res.requestOptions.uri}】 接口超时~~!!!!!!!!');
          errorMsg.code = res.statusCode;
          errorMsg.msg =
              '${config.langMap['baseLang']['networkError']['networkTimeout']}(${res.statusCode})';
          break;
        }
      case 403:
        {
          if (!config.userInfo.show403SystemRepairPage && config.isFastAiSdk) {
            config.userInfo.show403SystemRepairPage = true;
            FastAiSdk.sdkCallback.onSystemRepair403();
            _showSystemRepairPage403();
          }
          break;
        }
      default:
        {
          errorMsg.code = res.statusCode;
          errorMsg.msg =
              '${config.langMap['baseLang']['networkError']['networkBackError']}(${res.statusCode})';
          return false;
        }
    }
    return true;
  }

  void _showSystemRepairPage403() async {
    await AiRouter.pushAndRemoveUntil(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => SystemRepairPage(
            servicingTime: '',
            sportPlatform: '',
            allSystemRepair: false,
          ),
        ), (route) => route == null);
  }

  void _showSystemRepairPage(
      String whTime, String platform, bool allSystemRepair,
      {SystemMaintainInfo info, bool isServiceRepair = false}) {

    _lock.synchronized(() async {
      if (config.userInfo.showSystemRepairPage) {
        return;
      }
      config.userInfo.showSystemRepairPage = true;
      if (!allSystemRepair) {
        return;
      }
      AiCache.get().setString('servicingTime', whTime);
      AiCache.get().setString('sportPlatform', platform);
      AiCache.get().setBool('allSystemRepair', allSystemRepair);
      if (config.isFastAiSdk) {
        FastAiSdk.sdkCallback.onSystemRepair(whTime);
      }
      await AiRouter.pushAndRemoveUntil(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => SystemRepairPage(
              servicingTime: whTime,
              sportPlatform: platform,
              allSystemRepair: allSystemRepair,
              info: info,
              isServiceRepare: isServiceRepair,
            ),
          ), (route) => route == null);

    });
  }

  static Future<dynamic> dget(String uri,
      {Map<String, String> headers, params}) async {
    var bUrl = uri;
    // print('------get preUrl=$preUrl');
    try {
      headers = headers ?? Map();
      String paramsStr = '';
      if (params != null) {
        params.forEach((String key, dynamic value) {
          if (paramsStr == '') {
            paramsStr = paramsStr + '?$key=$value';
          } else {
            paramsStr = paramsStr + '&$key=$value';
          }
        });
      }

      //如果接口没有添加groupId的给个默认值groupId=0,用于后台兼容低版本的前端
      if (!uri.contains('groupId=') && !paramsStr.contains('groupId=')) {
        if (uri.contains('?')) {
          uri = uri + '&groupId=0';
        } else {
          if (paramsStr == '') {
            paramsStr = paramsStr + '?groupId=0';
          } else {
            paramsStr = paramsStr + '&groupId=0';
          }
        }
      }

      var reqUrl = '$bUrl$uri$paramsStr';
      headers['Content-Type'] = 'html/text';
      headers['User-Agent'] =
          'Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.25 Mobile Safari/537.36';
      _http.Response res = await _http.get(Uri.parse(reqUrl), headers: headers);
      //print('------get url=$reqUrl');
      var result = res.body;
      return result;
    } on Exception catch (e) {
      print('[uri=$bUrl$uri] exception e=${e.toString()}');
      return "err";
    }
  }

  //处理网络错误的情况
  dynamic _checkError(e, {Map<String, String> reqHeaders}) {
    BaseModel error = BaseModel.fromMap(Map());
    if (e is DioError) {
      DioError dioError = e;
      if (dioError?.response?.statusCode == null) {
        print(
            '00-_checkError-dioError?.response?.statusCode=${dioError?.response}');
      }
      switch (dioError?.response?.statusCode ?? 0) {
        case 460:
          print('【${dioError.requestOptions.uri}】 请求超时...!!!');
          error.msg =
              "${config.langMap['baseLang']['networkError']['networkCheck']}";
          error.code = 460;
          break;
        default:
          error.code = dioError?.response?.statusCode ?? 0;
          error.msg = dioError?.message ?? '';
          break;
      }
    } else {
      error.code = 500;
      error.msg = e.message;
    }

//    print('11-_checkError-loginShow=$loginShow, isFlutterSdk=${config.isFlutterSdk}, isFastAiSdk=${config.isFastAiSdk}');
//    if (!loginShow) {
//      loginShow = true;
//      print('22-_checkError-loginShow');
//
//      config.userInfo.logout();
//      Fluttertoast.showToast(msg: config.langMap['baseLang']['networkError']['networkErrorRetry3'], gravity: ToastGravity.CENTER);
//    }
    print('33-_checkError-erro.toMap()=${error.toMap()}');
    return error.toMap();
  }

  //关闭请求
  void close() async{
//    _http.Client().close();
    try{
      cancelTokenMap.forEach((key, value) {
        if(value is CancelToken){
          value?.cancel('取消请求:$key');
        }
      });
      cancelTokenMap?.clear();
    }
    catch(e){
      print('取消请求报错---${e.toString()}');
    }
//    try{
//      await Future.forEach(cancelTokenMap.keys, (element){
//        CancelToken token = cancelTokenMap[element];
//        if(token != null){
//          token?.cancel('取消请求:$element');
//        }
//      });
//      cancelTokenMap.clear();
//    }
//    catch(e){
//      print('取消请求报错---${e.toString()}');
//    }
  }

  bool isLogin = true;

  //设置全局headers，检查token等
  Future _init(String uri, Map<String, String> headers, bool needLogin,
      {dynamic param}) async {
    //如果惹名开启，登录一次
    if (needLogin && config.enableAnonymous && config.userInfo.isLogout()) {
      await Net.loginAnonymous();
    }
    headers.addAll(config.apiConfig.headers);
    if (param != null && param is Map) {
      if (param['wid'] != null) {
        headers['wid'] = param['wid'];
      }
    }
    headers['groupId'] = '${config.userInfo.sportPlatformId}';
    // 商户类型，1=AI-SDK，2=AI-新体育,3=188新体育，4=188SDK
    headers['merchantType'] = config.merchantType;
  }

  ///
  /// 速达点水请求
  ///
  Future<dynamic> postUseCookie(String uri, String cookieValue,
      {Map<String, String> headers, body, String preUrl}) async {
    var bUrl = preUrl ?? Api.baseUrl;
    try {
      headers = headers ?? Map();
      headers['Cookie'] = cookieValue;
      headers['Referer'] =
          'https://xj-sb-asia-manbetx3.prdasbbwla2.com/zh-cn/sports';

      Map decodeBody;
      if (body is String) {
        decodeBody = _convert.jsonDecode(body) ?? Map();
      } else {
        decodeBody = body;
      }
      body = _convert.jsonEncode(decodeBody);

      Dio dio = Dio();
      // int startInt = DateTime.now().millisecondsSinceEpoch;
      Response res = await dio.post('$bUrl$uri',
          data: body,
          options: Options(
              headers: headers, receiveTimeout: 25000, sendTimeout: 10000));
      // print('------post url=$bUrl$uri ------ finish  接口耗时=${DateTime.now().millisecondsSinceEpoch-startInt}毫秒 body=$body, res=${res.data} headers=$headers');

      return res.data;
    } on Exception catch (e) {
      print('[uri=$bUrl$uri] exception e=${e.toString()}');
      return e;
    }
  }

  bool isFirstEnterAutoChangingToOther = false;

//  //多数据源情况下其中之一维护，切换自动到其他数据源
//  void changeToOtherPlatform(String currentSportPlatform) async {
//    _autoChangeLock.synchronized(() async {
//      if (isFirstEnterAutoChangingToOther) {
//        return;
//      }
//      isFirstEnterAutoChangingToOther = true;
//      config.userInfo.sportPlatformId = int.tryParse(currentSportPlatform);
//      try {
//        BetConfigModel betModel = BetConfigModel();
//        BetConfigUpdateUtil.convertModel(betModel);
//        bool rst = await BetConfigUpdateUtil.sendBetSettingRequest(betModel);
//        if (rst) {
//          currentSportPlatform = '${config.userInfo.sportPlatformId}';
//          var result = await Net.topMenu();
//          if (result?.code != null && result?.code == 200) {
//            config.userInfo.showSystemRepairPage = false;
//            config.userInfo.isFirstTimeEntryApp = false;
//            if (!config.isGbet) {
//              await AiRouter.pushAndRemoveUntil(
//                  MaterialPageRoute(
//                      builder: (context) => SportAiPage(),
//                      settings: RouteSettings(name: 'sportAiPage'),
//                      fullscreenDialog: true),
//                  (route) => route == null);
//            }
//          }
//        }
//      } catch (_) {}
//      isFirstEnterAutoChangingToOther = false;
//    });
//  }
}
