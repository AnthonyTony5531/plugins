import 'package:flutter/material.dart';
import 'package:fast_ai/config/config.dart';

class SportPlatformConfig{
  ///
  /// 注单记录平台默认名称
  ///
  static var _platformDefaultNameMap = <String,String>{
    '1': config.langMap['baseLang']['defaultSportPlatformName']['platformId1'],
    '2': config.langMap['baseLang']['defaultSportPlatformName']['platformId2'],
    '3': config.langMap['baseLang']['defaultSportPlatformName']['platformId3'],
    '4': config.langMap['baseLang']['defaultSportPlatformName']['platformId4'],
  };

  static String getDefaultName(String platformId){
    if(_platformDefaultNameMap.containsKey(platformId)){
      return _platformDefaultNameMap[platformId];
    }
    return _platformDefaultNameMap['4'];
  }

  //////////////////////////////////////////////////////////////////////////////
  ///
  /// 注单记录平台图标
  ///
  static const _bigIconMap = <String,String>{
    '1': 'assets/images/sdk_image/img_bg_chose_A.png',
    '2': 'assets/images/sdk_image/img_bg_chose_B.png',
    '3': 'assets/images/sdk_image/img_bg_chose_C.png',
    '4': 'assets/images/sdk_image/img_bg_chose_C.png',
  };

  static String getBigIcon(String platformId){
    if(_bigIconMap.containsKey(platformId)){
      return _bigIconMap[platformId];
    }
    return _bigIconMap['4'];
  }

  //////////////////////////////////////////////////////////////////////////////
  ///
  /// 注单记录平台标签背景色
  ///
  static const _colorMap = <String,Color>{
    '1': Color(0xFFFEFBEB),
    '2': Color(0xFFE8FAF7),
    '3': Color(0xFFE6F0F6),
    '4': Color(0xFFF1EBFA),
  };

  static Color getColor(String platformId){
    if(_colorMap.containsKey(platformId)){
      return _colorMap[platformId];
    }
    return _colorMap['4'];
  }
}