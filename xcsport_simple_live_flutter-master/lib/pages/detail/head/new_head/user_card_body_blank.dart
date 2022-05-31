import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';

class UserCardBodyBlank extends StatelessWidget {
  UserCardBodyBlank({this.title, this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          child: AiImage.asset('assets/images/nodataicon/no-data-homepage.png'),
        ),
        Text(
          this.title ??
              config.langMap['baseLang']['message']['privacyDenyTitle'],
          style: AiTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff19263B)),
        ),
        Text(
          this.subTitle ??
              config.langMap['baseLang']['message']['privacyDenySubTitle'],
          style: AiTextStyle(fontSize: 12, color: Color(0x70000000)),
        )
      ],
    );
  }
}
