import 'package:flutter/material.dart';

import '../lux_creater.dart';

/// * ClassName: sized_box_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/19 15:15

class SizedBoxCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return SizedBox(
      width: LuxCreater.parseDouble(script, 'width'),
      height: LuxCreater.parseDouble(script, 'height'),
      child: LuxCreater.createIns(context, script, 'child'),
    );
  }

  @override
  bool get isWidget => true;

  @override
  String get lux => 'SizedBox';

  @override
  Map get sample => {
        'lux': 'SizedBox',
        'width': '60.0',
        'height': '60.0',
        'child': {
          'lux': 'Container',
          'color': '0xff225566',
        }
      };
}
