//**********************************************************************
//* author:Sam
//* date:2020-05-11
//**********************************************************************

import 'package:dio/dio.dart';
import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:flutter/material.dart';

import 'ai_game_url_protocol.dart';

class AiGameListRequastProtocol extends BaseReqProtocol<AiGameListResponseProtocol>{

  AiGameListRequastProtocol(){
    param ={
      'supplierId':'',
      'gameKey':'',
      'gameType':'',
      'page':1,
      'row':5,
    };
  }

  @override
  String get apiUrl => 'game/list';

  @override
  Future<AiGameListResponseProtocol> result(Map<String, dynamic> map) async{
    var protolcol =  AiGameListResponseProtocol(map);
    if(protolcol.isSuccess){
      protolcol.models.forEach((f) async{
        var  rq =  await AiGameURlRequestProtocol(supplierId: f.supplierId, gameKey: f.gameKey).request();
        f.url = rq.url;
      });
    }
    return protolcol ;
  }

  VoidCallback onCallBack;
  String supplierId = '';
  String gameKey = '';
  String gameType = '';
  int page = 1;
  int row = 5;
  Future<AiGameListResponseProtocol> requestGameList()async{
    var url = "game/list?supplierId=$supplierId&gameKey=$gameKey&gameType=$gameType&page=$page&row=$row";
    var rst = await Net.get(url);
    var rstM = AiGameListResponseProtocol(rst);
    // 改为点击时获取URL
//    rstM.models.forEach((f) async{
//      var  rq =  await AiGameURlRequestProtocol(supplierId: f.supplierId, gameKey: f.gameKey).request();
//      f.url = rq.url;
//      if(onCallBack != null){
//        onCallBack();
//      }
//    });
    return rstM;
  }
}

//final String supplierId;
//final String img;
//final String gameKey;
//final String gameName;
//final String icon;
//String supplierName;
//String gameType;
//String url;
//String screen;
//bool isShowLock;


class AiGameListResponseProtocol extends BaseModel{
  List<AiGameCellModel> models=[];
  AiGameListResponseProtocol(Map<String, dynamic> map):super.fromMap(map)
  {
    print(map);
    AiJson  json = new AiJson(map);
    List<dynamic>  gameData =  json.getArray('data.gameData');
    if (isNotEmpty(gameData)) {
      models.addAll(gameData.map((f){
        return AiGameCellModel(
          img: new AiJson(f).getString('img'),
          supplierId:  new AiJson(f).getString('supplierId'),
          gameKey:  new AiJson(f).getString('gameKey'),
          gameName:  new AiJson(f).getString('gameName'),
          icon: AiJson(f).getString('icon'),
          supplierName: new AiJson(f).getString('supplierName'),
          gameType: new AiJson(f).getString('gameType'),
          screen: new AiJson(f).getString('screen'),
        );
      }).toList());
    }
  //  models.add( AiGameCellModel());

  }
}

// 新的游戏列表
class AiGameListNewReqProtocol{
  final String appType;
  final int page;
  final int row;
  AiGameListNewReqProtocol({
    this.appType = '1',
    this.page = 1,
    this.row = 8,
  });

  Future<AiGameListResponseProtocol> request({CancelToken cancelToken}) async {
    var url = 'game/list/new?appType=$appType&page=$page&row=$row';
    var rst = await Net.get(url,cancelToken: cancelToken);
    var protocol =  AiGameListResponseProtocol(rst);
    if(protocol.isSuccess){
      Future.forEach(protocol.models, (f) async{
        var  rq =  await GameURlNewReqProtocol(supplierId: f.supplierId, gameKey: f.gameKey).request();
        f.url = rq.url;
      });
    }
    return protocol;
  }
}










