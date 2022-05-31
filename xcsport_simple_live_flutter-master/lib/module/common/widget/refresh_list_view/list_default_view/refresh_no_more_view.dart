import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

class RefreshNoMoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      alignment: Alignment.center,
      child: Text(
        '老铁，这回真没了',
        style: cmPackage.res.textCreator
            .style(fontSize: 13.0, color: Color(0xFF888888)),
      ),
    );
  }
}
