import 'package:common_component/util/listeners/value_listener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lux_creater.dart';
class Counter extends StatefulWidget {
  final ValueListener increase;
  Counter({this.increase});

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("count: $_count"),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.increase?.addListener(_increase);
  }

  void _increase(dynamic args) {
    if (!(args is int)) return;
    if (mounted) {
      setState(() {
        _count += args;
      });
    }
  }
}

class CounterCreater extends LuxCreater {

  String get lux => "Counter";

  Widget create(BuildContext context, Map script) {
    return Counter(increase: LuxCreater.createListener(script, "increase"));
  }

  @override
  bool get isWidget => true;

  Map get sample => {"lux": "Counter", "increase": "122"};
}
