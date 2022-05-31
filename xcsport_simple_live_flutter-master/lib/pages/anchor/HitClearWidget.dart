
import 'package:flutter/material.dart';

class HitClearWidget extends StatefulWidget {
  final Widget child;
  final RefreshCallback onRedraw;
  HitClearWidget({Key key, @required this.child, @required this.onRedraw}) : super(key: key);

  @override
  _HitClearWidgetState createState() => _HitClearWidgetState();
}

class _HitClearWidgetState extends State<HitClearWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class HitOptionWidget extends StatefulWidget {
  final RefreshCallback onRedraw;
  final Widget child;

  const HitOptionWidget({Key key, this.onRedraw, this.child}) : super(key: key);

  @override
  _HitOptionState createState() => _HitOptionState();
}

class _HitOptionState extends State<HitOptionWidget> {


  @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
