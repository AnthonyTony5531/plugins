import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';

class ClickStatisticsReqProtocol{
  final String apiType;/// 1=banner 2=首屏推送 3=赛季排名
  final String apiTypeId;/// item id
  final String playerId;/// 用户id
  ClickStatisticsReqProtocol(
    this.apiType,
    this.apiTypeId,
    this.playerId,
  );

  Future<ClickStatisticsResProtocol> request()async{
    String url = '${Api.ClickStatistics}?apiType=$apiType&apiTypeId=$apiTypeId&playerId=$playerId';
    var rst = await Net.get(url);
    print('rsp ---> $rst');

    if (rst is String) { // 系统维护中返回字符串
      var rstM = ClickStatisticsResProtocol.fromString(rst);
      return rstM;
    }
    else{
      var rstM = ClickStatisticsResProtocol.fromMap(rst);
      if (rstM.code != 200 && rstM.code != 404)throw Exception('${rstM.msg}');
      return rstM;
    }
  }
}

class ClickStatisticsResProtocol extends BaseModel{
  Map<String, dynamic> dataMap = Map();
  BaseModel baseModel = BaseModel();

  ClickStatisticsResProtocol.fromMap(Map<String, dynamic>map): super.fromMap(map){
//    dataMap = AiJson(map).getMap('data');
  }
  ClickStatisticsResProtocol.fromString(String value){
//    baseModel = BaseModel.fromMap(_convert.jsonDecode(value));
  }
}