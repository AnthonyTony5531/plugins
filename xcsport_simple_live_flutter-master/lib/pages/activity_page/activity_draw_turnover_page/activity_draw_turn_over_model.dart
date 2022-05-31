import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_picture_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_protocol/activity_draw_detail_protocol.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_protocol/send_lottery_award_protocol.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_item_page/activity_view_draw_item_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_turn_over_style.dart';
import 'package:flutter/cupertino.dart';
import 'activity_draw_item_page/activity_common_util.dart';

class ActivityDrawTurnOverViewModel
    extends StatefulViewModel<ActivityDrawTurnOverStyle> {
  num awardType; //中奖等级:1.A奖池、2.B奖池、3.C奖池、4.D奖池、5.基础奖池
  num id; // 发奖id
  List<String> imageList; // 翻牌图片["B","C","A","A","E","B","C","D","A"]
  num lotteryId;
  String cardImg; // 卡面背景图片
  ActivityDrawTurnOverViewModel.create({
    @required this.awardType,
    @required this.id,
    @required this.imageList,
    @required this.lotteryId,
    @required this.cardImg,
  });

  void upData(
      {@required num awardType,
      @required num id,
      @required List<String> imageList,
      @required num lotteryId,
      @required String cardImg}) {
    this.awardType = awardType;
    this.id = id;
    this.imageList = imageList;
    this.lotteryId = lotteryId;
    this.cardImg = cardImg;
  }

  ActivityDrawTurnOverViewModel();

  @override
  List<ActivityDrawTurnOverStyle> get styleList =>
      [ActivityDrawTurnOverStyle()];

  List<ActivityDrawItemViewModel> _pictureList = [];
  List<ActivityDrawItemViewModel> get pictureList => _pictureList;

  List<String> _lotteryList = [];
  // 谢谢回顾数量
  List<String> thanksList = [];

  // 点击顺序
  int selectedIndex = 0;

  // 发奖失败信息
  String failMsg = '';
  // 加载失败信息
  String loadFailMsg = '';
  // 提示语
  String _hint = '';
  String get hint => _hint;

  List<ActivityPictureModel> modelList;

  List<int> indexList = [];
  Map dataMap;

  @override
  void onAttach() {
    super.onAttach();
    makeRefreshingStatus();
  }

  @override
  Future<bool> onInit() async {
    dataMap = config.baseLang['activityDraw'];
    failMsg = dataMap['failMsg'] ?? '网络异常,未扣除翻牌次数,请重新翻牌';
    loadFailMsg = dataMap['faileMsg'] ?? '网络不给力，请连接网络重试!';
    _hint = dataMap['describe'];
    await refresh();
    return false;
  }

  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) async {
    ActivityPictureRspProtocol rspProtocol = await ActivityPictureRepProtocol(lotteryId: lotteryId).request();
    if (rspProtocol.isSuccess) {
      _pictureList.clear();
      _lotteryList.clear();
      modelList = rspProtocol.pictureList;
      if (modelList.isNotEmpty) {
        for (int i = 0; i < activityConfig.activityNum; i++) {
          ActivityDrawItemViewModel drawItemViewModel =
          ActivityDrawItemViewModel.create(
            width: 78.0,
            height: 90.0,
            images: imageList,
            modelList: modelList,
          );

          if (i >= imageList.length) {
            ActivityPictureModel pictureM =
            modelList.firstWhere((element) => element.imageLevel == activityConfig.baseImg);
            drawItemViewModel.upData(
                image: pictureM.image,
                cardImg: cardImg,
                imageLevel: pictureM.imageLevel,
                isFront: false);
          } else {
            String imageS = imageList[i];
            var pictureModel =
            modelList.firstWhere((element) => element.imageLevel == imageS);

            drawItemViewModel.upData(
              image: pictureModel.image,
              cardImg: cardImg,
              imageLevel: pictureModel.imageLevel,
              isFront: false,
            );
          }
          _pictureList.add(drawItemViewModel);
        }
      }
      makeSuccessStatus();
    } else {
      makeErrorStatus();
    }
    notifyStateChanged();
    return super.refresh(args);
  }

  // 发奖
  Future<num> configSendLottery() async {
    SendLotteryAwardRspProtocol awardRspProtocol = await SendLotteryAwardRepProtocol(id: id).request();
    if (awardRspProtocol.isSuccess) {
      return awardRspProtocol.lotteryModel.status;
    } else {
      return 0;
    }
  }

  void configThanks(){
    thanksList.clear();
    _pictureList.forEach((element) {
      if (!element.isFront) {
        element.upSuccess(sendSuccess: true);
      }
    });
  }

  // 处理翻转图片 中奖等级:1.A奖池、2.B奖池、3.C奖池、4.D奖池、5.基础奖池
  // 返回的num类型 0：发奖失败 1：发奖成功 2:禁用 3：还未到发奖数量
  Future<num> configLotteryPicture(String imageLevel,int index) async {
    num type = configAwardType(imageLevel);
    _pictureList[index].isFront = true;

    if (type == awardType) {
      _lotteryList.add(imageLevel);
    }

    if (_lotteryList.length == 3) {
      activityConfig.isTrue = true;
      num state = await configSendLottery();
      activityConfig.acNumber = 0;
      if (state == 0) {
        // 发奖失败
        _lotteryList.clear();

      } else if (state == 1 || state == 2) {

//        _pictureList[index].upIsLast(isLast: true);
//
//        await sleep(900);

        _pictureList.forEach((element) {
          if (!element.isFront) {
            element.upSuccess(sendSuccess: true);
          }
        });

      }
      return state;
    } else {
      return 3;
    }
  }

  num configAwardType(String imageLevel) {
    num type = 4;
    switch (imageLevel) {
      case 'A':
        type = 1;
        break;
      case 'B':
        type = 2;
        break;
      case 'C':
        type = 3;
        break;
      case 'D':
        type = 4;
        break;
      case 'E':
        type = 5;
        break;
      case 'X':
        type = 10;
        break;
      default:
        type = 5;
        break;
    }
    return type;
  }

}
