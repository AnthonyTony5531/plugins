import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

import '../../net.dart';

class MatchEventParseReqProtocol {

  String gidm = '';
  int page = 1;
  int size = 100;
  MatchEventParseReqProtocol({
    this.gidm,
    this.page = 1,
    this.size = 100,
  });

  Future<MatchEventParseRspProtocol> request() async {
    var url = "single/matchEventPrase";
    var params = {
      'gidm': gidm,
      'page': page,
      'size': size,
    };
    var rst = await Net.post(url,body: params);
    var rstM = MatchEventParseRspProtocol.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) throw Exception("${rstM.msg}");
    return rstM;
  }
}

class MatchEventParseRspProtocol extends BaseModel {
  Map<String,dynamic> data = {};
  List<dynamic> list = [];
  int totalCount = 0;
  MatchEventParseRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    try {
      if(map == null || map.isEmpty){
        return;
      }
      data = AiJson(map).getMap("data");
      list = AiJson(map).getArray('data.list');
      totalCount = AiJson(map).getNum('data.totalCount');
    } catch (e) {
      print(e);
    }
  }
}

