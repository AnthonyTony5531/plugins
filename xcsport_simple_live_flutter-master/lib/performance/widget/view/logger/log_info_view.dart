import 'package:fast_ai/performance/bean/data/log_info_data.dart';
import 'package:fast_ai/performance/widget/behavior/hide_scroll_behavior.dart';
import 'package:flutter/material.dart';

import '../save_widget_view.dart';

/// @author grey
/// Function :

class LogInfoView extends StatelessWidget {
  final LogInfoData infoData;

  const LogInfoView({@required this.infoData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(6.0)),
      ),
      child: ScrollConfiguration(
        behavior: HideScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              SaveWidgetView(value: infoData.msg),
              const SizedBox(height: 16.0),
              buildTextView(infoData.typeStr),
              buildTextView(infoData.timestampStr),
              buildTextView(infoData.msgStr),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextView(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        title,
        style: TextStyle(color: Color(0xff333333), fontSize: 12.0, height: 1.5),
      ),
    );
  }
}
