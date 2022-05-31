import 'package:flutter/material.dart';

import '../../lux_creater.dart';


class TextEditingControllerCreater extends LuxCreater {

  @override
  create(BuildContext context, Map script) {
    return TextEditingController(
      text: LuxCreater.parseString(script, 'text')
    );
  }

  @override
  String get lux => 'TextEditingController';

  @override
  Map get sample =>
  {
    'lux': 'TextEditingController',
    'text': 'default text'
  };

}