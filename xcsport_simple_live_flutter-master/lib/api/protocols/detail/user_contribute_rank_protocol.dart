import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/api/protocols/detail/rank_contribute_protocol.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class UserContributeRankReqProtocol {

  int page = 1;
  int pageSize = 20;
//  String gidm = '';
  String systemId = '';
  String anchorId = '';
  String roomNo;
  UserContributeRankReqProtocol({
    this.page = 1,
    this.pageSize = 20,
//    this.gidm = '',
    this.systemId = '',
    this.anchorId = '',
    this.roomNo,
  });

  Future<UserContributeRankRspProtocol> request() async {
    var url = "gift/userContributeRank";

    var param = {
      'roomNo': this.roomNo,
      'page': this.page,
      'pageSize': this.pageSize,
//      'gidm': this.gidm,
      'systemId': this.systemId,
      'anchorId': this.anchorId
    };

    var rst = await Net.post(url, body: param);
    var resultM = UserContributeRankRspProtocol.fromMap(rst);
    if (resultM.code != 200 && resultM.code != 404) throw Exception(
        "${resultM.msg}");
    return resultM;
  }
}

class UserContributeRankRspProtocol extends BaseModel {
  AnchorContributionBaseModel anchorContributionBaseModel;
  UserContributeRankRspProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {
    if (map == null || map.isEmpty) {
      return;
    }
    AiJson aiJson = AiJson(map);
    anchorContributionBaseModel = AnchorContributionBaseModel.fromJson(aiJson.getMap('data'));
  }
}