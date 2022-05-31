import 'package:flutter/material.dart';

class AnchorStatefulView extends StatefulWidget {
  final Widget child;
  const AnchorStatefulView({Key key,this.child}) : super(key: key);

  @override
  _AnchorStatefulViewState createState() => _AnchorStatefulViewState();
}

class _AnchorStatefulViewState extends State<AnchorStatefulView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
