
import 'package:flutter/material.dart';


class PlayGroupNavPingController {
  PlayGroupNavPingController();

  bool _pingStatus = false;

  bool isOnTop = false;

  set pingStatus(bool value){
    _pingStatus = value;
  }
  ///
  void setPingStatus(bool ping){
    _pingStatus = ping;
    _pingStatusListener?.forEach((l){
      if(l!=null){
        l(ping);
      }
    });
  }

  ///
  bool getPingStatus(){
    return _pingStatus;
  }

  List<ValueChanged<bool>> _pingStatusListener = [];
  void addPingStatusListener(ValueChanged<bool> listener){
    if(listener == null){
      return;
    }
    if(_pingStatusListener == null){
      _pingStatusListener = [];
    }
    _pingStatusListener.add(listener);
  }

  void removePingStatusListener(ValueChanged<bool> listener){
    if(listener == null){
      return;
    }
    if(_pingStatusListener == null){
      _pingStatusListener = [];
    }
    _pingStatusListener.remove(listener);
  }


}


