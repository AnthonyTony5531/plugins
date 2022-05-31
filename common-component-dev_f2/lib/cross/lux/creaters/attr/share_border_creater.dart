import 'package:flutter/material.dart';

import '../../lux_creater.dart';

/// * ClassName: share_border_creater
/// * Description: 图形
/// * Author: Grey
/// * CreateDate: 2020/11/18 18:34

class RoundedRectangleBorderCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return RoundedRectangleBorder(
      borderRadius: LuxCreater.parseBorderRadius(script, 'borderRadius'),
      side: LuxCreater.parseBorderSide(script, 'side'),
    );
  }

  @override
  String get lux => 'RoundedRectangleBorder';

  @override
  Map get sample => {
        'lux': 'RoundedRectangleBorder',
        'borderRadius': {
          'topLeft': '3',
          'topRight': '3',
        },
        'side': {
          'color': '0xffff0000',
          'width': '1.0',
        },
      };
}
