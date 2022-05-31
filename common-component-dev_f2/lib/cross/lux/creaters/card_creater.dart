import 'package:flutter/material.dart';

import '../lux_creater.dart';

/// * ClassName: card_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/18 18:25

class CardCreater extends LuxCreater {

  @override
  bool get isWidget => true;
  
  @override
  create(BuildContext context, Map script) {
    return Card(
      child: LuxCreater.createIns(context, script, "child"),
      color: LuxCreater.parseColor(script, 'color'),
      elevation: LuxCreater.parseDouble(script, 'elevation'),
      clipBehavior: LuxCreater.parseEnum(script, 'clipBehavior'),
      shape: LuxCreater.createIns(context, script, 'shape'),
      margin: LuxCreater.parseEdgeInsets(script, 'margin'),
    );
  }

  @override
  String get lux => 'Card';

  @override
  Map get sample => {
        'lux': 'Card',
        'child': {
          "lux": "Container",
          "width": "150",
          "height": "200",
          'child': {
            'lux': 'Text',
            'data': 'Card Creater',
          }
        },
        'color': '0xff00f0f0',
        'elevation': '1.0',
        'shape': {
          'lux': 'RoundedRectangleBorder',
          'borderRadius': {
            'topLeft': '5.0',
            'topRight': '5.0',
          },
          'side': {
            'color': '0xffff0000',
            'width': '1.0',
          },
        },
        'margin': {
          'left': '10.0',
          'right': '10.0',
          'top': '10.0',
          'bottom': '10.0',
        },
      };
}
