import 'package:dio/dio.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/pages/detail/anchor_room_info/live_Room_Info.dart';
import 'package:fast_ai/utils/ai_json.dart';

class LiveRoomInfoReqProtocol{
  final String liveId;
  LiveRoomInfoReqProtocol({
    this.liveId = '',
  });

  Future<LiveRoomInfoRspProtocol> request({CancelToken cancelToken}) async {
    var url = 'anchor/getLiveRoomInfo?liveId=$liveId';
    var rst = await Net.get(url,cancelToken: cancelToken);
    var rstM = LiveRoomInfoRspProtocol.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) {
      throw Exception('${rstM.msg}');
    }
    return rstM;
  }

}

class LiveRoomInfoRspProtocol extends BaseModel{
  LiveRoomInfo liveRoomInfo;

  LiveRoomInfoRspProtocol.fromMap(Map<String, dynamic> map) {
    super.fromMap(map);
    if (map == null || map.isEmpty) {
      return;
    }
    var data = AiJson(map).getMap('data');
    liveRoomInfo = LiveRoomInfo.fromMap(data);

  }
}

