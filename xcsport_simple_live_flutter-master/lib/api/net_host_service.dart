//**********************************************************************
//* author:Sam
//* date:2020-09-09
//**********************************************************************

import 'package:fast_ai/api/net_host.dart';
import 'package:flutter/material.dart';

class _HostItem {
  // ignore: non_constant_identifier_names
  String BASE_IM_URL;
  // ignore: non_constant_identifier_names
  String BASE_IMG_URL;
  // ignore: non_constant_identifier_names
  String BASE_MAIN_URL;
  // ignore: non_constant_identifier_names
  String BASE_VIDEO_URL;
  HostType hostType;
  // ignore: non_constant_identifier_names
  _HostItem(this.hostType,
      {
      // ignore: non_constant_identifier_names
      @required this.BASE_IM_URL,
      // ignore: non_constant_identifier_names
      @required this.BASE_IMG_URL,
      // ignore: non_constant_identifier_names
      @required this.BASE_MAIN_URL,
      // ignore: non_constant_identifier_names
      @required this.BASE_VIDEO_URL});
}

enum HostType {
  Dev,
  Dev106, // 泰国
  Dev107, // 越南
  Beta,
  Fat,
  BetaFat,
  Pre1,
  Pre2,
  GBet_Pre,
  Cn2,
  Cn3,
  Nc,
  Lt,
  bj,
  CCSIT,
  XZ,
  Dev6,
  Ip,
  ty, // 泰语版
  yn, // 越南版
  zw, // 中文版
  xj, // 小金商户
  yc365d,
  yc365d_106, //泰国
  yc365d_107, //越南
  gbetm01, // gbet
  cn2_h603,
  yc365d_nm01, // gbet - USDT
  Count,
}

class NetHostService {

  static NetHostService ins = new NetHostService();
  HostType _currentType = HostType.Pre2;

  List<_HostItem> _hosts = new List<_HostItem>();
  NetHostService() {
    _hosts.clear();
    for (var i = 0; i < HostType.Count.index; i++) {
      var type = HostType.values[i];
      _hosts.add(createHostItem(type));
    }
  }

  set currentType(HostType hostType) {
    assert(hostType.index < HostType.Count.index);
    _currentType = hostType;
  }

  HostType get currentType {
    return _currentType;
  }

  get currentMainUrl{
    return current?.BASE_MAIN_URL ?? '';
  }

  _HostItem get current {
    return _hosts[_currentType.index];
  }

  bool get isDev => NetHost.BASE_MAIN_URL == 'http://dev.m.xc.com';

  _HostItem createHostItem(HostType type) {
    switch (type) {
      case HostType.cn2_h603 : {
        return _HostItem(
          type,
          BASE_IM_URL: 'ws://cn2.h603.aisports.io',
          BASE_IMG_URL: 'http://cn2.img.aisports.io',
          BASE_MAIN_URL: 'http://cn2.h603.aisports.io',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      }
      case HostType.gbetm01 : {
        return _HostItem(
          type,
          BASE_IM_URL: 'ws://dev.gbetm01.yc365d.com',
          BASE_IMG_URL: 'http://dev.img.yc365d.com',
          BASE_MAIN_URL: 'http://dev.gbetm01.yc365d.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      }
      case HostType.yc365d : {
        return _HostItem(
          type,
          BASE_IM_URL: 'ws://dev.m.yc365d.com',
          BASE_IMG_URL: 'http://dev.img.yc365d.com',
          BASE_MAIN_URL: 'http://dev.m.yc365d.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      }
      case HostType.yc365d_106 : {
        return _HostItem(
          type,
          BASE_IM_URL: 'ws://dev.m106.yc365d.com',
          BASE_IMG_URL: 'http://dev.img.yc365d.com',
          BASE_MAIN_URL: 'http://dev.m106.yc365d.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      }
      case HostType.yc365d_107 : {
        return _HostItem(
          type,
          BASE_IM_URL: 'ws://dev.m107.yc365d.com',
          BASE_IMG_URL: 'http://dev.img.yc365d.com',
          BASE_MAIN_URL: 'http://dev.m107.yc365d.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      }
      case HostType.xj : {
        return _HostItem(
          type,
          BASE_IM_URL: 'ws://dev.h605.yc365d.com',
          BASE_IMG_URL: 'http://dev.img.yc365d.com',
          BASE_MAIN_URL: 'http://dev.h605.yc365d.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      }
      case HostType.Dev107:
        {
          return new _HostItem(
            type,
            BASE_IM_URL: 'ws://dev.m.xc.com',
            BASE_IMG_URL: 'http://dev.img.xc.com',
            BASE_MAIN_URL: 'http://dev.m107.xc.com',
            BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
          );
        }
      case HostType.Dev106:
        {
          return new _HostItem(
            type,
            BASE_IM_URL: 'ws://dev.m.xc.com',
            BASE_IMG_URL: 'http://dev.img.xc.com',
            BASE_MAIN_URL: 'http://dev.m106.xc.com',
            BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
          );
        }
      case HostType.Dev:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://dev.m.xc.com',
          BASE_IMG_URL: 'http://dev.img.xc.com',
          BASE_MAIN_URL: 'http://dev.m.xc.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.yc365d_nm01:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://dev.nm01.yc365d.com',
          BASE_IMG_URL: 'http://dev.img.yc365d.com',
          BASE_MAIN_URL: 'http://dev.nm01.yc365d.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.Beta:
        return new _HostItem(
          type,
          BASE_VIDEO_URL: 'http://192.168.30.168:10080',
          BASE_IM_URL: 'ws://beta.m.xc.com',
          BASE_IMG_URL: 'http://beta.img.xc.com',
          BASE_MAIN_URL: 'http://beta.m.xc.com',
        );
      case HostType.Fat:
        return new _HostItem(type,
            // fat
            BASE_IM_URL: 'ws://fat.m.xc.com',
            BASE_IMG_URL: 'http://fat.img.xc.com',
            BASE_MAIN_URL: 'http://fat.m.xc.com',
            BASE_VIDEO_URL: 'http://fat.video.xc.com:10080');
      case HostType.BetaFat:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://beta-fat.m.xc.com',
          BASE_IMG_URL: 'http://beta-fat.img.xc.com',
          BASE_MAIN_URL: 'http://beta-fat.m.xc.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.Pre1:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://m.aisports.io',
          BASE_IMG_URL: 'http://cn2.img.aisports.io',
          BASE_MAIN_URL: 'http://m.aisports.io',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.Pre2:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://m.juxiangbaojie.com',
          BASE_IMG_URL: 'https://img.juxiangbaojie.com',
          BASE_MAIN_URL: 'https://m.juxiangbaojie.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.GBet_Pre:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://h5.juxiangbaojie.com',
          BASE_IMG_URL: 'https://img.juxiangbaojie.com',
          BASE_MAIN_URL: 'https://h5.juxiangbaojie.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      // case HostType.Ip:
      //   return new _HostItem(
      //     type,
      //     BASE_IM_URL: 'ws://112.74.186.85',
      //     BASE_IMG_URL: 'http://120.77.155.159',
      //     BASE_MAIN_URL: 'http://39.108.113.47',
      //     BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
      //   );
      case HostType.Ip:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://120.78.238.3',
          BASE_IMG_URL: 'http://120.78.196.187',
          BASE_MAIN_URL: 'http://120.78.212.55',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.Cn2:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://cn2.m.aisports.io',
          BASE_IMG_URL: 'http://cn2.img.aisports.io',
          BASE_MAIN_URL: 'http://cn2.m.aisports.io',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.Cn3:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://cn3.m.aisport.io',
          BASE_IMG_URL: 'http://cn3.img.aisport.io',
          BASE_MAIN_URL: 'http://cn3.m.aisport.io',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.Nc:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://nc.m.aisport.io',
          BASE_IMG_URL: 'http://nc.img.aisport.io',
          BASE_MAIN_URL: 'http://nc.m.aisport.io',
          BASE_VIDEO_URL: 'http://nc.video.xc.com',
        );

      case HostType.Lt:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://m.lt3389.com',
          BASE_IMG_URL: 'http://img.lt3389.com',
          BASE_MAIN_URL: 'http://m.lt3389.com',
          BASE_VIDEO_URL: 'http://nc.video.lt3389.com',
        );

      case HostType.bj:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://m.juxiangbaojie.com',
          BASE_IMG_URL: 'https://img.juxiangbaojie.com',
          BASE_MAIN_URL: 'https://m.juxiangbaojie.com',
          BASE_VIDEO_URL: 'http://nc.video.lt3389.com',
        );

      case HostType.CCSIT:
        return new _HostItem(
          type,
          BASE_IM_URL: 'wss://sit-h5.ldld2.com',
          BASE_IMG_URL: 'https://sit-h5.ldld2.com/coco_img',
          BASE_MAIN_URL: 'https://sit-h5.ldld2.com',
          BASE_VIDEO_URL: 'http://nc.video.lt3389.com',
        );
      case HostType.XZ:
        return _HostItem(
          type,
          BASE_IM_URL: 'ws://dev.m.xz.com',
          BASE_IMG_URL: 'http://dev.img.xz.com',
          BASE_MAIN_URL: 'http://dev.m.xz.com',
          BASE_VIDEO_URL: 'http://dev.video.xz.com:10080',
        );

      case HostType.Count:
        break;

      case HostType.Dev6:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://dev.m6.xc.com',
          BASE_IMG_URL: 'http://dev.img.xc.com',
          BASE_MAIN_URL: 'http://dev.m6.xc.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.ty:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://cn2.m30.xcspt.com',
          BASE_IMG_URL: 'https://img.aisports.com',
          BASE_MAIN_URL: 'http://cn2.m30.xcspt.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.yn:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://cn2.m31.xcspt.com',
          BASE_IMG_URL: 'https://img.aisports.com',
          BASE_MAIN_URL: 'http://cn2.m31.xcspt.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.zw:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://cn2.m32.xcspt.com',
          BASE_IMG_URL: 'https://img.aisports.com',
          BASE_MAIN_URL: 'http://cn2.m32.xcspt.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );

      case HostType.ty:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://cn2.m30.xcspt.com',
          BASE_IMG_URL: 'https://img.aisports.com',
          BASE_MAIN_URL: 'http://cn2.m30.xcspt.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.yn:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://cn2.m31.xcspt.com',
          BASE_IMG_URL: 'https://img.aisports.com',
          BASE_MAIN_URL: 'http://cn2.m31.xcspt.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
      case HostType.zw:
        return new _HostItem(
          type,
          BASE_IM_URL: 'ws://cn2.m32.xcspt.com',
          BASE_IMG_URL: 'https://img.aisports.com',
          BASE_MAIN_URL: 'http://cn2.m32.xcspt.com',
          BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
        );
    }
    return new _HostItem(
      type,
      BASE_IM_URL: 'ws://dev.m.xc.com',
      BASE_IMG_URL: 'http://dev.img.xc.com',
      BASE_MAIN_URL: 'http://dev.m.xc.com',
      BASE_VIDEO_URL: 'http://dev.video.xc.com:10080',
    );
  }
}

