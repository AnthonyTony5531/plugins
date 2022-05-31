
/*
 *********************************************************************
 * author:Sam
 * date:2019-12-27
 **********************************************************************
 */

// 本文件不可移动，不可修改文件名并且只能放以下环境URL，填加其他代码需要修改打包脚本来适应
// 本文件不可移动，不可修改文件名并且只能放以下环境URL，填加其他代码需要修改打包脚本来适应
// 本文件不可移动，不可修改文件名并且只能放以下环境URL，填加其他代码需要修改打包脚本来适应


import 'net_host_service.dart';



class NetHost {
// dev
// static String BASE_IM_URL    = 'ws://dev.m.xc.com';
// static String BASE_IMG_URL   = 'http://dev.img.xc.com';
// static String BASE_MAIN_URL  = 'http://dev.m.xc.com';
// static String BASE_VIDEO_URL = 'http://dev.video.xc.com:10080';

//beta
//
//  static String BASE_VIDEO_URL = 'http://192.168.30.168:10080';
//  static String BASE_IM_URL    = 'ws://beta.m.xc.com';
//  static String BASE_IMG_URL   = 'http://beta.img.xc.com';
//  static String BASE_MAIN_URL  = 'http://beta.m.xc.com';

// fat
//  static String BASE_IM_URL    = 'ws://fat.m.xc.com';
//  static String BASE_IMG_URL   = 'http://fat.img.xc.com';
//  static String BASE_MAIN_URL  = 'http://fat.m.xc.com';
//  static String BASE_VIDEO_URL = 'http://fat.video.xc.com:10080';


// beta-fat
// static String BASE_IM_URL    = 'ws://beta-fat.m.xc.com';
// static String BASE_IMG_URL   = 'http://beta-fat.img.xc.com';
// static String BASE_MAIN_URL  = 'http://beta-fat.m.xc.com';
// static String BASE_VIDEO_URL = 'http://dev.video.xc.com:10080';


//pre
// static String BASE_IM_URL    = 'ws://m.aisports.io';
// static String BASE_IMG_URL   = 'http://cn2.img.aisports.io';
// static String BASE_MAIN_URL  = 'http://m.aisports.io';

//pre
// static String BASE_IM_URL    = 'ws://m.juxiangbaojie.com';
// static String BASE_IMG_URL   = 'https://img.juxiangbaojie.com';
// static String BASE_MAIN_URL  = 'https://m.juxiangbaojie.com';

// cn2
// static String BASE_IM_URL   = 'ws://cn2.m.aisports.io';
// static String BASE_IMG_URL  = 'http://cn2.img.aisports.io';
// static String BASE_MAIN_URL = 'http://cn2.m.aisports.io';
// static String BASE_VIDEO_URL = 'http://dev.video.xc.com:10080';

// cn3
// static String BASE_IM_URL   = 'ws://cn3.m.aisport.io';
// static String BASE_IMG_URL  = 'http://cn3.img.aisport.io';
// static String BASE_MAIN_URL = 'http://cn3.m.aisport.io';
// static String BASE_VIDEO_URL = 'http://dev.video.xc.com:10080';

//使用NetHostService实现
  // ignore: non_constant_identifier_names
  static String get BASE_IM_URL => NetHostService.ins.current.BASE_IM_URL;
  // ignore: non_constant_identifier_names
  static set BASE_IM_URL(String value) =>  NetHostService.ins.current.BASE_IM_URL = value;
  // ignore: non_constant_identifier_names
  static String get BASE_IMG_URL => NetHostService.ins.current.BASE_IMG_URL;
  // ignore: non_constant_identifier_names
  static set BASE_IMG_URL(String value) => NetHostService.ins.current.BASE_IMG_URL = value;
  // ignore: non_constant_identifier_names
  static String get BASE_MAIN_URL => NetHostService.ins.current.BASE_MAIN_URL;
  // ignore: non_constant_identifier_names
  static set BASE_MAIN_URL(String value) => NetHostService.ins.current.BASE_MAIN_URL = value;
  // ignore: non_constant_identifier_names
  static String get BASE_VIDEO_URL => NetHostService.ins.current.BASE_VIDEO_URL;
  // ignore: non_constant_identifier_names
  static set BASE_VIDEO_URL(String value) => NetHostService.ins.current.BASE_VIDEO_URL = value;

}
