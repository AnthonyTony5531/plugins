import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/base/panel_mixin.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/base/panel_model_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/utils/model_controller_builder.dart';

import '../common_video_player_controller.dart';

class AnchorSelectorController extends PanelModelController<AnchorSelectorModel> with PanelAnimateAction, ToolPanel {
  AnchorSelectorController({AnchorSelectorModel model}) : super(model: model ?? AnchorSelectorModel());

  int currentIndex = 0;

  // show/hide和其他控制面板Controller相反
  @override
  void show([bool reverse = true]) {
    currentIndex = 0;
    super.show(reverse);
  }

  VoidListener anchorVideoChanged = VoidListener();

  @override
  void setPlayer(CommonVideoPlayerController player){
    super.setPlayer(player);
    this.anchorVideoChanged.setParent(player?.anyAction);
  }
}