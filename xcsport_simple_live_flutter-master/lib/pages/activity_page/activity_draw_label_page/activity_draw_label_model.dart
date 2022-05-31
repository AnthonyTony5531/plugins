import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_item/activity_draw_label_item_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_style.dart';
import 'package:flutter/cupertino.dart';

class ActivityDrawLabelViewModel extends StatefulViewModel<ActivityDrawLabelStyle>{

  List<ActivityLabelItemViewModel> prizePoolList;

  ActivityDrawLabelViewModel.create({@required this.prizePoolList});

  void upData({@required List<ActivityLabelItemViewModel> prizePoolList}) {
    this.prizePoolList = prizePoolList;
  }
  ActivityDrawLabelViewModel();

  @override
  List<ActivityDrawLabelStyle> get styleList => [ActivityDrawLabelStyle()];

  @override
  Future<bool> onInit() {
    return super.onInit();
  }

  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) async {
    return super.refresh(args);
  }
}
