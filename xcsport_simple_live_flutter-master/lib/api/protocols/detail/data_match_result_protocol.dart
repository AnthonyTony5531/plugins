import 'package:dio/dio.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class DataMatchResultReqProtocol {
  String gidm;
  String homeId;  // 不传也行和H5统一
  String awayId;
  String lang;
  int type;
  String tbMatchId;

  DataMatchResultReqProtocol({
    this.gidm = '',
    this.homeId = '',
    this.awayId = '',
    // this.type = 0,
    this.tbMatchId = '',
  });

  Future<DataMatchResultResProtocol> request({CancelToken cancelToken}) async{
    String groupId = '${config.userInfo.sportPlatformId}';
    String url = 'matches/scoresstaticsevents?groupId=$groupId&gidm=$gidm&homeId=$homeId&awayId=$awayId&tbMatchId=$tbMatchId';
    var rst = await Net.get(url, cancelToken: cancelToken);
    var rstM  = DataMatchResultResProtocol.fromMap(rst);
    return rstM;
  }
}

class DataMatchResultResProtocol extends BaseModel{
  Map<String, dynamic> matchResultMap = {};
  DataMatchResultResProtocol.fromMap(Map<String,dynamic>map):super.fromMap(map){
    var data = AiJson(map).getMap('data');
    if (data != null && data.isNotEmpty) {
      matchResultMap = AiJson(map).getMap('data');
    }
  }
}