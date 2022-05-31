import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/jsinteraction/jscontrollerimpl/common_jscontroller.dart';
import 'package:fast_ai/jsinteraction/jscontrollerimpl/route_jscontroller.dart';
import 'package:fast_ai/jsinteraction/xc_js_controller_mananger.dart';
import 'package:fast_ai/utils/ai_appbar.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//主播主页
class AnchorPage extends StatefulWidget {
  final Map<String, dynamic> params;
  AnchorPage({Key key, this.params}) : super(key: key);
  @override
  _AnchorPageState createState() => _AnchorPageState();
}

class _AnchorPageState extends State<AnchorPage> {
  String anchorId;
  String url;
  @override
  void initState() {
    var pm = widget.params ?? ModalRoute.of(context).settings.arguments as Map;
    if (pm != null) {
      anchorId = pm['anchorId'];
      url = '${Api.baseMainUrl}/dataview?active=10&theme=10&anchorId=$anchorId&lang=${Translations.langCode}';
    }
    super.initState();
  }
  XCJSControllerManager xcNavigationDelegateManager;
  @override
  Widget build(BuildContext context) {
    xcNavigationDelegateManager.addJsControllers([CommonJsController(context: context),RouteJSController(context: context)]);

    return Scaffold(
      appBar: AiAppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
        title: Text(
          config.langMap['baseLang']['anchor']['anchorPage'],
          style: AiTextStyle(
            fontSize: config.skin.fontSize.h3,
            fontFamily: config.skin.fontFimaly.pingFang,
            fontWeight: config.skin.fontWeight.medium,
            color: config.skin.colors.fontColorRegular,
          ),
        ),
      ),
      body: WebView(
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: [xcNavigationDelegateManager.buildChannel()].toSet(),
        onWebViewCreated: (controller) {
          xcNavigationDelegateManager.webViewController = controller;
        },
        onPageFinished: (url) {},

      ),
    );
  }
}
