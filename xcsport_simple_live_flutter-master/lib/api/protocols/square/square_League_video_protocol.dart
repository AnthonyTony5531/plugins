import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

import '../../net.dart';

class SquareLeagueVideoReqProtocol{

  int page = 1;
  int pageSize = 20;
  String lang = '';

  SquareLeagueVideoReqProtocol({
    this.page = 1,
    this.pageSize = 20,
    this.lang = '',
  });

  Future<SquareLeagueVideoRspProtocol> request()async{
    var url = 'video/getVideoByLeague?page=$page&pageSize=$pageSize&lang=$lang';
    var rst = await Net.get(url);
    var rstM = SquareLeagueVideoRspProtocol.fromMap(rst);
    if(rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
    return rstM;
  }
}

class SquareLeagueVideoRspProtocol extends BaseModel {
  Map<String, dynamic> data = {};
  int total = 0;
  List videoData = [];
  SquareLeagueVideoRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map){
    if(map == null || map.isEmpty){
      return;
    }
    data = AiJson(map).getMap('data');
    total = AiJson(data).getNum('total');
    videoData = AiJson(data).getArray('videoData');
  }
}