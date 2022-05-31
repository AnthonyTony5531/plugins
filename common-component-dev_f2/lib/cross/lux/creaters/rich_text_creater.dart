import 'package:flutter/material.dart';

import '../lux_creater.dart';

/// * ClassName: rich_text_creater
/// * Description: dart类作用描述
/// * Author: Grey
/// * CreateDate: 2020/11/18 16:39

class RichTextCreater extends LuxCreater {
  @override
  create(BuildContext context, Map script) {
    return RichText(
      text: LuxCreater.createIns(context, script, 'textSpan'),
      textAlign: LuxCreater.parseEnum(script, 'textAlign') ?? TextAlign.start,
      maxLines: LuxCreater.parseInteger(script, 'maxLines'),
      textDirection: LuxCreater.parseEnum(script, 'textDirection'),
      overflow: LuxCreater.parseEnum(script, 'overflow') ?? TextOverflow.clip,
    );
  }

  @override
  String get lux => 'RichText';

  @override
  bool get isWidget => true;

  @override
  Map get sample => {
        'lux': 'RichText',
        'textSpan': {
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
        },
      };
}
