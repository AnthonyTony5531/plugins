import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/jsinteraction/controller/js_controller.dart';
import 'package:fast_ai/jsinteraction/jscontrollerimpl/common_jscontroller.dart';
import 'package:fast_ai/jsinteraction/xc_js_controller_mananger.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/default_views/load_fail.dart';
import 'package:fast_ai/widgets/loading_widget/page_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../jsinteraction/jscontrollerimpl/route_jscontroller.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-10
 **********************************************************************
 */

//公共wevview,带公共的js交互
class CommonWebView extends StatefulWidget {
  final String url;
  final List<JsController> controllers;
  //final CacheMode cacheMode;
  CommonWebView({
    @required this.url,
    this.controllers,
    //this.cacheMode = CacheMode.LOAD_DEFAULT,
  });

  @override
  _CommonWebViewState createState() => _CommonWebViewState();
}

class _CommonWebViewState extends State<CommonWebView> {
  final XCJSControllerManager manager = XCJSControllerManager();
  Timer timeoutTimer;
  bool isLoadFinished = false;
  bool isLoadFailed = false;
  @override
  void initState() {
   
    startTimeoutTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    manager.addJsController(CommonJsController(context: context));
    manager.addJsController(RouteJSController(context: context));
    manager.addJsControllers(widget.controllers);
    return Stack(
      children: <Widget>[
        WebView(
          initialUrl: getWebUrl(widget.url ?? ''),
          //cacheMode: widget.cacheMode,
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: [manager.buildChannel()].toSet(),
          onWebViewCreated: (webViewController) {
            manager.webViewController = webViewController;
          },
          onPageFinished: (url) {
            isLoadFinished = true;
            isLoadFailed = false;
            timeoutTimer.cancel();
            //因为H5有黑色背景加载。看起来像黑屏，延迟一秒
            Future.delayed(Duration(seconds: 1), () {
              if (mounted) setState(() {});
            });
          },
        ),
        Offstage(
          offstage: isLoadFinished || isLoadFailed,
          child: Container(
            child: PageLoading(),
            color: Colors.white,
          ),
        ),
        Offstage(
          offstage: !isLoadFailed,
          child: Container(
            child: LoadFail(
              onRefresh: onRefresh,
            ),
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void startTimeoutTimer() {
    timeoutTimer =
        Timer(Duration(seconds: config.fiexd.webViewTimeoutTime), () {
      if (mounted) {
        setState(() {
          isLoadFailed = true;
        });
      }
    });
  }

  Future<void> onRefresh() async {
//    manager.webViewController?.reload();
    startTimeoutTimer();
    if (mounted) {
      setState(() {
        isLoadFinished = false;
        isLoadFailed = false;
      });
    }
  }
}
