import 'dart:async';
import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_widget.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_progress/activity_draw_progress_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_progress/activity_draw_progress_style.dart';
import 'package:flutter/material.dart';

// 进度条
class ActivityDrawProgressStatefulView extends StatefulView<
    ActivityDrawProgressStyle, ActivityDrawProgressViewModel> {
  final ActivityDrawProgressViewModel model;
  final Function timeClick;

  const ActivityDrawProgressStatefulView({
    Key key,
    this.model,
    this.timeClick,
  }) : super(key: key, model: model);

  @override
  _ActivityDrawProgressStatefulViewStatefulViewState createState() =>
      _ActivityDrawProgressStatefulViewStatefulViewState();
}

class _ActivityDrawProgressStatefulViewStatefulViewState extends ViewState<
    ActivityDrawProgressStyle,
    ActivityDrawProgressViewModel,
    ActivityDrawProgressStatefulView> {
  ActivityDrawProgressViewModel _model;

  @override
  ActivityDrawProgressViewModel get defaultModel =>
      _model ??= ActivityDrawProgressViewModel();

  @override
  void initState() {
    super.initState();
    if (FloatActivityDrawCarHelper.activityDrawCarIsShow()) {
      startTimer(1000);
    }
  }

  @override
  void startTimer([int milliseconds]) {
    super.startTimer(milliseconds);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onTime(int count, Timer timer) {
    super.onTime(count, timer);
    if (count == model.timeF) {
      stopTimer();
      widget.timeClick();
    } else {
      model.upDate();
    }
  }

  @override
  Widget render(BuildContext context) {
    bool isShow = FloatActivityDrawCarHelper.activityDrawCarIsShow();
    if (isShow == false) return SizedBox();
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
      borderRadius: BorderRadius.circular(model.height / 2),
      child: Container(
        width: model.width,
        height: model.height,
        color: style.backColor,
        child: Stack(
          children: [
            _configRectWidget(),
            Center(
              child: Text(
                model.timeS,
                style: style.timeStyle,
              ),
            ),
          ],
        ),
      ),
    ),);
  }

  Widget _configRectWidget(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(model.height / 2),
      child: Container(
        width: model.poolRateS,
        height: model.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: style.colors,
          ),
        ),
      ),
    );
  }

}
