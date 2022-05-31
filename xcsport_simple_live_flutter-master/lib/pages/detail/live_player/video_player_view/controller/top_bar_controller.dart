import 'package:fast_ai/pages/detail/live_player/views/live_topbar/live_topbar_model.dart';
import 'package:fast_ai/utils/model_controller_builder.dart';
import '../common_video_player_controller.dart';
import 'base/panel_model_controller.dart';
import 'base/panel_mixin.dart';

class TopBarController extends PanelModelController<LiveTopbarModel> with PanelAnimateAction, ToolPanel {
  TopBarController({LiveTopbarModel model}) : super(model: model ?? LiveTopbarModel());

  var leagueGameTap = VoidListener(); //点击显示联赛
  var backTap = VoidListener();    //点击回退
  var pickupChanged = ValueChangedListener<bool>();  //收点状态变化
  var moreTap = VoidListener();

  @override
  void setPlayer(CommonVideoPlayerController player) {
    super.setPlayer(player);
    this.leagueGameTap.setParent(player?.anyAction);
    this.backTap.setParent(player?.anyAction);
    this.pickupChanged.setParent(player?.anyAction);
    this.moreTap.setParent(player?.anyAction);
  }
}