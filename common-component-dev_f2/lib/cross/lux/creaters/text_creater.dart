import 'package:flutter/material.dart';

import '../lux_creater.dart';

/// * ClassName: text_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/18 15:06

class TextCreater extends LuxCreater {

  @override
  create(BuildContext context, Map script) {
    return Text(
      LuxCreater.parseString(script, "data"),
      style: LuxCreater.createIns(context, script, "style"),
      textAlign: LuxCreater.parseEnum(script, 'textAlign'),
      overflow: LuxCreater.parseEnum(script, 'overflow'),
      maxLines: LuxCreater.parseInteger(script, 'maxLines'),
    );
  }

  @override
  String get lux => 'Text';

  @override
  bool get isWidget => true;

  @override
  Map get sample => {
        'lux': 'Text',
        'data': '文本内容',
        'style': {
          'lux': 'TextStyle',
          'color': '0xFFFF0000',
          'fontSize': '14.0',
          'fontStyle': 'FontStyle.normal',
          'fontWeight': 'FontWeight.normal',
          'textBaseline': 'TextBaseline.alphabetic',
          'decoration': 'TextDecoration.underline',
          'decorationColor': '0xFFFF0000',
        },
        'maxLines': '1',
        'overflow': 'TextOverflow.ellipsis',
      };
}
