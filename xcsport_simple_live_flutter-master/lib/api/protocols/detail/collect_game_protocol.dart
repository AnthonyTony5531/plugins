import 'package:fast_ai/models/base_model.dart';
import '../../base_protocol.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-27
 **********************************************************************
 */


enum CollectedOption {

  //收藏
  collected,
  //取消收藏
  cancel

}

//收藏比赛
class CollectGameReqProtocol extends BaseReqProtocol<CollectGameRspProtocol>{

  CollectGameReqProtocol({String gidm,CollectedOption option}){
    param = {
      'follow':CollectedOption.collected == option?"1":"2",
      'gidm':gidm,
    };
  }

  @override
  String get apiUrl => "detail/collect";

  @override
  RequestMethodType get requestType => RequestMethodType.post;

  @override
  Future<CollectGameRspProtocol> result(Map<String,dynamic> map) async{
    return CollectGameRspProtocol.fromDetailCollect(map);
  }


}


class CollectGameRspProtocol extends BaseModel{

  CollectGameRspProtocol.fromDetailCollect(Map<String, dynamic> map):super.fromMap(map){
    // print(map);
  }

}