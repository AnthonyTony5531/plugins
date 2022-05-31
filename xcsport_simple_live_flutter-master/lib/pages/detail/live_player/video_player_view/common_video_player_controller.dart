import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/live_player/live_player_config.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_topbar/live_topbar_model.dart';
import 'package:fast_ai/utils/model_controller_builder.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_controller.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';

import 'controller/tool_panel_controller.dart';

class CommonVideoPlayerController {
  /// 虚拟关闭投注
  bool isVirtualMatchOver = false;
  /// 是否是虚拟
  bool isVirtual = false;

  ToolPanelController toolPanel;

  AiVideoController player = AiVideoController();
  LivePlayerConfig cfg = LivePlayerConfig();
  var anyAction = VoidListener();
  var matchOverListener = MatchOverListener();

  String animateLiveUrl;

  bool get hasAnimateLive => isNotEmpty(animateLiveUrl);
  bool get hasVideLive => toolPanel.anchorSelectorFull.model.currentAnchor != null && (toolPanel?.anchorSelectorFull?.model?.anchors?.length ?? 0) > 0;

  CommonVideoPlayerController() {
    toolPanel = ToolPanelController(
      anchorSelectorModel: AnchorSelectorModel(),
      bottomBarModel: LiveBottombarModel(),
      topBarModel: LiveTopbarModel()
    );
    toolPanel.setPlayer(this);
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
      showToas(config.textByPath('flux_tips'));
    }
  }

  bool get needShowFluxWidget {
    bool isNotWifi = config.isConnectMobile;
    //LogCollectUtil.collect('isNotWifi $isNotWifi');
    bool isOnlyWifi = cfg.fluxMode == AiFluxMode.OnlyWifi;
    //LogCollectUtil.collect('isOnlyWifi $isOnlyWifi');
    bool hasVideLive = this.hasVideLive;
    //LogCollectUtil.collect('hasVideLive $hasVideLive');
    if (!hasShowTips && hasVideLive && isNotWifi) {
      hasShowTips = true;
//      showToas("您当前为非WIFI环境，请注意流量消耗");
      showToas(config.langMap['baseLang']['flux_tips']);
    }
    return isNotWifi && isOnlyWifi && hasVideLive && !config.isApp;
  }

  void updateExtendModel(ExtendModel extend, DetailParams detailParams, bool isFreeAnchor) {
    animateLiveUrl = extend?.data?.animateLiveUrl;
    var anchors = extend.getAnchorList(detailParams, isFreeAnchor ?? false);
    toolPanel.updateAnchors(anchors, detailParams.anchorId, isFreeAnchor: isFreeAnchor);
  }

  void updateDetailModel(MatchesDetailModel resDetail) {}

  void updatePageModel(DPageModel pageModel, ExtendModel extendModel, FootballAuxiliaryData footballAuxiliaryData) {
    freshTopBar(pageModel, extendModel, footballAuxiliaryData);
    freshBottomBar(pageModel);
  }

  void freshTopBar(DPageModel pageModel, ExtendModel extendModel, FootballAuxiliaryData footballAuxiliaryData) {
    String showType = string(pageModel.matchesDetailModel?.data?.showtype);
    toolPanel.topBar.model.update(pageModel, extendModel);
    toolPanel.topBar.model.extendModel = extendModel;
    //如果是足球
    if ("FT" == toolPanel.topBar.model.gameType && showType == 'RB') {
      toolPanel.topBar.model.auxiliaryData = footballAuxiliaryData;
    }
    toolPanel.topBar.update();
  }

  void freshBottomBar(DPageModel pageModel) {
    toolPanel.bottomBar.model.update(pageModel);
    toolPanel.bottomBar.update();
  }

  void dispose() {
    print('dispose-CommonVideoPlayerController');
    player?.dispose();
    toolPanel?.setPlayer(null);
    //videoPlayer.setPlayer(null);
  }

}