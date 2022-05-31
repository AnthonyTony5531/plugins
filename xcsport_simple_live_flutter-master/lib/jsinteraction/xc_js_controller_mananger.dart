import 'dart:collection';
import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';

import 'controller/js_controller.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-09
 **********************************************************************
 */

//js 交互类
class XCJSControllerManager {
  //相应回调
  final HashMap<String, JsController> _controllers = HashMap<String, JsController>();
  WebViewController webViewController;

  XCJSControllerManager({JsController controller}) {
    addJsController(controller);
  }


  //添加单个控制器
  void addJsController(JsController controller) {
    if (null == controller) return;
    List<JsController> list = [];
    list.add(controller);
    addJsControllers(list);
  }

  //添加一坨的控制器
  void addJsControllers(List<JsController> controllers) {
    if (null == controllers || controllers.isEmpty) return;
    controllers.forEach((controller) {
      _controllers[controller.name] = controller;
      controller.manager = this;
    });
  }

//  //构造
//  NavigationDelegate buildNavigationDelegate() {
//    return (request) {
//      if (request.url.startsWith(JsProtocolConst.WebViewProtocolName)) {
//        XCUrlParser urlParser = new XCUrlParser(request.url);
//        final String controllerName = urlParser.controllerName;
//        JsController controller = _controllers[controllerName];
//        if (null != controller) {
//          Future(() async {
//            String data = await controller.process(
//                urlParser.methodName, urlParser.params);
//            if (null != data) {
//              final String wrapData = controller.buildResponseData(urlParser.methodName, data);
//            }
//          });
//        }
//        return NavigationDecision.prevent;
//      }
//      return NavigationDecision.navigate;
//    };
//  }

  JavascriptChannel buildChannel() {
    return JavascriptChannel(
        name: "xcjsmanager",
        onMessageReceived: (message) async {
          var base64 = base64Decode(message.message);
          var decodeStr = utf8.decode(base64);
          var json = jsonDecode(decodeStr);
          var action = json['action'];
          var method = json['method'];
          var params = json['params'];
          var requestId = json['requestId'];
          try {
            JsController controller = _controllers[action];
            if (null == controller) {
              execute(JsResponseData(code: ActionNotFoundErrorCode, message: 'action 错误'), requestId);
              return;
            }
            var jsResponseData = await controller.process(method, params);
            if (null != jsResponseData) {
              execute(jsResponseData,requestId);
            } else {
              execute(JsResponseData(code: MethodNotFountErrorCode, message: 'action 错误'), requestId);
            }
          } catch (e) {
            execute(JsResponseData(code: FlutterErrorCode, message: 'flutter 报错了, $e'), requestId);
          }
        });
  }

  void execute(JsResponseData jsResponseData,String requestId) {
//     Map<String,dynamic> map = jsResponseData.toMap();
    Map<String,dynamic> map = jsResponseData.data;
    map['requestId'] = requestId;
     var script = responseJs(map);
     webViewController?.evaluateJavascript(script)?.then((value){
       print('js返回内容-------：${value.toString()}');
     });
  }
}



const ActionNotFoundErrorCode = 400;
const MethodNotFountErrorCode = 404;
const FlutterErrorCode = 505;
const SuccessCode = 200;
