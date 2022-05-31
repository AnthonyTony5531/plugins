//已到底

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:flutter/material.dart';

class BottomRankWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var hint = AiJson(config.baseLang).getString('rankBottom');

    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 80.0,
            height: 1.0,
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFEBECF0).withOpacity(0.0),Color(0xFFEBECF0)],
              ),
            ),
          ),
          Text('${isEmpty(hint) ? '排行榜只显示前20位' : hint}',style: AiTextStyle(
            color: Color(0xFF999999),
            fontSize: 12.0,
            decoration: TextDecoration.none,
          ),),
          Container(
            width: 80.0,
            height: 1.0,
            margin: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFEBECF0),Color(0xFFEBECF0).withOpacity(0.0)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
