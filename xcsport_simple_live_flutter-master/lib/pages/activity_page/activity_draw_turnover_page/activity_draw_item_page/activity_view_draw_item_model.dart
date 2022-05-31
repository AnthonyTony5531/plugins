import 'dart:math';
import 'dart:typed_data';

import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_picture_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_item_page/activity_common_util.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_item_page/activity_draw_item_style.dart';
import 'package:fast_ai/widgets/imagecache/xc_cache_file_image.dart';
import 'package:flutter/cupertino.dart';

class ActivityDrawItemViewModel
    extends StatefulViewModel<ActivityDrawItemStyle> {
  String image; // 正面图片地址
  String cardImg; // 卡片背面图片
  String imageLevel; // 图片等级
  bool isFront; // 是否翻牌了
  double width;
  double height;
  List<String> images;
  List<ActivityPictureModel> modelList;

  ActivityDrawItemViewModel.create({
    @required this.width,
    @required this.height,
    @required this.images,
    @required this.modelList,
  });

  void upData({
    @required String image,
    @required String cardImg,
    @required String imageLevel,
    @required bool isFront,
  }) {
    this.cardImg = cardImg;
    this.image = image;
    this.imageLevel = imageLevel;
    this.isFront = isFront;
  }

  ActivityDrawItemViewModel();

  @override
  List<ActivityDrawItemStyle> get styleList => [ActivityDrawItemStyle()];

  XcCacheFileImage _cacheFileImage = XcCacheFileImage();

  String _urlImg = '';

  String get urlImg => _urlImg;

  Uint8List cacheBytes;

  num status = 0;

  List<String> stringList = ['A','B','C','D'];

  // 发奖成功之后的状态
  bool sendSuccess = false;
//  bool isLast = false; // 是否是第九张

  String _thanksImg = 'assets/images/activity/activity_draw_thanks.png';

  void upSuccess({bool sendSuccess}) {
    this.sendSuccess = sendSuccess ?? this.sendSuccess;
    notifyStateChanged();
  }

//  void upIsLast({bool isLast}) {
//    this.isLast = isLast ?? this.isLast;
//    print('第九张====');
//    notifyStateChanged();
//  }

//  Future upLastData() async {
//    if (cacheBytes != null) {
//      cacheBytes = null;
//    }
//    activityConfig.acNumber += 1;
//    String imageLevel = images[8];
//
//    ActivityPictureModel pictureModel =
//    modelList.firstWhere((element) => element.imageLevel == imageLevel);
//    cacheBytes = await _cacheFileImage.getFileBytes(pictureModel.imageS);
//    upData(
//        image: pictureModel.image,
//        cardImg: cardImg,
//        imageLevel: pictureModel.imageLevel,
//        isFront: true);
//    print('activityConfig.showFloatActivityDraw====翻牌---是否开启--${activityConfig.showFloatActivityDraw}');
//    if (activityConfig.showFloatActivityDraw == false) {
//      cacheBytes = null;
//      activityConfig.thankNum += 1;
//      _urlImg = _thanksImg;
//    } else {
//      if (cacheBytes == null) {
//        _urlImg = pictureModel.image;
//      } else {
//
//      }
//    }
//
//    notifyStateChanged();
//  }

    // 发奖成功之后调用
  Future upSuccessData() async {
    var rng = new Random();
    int imgInt = rng.nextInt(stringList.length);
    String imageLevel = stringList[imgInt];
    ActivityPictureModel pictureModel =
    modelList.firstWhere((element) => element.imageLevel == imageLevel);
    cacheBytes = await _cacheFileImage.getFileBytes(pictureModel.imageS);
    if (cacheBytes == null) {
      _urlImg = pictureModel.image;
    }

//    if (activityConfig.thankNum >= 3) {
//      if (cacheBytes == null) {
//        _urlImg = pictureModel.image;
//      }
//    }
//
//    if (activityConfig.thankNum <= 2 && activityConfig.thankNum != 0) {
//      cacheBytes = null;
//      _urlImg = _thanksImg;
//    }

    notifyStateChanged();
  }

  // 翻牌后刷新图片
  Future upModelData() async {
    if (cacheBytes != null) {
      cacheBytes = null;
    }


    if (activityConfig.acNumber > images.length) {

      cacheBytes = null;
      _urlImg = _thanksImg;
      isFront = true;

    } else {
      String image = images[activityConfig.acNumber - 1];
      ActivityPictureModel pictureModel =
      modelList.firstWhere((element) => element.imageLevel == image);
      cacheBytes = await _cacheFileImage.getFileBytes(pictureModel.imageS);
      if (activityConfig.acNumber >= 3) {
        if (activityConfig.showFloatActivityDraw == false) {
          cacheBytes = null;
          _urlImg = _thanksImg;
        } else {
          upData(
              image: pictureModel.image,
              cardImg: cardImg,
              imageLevel: pictureModel.imageLevel,
              isFront: true);
          _urlImg = pictureModel.image;
        }
      } else {
        upData(
            image: pictureModel.image,
            cardImg: cardImg,
            imageLevel: pictureModel.imageLevel,
            isFront: true);
        _urlImg = pictureModel.image;
      }
    }
    notifyStateChanged();
    activityConfig.isTurn = true;
  }

  @override
  void onAttach() {}

  @override
  Future<bool> onInit() {
    _urlImg = this.cardImg;
    return super.onInit();
  }

  //这是给外面掉用的
  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) async {
    return super.refresh();
  }

  @override
  void onDispose() {
    super.onDispose();
  }
}
