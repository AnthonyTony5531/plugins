import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_date.dart';


/// 获取系统维护状态信息
class SystemMaintainInfoReqProtocol extends BaseReqProtocol<SystemMaintainInfo> {
  SystemMaintainInfoReqProtocol();

  @override
  String get apiUrl => 'dataMaintainStatus';

  @override
  Future<SystemMaintainInfo> result(Map<String, dynamic > map) async{
    return SystemMaintainInfo.fromMap(map);
  }
}


class SystemMaintainInfo extends BaseModel {
  bool isAllSystemMaintain = false;
  List<String> platformIds = [];/// 维护中的平台ids
  Map<String,String> startTimes = {};
  Map<String,String> endTimes = {};

  SystemMaintainInfo.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if(isSuccess) {
      AiJson json = AiJson(map);
      List infos = json.getArray('data');
      Set<String> platIds = Set();
      infos.forEach((element) {
        if(element is Map && element.keys?.first != null && element.values?.first != null) {
          String key = element.keys.first;
          String value = element.values.first;

          platIds.add(key);
          platformIds = platIds.toList();

          // 解析时间
          List<String> params = value.split(',');
          if (params.length >= 4) {
            isAllSystemMaintain = params.last == 'true';

            String startTime = AiDate.getFormatDate(params[1], format: 'HH:mm');
            String endTime = AiDate.getFormatDate(params[2], format: 'HH:mm');

            startTimes[key] = startTime;
            endTimes[key] = endTime;
          }
        }
      });
    }

    print('system repair ----> $isAllSystemMaintain, $platformIds, $startTimes, $endTimes');
  }

}
