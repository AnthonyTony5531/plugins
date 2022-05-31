import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

import '../../api.dart';


class SquareAttentionLiveReqProtocol{

  int page = 1;
  int pageSize = 20;
  String playerId = '';

  SquareAttentionLiveReqProtocol({
    this.page = 1,
    this.pageSize = 20,
    this.playerId = '',
  });

  Future<SquareAttentionLiveRspProtocol> request()async{
    var url = '${Api.FollowAnchorList}?page=$page&pageSize=$pageSize&playerId=$playerId';
    var params = {
      'page' : this.page,
      'pageSize' : this.pageSize,
      'playerId' : this.playerId,
    };
    var rst = await Net.post(url,body: params);
    var rstM = SquareAttentionLiveRspProtocol.fromMap(rst);
    if(rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
    return rstM;
  }
}

class SquareAttentionLiveRspProtocol extends BaseModel {
  Map<String, dynamic> data = {};
  int total = 0;
  String playerId;
  List anchorFollowList = [];
  SquareAttentionLiveRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map){
    if(map == null || map.isEmpty){
      return;
    }
    data = AiJson(map).getMap('data');
    total = AiJson(data).getNum('total');
    playerId = AiJson(data).getString('playerId');
    anchorFollowList = AiJson(data).getArray('anchorFollowList');
  }
}