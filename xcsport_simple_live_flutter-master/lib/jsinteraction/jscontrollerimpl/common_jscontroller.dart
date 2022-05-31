import 'package:connectivity/connectivity.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/jsinteraction/controller/js_controller.dart';
import 'package:fast_ai/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
/*
*********************************************************************
 * author:Sam
 * date:2019-12-09
 * 版本：1.0.0
 *
 *
 * 修改人：Sam
 * 功能：
 * 1.关闭当webview
 * 2.获取网路状态
 * 3.toast
 **********************************************************************
 */

//每个webview都需要注入的js控制器
class CommonJsController extends JsController {
  BuildContext context;
  CommonJsController({@required this.context});

  @override
  String get name => 'common';

  @override
  Future<JsResponseData> process(
      String method, Map<String, dynamic> params) async {
    switch (method) {
      case 'close':
        return await _close();
      case 'setTitle':
        return await _setTitle(params);
      case 'netState':
        return await _netState();
      case 'toast':
        return await _toast(params);
      case 'toHideKeyBoard':
        return await toHideKeyBoard();
      case 'userinfo':
        return await _userinfo();
    }
    return null;
  }

  //关闭
  Future<JsResponseData> _close() async {
    AiRouter.pop(context, "h5");
    return JsResponseData();
  }


  //关闭
  Future<JsResponseData> toHideKeyBoard() async {
    // TODO: gitlab webView插件换成官方最新webView插件，hideKeyboard方法先注释
    //manager?.webViewController?.hideKeyboard();
    return JsResponseData();
  }

  //获取网路状态. wifi: 2, mobile:1, 无网路连接:0
  Future<JsResponseData> _netState() async {
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    int state = 0;
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        state = 1;
        break;
      case ConnectivityResult.mobile:
        state = 2;
        break;
      case ConnectivityResult.none:
        state = 0;
        break;
    }
    return JsResponseData(data: {'state': state});
  }

  Future<JsResponseData> _setTitle (Map<String, dynamic> params) async {
    String title = params['title'];
    Event.eventBus.fire(WebViewEvent(title: title));
    return JsResponseData();
  }

  Future<JsResponseData> _toast(Map<String, dynamic> params) async {
    Fluttertoast.showToast(
      msg: params['toast'] ?? '',
    );
    return JsResponseData();
  }

  Future<JsResponseData> _userinfo() async {
    return JsResponseData(data: {
      'loginName': config.userInfo.account?.data?.loginName ?? "",
      'playerId': config.userInfo.account?.data?.playerId ?? "",
      'token': config.userInfo.token ?? "",
      'wid': config.userInfo.walletId,
      'nickName': config.userInfo.account?.data?.nickName ?? "",
      'merchantType': config.merchantType,
      'headImg': config.userInfo.account?.data?.headImg ?? "",
      'followLeagues': config.userInfo?.followLeagues ?? [],
      'followTeams': config?.userInfo?.followTeams ?? [],
      'followGames': config.userInfo?.followGames ?? [],
    });
  }
}
