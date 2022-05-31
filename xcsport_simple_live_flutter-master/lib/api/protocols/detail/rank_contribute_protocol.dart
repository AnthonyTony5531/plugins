// 本场豪气榜protocol
import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_info_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class RankContributeReqProtocol extends BaseReqProtocol<RankContributeRankRspProtocol>{

  int page = 1;
  int pageSize = 20;
  String gidm = '';
  String anchorId = '';
  String systemId;
  String playerId;

  // 自由主播壕气榜传roomNo
  String roomNo;
  bool isFreeAnchor = false; // 是否为自由主播排行榜
  RankContributeReqProtocol({
    this.page = 1,
    this.pageSize = 20,
    this.gidm = '',
    this.anchorId = '',
    this.systemId,
    this.playerId,
    this.roomNo,
    this.isFreeAnchor = false,
  }) {

    if (isFreeAnchor) {
      param = {
        'roomNo':roomNo,
        'anchorId':anchorId,
        'page': this.page,
        'pageSize': this.pageSize,
      };
    } else {
      param = {
        'page': this.page,
        'pageSize': this.pageSize,
        'gidm': this.gidm,
        'anchorId': this.anchorId,
        'playerId': playerId,
        'systemId': systemId,
      };
    }
  }

  @override
  RequestMethodType get requestType => isFreeAnchor ? RequestMethodType.get : RequestMethodType.post;

  @override
  String get apiUrl => isFreeAnchor ? "anchorFollowOrderGameList" : "anchorOrderGameList";

  @override
  Future<RankContributeRankRspProtocol> result(Map<String, dynamic> map) async {
    return RankContributeRankRspProtocol.fromMap(map);
  }
}

class RankContributeRankRspProtocol extends BaseModel {

  AnchorContributionBaseModel anchorContributionBaseModel;
  RankContributeRankRspProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {
    if (map == null || map.isEmpty) {
      return;
    }
    AiJson aiJson = AiJson(map);
    anchorContributionBaseModel = AnchorContributionBaseModel.fromJson(aiJson.getMap('data'));
  }
}

class AnchorContributionBaseModel {
  int total = 0;
  AnchorContributionInfoModel myContribute = AnchorContributionInfoModel();
  List<AnchorContributionInfoModel> userContributeList = [];
  AnchorContributionBaseModel({this.myContribute,this.userContributeList,this.total});

  factory AnchorContributionBaseModel.fromJson(Map<String,dynamic> json){
    AiJson aiJson = AiJson(json);
    Map dic = aiJson.getMap('myContribute');
    List list = aiJson.getArray('userContributeList');
    return AnchorContributionBaseModel(
      total: aiJson.getNum('total'),
      userContributeList: list?.map((e) => AnchorContributionInfoModel.fromJson(e))?.toList() ?? [],
      myContribute: AnchorContributionInfoModel.fromJson(dic),
    );
  }
}
