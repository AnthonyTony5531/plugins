import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_item/activity_draw_label_item_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_style.dart';
import 'package:flutter/cupertino.dart';

import 'activity_draw_label_page/activity_draw_label_model.dart';
import 'activity_draw_notice_page/acvity_draw_notice_model.dart';
import 'activity_draw_turnover_page/activity_draw_turn_over_model.dart';

class ActivityDrawViewModel extends StatefulViewModel<ActivityDrawStyle> {
  List<ActivityLabelItemViewModel> prizePoolList; //	奖池信息
  String activityImg; // 活动背景图片
  num awardType; //中奖等级:1.A奖池、2.B奖池、3.C奖池、4.D奖池、5.基础奖池
  num id; // 发奖id
  List<String> imageList; // 翻牌图片["B","C","A","A","E","B","C","D","A"]
  num lotteryId; // 活动id
  String cardImg; // 卡面背景图片
  ActivityDrawViewModel.create({
    @required this.prizePoolList,
    @required this.activityImg,
    @required this.awardType,
    @required this.id,
    @required this.imageList,
    @required this.lotteryId,
    @required this.cardImg,
  });

  ActivityDrawViewModel();

  void upData({
    @required List<ActivityLabelItemViewModel> prizePoolList,
    @required String activityImg,
    @required num awardType,
    @required num id,
    @required List<String> imageList,
    @required num lotteryId,
    @required String cardImg,
  }) {
    this.prizePoolList = prizePoolList;
    this.activityImg = activityImg;
    this.awardType = awardType;
    this.id = id;
    this.imageList = imageList;
    this.lotteryId = lotteryId;
    this.cardImg = cardImg;
  }

  @override
  List<ActivityDrawStyle> get styleList => [ActivityDrawStyle()];

  ActivityDrawLabelViewModel activityDrawLabelViewModel;
  ActivityDrawNoticeViewModel activityDrawNoticeViewModel;
  ActivityDrawTurnOverViewModel activityDrawTurnOverViewModel;

  // 中奖标题
  String _title = '';
  String get title => _title;

  // 中奖金额
  String _money = '';
  String get money => _money;

  // 中奖描述
  String _describe = '';
  String get describe => _describe;

  Map _dataMap;

  @override
  Future<bool> onInit() {
    _dataMap = config.baseLang['activityDraw'];
    activityDrawLabelViewModel =
        ActivityDrawLabelViewModel.create(prizePoolList: this.prizePoolList);
    activityDrawNoticeViewModel = ActivityDrawNoticeViewModel();
    activityDrawTurnOverViewModel = ActivityDrawTurnOverViewModel.create(
        awardType: this.awardType,
        id: this.id,
        imageList: this.imageList,
        lotteryId: this.lotteryId,
        cardImg: this.cardImg);

    _title = configMessage(awardType);

    ActivityLabelItemViewModel itemViewModel = prizePoolList.firstWhere((element) => element.awardType == awardType);
    _money = itemViewModel.awardAmount.toString();

    _describe = _dataMap['lotteryDescribe'];
    return super.onInit();
  }

  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) {
    return super.refresh(args);
  }

  // 中奖等级
  String configMessage(int awardType) {
    String message = '';
    switch (awardType) {
      case 1:
        message = _dataMap['bigPrize'];
        break;
      case 2:
        message = _dataMap['grandPrize'];
        break;
      case 3:
        message = _dataMap['winningPrize'];
        break;
      case 4:
        message = _dataMap['smallPrize'];
        break;
      case 5:
        message = _dataMap['smallPrize'];
        break;
      default:
        message = _dataMap['smallPrize'];
        break;
    }
    String congratulationsLottery = _dataMap['congratulationsLottery'];
    return '$congratulationsLottery $message';
  }
}
