import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_notice_page/activity_draw_marquee/activity_draw_marquee_style.dart';
import 'package:flutter/material.dart';

class ActivityDrawMarqueeViewModel
    extends StatefulViewModel<ActivityDrawMarqueeStyle> {
  int duration; // 轮播时间
  double stepOffset; // 偏移量
  double paddingLeft; // 内容之间的间距
  List<String> marqueeList;

  ActivityDrawMarqueeViewModel.create(
      {@required this.duration,
      @required this.stepOffset,
      @required this.paddingLeft,
      @required this.marqueeList});

  void upData(
      {@required int duration,
      @required double stepOffset,
      @required double paddingLeft,
        @required List<String> marqueeList,
      }) {
    this.duration = duration;
    this.paddingLeft = paddingLeft;
    this.stepOffset = stepOffset;
    this.marqueeList = marqueeList;
  }

  ActivityDrawMarqueeViewModel();

  @override
  List<ActivityDrawMarqueeStyle> get styleList => [ActivityDrawMarqueeStyle()];


  @override
  Future<bool> onInit() {
    return super.onInit();
  }

  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) async {
    return super.refresh(args);
  }
}
