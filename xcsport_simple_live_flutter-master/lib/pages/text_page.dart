import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/widgets/app_bar_widget.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// ********************************************************************
/// author:Sam
/// date:2020-01-07
///*********************************************************************

//纯文字显示的页面
class TextPage extends StatelessWidget {
  final String title;
  final String text;
  TextPage({@required this.title, @required this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XCAppbarHelper.buildSimple(context, title:title),
      backgroundColor: config.skin.colors.bgColorGloabl,
      body: _body()
    );
  }

  Widget _body(){
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,/**/
        children: <Widget>[
          Expanded(child: TextHelper.buildNormal(text)),
        ],
      ),
    );
  }
}
