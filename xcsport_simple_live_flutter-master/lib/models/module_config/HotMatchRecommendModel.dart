import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class ModuleConfigModel extends BaseModel {
  ModuleConfigModel();

  List<ModuleConfig> moduleConfigs = [];

  ModuleConfigModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    List items = AiJson(map).getArray("data.moduleList");
    this.moduleConfigs = List.generate(items?.length, (idx) {
      return ModuleConfig.fromMap(items[idx]);
    });
  }
}

class ModuleConfig {
  ModuleConfig();

  int id;
  String code;
  String name;
  int level;
  int parentId;
  int enable;
  String createBy;
  int createTime;
  String updateBy;
  int updateTime;
  int apiNum;
  List<ModuleConfig> childList;

  ModuleConfig.fromMap(Map<String, dynamic> map) {
    if (map == null || map.length == 0) return;

    this.id = AiJson(map).getNum('id');
    this.code = AiJson(map).getString('code');
    this.name = AiJson(map).getString('name');
    this.level = AiJson(map).getNum('level');
    this.parentId = AiJson(map).getNum('parentId');
    this.enable = AiJson(map).getNum('enable');
    this.createBy = AiJson(map).getString('createBy');
    this.createTime = AiJson(map).getTimestamp('createTime');
    this.updateBy = AiJson(map).getString('updateBy');
    this.updateTime = AiJson(map).getNum('updateTime');
    this.apiNum = AiJson(map).getNum('apiNum');

    var cl = AiJson(map).getArray('childList');
    this.childList = [];
    if(cl != null){
      childList = List.generate(cl?.length, (idx) {
        return ModuleConfig.fromMap(cl[idx]);
      });
    }

  }
}
