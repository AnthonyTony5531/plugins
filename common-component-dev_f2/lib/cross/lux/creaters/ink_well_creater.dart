import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lux_creater.dart';

class InkWellCreater extends LuxCreater {
  
  String get lux => "InkWell";

  Widget create(BuildContext context, Map script) {
    return InkWell(
      child: LuxCreater.createIns(context, script, "child"),
      onTap: () {
        LuxCreater.fire(script, "onAdd", 2);
      },
    );
  }

  @override
  bool get isWidget => true;

  Map get sample => {
        "lux": "InkWell",
        "child": {
          "lux": "Container",
          "color": "0xFFFFFF00",
          "width": "130",
          "height": "40",
          "child": {"lux": "Counter", "increase": "mainPageAdd1"}
        },
        "onAdd": "increase=mainPageAdd1"
      };
}
