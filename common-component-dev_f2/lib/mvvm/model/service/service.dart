// @author king
// @date 2021-05-21

import 'dart:collection';

abstract class IService{
  static final  services = HashMap<String, IService>();

  String get name;

  Future<void> init(){
    IService.services[name] =this;
    return null;
  }
}