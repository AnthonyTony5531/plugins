import 'package:dio/dio.dart';
import 'package:fast_ai/api/protocols/detail/anchor_banner_protocol.dart';
import 'package:fast_ai/utils/time_watch.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';

import 'aibanner_single/aibanner_single_model.dart';

class AiBannerModel {

  int currentIndex = 0;
  List<AiBannerSingleModel> _bannerModels = [];
  TimeWatch timeWatch = TimeWatch(Duration(minutes: 5));
  TimeWatch timeWatchReqGame = TimeWatch(Duration(minutes: 1));
  CancelToken cancelRequestToken = CancelToken();
  bool isHandleRequest = false; //偶尔刷新时盘口不显示

  Future<List<AiBannerSingleModel> > onRequestFinished(List<AiBannerSingleModel> items) async{
    return items;
  }

  AnchorBannerReqProtocol anchorReq = AnchorBannerReqProtocol();
  Future<bool> requestAnchorBanner({VoidCallback callBack, ValueChanged<bool> onIsSuccess}) async{
    try{
      var rsp = await anchorReq.request();
      onIsSuccess?.call(rsp?.isSuccess ?? false);
      List<AiBannerSingleModel>  models = [];
      rsp.banners.forEach((f){
        models.add(AiBannerSingleModel().fromBannersRspProtocol(f));
      });
      models.sort((a,b){
        return a.orders.compareTo(b.orders);
      });
      _bannerModels = models;
    }
    catch(e){
      onIsSuccess?.call(false);
      print('banner错误-----:$e');
    }
    if(callBack != null){
      callBack();
    }
    return Future.value(true);
  }

  void updateBannerModels(List<AiBannerSingleModel>models ){
    if(models == null || models.length == 0)
      return;
    _bannerModels.clear();
    _bannerModels.addAll(models);
  }

  List<AiBannerSingleModel> get enableBanners{
    var rets = _bannerModels.where((f)=>f.enable).toList();
    // rets = rets.take(5).toList();
    return rets;
  }

  // 平台活动
  List<AiBannerSingleModel> filterActivityBanner(){
    List<AiBannerSingleModel> banners = [];
    _bannerModels.forEach((value){
      if(value?.url != null && value?.bannerType == 3){
        banners.add(value);
      }
    });
    _bannerModels.clear();
    _bannerModels.addAll(banners);
    return _bannerModels;
  }

  List<AiBannerSingleModel> get gameBanners{
    return _bannerModels.where((f)=>f.actionType == ActionType.Game || f.actionType == ActionType.Video).toList();
  }

  int get hotBanners{
    return _bannerModels.length;
  }

  AiBannerSingleModel get currentBanner{
    var curIndex = this.currentIndex;
    var enableBanners = this.enableBanners;
    if(curIndex < enableBanners.length)
      return (enableBanners[curIndex]);
    else
      return null;
  }

  void clear()async{
    isHandleRequest = false;
    cancelRequestToken?.cancel(stopAllRequestError);
    await sleep(100);
    cancelRequestToken = CancelToken();
    _bannerModels = [];
    timeWatch.reset();
    timeWatchReqGame.reset();
  }

  static String stopAllRequestError = 'stop before request';
  void reset()async{
    isHandleRequest = false;
    cancelRequestToken?.cancel(stopAllRequestError);
    await sleep(100);
    cancelRequestToken = CancelToken();
    timeWatch.reset();
    timeWatchReqGame.reset();
  }
}

