import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/config/config.dart';

class NodataConfig {
  NodataDiscription discription(String name){
    Map noDataMap = config.langMap['noData'];
    AiJson json = AiJson(noDataMap);

    if(json.getObject(name) == null)
      return null;
      
    var ret = NodataDiscription();
    ret.img = json.getString('$name.img');
    ret.title = json.getString('$name.title');
    ret.content = json.getString('$name.content');
    ret.btn = json.getString('$name.btn');
    return ret;
  }
}

class NodataDiscription {
  String img;
  String title;
  String content;
  String btn;
}

