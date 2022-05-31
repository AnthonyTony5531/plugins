import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_animal/activity_draw_animal_style.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_item/activity_draw_label_item_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class ActivityDrawAnimalViewModel extends StatefulViewModel<ActivityDrawAnimalStyle>{
  List<ActivityLabelItemViewModel> prizePoolList; //	奖池信息
  String activityImg; // 活动背景图片
  num awardType; //中奖等级:1.A奖池、2.B奖池、3.C奖池、4.D奖池、5.基础奖池
  num id; // 发奖id
  List<String> imageList; // 翻牌图片["B","C","A","A","E","B","C","D","A"]
  num lotteryId; // 活动id
  String cardImg; // 卡面背景图片
  String popupImg; // 弹窗图片
  ActivityDrawAnimalViewModel.create({
    @required this.prizePoolList,
    @required this.activityImg,
    @required this.awardType,
    @required this.id,
    @required this.imageList,
    @required this.lotteryId,
    @required this.cardImg,
    @required this.popupImg,
  });

  ActivityDrawAnimalViewModel();

  void upData({
    @required List<ActivityLabelItemViewModel> prizePoolList,
    @required String activityImg,
    @required num awardType,
    @required num id,
    @required List<String> imageList,
    @required num lotteryId,
    @required String cardImg,
    @required String popupImg,
  }) {
    this.prizePoolList = prizePoolList;
    this.activityImg = activityImg;
    this.awardType = awardType;
    this.id = id;
    this.imageList = imageList;
    this.lotteryId = lotteryId;
    this.cardImg = cardImg;
    this.popupImg = popupImg;
  }

  @override
  Future<bool> onInit() {
    return super.onInit();
  }

  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) {
    return super.refresh(args);
  }

  @override
  List<ActivityDrawAnimalStyle> get styleList => [ActivityDrawAnimalStyle()];

}
