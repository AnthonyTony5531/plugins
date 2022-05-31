import 'package:flutter/material.dart';

import '../../lux_creater.dart';

/// * ClassName: box_decoration_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/19 10:23

class BoxDecorationCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return BoxDecoration(
        color: LuxCreater.parseColor(script, "color"),
        border: LuxCreater.parseBorder(script, "border"),
        borderRadius: LuxCreater.parseBorderRadius(script, 'borderRadius'),
        image: LuxCreater.createIns(context, script, "image"));
  }

  @override
  String get lux => 'BoxDecoration';

  @override
  Map get sample => {
        "lux": "BoxDecoration",
        "color": "0xFF00FF00",
      };
}
