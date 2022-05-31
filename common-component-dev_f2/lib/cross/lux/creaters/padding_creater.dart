import 'package:flutter/material.dart';

import '../lux_creater.dart';

/// * ClassName: padding_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/19 16:19

class PaddingCreater extends LuxCreater {

  @override
  create(BuildContext context, Map script) {
    return Padding(
      padding: LuxCreater.parseEdgeInsets(script, 'padding'),
      child: LuxCreater.createIns(context, script, 'child'),
    );
  }

  @override
  bool get isWidget => true;

  @override
  String get lux => 'Padding';

  @override
  Map get sample => {
        'lux': 'Padding',
        'padding': {
          'left': '10.0',
          'right': '10.0',
          'top': '10.0',
          'bottom': '10.0',
        },
        'child': {
          'lux': 'Text',
          'data': 'Padding Text',
        },
      };

}
