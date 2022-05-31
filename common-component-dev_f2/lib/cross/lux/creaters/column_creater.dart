import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lux_creater.dart';

class ColumnCreater extends LuxCreater {

  String get lux => "Column";

  Widget create(BuildContext context, Map script) {
    return Column(
        mainAxisAlignment: LuxCreater.parseEnum(script, "mainAxisAlignment") ?? MainAxisAlignment.start,
        mainAxisSize: LuxCreater.parseEnum(script, "mainAxisSize") ?? MainAxisSize.max,
        crossAxisAlignment: LuxCreater.parseEnum(script, "crossAxisAlignment") ?? CrossAxisAlignment.center,
        textDirection: LuxCreater.parseEnum(script, "textDirection"),
        verticalDirection: LuxCreater.parseEnum(script, "verticalDirection") ?? VerticalDirection.down,
        textBaseline: LuxCreater.parseEnum(script, "textBaseline"),
        children: LuxCreater.createInsList<Widget>(context, script, "children"));
  }

  @override
  bool get isWidget => true;

  Map get sample => {
        "lux": "Column",
        "data": "文本内容",
        "style": "",
        "textAlign":"",
        "textDirection":"",
        "locale":"",
        "softWrap":"",
        "overflow":"",
        "textScaleFactor":"",
        "maxLines":"",
        "semanticsLabel":"",
      };
}
