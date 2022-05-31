import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_appbar.dart';
import 'package:fast_ai/widgets/common_webview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-06
 **********************************************************************
 */

//白色标题栏webview
class WhiteWebViewPage extends StatelessWidget {
  final String url;
  final String title;
  //final CacheMode cacheMode;
  WhiteWebViewPage({
    @required this.url,
    @required this.title,
    //this.cacheMode = CacheMode.LOAD_DEFAULT
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AiAppBar(
            brightness: Brightness.light,
            centerTitle: true,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            leading: new IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black87 ,size: 16.0), onPressed: (){
              AiRouter.pop(context);
            }),
            title: Text(title??'',style: Theme.of(context).textTheme.subtitle1),
            flexibleSpace: Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                height: 1,
                color: config.skin.colors.bgColorGloabl,
              ),
            ),
        ),
        body: CommonWebView(
          url: url,
          // cacheMode: cacheMode,
        )
    );
  }
}
