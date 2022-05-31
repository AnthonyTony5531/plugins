import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_topbar/live_topbar_model.dart';
import 'package:fast_ai/utils/model_controller_builder.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_controller.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';

class AIVideoPlayerController {
  var baseLang = config.langMap['baseLang'];

  /// 虚拟关闭投注
  bool isVirtualMatchOver = false;
  /// 是否是虚拟
  bool isVirtual = false;

  AiVideoController playerController;

  var anyAction = VoidListener();
  var matchOverListener = MatchOverListener();

  String animateLiveUrl;

  bool get hasAnimateLive {
    return !isNullOrEmpty(animateLiveUrl);
  }


  bool get hasVideLive {
    return false;
    // return toolPanel.anchorSelectorFull.currentModel.currentAnchor != null &&
    //     (toolPanel?.anchorSelectorFull?.currentModel?.anchors?.length ?? 0) > 0;
  }

  static bool hasShowTips = false;

  void  shouldShowToastWhenMobileTryPlay() {
    bool isNotWifi = config.isConnectMobile;
    //LogCollectUtil.collect('isNotWifi $isNotWifi');
    // bool isOnlyWifi = cfg.fluxMode == AiFluxMode.OnlyWifi;
    //LogCollectUtil.collect('isOnlyWifi $isOnlyWifi');
    bool hasVideLive = this.hasVideLive;
    //LogCollectUtil.collect('hasVideLive $hasVideLive');
    if (!hasShowTips && hasVideLive && isNotWifi && config.isApp) {
      hasShowTips = true;
      showToas(config.langMap['baseLang']['flux_tips']);
    }
  }

  bool get needShowFluxWidget {
    return false;
//     bool isNotWifi = config.isConnectMobile;
//     //LogCollectUtil.collect('isNotWifi $isNotWifi');
//     bool isOnlyWifi = cfg.fluxMode == AiFluxMode.OnlyWifi;
//     //LogCollectUtil.collect('isOnlyWifi $isOnlyWifi');
//     bool hasVideLive = this.hasVideLive;
//     //LogCollectUtil.collect('hasVideLive $hasVideLive');
//     if (!hasShowTips && hasVideLive && isNotWifi) {
//       hasShowTips = true;
// //      showToas("您当前为非WIFI环境，请注意流量消耗");
//       showToas(config.langMap['baseLang']['flux_tips']);
//     }
//     return isNotWifi && isOnlyWifi && hasVideLive && !config.isApp;
  }

  void updateExtendModel(ExtendModel extend, DetailParams detailParams, bool isFreeAnchor) {
    animateLiveUrl = extend?.data?.animateLiveUrl;
    var anchors = extend.getAnchorList(detailParams, isFreeAnchor ?? false);
    //toolPanel.updateAnchors(anchors, detailParams.anchorId, isFreeAnchor: isFreeAnchor);
  }

  void updatePageModel(DPageModel pageModel, ExtendModel extendModel, FootballAuxiliaryData footballAuxiliaryData) {
    freshTopBar(pageModel, extendModel, footballAuxiliaryData);
    freshBottomBar(pageModel);
  }

  void freshTopBar(DPageModel pageModel, ExtendModel extendModel, FootballAuxiliaryData footballAuxiliaryData) {
    String showType = string(pageModel.matchesDetailModel?.data?.showtype);
    //toolPanel.topbar.currentModel.update(pageModel, extendModel);
    // toolPanel.topbar.currentModel.extendModel = extendModel;
    // //如果是足球
    // if ("FT" == toolPanel.topbar.currentModel.gameType && showType == 'RB') {
    //   toolPanel.topbar.currentModel.auxiliaryData = footballAuxiliaryData;
    // }
    // toolPanel.topbar.update();
  }

  void freshBottomBar(DPageModel pageModel) {
    // toolPanel.bottombar.currentModel.update(pageModel);
    // toolPanel.bottombar.update();
  }

  dispose() {
    // videoPlayer.dispose();
    // toolPanel.setPlayer(null);
    // videoPlayer.setPlayer(null);
  }
}