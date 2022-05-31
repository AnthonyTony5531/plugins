
import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/models/module_config/HotMatchRecommendModel.dart';
import '../../api.dart';

/*
*********************************************************************
 * author:wilson
 * date:2020-05-27
 **********************************************************************
 */

//
//商户模块列表
//
class ModuleConfigReqProtocol extends BaseReqProtocol<ModuleConfigRspProtocol> {

  // modeType 1:ai、3:小金
  ModuleConfigReqProtocol({int modeType = 1}) {
    param = {
      'modeType' : modeType,
    };
  }

  @override
  String get apiUrl => Api.ModuleConfig;

  String get baseUrl => Api.baseUrl;

  @override
  Future<ModuleConfigRspProtocol> result(Map<String, dynamic> map)async {
    return ModuleConfigRspProtocol.fromMap(map);
  }
}


class ModuleConfigRspProtocol extends BaseModel{
  ModuleConfigModel model = ModuleConfigModel();

  ModuleConfigRspProtocol.fromMap(Map<String, dynamic> map):super.fromMap(map){
    if(isSuccess){
      model = ModuleConfigModel.fromMap(map);
    }
  }
}
