//**********************************************************************
//* author:Sam
//* date:2020-03-05
//**********************************************************************

//常用语
import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/frequency_limit.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveHotHelperCommonExpression extends StatefulWidget {

  ValueChanged<String> onSelected;
  LiveHotHelperCommonExpression({this.onSelected});
  @override
  _LiveHotHelperCommonExpressionState createState() =>
      _LiveHotHelperCommonExpressionState();
}

class _LiveHotHelperCommonExpressionState
    extends State<LiveHotHelperCommonExpression> {

//  List<String> messages = config.langMap['baseLang']['detail']['chatMsg'];
  List<String> messages = [];

  PreventMultiTap preventMultiTap = PreventMultiTap();

  @override
  void initState() {
    var baseLang = config.langMap['baseLang'];
    var list = AiJson(baseLang).getArray('detail.chatMsg');
    messages = list.map((e) => e?.toString())?.toList() ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final expression = messages[index];
          return InkWell(
              onTap: (){
//                ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailMessagePhrase);
                preventMultiTap.onTask(
                  task: (){
                    widget.onSelected(expression);
                  },
                );
              },
              child: ExpressionCell(expression)
          );
        });
  }
}

class ExpressionCell extends StatelessWidget {
  final String text;

  ExpressionCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 6,
              height: 6,
              margin: EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 0.5),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: TextHelper.buildNormal(
                text,
              ),
            ),
          ],
        ),
        InterValHelper.h(4),
        LineHelper.buildHLine(),
        InterValHelper.h(4),
      ],
    );
  }
}
