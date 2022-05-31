import 'package:flutter/material.dart';

import '../../lux_creater.dart';

/// * ClassName: box_constraints_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/19 10:26

class BoxConstraintsCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return BoxConstraints(
      minWidth: LuxCreater.parseDouble(script, "minWidth"),
      maxWidth: LuxCreater.parseDouble(script, "maxWidth"),
      minHeight: LuxCreater.parseDouble(script, "minHeight"),
      maxHeight: LuxCreater.parseDouble(script, "maxHeight"),
    );
  }

  @override
  String get lux => 'BoxConstraints';

  @override
  Map get sample => {
        "lux": "BoxConstraints",
        "minWidth": 0,
        "maxWidth": "double.infinity",
        "minHeight": 0,
        "maxHeight": "double.infinity",
      };
}
