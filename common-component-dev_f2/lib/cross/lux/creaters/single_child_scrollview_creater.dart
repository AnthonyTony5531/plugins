import 'package:flutter/material.dart';

import '../lux_creater.dart';


/// * ClassName: single_child_scrollview_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/19 16:28


class SingleChildScrollviewCreater extends LuxCreater {


  @override
  create(BuildContext context, Map script) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: LuxCreater.createIns(context, script),

    );
  }

  @override
  bool get isWidget => true;

  @override
  String get lux => 'SingleChildScrollview';

  @override
  Map get sample =>
      {
        'lux': 'SingleChildScrollview',

      };

}
