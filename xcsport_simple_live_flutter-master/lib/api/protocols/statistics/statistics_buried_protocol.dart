
import 'dart:io';
import 'dart:ui';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:flutter/material.dart';
import '../../net.dart';

class StatisticsBuriedReqProtocol{
  StatisticsBuriedReqProtocol();
  Future<StatisticsBuriedResProtocol> request({Map<String,dynamic> event})async{
    var hostUrl = 'http://tracking-accept-api.aisport-api:9906/ai/mobile/';
    var url = 'track/saveBuried';
    var params = {
      'cm' : commonParam(),
      'et' : event,
    };
    var rst = await Net.post(url,body: params,preUrl: hostUrl);
    var rstM = StatisticsBuriedResProtocol.fromMap(rst);
    if(rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
    return rstM;
  }

  Map<String, dynamic>commonParam(){
    return {};
    // MediaQueryData deviceData = MediaQueryData.fromWindow(window);
    // double width = deviceData.size.width;
    // double height = deviceData.size.height;
    // String mid = Platform.isIOS ? config.iOSDeviceInfo.identifierForVendor : config.androidDeviceInfo.androidId;
    // String vc = Platform.isIOS ? config.appInfo.iosVersion : config.appInfo.versionName;
    // String os= Platform.isIOS ? config.iOSDeviceInfo.systemVersion : config.androidDeviceInfo.version.release;
    // String md= Platform.isIOS ? config.iOSDeviceInfo.utsname.machine : config.androidDeviceInfo.model;
    // String ba= Platform.isIOS ? config.iOSDeviceInfo.utsname.nodename : config.androidDeviceInfo.manufacturer;
    // return {
    //   "ap": 'app',                                                     //项目数据来源(app,pc,h5)
    //   "ip": "",                                                        //ip地址
    //   "mid": mid,                                                      //设备唯一标识
    //   "uid": config.userInfo.uid,                                      //用户id
    //   "vc": vc,                                                        //程序版本号
    //   "vn": "",                                                        //程序版本名
    //   "lan": Translations.lang,                                        //系统语言
    //   "merId": '',                                                     //渠道号（商户号）
    //   "os": os,                                                        //苹果系统版本
    //   "md": md,                                                        //手机型号
    //   "ba": ba,                                                        //手机品牌
    //   "sv": "",                                                        //Sdk版本号
    //   "hw": "$height" + 'x' + '$width',                                //屏幕宽高
    //   "tm": '',                                                        //客户端产生日志的时间
    //   "nw": config.networkConnect(),                                   //网络模式
    //   "ln": "",                                                        //经度
    //   "la": "",                                                        //纬度
    //   "src": config.userInfo.sportPlatformId,                          //AI/BI
    //   "status": "",                                                    //1:成功，2:失败
    //   "start": 0,                                                      //开始调用接口时间
    //   "end": 0,                                                        //接口返回时间
    //   "ex1": "",                                                       //扩展字段1
    //   "ex2": ""                                                        //扩展字段2
    // };
  }
}

class StatisticsBuriedResProtocol extends BaseModel {
  StatisticsBuriedResProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map){
    if(map == null || map.isEmpty){
      return;
    }
  }
}