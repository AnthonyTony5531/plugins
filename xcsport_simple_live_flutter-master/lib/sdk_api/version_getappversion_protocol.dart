import 'dart:convert';
import 'dart:io';

import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:flutter/services.dart';

class AiVersionGetAppVersionReqProtocol extends BaseReqProtocol<AiVersionGetAppVersionModel> {
  AiVersionGetAppVersionReqProtocol(String sdkVersion, {String ip=''}) {
    param = {'versionNo' : sdkVersion??'', 'ip' : ip ?? ''};
  }

  @override
  String get apiUrl => 'version/getAppVersionNew';//'ai/version/getAppVersion';

//  @override
//  String get baseUrl => Api.baseMainUrl; //http://dev.m.xc.com

  @override
  Future<AiVersionGetAppVersionModel> result(Map<String, dynamic > map) async {
    return AiVersionGetAppVersionModel.fromMap(map);
  }
}


class AiVersionGetAppVersionModel extends BaseModel {
  /// SDK版本号
  String sdkVersion = '';
  /// 资源包版本号-暂时不用
  String sourceVersion = '';
  /// 是否需要强制更新 1-需要强制更新，0-不需要
  int forceUpdate = 0;


  /// 资源下载链接(包含本地写死的配置)
  List<String> assetsUrls = [];

  AiVersionGetAppVersionModel();
  AiVersionGetAppVersionModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    print('AiVersionGetAppVersionModel.fromMap-resp=$map');
    if (isSuccess) {
      sdkVersion = AiJson(map).getString('data.versionNo');
      String force = AiJson(map).getString('data.forceUpdate');
      sourceVersion = AiJson(map).getString('data.sourceVersionNo');
      String url = AiJson(map).getString('data.relativeSdkUrl');
      
      print('force is String ${force is String}, force is num ${force is num}, force is num ${force is int}');
      if (sdkVersion == 'null') sdkVersion = '';
      if (force == null || force == 'null' || force == '') {
        forceUpdate = 0;
      }
      else {
        forceUpdate = int.parse(force);
      }
      if (sourceVersion == 'null') sourceVersion = '';
      if (url == 'null') url = '';
      // if(version != null && version.trim().isNotEmpty) sourceVersions = version.split(',');
      print('000000-AiVersionGetAppVersionModel-----url=$url sdkVersion=$sdkVersion, forceUpdate=$forceUpdate, sourceVersion=$sourceVersion, ');
      //if(url != null && url.trim().isNotEmpty) assetsUrls = url.split(',').map((uri)=> uri.endsWith('.zip') ? uri : '$uri/assets$sourceVersion.zip').toList();
      if(url != null && url.trim().isNotEmpty) {
        List<String> uris = url.split(',');
        uris.removeWhere((uri)=>!uri.startsWith('http'));
        assetsUrls.clear();
        assetsUrls.addAll(uris.map((uri)=>uri.endsWith('.zip') ? uri : '$uri/assets$sourceVersion.zip').toList());
      }
      print('111111-AiVersionGetAppVersionModel-----assetsUrls=$assetsUrls');
    }
  }

  Future combineXxlAssetUrls() async {
    List<String> urls = [];

    String filePath = 'assets/files/remote_assets_dirs.json';
    bool hasJson = false;
    try {
      String jsonString;
      // 默认优先读取下载资源中的域名
      File jsonFile = File("${config.sdkAssetsModel.sdkAssetsDir}/$filePath");
      hasJson = await jsonFile.exists();
      print('download remote_assets_dirs.json hasJson=$hasJson');
      if(hasJson) {
        print('00000 ---准备读取  网络下载ip列表');
        jsonString = await jsonFile.readAsString();
        print('11111 ---准备读取  网络下载ip列表');
      }
      else {
        // 读本地资源包的remote_assets_dirs.json
        try {
          print('000000-读取本地 remote_assets_dirs.json');
          jsonString = await rootBundle.loadString(filePath);
        } catch (e) {
          print('111111-读取本地 remote_assets_dirs.json异常 e=$e');
          var json = {
            "assets_remote_dir": [
              "https://img.sxlim.com/app/sdkassets",
              "https://img.czedl.com/app/sdkassets"
            ]
          };
          jsonString = jsonEncode(json);
        }
      }
      print('222222---本地ip列表转成JSON');
      dynamic jsonMap = jsonDecode(jsonString);
      print('000-remote_assets_dirs.json jsonMap=$jsonMap');
      var json = AiJson(jsonMap);
      print('111-remote_assets_dirs.json');
      List<String> urlList = json.getArray('assets_remote_dir').map((dir)=>'$dir/assets${config.sdkAssetsModel.sdkAssetsVersion}.zip').toList();
      print('222-remote_assets_dirs.json urlList=${urlList.length}');
      urls.addAll(urlList);
      print('_remoteAssetsUrls.length=${urls.length}, _remoteAssetsUrls=${urls.toString()}');
    } catch (e) {
      print('remote_assets_dirs.json 读取失败 hasJson=$hasJson e=${e.toString()}');
    }

    if(urls.length != 0) {
      if (assetsUrls.length == 0) {
        assetsUrls.addAll(urls);
      }
      else {
        urls.forEach((url)=>!assetsUrls.contains(url) ? assetsUrls.add(url) : print('url=$url'));
      }
    }
  }
}