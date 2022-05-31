import 'package:flutter/material.dart';

import '../../lux_creater.dart';

/// * ClassName: text_span_creater
/// * Description: 配合Rich使用
/// * Author: Grey
/// * CreateDate: 2020/11/18 17:41

class TextSpanCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return TextSpan(
      text: LuxCreater.parseString(script, 'text'),
      style: LuxCreater.createIns(context, script, "style"),
      children: LuxCreater.createInsList<InlineSpan>(context, script, 'children'),
    );
  }

  @override
  String get lux => 'TextSpan';

  @override
  Map get sample => {
        'lux': 'TextSpan',
        'text': 'Text Span Creater',
        'children': [
          {
            'lux': 'TextSpan',
            'text': 'Text Span child one ',
          },
          {
            'lux': 'TextSpan',
            'text': 'Text Span child two ',
            'style': {
              'lux': 'TextStyle',
              'color': '0xFF000000',
              'fontSize': '14.0',
              'fontStyle': 'FontStyle.normal',
              'fontWeight': 'FontWeight.normal',
              'textBaseline': 'TextBaseline.alphabetic',
              'decoration': 'TextDecoration.underline',
              'decorationColor': '0xFFFF0000',
            },
          },
          {
            'lux': 'TextSpan',
            'text': 'Text Span child three ',
            'style': {
              'lux': 'TextStyle',
              'color': '0xFF00ff52',
              'fontSize': '14.0',
              'fontStyle': 'FontStyle.normal',
              'fontWeight': 'FontWeight.bold',
            },
          },
        ],
        'style': {
          'lux': 'TextStyle',
          'color': '0xFF0000FF',
          'fontSize': '14.0',
          'fontStyle': 'FontStyle.normal',
          'fontWeight': 'FontWeight.normal',
        },
      };
}
