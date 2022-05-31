import 'package:flutter/material.dart';

import '../../lux_creater.dart';

/// * ClassName: decoration_asset_image_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/19 10:25

class DecorationAssetImageCreater extends LuxCreater {

  @override
  create(BuildContext context, Map script) {
    return DecorationImage(
        image: AssetImage(LuxCreater.parseString(script, "image")),
        fit: LuxCreater.parseEnum(script, "fit"),
        alignment: LuxCreater.parseEnum(script, "alignment"),
        centerSlice: LuxCreater.parseRect(script, "centerSlice"));
  }

  @override
  String get lux => 'DecorationAssetImage';

  @override
  Map get sample => {
        "lux": "DecorationAssetImage",
        "image": "assets/a.png",
        "fit": "BoxFit.contain",
        "alignment": "Alignment.center",
        "centerSlice": {"left": 0, "top": 0, "width": 100, "height": 100}
      };

}
