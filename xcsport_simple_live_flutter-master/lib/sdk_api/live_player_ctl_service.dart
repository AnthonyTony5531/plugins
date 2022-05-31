import 'package:common_component/util/listeners/value_changed_listener.dart';

class LivePlayerCtlService{

  LivePlayerCtlService();


  var livePlayCtlListener = ValueChangedListener<CtlAction>();

  ///
  ///
  void play(){
    livePlayCtlListener.fire(CtlAction.play);
  }

  ///
  ///
  void stop(){
    livePlayCtlListener.fire(CtlAction.stop);
  }
}

LivePlayerCtlService livePlayerCtlService = LivePlayerCtlService();

enum CtlAction{
  play, stop,
}