import 'package:flutter/material.dart';

import '../lux_creater.dart';

/// * ClassName: image_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/19 15:58

class ImageNetCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return Image.network(
      LuxCreater.parseString(script, 'url'),
      width: LuxCreater.parseDouble(script, 'width'),
      height: LuxCreater.parseDouble(script, 'height'),
      alignment: LuxCreater.parseEnum(script, 'alignment') ?? Alignment.center,
      fit: LuxCreater.parseEnum(script, 'fit') ?? BoxFit.cover,
    );
  }

  @override
  bool get isWidget => true;

  @override
  String get lux => 'ImageNet';

  @override
  Map get sample => {
        'lux': 'ImageNet',
        'url': 'http://img.ivsky.com/img/tupian/pre/202004/27/the_mystery_of_stonehenge-002.jpg',
        'alignment': 'Alignment.center',
        'fit': "BoxFit.cover",
      };
}
