//**********************************************************************
//* author:Sam
//* date:2020-09-14
//**********************************************************************

import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:flutter/cupertino.dart';

//上下滑切换比赛
class SlideProtocol extends BaseReqProtocol<SlideRspProtocol>{

  SlideProtocol({@required String gidm, @required String gameType, String groupId}){
    param ={
      "gidm":gidm,
      "gameType":gameType,
      "groupId":groupId,
    };
  }


  @override
  String get apiUrl => "getSlideGidms";

  @override
  Future<SlideRspProtocol> result(Map<String, dynamic> map) async{
    return  SlideRspProtocol(map);
  }

}

class SlideRspProtocol extends BaseModel{

  String preGidm;
  String nextGidm;

  SlideRspProtocol(Map map):super.fromMap(map){
    if(isSuccess){
      AiJson aiJson =  new AiJson(map);
      List<dynamic> array =  aiJson.getArray("data");
      if(isNotEmpty(array)){
        if(array.length>0){
          preGidm = array[0];
        }

        if(array.length>1){
          nextGidm = array[1];
        }
      }
    }
  }
}