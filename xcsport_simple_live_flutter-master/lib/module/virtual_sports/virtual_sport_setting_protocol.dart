import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class VirtualSportSettingProtocol {
  final String serverUrl;

  VirtualSportSettingProtocol({this.serverUrl});

  Future<VirtualSportSettingRspProtocol> request() async {
    var result = await Net.get('/ai/virtual/game/virtual/checkManager', preUrl: serverUrl);
    var resultM = VirtualSportSettingRspProtocol.fromMap(result);
    return resultM;
  }
}

class VirtualSportSettingRspProtocol extends BaseModel {
  bool checkManager = false;
  String speedUrl = '';

  VirtualSportSettingRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if (map == null) {
      return;
    }
    //{code: 200, msg: SUCCESS, systemTime: 1636249754984, data: {domain: http://dev.vapi.yc365d.com, checkManager: true}}
    AiJson aiJson = AiJson(map);
    checkManager = aiJson.getBool('data.checkManager', defaultValue: false);
    speedUrl = aiJson.getString('data.domain', defaultValue: '');
    print('VirtualSportSettingRspProtocol ========> isOpen : $checkManager , domain : $speedUrl');
  }
}
