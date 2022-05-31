import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class SuggestModel extends BaseModel{
  _SuggestModel data;
  SuggestModel.fromMap(Map<String,dynamic> map):super.fromMap(map){
    this.data = _SuggestModel.fromMap(map['data']);
  }
}

class _SuggestModel{
  String resourceUrl;
  String resourceDomain;
  _SuggestModel.fromMap(Map map){
    resourceUrl = AiJson(map).getString('resourceUrl');
    resourceDomain = AiJson(map).getString('resourceDomain');
  }
}