import 'package:fast_ai/performance/bean/port/i_kit.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function :  性能工具栏 - 界面

class PerformancePage extends StatefulWidget {
  @override
  _PerformancePageState createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        color: Color(0xffffffff),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                '常用工具',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildKitItemView(context),
          ],
        ),
      ),
    );
  }

  Widget buildKitItemView(BuildContext context) {
    final List<Widget> widgets = <Widget>[];
    final double round = (MediaQuery.of(context).size.width - 80 * 4 - 30) / 3;

    KitManager.instance.kitMap.forEach((key, value) {
      widgets.add(KitItem(value));
    });

    return Wrap(
      spacing: round,
      runSpacing: 15.0,
      children: widgets,
    );
  }
}

class KitItem extends StatelessWidget {
  final IKit kit;

  const KitItem(this.kit);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => kit?.tabAction(),
      child: Container(
          width: 80.0,
          alignment: Alignment.center,
          child: Column(
            children: [
              AiImage.asset(
                kit.getIcon(),
                width: 34.0,
                height: 34.0,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top: 6.0),
                child: Text(
                  kit.getKitName(),
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    color: Color(0xff666666),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
