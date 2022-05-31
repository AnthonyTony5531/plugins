//**********************************************************************
//* author:Sam
//* date:2020-03-23
//**********************************************************************

import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_topbar/live_topbar_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';

//滚球红黄牌角球数据
class RbRedCardReqProtocol extends BaseReqProtocol {
  RbRedCardReqProtocol({String gidm, String systemId}) {
    String groupId = '${config.userInfo.sportPlatformId}';
    param = {
      'gidm': gidm,
      'type': 0,
      'groupId': groupId,
      'tbMatchId': systemId
    };
  }

  @override
  String get apiUrl => 'matches/scoresstaticsevents';

  @override
  Future<FootballAuxiliaryData> result(Map<String, dynamic> map) async {
    AiJson aiJson = new AiJson(map);
    FootballAuxiliaryData footballAuxiliaryData = FootballAuxiliaryData();
    var id = aiJson.getString('data.leagueId');
    print('$id');
    aiJson.getArray("data.statics").forEach((f) {
      AiJson tjson = new AiJson(f);
      String typeId = tjson.getString('typeId');
      var score =
          "${string(tjson.getString('homeTeamTime'), defaultVal: "-")}:${string(tjson.getString('awayTeamTime'), defaultVal: "-")}";
      //2角球
      if ('2' == typeId) {
        footballAuxiliaryData.corner = score;
      } else if ('14' == typeId) {
        footballAuxiliaryData.yellowCard = score;
      } else if ('15' == typeId) {
        footballAuxiliaryData.redCard = score;
      }
    });

    return footballAuxiliaryData;
  }
}
