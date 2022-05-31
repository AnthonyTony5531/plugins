//**********************************************************************
//* author:Sam
//* date:2020-05-11
//**********************************************************************



import 'package:fast_ai/router.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/widgets/default_views/default_view.dart';
import 'package:fast_ai/widgets/loading_widget/loading_circular.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class GameWebView extends StatefulWidget {
  final String initialUrl;
  const GameWebView({Key key, this.initialUrl}) : super(key: key);

  @override
  _GameWebViewState createState() => _GameWebViewState();
}

class _GameWebViewState extends State<GameWebView> {
  bool enableFresh = false;
  bool loadingFinish = false;
  bool isError = false;
  @override
  void initState() {
    super.initState();
    print('00-GameWebView-initState');
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]).then((f){
      print('22-GameWebView-initState');
      Future((){
        print('33-GameWebView-initState');
        if(mounted){
          enableFresh = true;
          setState(() {});
        }
      });

      XcSdkApi.canAutorotate(true);
    });
    print('11-GameWebView-initState');
  }


  @override
  void dispose() {
    super.dispose();
    print('00-GameWebView-dispose');

    XcSdkApi.canAutorotate(false);
  }

  @override
  Widget build(BuildContext context) {
    print('00-GameWebView-build');
    return  Material(
      color: Colors.black,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            //webview 不能用Offstage，否者有问题。
            enableFresh? WebView(
              initialUrl:widget.initialUrl,
              javascriptMode: JavascriptMode.unrestricted,

              onWebResourceError: (error) {
                loadingFinish = true;
                isError = true;
                if (mounted) {
                  setState(() {

                  });
                }
              },
              onPageFinished: (url){
              loadingFinish = true;
              setState(() {

              });
            },):Container(),
            Offstage(
              offstage: !isError,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: DefaultView(
                  name: 'game_error',
                  enableBtn: false,
                  backgroundColor:Colors.transparent,
                ),
              ),
            ),
            Offstage(
              offstage: loadingFinish,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
                child: Center(
                  child: LoadingCircular(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: AiMeasure.topOffset(context), left: 10),
              child: IconButton(
                onPressed: (){
                  AiRouter.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.white.withOpacity(0.6),),),
            ),
          ],
        ),
      ),
    );
  }
}
