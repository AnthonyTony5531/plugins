import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:dio/dio.dart';

class GiftQueryReqProtocol {

  int page = 1;
  int pageSize = 100;
  int status = 1; // 1上线，2未上线
  GiftQueryReqProtocol({
    this.page = 1,
    this.pageSize = 100,
    this.status = 1,
  });

  Future<GiftQueryRspProtocol> request({CancelToken cancelToken})async{
    var url = "gift/query?page=$page&pageSize=$pageSize&status=$status";
    var rst = await Net.get(url,cancelToken: cancelToken);
    var rstM = GiftQueryRspProtocol.fromMap(rst);
    if(rstM.code != 200 && rstM.code != 404) throw('${rstM.msg}');
    return rstM;
  }
}

class GiftQueryRspProtocol extends BaseModel {

  List<dynamic> giftList = [];
  int total = 0;
  GiftQueryRspProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {
    if(map == null || map.isEmpty){
      return;
    }
    giftList = AiJson(map).getArray("data.giftList");
    total = AiJson(map).getNum('data.total');
  }

  GiftQueryRspProtocol.fromList(List<dynamic> list){
    if(list != null){
      total = list?.length ?? 0;
      giftList = list ?? [];
      code = 200;
    } else {
      code = 9999;
      total = 0;
      giftList = [];
    }
    systemTime = DateTime.now().millisecondsSinceEpoch;
  }
}
