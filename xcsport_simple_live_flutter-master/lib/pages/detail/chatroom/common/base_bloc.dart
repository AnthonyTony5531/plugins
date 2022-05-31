import 'dart:async';

import 'package:rxdart/rxdart.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-29
 **********************************************************************
 */


abstract class BaseBloc{
  List<StreamController> controllers = [];
  List<PublishSubject> subjects = [];

  void init(){

  }

  void addStreamController(StreamController controller){
    controllers.add(controller);
  }
  void addPublishSubject(PublishSubject controller){
    subjects.add(controller);
  }

  void dispose(){
    controllers.forEach((controller){
      if(!controller.isClosed)
          controller.close();
    });
    subjects.forEach((controller){
      if(!controller.isClosed)
        controller.close();
    });
  }

}