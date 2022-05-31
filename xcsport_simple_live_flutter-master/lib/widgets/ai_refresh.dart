import 'dart:io';

import 'package:common_component/widget/sc_refresh_view/sc_refresh_view.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loading_widget/loading_circular.dart';

/// @author king
/// @date 2021/6/2

class AiRefresh extends StatelessWidget {
  final Widget child;
  final int maxWaitTime;
  final bool isStack;
  final ScRefreshViewRefreshCallback onRefresh;
  final ScRefreshViewController controller;

  const AiRefresh(
      {Key key,
      this.child,
      this.controller,
      this.isStack = false,
      this.onRefresh,
      this.maxWaitTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScRefreshView(
      controller: this.controller,
      onRefresh: onRefresh,
      maxWaitTime: this.maxWaitTime,
      isStack: isStack,
      onPullDown: () async {
        _doVibrate();
      },
      freshHeaderBuilder: (BuildContext context, double value, type) {
        var size = 50 * value;
        size = size < 50 ? size : 50;
        return Container(
          width: AiMeasure.screenWidth(context),
          height: 90,
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 50 / 2),
            child: SizedBox(
              width: size,
              height: size,
              child: LoadingCircular(),
            ),
          ),
        );
      },
      child: this.child,
    );
  }

  void _doVibrate() {
    if (AiCache.get()?.getBool(AiCache.vibrate_setting) ?? true) {
      vibrateImpact();
    }
  }
}

class AndroidScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    } else {
      return super.buildViewportChrome(context, child, axisDirection);
    }
  }
}
