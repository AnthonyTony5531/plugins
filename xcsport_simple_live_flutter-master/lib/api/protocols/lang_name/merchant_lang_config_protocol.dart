import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/models/many_name/merchant_lang.dart';
import 'package:fast_ai/utils/ai_json.dart';

class MerchantLangConfigReqProtocol {
  Future<MerchantLangConfigRspProtocol> request() async {
//    var url = "merchantAccountServer/api/c/queryCMerLanguage";
    var url = "merchant/queryCMerLanguage";
    var rst = await Net.get(url);
    var rstM = MerchantLangConfigRspProtocol.fromMap(rst);
    return rstM;
  }
}

class MerchantLangConfigRspProtocol extends BaseModel {
  List<MerchantLang> langs = [];
  int versionType = 1;

  MerchantLangConfigRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    AiJson json = AiJson(map);
    versionType = json.getNum('data.versionType');

    var data = json.getArray("data.accessLanguage");
    var translateMap = json.getMap('data.translate');
    if (data is List) {
      data.forEach((element) {
        final lang = MerchantLang.fromJson(element);
        // 获取对应语言翻译的语言
        String value;
        try {
          value = translateMap[lang.key][lang.key];
        } catch (e) {}

        if (value != null && value.isNotEmpty) {
          lang.value = value;
        }
        langs.add(lang);
      });
    }
  }
}
