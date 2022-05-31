import 'package:flutter/material.dart';

import '../lux_creater.dart';

/// * ClassName: align_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/19 10:16

class AlignCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return Align(
      child: LuxCreater.createIns(context, script, 'child'),
      heightFactor: LuxCreater.parseDouble(script, 'heightFactor'),
      widthFactor: LuxCreater.parseDouble(script, 'widthFactor'),
      alignment: LuxCreater.createIns(context, script, 'alignment'),
    );
  }

  @override
  String get lux => 'Align';

  @override
  bool get isWidget => true;

  @override
  Map get sample => {
        'lux': 'Align',
        'alignment': {
          'lux': 'Alignment',
          'x': '0.0',
          'y': '0.0',
        },
//        'alignment': {
//          'lux': 'FractionalOffset',
//          'x': '0.5',
//          'y': '0.0',
//        },
        'child': {
          'lux': 'Container',
          "color": "0xFF00FF00",
          "child": {
            "lux": "Text",
            "data": "Align Position",
          }
        }
      };
}
