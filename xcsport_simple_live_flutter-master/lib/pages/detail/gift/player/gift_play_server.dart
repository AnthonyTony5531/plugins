import 'package:fast_ai/pages/detail/gift/gift_info_model.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:flutter/material.dart';
import 'dart:async';

///
/// 礼物播放服务
///
class GiftPlayServer{

  GiftChannelController _giftChannelController;
  bool _running = false;

  GiftPlayServer._();

  static GiftPlayServer ins = GiftPlayServer._();

  void start(){
    if(_giftChannelController == null){
      _giftChannelController?.stop();
      _giftChannelController = GiftChannelController();
    }
    _running = true;

  }

  void stop(){
    removeAllGift();
    _running = false;
    _giftChannelController?.stop();
    _giftChannelController = null;
  }

  //当从聊天室切换到投注页时将暂停礼物的播放
  void pause(){
    _running = false;
    _giftChannelController?.pause();
  }

  void resume(){
    _running = true;
    _giftChannelController?.resume();
  }

  //////////////////////////////////////////////////////////////////////////////
  //添加与移除数据

  var _gifGiftData = <GiftInfoModel>[];   //接收到他人发出Gif的礼物
  var _myGifGiftData = <GiftInfoModel>[]; //本人发出的Gif礼物
  var _svgaGiftData = <GiftInfoModel>[];   //接收到他人发出Svga的礼物
  var _mySvgaGiftData = <GiftInfoModel>[]; //本人发出的Svga礼物
  var _overallGiftData = <GiftInfoModel>[]; //不同直播间都能收到消息

  //
  void addGift(GiftInfoModel gift){
    if(!_running){
      return;
    }
    if(AiCache.get().getBool(AiCache.gift_play_mode_config) == true){
      removeOtherGift();
      if(gift?.playerId != config?.userInfo?.account?.data?.playerId){
        return;
      }
    }
    if(gift?.playerId == config?.userInfo?.account?.data?.playerId){
      if(gift?.type == GiftType.gif){
        _myGifGiftData?.add(gift);
      } else if(gift?.type == GiftType.svga){
        _myGifGiftData?.add(gift);
        _mySvgaGiftData?.add(gift);
      }
    } else {
      if(gift?.type == GiftType.gif){
        _gifGiftData?.add(gift);
      } else if(gift?.type == GiftType.svga){
        _gifGiftData?.add(gift);
        _svgaGiftData?.add(gift);
      }
    }

  }

  void addOverallGift(GiftInfoModel gift) {
    if(!_running){
      return;
    }
    if(AiCache.get().getBool(AiCache.gift_play_mode_config) == true){
      removeOtherGift();
      if(gift?.playerId != config?.userInfo?.account?.data?.playerId){
        return;
      }
    }
    _overallGiftData?.add(gift);
  }

    //
  void removeGift(GiftInfoModel gift){
    if(_gifGiftData?.contains(gift) ?? false){
      _gifGiftData.remove(gift);
    } else if(_myGifGiftData?.contains(gift) ?? false){
      _myGifGiftData.remove(gift);
    }
  }

  //
  void removeGiftById(String giftId){
    var gift = _gifGiftData?.firstWhere((gift) => gift.giftNo == giftId, orElse: () => null);
    if(_gifGiftData?.contains(gift) ?? false){
      _gifGiftData.remove(gift);
    }
    if(_myGifGiftData?.contains(gift) ?? false){
      _myGifGiftData.remove(gift);
    }
  }


  void removeAllGift(){
    _gifGiftData?.clear();
    _myGifGiftData?.clear();
    _svgaGiftData?.clear();
    _mySvgaGiftData?.clear();
    _overallGiftData?.clear();
  }

  void removeOtherGift(){
    _gifGiftData?.clear();
    _svgaGiftData?.clear();
  }

  //是否有下个礼物需要播放
  bool hasNextGifGift(){
    if((_gifGiftData?.isNotEmpty ?? false) && _gifGiftData.length > 0){
      return true;
    }
    return false;
  }

  //是否有下个礼物需要播放
  bool hasNextOverallGifGift(){
    if((_overallGiftData?.isNotEmpty ?? false) && _overallGiftData.length > 0){
      return true;
    }
    return false;
  }

  //是否有本人发送的下个礼物待播放
  bool hasMyNextGifGift(){
    if((_myGifGiftData?.isNotEmpty ?? false) && _myGifGiftData.length > 0){
      return true;
    }
    return false;
  }

  //是否有下个礼物需要播放
  bool hasNextSvgaGift(){
    if((_svgaGiftData?.isNotEmpty ?? false) && _svgaGiftData.length > 0){
      return true;
    }
    return false;
  }

  //是否有本人发送的下个礼物待播放
  bool hasMyNextSvgaGift(){
    if((_mySvgaGiftData?.isNotEmpty ?? false) && _mySvgaGiftData.length > 0){
      return true;
    }
    return false;
  }


  void bindGifChannelPlayController({GiftPlayController controller,int channelIndex}){
    _giftChannelController?.bindGifChannelPlayController(controller:controller,channelIndex: channelIndex);
  }


  void bindSvgaChannelPlayController({GiftPlayController c}){
    _giftChannelController?.bindSvgaChannelPlayController(controller:c);
  }

  void bindOverallGifChannelPlayController({GiftPlayController controller}){
    _giftChannelController?.bindOverallGifChannelPlayController(controller:controller);
  }


  GiftPlayChannel getGifPlayChannel(int channelIndex){
    return _giftChannelController?.getGifPlayChannel(channelIndex);
  }


  GiftPlayChannel getSvgaPlayChannel(){
    return _giftChannelController?.getSvgaPlayChannel();
  }

  GiftPlayChannel getOverallGifPlayChannel(){
    return _giftChannelController?.getOverallGifPlayChannel();
  }


  //播放控制
  //@position 礼物被展示的位置
  GiftInfoModel getGift2Play(int position){
    if(!_running){
      return null;
    }
    if(AiCache.get().getBool(AiCache.gift_play_mode_config) == true){
      removeOtherGift();
    }
    var gift;
    if(position == 0 && hasMyNextGifGift()){
      gift = _myGifGiftData.firstWhere((data) => data.type == GiftType.svga, orElse: ()=>null);
      if(gift == null){
        gift = _myGifGiftData[0];
      }
      _myGifGiftData.remove(gift);
    } else if(position == 1 && hasNextGifGift()) {
      gift = _gifGiftData.firstWhere((data) => data.type == GiftType.svga, orElse: ()=>null);
      if(gift == null){
        gift = _gifGiftData[0];
      }
      _gifGiftData.remove(gift);
    }
    return gift;
  }

  //播放控制
  //@position 礼物被展示的位置
  GiftInfoModel getOverallGiftPlay(int position){
    if(!_running){
      return null;
    }
    if(AiCache.get().getBool(AiCache.gift_play_mode_config) == true){
      removeOtherGift();
    }
    var gift;
    if(hasNextOverallGifGift()){
      gift = _overallGiftData[0];
      _overallGiftData.remove(gift);
    }
    return gift;
  }

  //播放控制
  //@position 礼物被展示的位置
  GiftInfoModel getSvgaGift2Play(){
    if(!_running){
      return null;
    }
    if(AiCache.get().getBool(AiCache.gift_play_mode_config) == true){
      removeOtherGift();
    }
    var gift;
    if(hasMyNextSvgaGift()){
      gift = _mySvgaGiftData[0];
      _mySvgaGiftData.remove(gift);
    } else if(hasNextSvgaGift()) {
      gift = _svgaGiftData[0];
      _svgaGiftData.remove(gift);
    }
    return gift;
  }

}

///
class GiftPlayChannel{
  GiftInfoModel data;
  int startTime;
  GiftPlayStatus giftPlayStatus;
  VoidCallback play;
  VoidCallback stop;

  GiftPlayChannel({this.data,this.startTime,this.play,this.stop,this.giftPlayStatus});
}

///
class GiftChannelController{
  static const int minPlayTime = 1000;    //最短播放时间
  static const int normalPlayTime = 3000; //正常播放时长
  static const int overallPlayTime = 7000; //全局动画播放时长
  GiftPlayChannel _gifChannel0;
  GiftPlayChannel _gifChannel1;
  GiftPlayChannel _svgaChannel;
  GiftPlayChannel _overallGiftChannel;


  GiftPlayController _gifChannelPlayController0;
  GiftPlayController _gifChannelPlayController1;
  GiftPlayController _svgaChannelPlayController;
  GiftPlayController _overallGifChannelPlayController;

  Timer _timer;
  bool _running = false;

  GiftChannelController(){
    _running = true;
    _timer = Timer.periodic(Duration(milliseconds: 100), timerCallback);

    _gifChannel0 = GiftPlayChannel(
      giftPlayStatus: GiftPlayStatus.Stopped,
      play: (){
        if(_gifChannelPlayController0 != null && _gifChannelPlayController0.play != null){
          _gifChannelPlayController0.play();
        }
      },
      stop: (){
        if(_gifChannelPlayController0 != null && _gifChannelPlayController0.stop != null){
          _gifChannelPlayController0.stop();
        }
      }
    );
    _gifChannel1 = GiftPlayChannel(
      giftPlayStatus: GiftPlayStatus.Stopped,
        play: (){
          if(_gifChannelPlayController1 != null && _gifChannelPlayController1.play != null){
            _gifChannelPlayController1.play();
          }
        },
        stop: (){
          if(_gifChannelPlayController1 != null && _gifChannelPlayController1.stop != null){
            _gifChannelPlayController1.stop();
          }
        }
    );
    _svgaChannel = GiftPlayChannel(
        play: (){
          if(_svgaChannelPlayController != null && _svgaChannelPlayController.play != null){
            _svgaChannelPlayController.play();
          }
        },
        stop: (){
          if(_svgaChannelPlayController != null && _svgaChannelPlayController.stop != null){
            _svgaChannelPlayController.stop();
          }
        }
    );
    _overallGiftChannel = GiftPlayChannel(
        giftPlayStatus: GiftPlayStatus.Stopped,
        play: (){
          if(_overallGifChannelPlayController != null && _overallGifChannelPlayController.play != null){
            _overallGifChannelPlayController.play();
          }
        },
        stop: (){
          if(_overallGifChannelPlayController != null && _overallGifChannelPlayController.stop != null){
            _overallGifChannelPlayController.stop();
          }
        }
    );
  }


  ///
  void bindSvgaChannel({GiftPlayChannel svgaChannel}){
    this._svgaChannel = svgaChannel;
  }

  void bindGifChannelPlayController({GiftPlayController controller,int channelIndex}){
    if(channelIndex == 0){
      _gifChannelPlayController0 = controller;
    }
    if(channelIndex == 1){
      _gifChannelPlayController1 = controller;
    }
  }

  void bindOverallGifChannelPlayController({GiftPlayController controller}){
    _overallGifChannelPlayController = controller;
  }

  void bindSvgaChannelPlayController({GiftPlayController controller}){
    _svgaChannelPlayController = controller;
  }

  GiftPlayChannel getGifPlayChannel(int channelIndex){
    if(channelIndex == 0){
      return _gifChannel0;
    } else if(channelIndex == 1){
      return _gifChannel1;
    }
    return null;
  }
  GiftPlayChannel getSvgaPlayChannel(){
    return _svgaChannel;
  }

  GiftPlayChannel getOverallGifPlayChannel(){
    return _overallGiftChannel;
  }

  ///
  void stop(){
    pause();
    _timer?.cancel();
    _gifChannel0 = null;
    _gifChannel1 = null;
    _svgaChannel = null;
    _overallGiftChannel = null;
  }

  ///
  void pause(){
    _running = false;
    if(_gifChannel0 != null && _gifChannel0.stop != null){
      _gifChannel0?.stop();
    }
    if(_gifChannel1 != null && _gifChannel1.stop != null){
      _gifChannel1?.stop();
    }
    if(_gifChannel1 != null && _gifChannel1.stop != null){
      _svgaChannel?.stop();
    }
    if(_overallGiftChannel != null && _overallGiftChannel.stop != null){
      _overallGiftChannel?.stop();
    }
  }

  ///
  void resume(){
    _running = true;
  }

  /// 1.gif礼物显示在侧面，用户自己发送的显示在上方，其他用户送的显示在下方
  /// 2.gif礼物其他用户送的礼物如果后面没有新的礼物序列，则显示3s之后消失，若是有新的礼物队列，则显示1s之后就切换到下个礼物效果
  /// 3.svga礼物需要全屏展示，在展示过程中需要侧面也出现一条（gif礼物）的样式，显示送礼的昵称，礼物名字，礼物png，数量
  /// 4.全屏svga礼物的逻辑是，没有新的礼物就播放当前的礼物直到结束，播放中有新的礼物就播放3s之后换成下一个礼物的效果，
  ///   自己送的礼物直接插播，播放完成之后再按照上述逻辑播放剩余队列
  /// 5.全屏svga礼物侧面的推送效果要展示3s，展示完之后再展示后面的礼物（svga，gif，优先级svga>gif）
  /// 6.gif和svga的礼物送出都要有聊天室的文字推送（无论是否简洁模式）
  void timerCallback(timer){
    if(!_running){
      return;
    }

    handleGifChannel0();
    handleGifChannel1();
    handleSvgaChannel();
    handleOverallGifChannel();
  }

  void handleGifChannel0(){
    if(_gifChannel0 != null){
      if(_gifChannel0.data == null){
        var gift = GiftPlayServer.ins.getGift2Play(0);
        if(gift != null){
          _gifChannel0.data = gift;
          _gifChannel0.giftPlayStatus = GiftPlayStatus.Play;
          _gifChannel0.startTime = DateTime.now().millisecondsSinceEpoch;
          if(_gifChannel0?.play != null){
            _gifChannel0?.play();
          }
        }
      } else if(GiftPlayServer.ins.hasMyNextGifGift() ) {
        if(_gifChannel0?.data?.type == GiftType.svga) {
          if(DateTime.now().millisecondsSinceEpoch - (_gifChannel0?.startTime ?? DateTime.now().millisecondsSinceEpoch) < normalPlayTime){
            return;
          }
        } else {
          if(DateTime.now().millisecondsSinceEpoch - (_gifChannel0?.startTime ?? DateTime.now().millisecondsSinceEpoch) < minPlayTime){
            return;
          }
        }

        if(_gifChannel0?.stop != null && (_gifChannel0.giftPlayStatus == GiftPlayStatus.Play || _gifChannel0.giftPlayStatus == GiftPlayStatus.Playing)){
          _gifChannel0?.stop();
          return;
        }
        if(_gifChannel0.giftPlayStatus == GiftPlayStatus.Stopping){
          return;
        }
        var gift = GiftPlayServer.ins.getGift2Play(0);
        if(gift != null){
          _gifChannel0.data = gift;
          _gifChannel0.giftPlayStatus = GiftPlayStatus.Play;
          _gifChannel0.startTime = DateTime.now().millisecondsSinceEpoch;
          if(_gifChannel0?.play != null){
            _gifChannel0?.play();
          }
        }

      } else if(!GiftPlayServer.ins.hasMyNextGifGift() && DateTime.now().millisecondsSinceEpoch - (_gifChannel0.startTime ?? DateTime.now().millisecondsSinceEpoch) > normalPlayTime) {
        if(_gifChannel0?.stop != null && (_gifChannel0.giftPlayStatus == GiftPlayStatus.Play || _gifChannel0.giftPlayStatus == GiftPlayStatus.Playing)){
          _gifChannel0?.stop();
          return;
        }
        if(_gifChannel0.giftPlayStatus == GiftPlayStatus.Stopping){
          return;
        }
        _gifChannel0.data = null;
        _gifChannel0.startTime = null;
      }
    }
  }

  void handleGifChannel1(){//非自己通道
    if(AiCache.get().getBool(AiCache.gift_play_mode_config) == true){
      if(_gifChannel1?.stop != null && (_gifChannel1.giftPlayStatus == GiftPlayStatus.Play || _gifChannel1.giftPlayStatus == GiftPlayStatus.Playing)){
        _gifChannel1?.stop();
      }
      return;
    }
    if(_gifChannel1 != null) {
      if(GiftPlayServer.ins.hasNextGifGift() && _gifChannel1.data == null) {
        var gift = GiftPlayServer.ins.getGift2Play(1);
        if(gift != null) {
          _gifChannel1.data = gift;
          _gifChannel1.giftPlayStatus = GiftPlayStatus.Play;
          _gifChannel1.startTime = DateTime.now().millisecondsSinceEpoch;
          if(_gifChannel1?.play != null){
            _gifChannel1?.play();
          }
        }
      } else if(GiftPlayServer.ins.hasNextGifGift()) {
        if(_gifChannel1?.data?.type == GiftType.svga) {
          if(DateTime.now().millisecondsSinceEpoch - (_gifChannel1?.startTime ?? DateTime.now().millisecondsSinceEpoch) < normalPlayTime){
            return;
          }
        } else {
          if(DateTime.now().millisecondsSinceEpoch - (_gifChannel1?.startTime ?? DateTime.now().millisecondsSinceEpoch) < minPlayTime){
            return;
          }
        }
        if(_gifChannel1?.stop != null && (_gifChannel1.giftPlayStatus == GiftPlayStatus.Play || _gifChannel1.giftPlayStatus == GiftPlayStatus.Playing)){
          _gifChannel1?.stop();
          return;
        }
        if(_gifChannel1.giftPlayStatus == GiftPlayStatus.Stopping){
          return;
        }
        var gift = GiftPlayServer.ins.getGift2Play(1);
        if(gift != null) {
          _gifChannel1.data = gift;
          _gifChannel1.giftPlayStatus = GiftPlayStatus.Play;
          _gifChannel1.startTime = DateTime.now().millisecondsSinceEpoch;
          if(_gifChannel1?.play != null){
            _gifChannel1?.play();
          }
        }
      } else if(!GiftPlayServer.ins.hasNextGifGift() && DateTime.now().millisecondsSinceEpoch - (_gifChannel1.startTime ?? DateTime.now().millisecondsSinceEpoch) > normalPlayTime) {
        if(_gifChannel1?.stop != null && (_gifChannel1.giftPlayStatus == GiftPlayStatus.Play || _gifChannel1.giftPlayStatus == GiftPlayStatus.Playing)){
          _gifChannel1?.stop();
          return;
        }
        if(_gifChannel1.giftPlayStatus == GiftPlayStatus.Stopping){
          return;
        }
        _gifChannel1.data = null;
        _gifChannel1.startTime = null;
      }
    }
  }

  void handleSvgaChannel(){
    if(AiCache.get().getBool(AiCache.gift_play_mode_config) == true){
      if(_svgaChannel?.stop != null && _svgaChannel?.data?.playerId != config?.userInfo?.account?.data?.playerId && (_svgaChannel.giftPlayStatus == GiftPlayStatus.Play || _svgaChannel.giftPlayStatus == GiftPlayStatus.Playing)){
        _svgaChannel?.stop();
        _svgaChannel?.data = null;
        _svgaChannel.giftPlayStatus = GiftPlayStatus.Stopped;
        return;
      }
    }

    if(_svgaChannel.giftPlayStatus == GiftPlayStatus.Play){
      if(_svgaChannel?.play != null){
        _svgaChannel?.play();
      }
    }

    //播放svga通道顺充控制
    if(_svgaChannel != null){
      if(_svgaChannel.data == null){
        var gift = GiftPlayServer.ins.getSvgaGift2Play();
        if(gift != null){
          //print("svga=====================第一次收到");
          _svgaChannel.data = gift;
          _svgaChannel.giftPlayStatus = GiftPlayStatus.Play;
          _svgaChannel.startTime = DateTime.now().millisecondsSinceEpoch;
          if(_svgaChannel?.play != null){
            _svgaChannel?.play();
          }
        }
      } else if(GiftPlayServer.ins.hasMyNextSvgaGift()) {
        //print("svga=====================我发的");
        if(_svgaChannel?.stop != null && (_svgaChannel.giftPlayStatus == GiftPlayStatus.Play || _svgaChannel.giftPlayStatus == GiftPlayStatus.Playing)){
          _svgaChannel?.stop();
        }
        if(_svgaChannel.giftPlayStatus == GiftPlayStatus.Stopping){
        }
        var gift = GiftPlayServer.ins.getSvgaGift2Play();
        if(gift != null){
          _svgaChannel.data = gift;
          _svgaChannel.giftPlayStatus = GiftPlayStatus.Play;
          _svgaChannel.startTime = DateTime.now().millisecondsSinceEpoch;
          if(_svgaChannel?.play != null){
            _svgaChannel?.play();
          }
        }
      } else if(GiftPlayServer.ins.hasNextSvgaGift() && DateTime.now().millisecondsSinceEpoch - (_svgaChannel.startTime ?? DateTime.now().millisecondsSinceEpoch) > normalPlayTime) {
        //print("svga  ${_svgaChannel?.data?.playerId}    ${config?.userInfo?.account?.data?.playerId}     ${_svgaChannel.giftPlayStatus}");
        if(_svgaChannel?.data?.playerId == config?.userInfo?.account?.data?.playerId && //
            (_svgaChannel.giftPlayStatus == GiftPlayStatus.Play || //
             _svgaChannel.giftPlayStatus == GiftPlayStatus.Playing))//
        {
          return;
        }

        //print("svga=====================大于3秒------------${DateTime.now().millisecondsSinceEpoch}");
        if(_svgaChannel?.stop != null && (_svgaChannel.giftPlayStatus == GiftPlayStatus.Play || _svgaChannel.giftPlayStatus == GiftPlayStatus.Playing)){
          _svgaChannel?.stop();
        }
        if(_svgaChannel.giftPlayStatus == GiftPlayStatus.Stopping){
        }
        var gift = GiftPlayServer.ins.getSvgaGift2Play();
        if(gift != null){
          _svgaChannel.data = gift;
          _svgaChannel.giftPlayStatus = GiftPlayStatus.Play;
          _svgaChannel.startTime = DateTime.now().millisecondsSinceEpoch;
          if(_svgaChannel?.play != null){
            _svgaChannel?.play();
          }
        }
      }
    }
  }

  void handleOverallGifChannel(){
    if(_overallGiftChannel != null){
      if(_overallGiftChannel.data == null){
        var gift = GiftPlayServer.ins.getOverallGiftPlay(0);
        if(gift != null){
          _overallGiftChannel.data = gift;
          _overallGiftChannel.giftPlayStatus = GiftPlayStatus.Play;
          _overallGiftChannel.startTime = DateTime.now().millisecondsSinceEpoch;
          if(_overallGiftChannel?.play != null){
            _overallGiftChannel?.play();
          }
        }
      }
      else if(GiftPlayServer.ins.hasNextOverallGifGift() ) {
        if(DateTime.now().millisecondsSinceEpoch - (_overallGiftChannel?.startTime ?? DateTime.now().millisecondsSinceEpoch) < overallPlayTime){
          return;
        }
        if(_overallGiftChannel?.stop != null && (_overallGiftChannel.giftPlayStatus == GiftPlayStatus.Play || _overallGiftChannel.giftPlayStatus == GiftPlayStatus.Playing)){
          _overallGiftChannel?.stop();
          return;
        }
        if(_overallGiftChannel.giftPlayStatus == GiftPlayStatus.Stopping){
          return;
        }
        var gift = GiftPlayServer.ins.getOverallGiftPlay(0);
        if(gift != null){
          _overallGiftChannel.data = gift;
          _overallGiftChannel.giftPlayStatus = GiftPlayStatus.Play;
          _overallGiftChannel.startTime = DateTime.now().millisecondsSinceEpoch;
          if(_overallGiftChannel?.play != null){
            _overallGiftChannel?.play();
          }
        }
      }else if(!GiftPlayServer.ins.hasNextOverallGifGift() && DateTime.now().millisecondsSinceEpoch - (_overallGiftChannel.startTime ?? DateTime.now().millisecondsSinceEpoch) > overallPlayTime) {
        if(_overallGiftChannel?.stop != null && (_overallGiftChannel.giftPlayStatus == GiftPlayStatus.Play || _overallGiftChannel.giftPlayStatus == GiftPlayStatus.Playing)){
          _overallGiftChannel?.stop();
          return;
        }
        if(_overallGiftChannel.giftPlayStatus == GiftPlayStatus.Stopping){
          return;
        }
        _overallGiftChannel.data = null;
        _overallGiftChannel.startTime = null;
      }
    }
  }

}

class GiftPlayController{
  VoidCallback play;
  VoidCallback stop;

  GiftPlayController({this.play,this.stop});
}

enum GiftPlayStatus{
  Ready,
  Play,
  Playing,
  Stopping,
  Stopped,
}




























