// @author king
// @date 2021-05-21

//用来管理每个插件初始化使用,每个插件只有唯一IPackage
import 'package:common_component/component/route/route_table.dart';
import 'package:common_component/cross/cross.dart';
import 'package:common_component/mvvm/model/config/config.dart';
import 'package:common_component/mvvm/model/service/service.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/theme/res.dart';

abstract class IPackage{
  String get name;
  Future<void> init()async{
    await config.init();
    await service.init();
    if(null != routeTable){
      ccRoute.addRouteTable(routeTable: routeTable);
    }
  }
  IService get service;
  IConfig get config;
  ICross get cross;
  Res get res;
  IRouteTable get routeTable => null;
}