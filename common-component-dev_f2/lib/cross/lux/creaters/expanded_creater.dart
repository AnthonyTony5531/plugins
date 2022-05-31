import 'package:flutter/material.dart';

import '../lux_creater.dart';

/// * ClassName: expanded_creater
/// * Description: Expanded 和 Flexible ,但是在[Row], [Column], or [Flex]
/// * 主轴方向空间填充的能力，区别Expanded:强制填充,Flexible:非强制填充，根据内容长度扩充
/// * Author: Grey
/// * CreateDate: 2020/11/19 14:26

/// Creates a widget that expands a child of a

class ExpandedCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return Expanded(
      child: LuxCreater.createIns(context, script, 'child'),
      flex: LuxCreater.parseInteger(script, 'flex') ?? 1,
    );
  }

  @override
  bool get isWidget => true;

  @override
  String get lux => 'Expanded';

  @override
  Map get sample => {
        'lux': 'Row',
        'children': [
          {
            'lux': 'Expanded',
            'flex': '1',
            'child': {
              'lux': 'Container',
              "color": "0xFFFF8800",
              "child": {
                "lux": "Text",
                "data": "Expanded 1",
              },
            },
          },
          {
            'lux': 'Expanded',
            'flex': '2',
            'child': {
              'lux': 'Container',
              "color": "0xFF8888FF",
              "child": {
                "lux": "Text",
                "data": "Expanded 2",
              },
            },
          }
        ],
      };
}

class FlexibleCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return Flexible(
      child: LuxCreater.createIns(context, script, 'child'),
      flex: LuxCreater.parseInteger(script, 'flex') ?? 1,
      fit: LuxCreater.parseEnum(script, 'fit') ?? FlexFit.loose,
    );
  }

  @override
  bool get isWidget => true;

  @override
  String get lux => 'Flexible';

  @override
  Map get sample => {
        'lux': 'Row',
        'children': [
          {
            'lux': 'Flexible',
            'flex': '1',
            'child': {
              'lux': 'Container',
              "color": "0xFFFF8800",
              "child": {
                "lux": "Text",
                "data": "Flexible 1",
              },
            },
          },
          {
            'lux': 'Flexible',
            'flex': '2',
            'child': {
              'lux': 'Container',
              "color": "0xFF8888FF",
              "child": {
                "lux": "Text",
                "data": "Flexible 2",
              },
            },
          }
        ],
      };
}
