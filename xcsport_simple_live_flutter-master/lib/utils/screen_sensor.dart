////**********************************************************************
////* author:Sam
////* date:2020-03-27
////**********************************************************************
//
//import 'dart:async';
//
//import 'package:all_sensors/all_sensors.dart';
//import 'package:dio/dio.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/services.dart';
//
////屏幕旋转传感器
//class ScreenSensor{
//  StreamSubscription subscription;
//  ValueChanged<List<DeviceOrientation>> onScreenChanged;
//  DeviceOrientation direction;
//  void listen(ValueChanged<List<DeviceOrientation>> onScreenChanged){
//    this.onScreenChanged = onScreenChanged;
//    subscription?.cancel();
//    subscription =  accelerometerEvents.listen((event){
//      if(event.z<3&&event.z>0){
//       DeviceOrientation  direction;
//       List<DeviceOrientation> values;
//       if(event.x>8){
//         direction =  DeviceOrientation.landscapeRight;
//         values = [
//           DeviceOrientation.landscapeRight,
//         ];
//       }else if(event.x<-8) {
//         direction = DeviceOrientation.landscapeLeft;
//         values = [
//           DeviceOrientation.landscapeLeft,
//         ];
//       }else if(event.y > 5 || event.y<-5){
//         direction =  DeviceOrientation.portraitUp;
//         values = [
//           DeviceOrientation.portraitUp,
//           DeviceOrientation.portraitDown,
//         ];
//       }
//       if( null != onScreenChanged && direction != null){
//         if(null == direction){
//           this.direction = direction;
//         }else{
//           if( this.direction!= direction){
//             this.direction = direction;
//             onScreenChanged(values);
//           }
//         }
//       }
//      }
//    });
//  }
//
//  void dispose(){
//    onScreenChanged = null;
//    subscription?.cancel();
//  }
//}