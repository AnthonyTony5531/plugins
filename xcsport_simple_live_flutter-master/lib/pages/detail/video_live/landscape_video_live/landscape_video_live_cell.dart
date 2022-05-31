import 'package:flutter/material.dart';

class LandscapeVideoLiveCell extends StatefulWidget {
  LandscapeVideoLiveCell({Key key}) : super(key: key);

  @override
  _LandscapeVideoLiveCellState createState() => _LandscapeVideoLiveCellState();
}

class _LandscapeVideoLiveCellState extends State<LandscapeVideoLiveCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
      ),
    );
  }
}