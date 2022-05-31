//--------------------------------------------------------------------------
// @author sam
// @Date 2019/11/14
//--------------------------------------------------------------------------

import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

//数据详情页
class DataDetailPage extends StatefulWidget {
  final String name;
  final int index;
  final String homeId;
  final String awayId;
  final String gidm;
  bool hasActionBar;
  ValueChanged<String>  onPageFinished;

  String dataUrl;
  DataDetailPage.create({this.name,this.index =1,@required   this.gidm,@required this.homeId,@required this.awayId, this.hasActionBar = true , this.onPageFinished}){
    dataUrl = '${Api.baseMainUrl}/dataview?gidm=$gidm&theme=3&homeId=$homeId&awayId=$awayId&head=0&background=0&lang=${Translations.langCode}';
  }

  @override
  _DataDetailPageState createState() => _DataDetailPageState();
}

class _DataDetailPageState extends State<DataDetailPage>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return !widget.hasActionBar?_body(): Scaffold(
      appBar:XCAppbarHelper.build(context,
          titleName: widget.name,
          elevation: 1,
           ),
      body: _body(),
    );
  }

  Widget _body() {

    return   WebView(
      initialUrl: getWebUrl(widget.dataUrl),
      initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (url){
        widget.onPageFinished(url);
      },
    );
  }


  @override
  void dispose() {
    super.dispose();
  }

  
}
