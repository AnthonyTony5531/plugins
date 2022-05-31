import 'package:fast_ai/utils/ai_json.dart';

class MerchantLang {
  String key;// zh-cn  vi-vn
  String value; // 默认名称： 简体中文  泰语 (中文译文)

  MerchantLang({
    this.key,
    this.value,
  });

  MerchantLang.fromJson(Map<String, dynamic> json) {
    AiJson aiJson = AiJson(json);
    key = aiJson.getString('key');
    value = aiJson.getString('value');
  }
}