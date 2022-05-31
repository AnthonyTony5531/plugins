import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lux_creater.dart';

class RowCreater extends LuxCreater {
  String get lux => "Row";

  Widget create(BuildContext context, Map script) {
    return Row(
        mainAxisAlignment: LuxCreater.parseEnum(script, "mainAxisAlignment") ?? MainAxisAlignment.start,
        mainAxisSize: LuxCreater.parseEnum(script, "mainAxisSize") ?? MainAxisSize.max,
        crossAxisAlignment: LuxCreater.parseEnum(script, "crossAxisAlignment") ?? CrossAxisAlignment.center,
        textDirection: LuxCreater.parseEnum(script, "textDirection"),
        verticalDirection: LuxCreater.parseEnum(script, "verticalDirection") ?? VerticalDirection.down,
        textBaseline: LuxCreater.parseEnum(script, "textBaseline"),
        children: LuxCreater.createInsList<Widget>(context, script, "children"),
    );
  }

  bool get isWidget => true;

  Map get sample => {
    "lux": "Row",
    "children": [
      {
        "lux": "InkWell",
        "child": {
          "lux": "Container",
          "color": "0xFFFFFF00",
          "width": "130",
          "height": "40",
          "child": {"lux": "Counter", "increase": "2313"}
        },
        "onTap": "increase=2313"
      },
      {
        "lux": "Container",
        "width": "40",
        "height": "60",
        "color": "0xFFFF2312"
      },
    ]
  };
}
