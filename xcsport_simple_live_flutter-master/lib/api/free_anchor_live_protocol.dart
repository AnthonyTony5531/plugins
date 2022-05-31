import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/utils/ai_json.dart';

class FreeAnchorLiveReqProtocol extends HttpRequestProtocol<FreeAnchorLiveRspProtocol>{

  String gameType;
  String page;
  String pageSize;
  String rbType;
  String videoType;
  String anchorId;
  bool hideSame;
  FreeAnchorLiveReqProtocol({
    this.gameType = '',
    this.page = '1',
    this.pageSize = '40',
    this.rbType = '', // 1:滚球直播 2:非滚球直播 为空全部
    this.videoType = '1', // 1:主播 2:视频 3:为空全部
    this.hideSame = false, // 隐藏相同
    this.anchorId = '',
  });

  @override
  Future<FreeAnchorLiveRspProtocol> onRequest() {
    var params = {
      'gameType': '',
      'page': page,
      'pageSize': pageSize,
      'rbType': rbType,
      'videoType': videoType,
      'hideSame': hideSame,
      'anchorId': anchorId
    };
    String groupId = '${config.userInfo.sportPlatformId}';
    return get(
        api: '/game/anchorLiveList?groupId=$groupId',
        urlParams: params,
        responseProtocol: FreeAnchorLiveRspProtocol()
    );
  }
}

class FreeAnchorLiveRspProtocol extends HttpResponseProtocol {
  List freeAnchors = [];
  List liveRooms = [];
  int total = 0;
  int totalRooms = 0;

  @override
  void onParse(data){
    if (data != null) {
      AiJson json = AiJson(data);
      total = json.getNum('total');
      totalRooms = json.getNum('totalRooms');
      freeAnchors = json.getArray('list');
      liveRooms = json.getArray('liveRooms');
    }
  }
}

// 走503，403回调
class AnchorLiveListReqProtocol {
  String gameType;
  String page;
  String pageSize;
  String rbType;
  String videoType;
  String anchorId;
  bool hideSame;
  AnchorLiveListReqProtocol({
    this.gameType = '',
    this.page = '1',
    this.pageSize = '40',
    this.rbType = '', // 1:滚球直播 2:非滚球直播 为空全部
    this.videoType = '1', // 1:主播 2:视频 3:为空全部
    this.hideSame = false, // 隐藏相同
    this.anchorId = '',
  });

  Future<AnchorLiveListRspProtocol> request()async{
    String groupId = '${config.userInfo.sportPlatformId}';
    var url = 'game/anchorLiveList?groupId=$groupId&gameType=$gameType&page=$page&pageSize=$pageSize&rbType=$rbType&videoType=$videoType&anchorId=$anchorId&hideSame=$hideSame';
    var rst = await Net.get(url);
    var rstM = AnchorLiveListRspProtocol.fromMap(rst);
    if(rstM.code != 200 && rstM.code != 404)throw Exception("${rstM.msg}");
    return rstM;
  }
}

class AnchorLiveListRspProtocol extends BaseModel {
  List freeAnchors = [];
  List liveRooms = [];
  int total = 0;
  int totalRooms = 0;

  AnchorLiveListRspProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {
    if(map==null) return;

    AiJson json = AiJson(map);
    total = json.getNum('data.total');
    totalRooms = json.getNum('data.totalRooms');
    freeAnchors = json.getArray('data.list');
    liveRooms = json.getArray('data.liveRooms');
    print('');
  }
}


