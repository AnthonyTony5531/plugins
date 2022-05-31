import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/utils/model_controller_builder.dart';
import '../common_video_player_controller.dart';
import 'base/panel_model_controller.dart';
import 'base/panel_mixin.dart';

class BottomBarController extends PanelModelController<LiveBottombarModel> with PanelAnimateAction, ToolPanel {
  BottomBarController({LiveBottombarModel model}) : super(model: model ?? LiveBottombarModel());

  var settingTap = VoidListener();
  var anchorSelectorTap = VoidListener();
  var autioStateChanged = ValueChangedListener<AutioState>();
  var videoTypeChanged = ValueChangedListener<VideoType>();
  var screenDirectionChanged = ValueChangedListener<ScreenDirection>();

  void setVideoType(VideoType videoType){
    model.videoType = videoType;
    videoTypeChanged.fire(videoType);
  }

  @override
  void setPlayer(CommonVideoPlayerController player) {
    super.setPlayer(player);
    this.settingTap.setParent(player?.anyAction);
    this.anchorSelectorTap.setParent(player?.anyAction);
    this.autioStateChanged.setParent(player?.anyAction);
    this.videoTypeChanged.setParent(player?.anyAction);
    this.screenDirectionChanged.setParent(player?.anyAction);
  }
}