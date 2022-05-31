import 'package:flutter/material.dart';

import '../lux_creater.dart';


class FlatButtonCreater extends LuxCreater {

  @override
  create(BuildContext context, Map script) {
    return FlatButton(
      textColor: LuxCreater.parseColor(script, 'textColor'),
      disabledTextColor: LuxCreater.parseColor(script, 'disabledTextColor'),
      color: LuxCreater.parseColor(script, 'color'),
      highlightColor: LuxCreater.parseColor(script, 'highlightColor'),
      splashColor: LuxCreater.parseColor(script, 'splashColor'),
      focusColor: LuxCreater.parseColor(script, 'focusColor'),
      autofocus: LuxCreater.parseBool(script, 'autofocus'),
      clipBehavior: LuxCreater.parseEnum(script, 'clipBehavior'),
      child: LuxCreater.createIns(context, script, 'child'),
      onPressed: (){
        LuxCreater.fire(script, 'onPressed', 'press button');
      },
      onLongPress: (){
        LuxCreater.fire(script, 'onLongPress', 'longPress button');
      },
    );
  }

  @override
  String get lux => 'FlatButton';

  @override
  bool get isWidget => true;

  @override
  Map get sample =>
  {
    'lux': 'FlatButton',
    'textColor': '0xFF123456',
    'disabledTextColor': '0xFF123FFF',
    'color': '0xFF123FFF',
    'highlightColor': '0xFF123FFF',
    'splashColor': '0xFF123FFF',
    'focusColor': '0xFF123FFF',
    'colorBrightness': '',
    'focusNode': '',
    'materialTapTargetSize': '',
    'autofocus': 'false',
    'clipBehavior': 'Clip.antiAlias',
    'shape': '',
    'child': {
      "lux": "Container",
      "color": "0xFFFFFF00",
      "width": "20",
      "height": "20",
    },
    'onPressed': 'press=9100',
    'onLongPress': 'longPress=9200',
    'onHighlightChanged': '',
    'textTheme': '',
  };

}