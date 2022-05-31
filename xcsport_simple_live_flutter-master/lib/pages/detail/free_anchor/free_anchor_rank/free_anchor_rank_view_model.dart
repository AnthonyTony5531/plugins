import 'dart:async';

import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:fast_ai/api/protocols/detail/wish_gift_protocol.dart';
import 'package:fast_ai/api/protocols/rank/anchor_charm_rank.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/free_anchor/free_anchor_model/wish_gift_model.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/util.dart';
import 'free_anchor_rank_view_style.dart';

///生命周期onAttach->onInit->onDetach->onDispose. refresh不属于生命周期，外面掉用，外部没调用可以不实现。
//其中onAttach, onDetach属于视图的生命周期期间同步方法
class FreeAnchorRankViewModel extends StatefulViewModel<FreeAnchorRankViewStyle> {
  FreeAnchorRankViewModel();

  int anchorRank = 0;
  List<WishGiftModel> wishGifts = [];

  Timer _updateTimer;

  String _anchorId;
  String _liveId;
  num _wishGiftSwitch = 0; // 心愿礼物开关(0=关闭 1=开启)
  bool _isFreeLiveGameAnchor = false;

  void initModel(String anchorId, String liveId, num giftSwitch, bool isFreeLiveGameAnchor) {
    bool isRefresh = _anchorId != anchorId;
    _anchorId = anchorId;
    _liveId = liveId;
    _wishGiftSwitch = giftSwitch;
    _isFreeLiveGameAnchor = isFreeLiveGameAnchor ?? false;

    if (isRefresh) {
      _loadData();
      // 开启定时器
      _updateTimer?.cancel();
      _updateTimer = Timer(Duration(seconds: 30), () => _loadWishGifts());
    } else {
      if (_wishGiftSwitch == 0) {
        wishGifts.clear();
        notifyStateChanged();
      }
    }
  }

  Future<void> _loadData() async {
    if(_isFreeLiveGameAnchor){
      // 游戏播 - 魅力榜
      AnchorCharmRepProtocol protocol = AnchorCharmRepProtocol(
        url: '/anchorCharmRank',
        params: {'walletId': config.userInfo.walletId},
      );
      var req = await protocol.request();
      if (req.isSuccess) {
        for (int index = 0; index < req.dataList.length; index++) {
          var element = req.dataList[index];
          if (element.anchorId == _anchorId && !isStrNullOrEmpty(_anchorId)) {
            anchorRank = index + 1;
            break;
          }
        }
        notifyStateChanged();
      }
    }else{
      // 主播贡献榜
      AnchorCharmRepProtocol protocol = AnchorCharmRepProtocol(
        url: '/orderQueryServer/api/c/anchor/ballKingRank',
        params: {'walletId': config.userInfo.walletId},
      );
      var req = await protocol.request();
      if (req.isSuccess) {
        for (int index = 0; index < req.dataList.length; index++) {
          var element = req.dataList[index];
          if (element.anchorId == _anchorId && !isStrNullOrEmpty(_anchorId)) {
            anchorRank = index + 1;
            break;
          }
        }
        notifyStateChanged();
      }
    }
    await _loadWishGifts();
  }

  // 主播心愿礼物
  Future<void> _loadWishGifts() async {
    if (_wishGiftSwitch == 0) return;
    WishGiftReqProtocol protocol = WishGiftReqProtocol(liveId: _liveId);
    var req = await protocol.request();

    if (req.isSuccess) {
      wishGifts.clear();
      req.giftData.forEach((element) {
        WishGiftModel model = WishGiftModel().fromWishGiftReqProtocol(element);
        String text = '${model.giftName}(${model.implementationNumber}/${model.number})';
        double width = AiMeasure.measureTextWidth(text, style.rankStyle);
        model.giftWidth = width;
        wishGifts.add(model);
      });
      notifyStateChanged();
    }
  }

  //view 摧毁时候会调用，或者model变更被移除的时候也会被执行
  @override
  void onDispose() {
    _updateTimer?.cancel();
  }

  @override
  List<FreeAnchorRankViewStyle> get styleList => [FreeAnchorRankViewStyle()];
}
