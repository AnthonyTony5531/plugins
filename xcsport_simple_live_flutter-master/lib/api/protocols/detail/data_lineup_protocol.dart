// 近期交锋
import 'package:dio/dio.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

import '../../net.dart';

class DataLineupReqProtocol {
  String gidm;
  String homeId;  // 不传也行和H5统一
  String awayId;
  String tbMatchId;

  DataLineupReqProtocol({
    this.gidm = '',
    this.homeId = '',
    this.awayId = '',
    this.tbMatchId = '',
  });

  Future<DataLineupResProtocol> request({CancelToken cancelToken}) async{
    String url = 'matches/lineup?gidm=$gidm&homeId=$homeId&awayId=$awayId&tbMatchId=$tbMatchId';
    var rst = await Net.get(url,cancelToken: cancelToken);
    var rstM  = DataLineupResProtocol.fromMap(rst);
    return rstM;
  }
}

class DataLineupResProtocol extends BaseModel{
  Map<String, dynamic> lineupMap = {};
  DataLineupResProtocol.fromMap(Map<String,dynamic>map):super.fromMap(map){
    var dataList = AiJson(map).getMap('data');
    if (dataList != null && dataList.isNotEmpty) {
      lineupMap = AiJson(map).getMap('data');
    }
  }
}