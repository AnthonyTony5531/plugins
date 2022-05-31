import 'package:flutter/material.dart';

import '../../lux_creater.dart';

/// * ClassName: alignment_geometry_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/19 10:29

/// 起始坐标在(x/2,y/2),相当于布局中心
class AlignmentCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return Alignment(
      LuxCreater.parseDouble(script, "x") ?? Alignment.center.x,
      LuxCreater.parseDouble(script, "y") ?? Alignment.center.y,
    );
  }

  @override
  String get lux => 'Alignment';

  @override
  Map get sample => {
        'lux': 'Alignment',
        'x': '1.0',
        'y': '0.0',
      };
}

/// 起始坐标在(0,0)，相当于布局左侧顶点
class FractionalOffsetCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return FractionalOffset(
      LuxCreater.parseDouble(script, "x") ?? Alignment.center.x,
      LuxCreater.parseDouble(script, "y") ?? Alignment.center.y,
    );
  }

  @override
  String get lux => 'FractionalOffset';

  @override
  Map get sample => {
        'lux': 'FractionalOffset',
        'x': '0.2',
        'y': '0.6,',
      };
}
