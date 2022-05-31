
import 'package:common_component/mvvm/viewmodel/stateless_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_item/activity_draw_label_item_style.dart';
import 'package:flutter/material.dart';

class ActivityLabelItemViewModel extends StatelessViewModel<ActivityDrawLabelItemStyle> {
  num awardAmount;
  num awardType;
  String poolImg;
  String lotteryImg;
  ActivityLabelItemViewModel.create({
    @required this.awardAmount,
    @required this.awardType,
    @required this.poolImg,
    @required this.lotteryImg,
  });

  void upData({@required num awardAmount,@required num awardType,@required String poolImg,@required String lotteryImg}){
    this.awardAmount = awardAmount;
    this.awardType = awardType;
    this.poolImg = poolImg;
    this.lotteryImg = lotteryImg;
  }

  ActivityLabelItemViewModel();

  @override
  List<ActivityDrawLabelItemStyle> get styleList => [ActivityDrawLabelItemStyle()];

}