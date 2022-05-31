import 'package:flutter/material.dart';

class DefaultLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 40.0,
        height: 40.0,
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.red.shade300)),
      ),
    );
  }
}
