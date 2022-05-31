/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-22
 * 说明：取球种及数量
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/logger.dart';

import '../../net.dart';

class LeagueListReqProtocol {
  String gameType;
  String gradeId;
  LeagueListReqProtocol({
    this.gameType = 'FT',
    this.gradeId = "1,2",
  });

  Future<LeagueListRspProtocol> request()async{
    var url = "common/leagueList?gameType=$gameType&gradeId=$gradeId";
    var rst = await Net.get(url);
    var rstM = LeagueListRspProtocol.fromMap(rst);
    return rstM;
  }
}

class LeagueListRspProtocol extends BaseModel {

  LeagueListRspProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {
    
    // content = AiJson(map).getString("data.content");
    logInfo("LeagueListRspProtocol");
  }
}

