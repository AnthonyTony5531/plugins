import 'dart:async';
import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_notice_page/activity_draw_marquee/activity_draw_marquee_style.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_notice_page/activity_draw_marquee/activity_draw_marquee_viewmodel.dart';
import 'package:flutter/material.dart';

class ActivityDrawMarqueeStatefulView extends StatefulView<
    ActivityDrawMarqueeStyle, ActivityDrawMarqueeViewModel> {
  final ActivityDrawMarqueeViewModel model;

  const ActivityDrawMarqueeStatefulView({
    Key key,
    this.model,
  }) : super(key: key, model: model);

  @override
  _ActivityDrawMarqueeStatefulViewState createState() =>
      _ActivityDrawMarqueeStatefulViewState();
}

class _ActivityDrawMarqueeStatefulViewState extends ViewState<
    ActivityDrawMarqueeStyle,
    ActivityDrawMarqueeViewModel,
    ActivityDrawMarqueeStatefulView> {
  ActivityDrawMarqueeViewModel _model;
  ScrollController _controller; // 执行动画的controller
  double _offset = 0.0; // 执行动画的偏移量
  List<Widget> itemWidget = [];

  @override
  ActivityDrawMarqueeViewModel get defaultModel =>
      _model ??= ActivityDrawMarqueeViewModel();

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(initialScrollOffset: _offset);
    if (model.marqueeList.isNotEmpty) {
      itemWidget = model.marqueeList
          .map((e) {
            List<String> list = e.split(':');

            return Container(
              margin: new EdgeInsets.only(right: model.paddingLeft),
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: '${list.first}:',
                          style: style.textStyle),
                      TextSpan(
                          text: list.last,
                          style: style.moneyTextStyle),
                    ]
                ),
              ),
            );
      })
          .toList();
      startTimer(3 * 1000);
    }
  }

  @override
  void startTimer([int milliseconds]) {
    super.startTimer(milliseconds);
  }

  @override
  void didUpdateWidget(covariant ActivityDrawMarqueeStatefulView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void onTime(int count, Timer timer) {
    super.onTime(count, timer);
    double newOffset = _controller.offset + model.stepOffset;
    if (newOffset != _offset) {
      _offset = newOffset;
      _controller.animateTo(_offset,
          duration: Duration(milliseconds: model.duration * 1000), curve: Curves.linear); // 线性曲线动画
    }
  }

  @override
  void onDataUpdatedAfter() {
    super.onDataUpdatedAfter();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    return itemWidget.length > 0 ? ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal, // 横向滚动
      controller: _controller, // 滚动的controller
      itemBuilder: (context, index) {
        return new Row(children: itemWidget);
      },
    ) : SizedBox();
  }
}
