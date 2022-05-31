import 'package:fast_ai/utils/model_controller_builder.dart';

class LivePlayerConfig {

  AiFluxMode _fluxMode = AiFluxMode.OnlyWifi;
  var fluxModeChanged = ValueChangedListener<AiFluxMode>();
  AiFluxMode get fluxMode => _fluxMode;
  set fluxMode(AiFluxMode value){
    _fluxMode = value;
    fluxModeChanged.fire(value);
  }

}

enum AiFluxMode {
  OnlyWifi, //只允许wif
  ArrowMobile, //允许移动播放
}

