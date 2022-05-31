import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../lux_creater.dart';

class ContainerCreater extends LuxCreater {
  String get lux => "Container";

  Widget create(BuildContext context, Map script) {
    return Container(
        child: LuxCreater.createIns(context, script, "child"),
        color: LuxCreater.parseColor(script, "color"),
        width: LuxCreater.parseDouble(script, "width"),
        height: LuxCreater.parseDouble(script, "height"),
        padding: LuxCreater.parseEdgeInsets(script, "padding"),
        alignment: LuxCreater.parseEnum(script, "alignment"),
        margin: LuxCreater.parseEdgeInsets(script, "margin"),
        decoration: LuxCreater.createIns(context, script, "decoration"),
        foregroundDecoration: LuxCreater.createIns(context, script, "foregroundDecoration"),
        constraints: LuxCreater.createIns(context, script, "constraints"),
        transform: LuxCreater.parseMatrix4(script, "transform"));
  }

  bool get isWidget => true;

  Map get sample => {
        "padding": {"left": 10, "top": 20},
        "lux": "Container",
        "color": "0xFF00FF00",
        "width": "200",
        "height": "200",
        "alignment": "Alignment.bottomCenter",
        "margin": {"top": "30"},
        "child": {
          "lux": "Container",
          "color": "0xFFFFFF00",
          "width": "30",
          "height": "40",
        }
      };
}
