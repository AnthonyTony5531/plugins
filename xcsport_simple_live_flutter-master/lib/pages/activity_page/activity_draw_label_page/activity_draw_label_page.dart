import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_item/activity_draw_label_item_view.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_item/activity_draw_label_item_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_style.dart';
import 'package:flutter/material.dart';

// 活动-翻牌-头部奖池
class ActivityLabelStatefulView
    extends StatefulView<ActivityDrawLabelStyle, ActivityDrawLabelViewModel> {
  final ActivityDrawLabelViewModel model;

  const ActivityLabelStatefulView({
    Key key,
    this.model,
  }) : super(key: key, model: model);

  @override
  _ActivityLabelStatefulViewState createState() =>
      _ActivityLabelStatefulViewState();
}

class _ActivityLabelStatefulViewState extends ViewState<ActivityDrawLabelStyle,
    ActivityDrawLabelViewModel, ActivityLabelStatefulView> {
  ActivityDrawLabelViewModel _model;

  @override
  ActivityDrawLabelViewModel get defaultModel =>
      _model ??= ActivityDrawLabelViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ActivityLabelStatefulView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget render(BuildContext context) {
    return model.prizePoolList.isEmpty ? SizedBox() : GridView.builder(
        padding: EdgeInsets.only(top: 0, left: 5.0, right: 5.0),
        physics: NeverScrollableScrollPhysics(),
        itemCount: model.prizePoolList.length ?? 0,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // 横轴元素个数
            crossAxisCount: model.prizePoolList.length ?? 0,
            // 纵轴间距
            mainAxisSpacing: 0,
            // 横轴间距
            crossAxisSpacing: 4.0,
            // 子组件宽高长度比例
            childAspectRatio: 78.0 / 32.0),
        itemBuilder: (BuildContext con, int index) {
          ActivityLabelItemViewModel itemViewModel = model.prizePoolList[index];
          return ActivityLabelItemStatelessView(
            model: itemViewModel,
          );
        });
  }
}
