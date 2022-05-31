import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/widgets/default_views/default_view.dart';
import 'package:flutter/material.dart';

class SystemAppPage extends StatelessWidget {
  const SystemAppPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: Container(
        color: config.skin.colors.bgColorGloabl,
        alignment: Alignment(0, 0),
        child: Container(
          height: 220,
          child: DefaultView(name: 'merchant_forbid',),
        ),
       ),
      ),
    );
  }
}