import 'package:flutter/material.dart';

import '../lux_creater.dart';

/// * ClassName: clip_creater
/// * Description: 裁剪组件
/// * Author: Grey
/// * CreateDate: 2020/11/19 14:58

/// 圆形裁剪
class ClipOvalCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return ClipOval(
      clipBehavior: LuxCreater.parseEnum(script, 'clipBehavior') ?? Clip.antiAlias,
      child: LuxCreater.createIns(context, script, 'child'),
    );
  }

  @override
  bool get isWidget => true;

  @override
  String get lux => 'ClipOval';

  @override
  Map get sample => {
        'lux': 'ClipOval',
        'child': {
          'lux': 'Container',
          "color": "0xFFFF5522",
          "width": "60",
          "height": "60",
          "alignment": "Alignment.center",
          "child": {
            "lux": "Text",
            "data": "ClipOval",
          },
        },
      };
}

/// 矩形裁剪
class ClipRectCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return ClipRect(
      clipBehavior: LuxCreater.parseEnum(script, 'clipBehavior') ?? Clip.hardEdge,
      child: LuxCreater.createIns(context, script, 'child'),
    );
  }

  @override
  bool get isWidget => true;

  @override
  String get lux => 'ClipRect';

  @override
  Map get sample => {
        'lux': 'ClipRect',
        'child': {
          'lux': 'Container',
          "color": "0xFFFF5522",
          "width": "60",
          "height": "60",
          "alignment": "Alignment.center",
          "child": {
            "lux": "Text",
            "data": "ClipRect",
          },
        },
      };
}

/// 矩形裁剪
class ClipRRectCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return ClipRRect(
      borderRadius: LuxCreater.parseBorderRadius(script, 'borderRadius') ?? BorderRadius.zero,
      clipBehavior: LuxCreater.parseEnum(script, 'clipBehavior') ?? Clip.antiAlias,
      child: LuxCreater.createIns(context, script, 'child'),
    );
  }

  @override
  bool get isWidget => true;

  @override
  String get lux => 'ClipRRect';

  @override
  Map get sample => {
        'lux': 'ClipRRect',
        'borderRadius': {
          'topLeft': '5.0',
          'topRight': '10.0',
          'bottomLeft': '0.0',
          'bottomRight': '5.0',
        },
        'child': {
          'lux': 'Container',
          "color": "0xff339933",
          "width": "100",
          "height": "100",
          "alignment": "Alignment.center",
          "child": {
            "lux": "Text",
            "data": "ClipRRect",
          },
        },
      };
}
