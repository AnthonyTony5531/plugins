import 'package:fast_ai/models/base_model.dart';

/// 详情支持接口
class SupportModel extends BaseModel{
  SupportModel();

  _SupportModel data;

  SupportModel.fromMap(Map map): super.fromMap(map) {
    this.data = _SupportModel.fromMap(map['data']);
  }
}

class _SupportModel{
  dynamic supportRate;
  _SupportModel.fromMap(Map map) {
   this.supportRate = map['supportRate'];
  }
}