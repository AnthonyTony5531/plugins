import 'package:fast_ai/models/base_model.dart';
import 'dart:convert' as _convert;

class LoginModel extends BaseModel {
  String data;
  LoginModel.fromMap(Map<String, dynamic> map): super.fromMap(map) {
    var data = map['data'] ?? "";
    try{
      Map<String, dynamic> dataMap = _convert.jsonDecode(data);
      BaseModel baseModel = BaseModel.fromMap(dataMap);
      this.code = baseModel.code;

    }catch(e){
      this.data = data;
    }
  }
}