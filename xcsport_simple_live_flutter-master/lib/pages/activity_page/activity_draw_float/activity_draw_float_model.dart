import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:common_component/util/sleep.dart';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_style.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_item/activity_draw_label_item_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_draw_progress_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_user_win_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_progress/activity_draw_progress_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_protocol/activity_draw_float_protocol.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_protocol/activity_win_prize_protocol.dart';
import 'package:fast_ai/widgets/imagecache/xc_network_image.dart' as xcNetworkImage;

class ActivityDrawFloatViewModel
    extends StatefulViewModel<ActivityDrawFloatStyle> {
  ActivityDrawFloatViewModel.create();
  ActivityDrawFloatViewModel();

  @override
  List<ActivityDrawFloatStyle> get styleList => [ActivityDrawFloatStyle()];

  List<WinPrizeUserModel> winPrizeModelList = [];

  List<ActivityLabelItemViewModel> _prizePoolList = [];
  List<ActivityLabelItemViewModel> get prizePoolList => _prizePoolList;

  String _activityImg = ''; // 活动背景图片
  String get activityImg => _activityImg;

  num _awardType = 1; //中奖等级:1.A奖池、2.B奖池、3.C奖池、4.D奖池、5.基础奖池
  num get awardType => _awardType;

  num _id = 0; // 发奖id
  num get id => _id;

  List<String> _imageList = []; // 翻牌图片["B","C","A","A","E","B","C","D","A"]
  List<String> get imageList => _imageList;

  num _lotteryId = 0; // 活动id
  num get lotteryId => _lotteryId;

  String _cardImg = ''; // 卡面背景图片
  String get cardImg => _cardImg;

  String _popupImg = ''; // 弹窗图片
  String get popupImg => _popupImg;

  String _floatingImg = ''; // 浮动图片
  String get floatingImg => _floatingImg;

  String _titleS = ''; // 图片按钮标题
  String get titleS => _titleS;

  int _createTime = 0; // 创建时间
  int get createTime => _createTime;

  String _startLottery = '';

  String _baseImgUrl = '';

  ActivityDrawProgressViewModel progressViewModel;

  // 连续点击
  bool isTap = true;

  String _noDataTitle = '';
  String get noDataTitle => _noDataTitle;

  String _noDataHint = '';
  String get noDataHint => _noDataHint;

  String _noNetHint = '';
  String get noNetHint => _noNetHint;

  @override
  Future<bool> onInit() async {

    Map activityMap = config.baseLang['activityDraw'];
    _startLottery = activityMap['startLottery'];
    _baseImgUrl = Api.baseImgUrl;
    _noDataTitle = activityMap['noDataMsg'] ?? '您暂未获得翻牌次数!';
    _noDataHint = activityMap['noDataHint'] ?? '快去投注吧!';
    _noNetHint = activityMap['noNetMsg'] ?? '网络异常，请检查网络后重试';

    await loadQueryWinPrizeUserData();
    return false;
  }

  Future loadQueryWinPrizeUserData() async {
    winPrizeModelList.clear();
    ActivityWinPrizeRspProtocol rspProtocol = await ActivityWinPrizeRepProtocol().request();

    if (rspProtocol.isSuccess) {
      winPrizeModelList.addAll(rspProtocol.winPrizeList);
      await loadData();
    } else {
      if (rspProtocol.isUserNetError) {
        if (!config.userInfo.isLogout()) {
          await sleep(3 * 1000);
          await loadQueryWinPrizeUserData();
        }
      } else {

      }
    }
  }

  Future loadData() async {
    _titleS = '$_startLottery${winPrizeModelList.length}';
    if (winPrizeModelList.isNotEmpty) {
      WinPrizeUserModel prizeUserModel = winPrizeModelList.first;
      _awardType = prizeUserModel.awardType;
      _createTime = prizeUserModel.createTime;

      if (progressViewModel == null) {
        progressViewModel = ActivityDrawProgressViewModel.create(
            createTime: _createTime);
      } else {
        progressViewModel.upData(
            createTime: _createTime);
      }

      _id = prizeUserModel.id;
      _imageList = prizeUserModel.imageList;
      _lotteryId = prizeUserModel.lotteryId;

    }

    // 获取抽奖活动详情
    ActivityDetailRspProtocol detailRepProtocol = await ActivityDetailRepProtocol().request();
    if (detailRepProtocol.isSuccess) {
      ActivityDrawProgressModel progressModel = detailRepProtocol.activityDrawProgressModel;

      if (!progressModel.activityImg.startsWith("http")) {
        if (progressModel.activityImg.startsWith('/'))
          _activityImg = "$_baseImgUrl${progressModel.activityImg}";
        else
          _activityImg = "$_baseImgUrl/${progressModel.activityImg}";
      }

      if (!progressModel.activityImg.startsWith("http")) {
        if (progressModel.activityImg.startsWith('/'))
          _cardImg = "$_baseImgUrl${progressModel.cardImg}";
        else
          _cardImg = "$_baseImgUrl/${progressModel.cardImg}";
      }

      if (!progressModel.floatingImg.startsWith("http")) {
        if (progressModel.floatingImg.startsWith('/'))
          _floatingImg = "$_baseImgUrl${progressModel.floatingImg}";
        else
          _floatingImg = "$_baseImgUrl/${progressModel.floatingImg}";
      }

      if (!progressModel.popupImg.startsWith("http")) {
        if (progressModel.popupImg.startsWith('/'))
          _popupImg = "$_baseImgUrl${progressModel.popupImg}";
        else
          _popupImg = "$_baseImgUrl/${progressModel.popupImg}";
      }

      // 预加载svga图片

      if (isNotEmpty(progressModel.floatingImg)) {
        await xcNetworkImage.NetworkImage(_floatingImg).preLoad();
      }
      if (isNotEmpty(progressModel.popupImg.isNotEmpty)) {
        await xcNetworkImage.NetworkImage(_popupImg).preLoad();
      }

      bool lower = progressModel.activityImg.contains('.svga');

      if (isNotEmpty(progressModel.activityImg.isNotEmpty) && lower) {
        await xcNetworkImage.NetworkImage(_activityImg).preLoad();
      }

      if (progressModel.prizePoolList.isNotEmpty) {
        _prizePoolList.clear();
        for (int i = 0;i< progressModel.prizePoolList.length;i++) {
          PrizePoolModel element = progressModel.prizePoolList[i];
          String lotteryImg = '';
          if (i == 0) {
            lotteryImg = 'activity_draw_large.png';
          } else if (i == 1) {
            lotteryImg = 'activity_draw_big.png';
          } else if (i == 2) {
            lotteryImg = 'activity_draw_middle.png';
          } else {
            lotteryImg = 'activity_draw_small.png';
          }

          ActivityLabelItemViewModel aModel = ActivityLabelItemViewModel.create(
            awardAmount: element.awardAmount,
            awardType: element.awardType,
            poolImg: '$_baseImgUrl${element.poolImg}',
            lotteryImg:'assets/images/activity/$lotteryImg',
          );
          _prizePoolList.add(aModel);
        }
      }
    }
    notifyStateChanged();
  }

  void configAddWinPrizeList(WinPrizeUserModel winPrizeUserModel){
    winPrizeModelList.add(winPrizeUserModel);
    _titleS = '$_startLottery${winPrizeModelList.length}';
    notifyStateChanged();
  }

  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) async {
    return super.refresh(args);
  }
}