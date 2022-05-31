import 'package:fast_ai/performance/bean/data/http_info.dart';
import 'package:fast_ai/performance/widget/behavior/hide_scroll_behavior.dart';
import 'package:flutter/material.dart';

import '../save_widget_view.dart';

/// @author grey
/// Function :

class HttpInfoView extends StatelessWidget {
  final HttpInfo info;

  const HttpInfoView({@required this.info});

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
              SaveWidgetView(value: info.getValue()),
              const SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  children: [
                    _buildDataInfo('\nBase Info', isBold: true, isChange: false),
                    _buildDataInfo(info.httpUrlStr),
                    _buildDataInfo(info.requestTimeStr),
                    _buildDataInfo(info.serverTimeStr),
                    if (info.requestInfo.isHasData) _buildDataInfo('\nRequest Info', isBold: true),
                    if (info.requestInfo.isHasData) _buildDataInfo(info.requestInfo.getInfo()),
                    if (info.responseInfo.isHasData) _buildDataInfo('\nResponse Info', isBold: true),
                    if (info.responseInfo.isHasData) _buildDataInfo(info.responseInfo.getInfo()),
                    if (info.errorInfo.isHasData) _buildDataInfo('\nError Info', isBold: true),
                    if (info.errorInfo.isHasData) _buildDataInfo(info.errorInfo.getInfo()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan _buildDataInfo(String data, {bool isChange = true, bool isBold = false}) {
    final txt = '${isChange ? '\n' : ''}$data';
    return TextSpan(
      text: txt,
      style: TextStyle(
        color: Color(0xff333333),
        fontSize: isBold ? 12.0 : 10.0,
        height: 1.5,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
