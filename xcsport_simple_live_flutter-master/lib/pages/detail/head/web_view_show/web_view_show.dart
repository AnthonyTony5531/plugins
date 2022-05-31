import 'package:fast_ai/jsinteraction/jscontrollerimpl/common_jscontroller.dart';
import 'package:fast_ai/jsinteraction/jscontrollerimpl/route_jscontroller.dart';
import 'package:fast_ai/jsinteraction/xc_js_controller_mananger.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewShow extends StatefulWidget {
  WebViewShow({Key key, this.url, this.type, this.height, this.onPageFinished, this.isJointLang = true,this.onPageError}) : super(key: key);
  String type;
  String url;
  double height;
  bool isJointLang = true;
  ValueChanged<bool> onPageFinished;
  ValueChanged<bool> onPageError;

  @override
  _WebViewShow createState() => _WebViewShow();
}

class _WebViewShow extends State<WebViewShow> {

  XCJSControllerManager xcNavigationDelegateManager;


  String get url {
    return widget.url;
  }

  String get type {
    return widget.type;
  }

  double get height {
    return widget.height;
  }

  ValueChanged<bool> onPageFinished;
  ValueChanged<bool> onPageError;

  WebView webview;
  WebViewController _controller;
  @override
  void initState() {
    onPageFinished = widget.onPageFinished;
    if (widget.onPageError != null) {
      onPageError = widget.onPageError;
    }
    xcNavigationDelegateManager =
        XCJSControllerManager();
    xcNavigationDelegateManager.addJsControllers([CommonJsController(context: context),RouteJSController(context: context)]);

    webview = WebView(
      initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      initialUrl: getWebUrl(url, isJointLang: widget.isJointLang),
      javascriptChannels: [xcNavigationDelegateManager.buildChannel()].toSet(),
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController controller) {
        _controller = controller;
        xcNavigationDelegateManager.webViewController = controller;
      },
      onWebResourceError: (error){
        if (this.onPageError != null) {
          this.onPageError(true);
        }
      },
      onPageFinished: (url) {
        this.onPageFinished(true);
        // setState(() {
        // });
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    // if (_controller != null) {
    //   _controller.clearCache();
    // }
    _controller = null;
    webview = null;
    print("销毁");
    super.dispose();
  }

  //FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {




    var showWidget = Container();
    // WebviewScaffold webview = WebviewScaffold(
    //   url: url,
    //   withZoom:false,
    //   primary:false,
    // );

    // WebView webview = WebView(
    //   //initialMediaPlaybackPolicy:AutoMediaPlaybackPolicy.always_allow,
    //   initialUrl: url,
    //   javascriptMode: JavascriptMode.unrestricted,
    //   onWebViewCreated: (WebViewController controller) {
    //   },
    // );

    showWidget = Container(
      height: height,
      child: webview,
    );
    return showWidget;
  }
}
