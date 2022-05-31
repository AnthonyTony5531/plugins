import 'package:flutter/material.dart';

import '../lux_creater.dart';


class StackCreater extends LuxCreater {

  @override
  create(BuildContext context, Map script) {
    return Stack(
      alignment: LuxCreater.parseEnum(script, "alignment"),
      fit: LuxCreater.parseEnum(script, "fit"),
      overflow: LuxCreater.parseEnum(script, "overflow"),
      children: LuxCreater.createInsList<Widget>(context, script, "children"),
    );
  }

  @override
  bool get isWidget => true;

  @override
  String get lux => 'Stack';

  @override
  Map get sample =>
  {
    'lux': 'Stack',
    'alignment': 'Alignment.topCenter',
    'textDirection': '',
    'fit': 'StackFit.loose',
    'overflow': 'Overflow.clip',
    'children': [
      {
        'lux': 'Positioned',
        'left': '12.6',
        'top': '10.0',
        'bottom': '9.4',
        'child': {
          "lux": "Container",
          "color": "0xFF007700",
          "width": "200",
          "height": "40",
        }
      },
      {
        'lux': 'Positioned',
        'left': '60.6',
        'top': '20.0',
        'bottom': '20.4',
        'child': {
          "lux": "Container",
          "color": "0xFF87FF00",
          "width": "30",
          "height": "40",
        }
      }
    ],
  };

}
