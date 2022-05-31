/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-12-09
 * 说明：获取赛季分类项对应排行数据
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/logger.dart';

import '../../net.dart';

class TopTypeInfoReqProtocol {
  String seasonId;
  String itemType;
  String subItemType;
  String trickType;
  String ranktype;

  num page;
  num pageSize;
  TopTypeInfoReqProtocol({
    this.seasonId = 'S1',
    this.itemType = '2',
    this.subItemType = 'FT',
    this.trickType = '',
    this.ranktype = '1',
    this.page = 1,
    this.pageSize = 5,
  });

//  Future<TopTypeInfoRspProtocol> request() async {
////    this.seasonId = config.userInfo?.season?.currentSeason?.seasonId;
//    if (seasonId == null) {
//      var res = await Net.getSeasonInfo();
//      if (res.code == 200) {
//        seasonId = res.currentSeason?.seasonId;
//        config.userInfo?.season = res;
//      }
//    }
//
//    //http://doc.xc.com:8090/pages/viewpage.action?pageId=8389005#id-09.%E8%B5%9B%E5%AD%A3%E6%8E%92%E8%A1%8C%E6%A6%9C-2.%E8%8E%B7%E5%8F%96%E8%B5%9B%E5%AD%A3%E5%88%86%E7%B1%BB%E9%A1%B9%E5%AF%B9%E5%BA%94%E6%8E%92%E8%A1%8C%E6%95%B0%E6%8D%AE
//    var url =
//        "top/competition/season/topTypeInfo?page=$page&pageSize=$pageSize&seasonId=$seasonId&itemType=$itemType&subItemType=$subItemType&trickType=$trickType&ranktype=$ranktype";
//    var rst = await Net.get(url);
//    var rstM = TopTypeInfoRspProtocol.fromMap(rst);
//    return rstM;
//  }
//}

//class TopTypeInfoRspProtocol extends BaseModel {
//  List<dynamic> topSeasonDatas = [];
//  TopTypeInfoRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
//    topSeasonDatas = AiJson(map).getArray("data.topSeasonDatas");
//    logInfo("TopTypeInfoRspProtocol");
//  }
}
