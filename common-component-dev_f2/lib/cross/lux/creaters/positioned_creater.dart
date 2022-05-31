import 'package:flutter/material.dart';

import '../lux_creater.dart';


class PositionedCreater extends LuxCreater {

  @override
  create(BuildContext context, Map script) {
    return Positioned(
      left: LuxCreater.parseDouble(script, "left"),
      right: LuxCreater.parseDouble(script, "right"),
      top: LuxCreater.parseDouble(script, "top"),
      bottom: LuxCreater.parseDouble(script, "bottom"),
      width: LuxCreater.parseDouble(script, "width"),
      height: LuxCreater.parseDouble(script, "height"),
      child: LuxCreater.createIns(context, script, "child"),
    );
  }

  @override
  String get lux => 'Positioned';

  @override
  bool get isWidget => true;

  @override
  Map get sample =>
  {
    'lux': 'Positioned',
    'left': '12.6',
    'top': '10.0',
    'bottom': '9.4',
    'child': {
      "lux": "Container",
      "color": "0xFFFFFF00",
      "width": "30",
      "height": "40",
    }
  };

}
