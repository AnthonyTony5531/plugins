
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'dart:convert' as _convert;

class BusinessConfigReqProtocol{

    Future<BusinessConfigResProtocol> request()async{
    var url = 'common/businessConfig';
    var rst = await Net.get(url);
    if (rst is String) { // 系统维护中返回字符串
      var rstM = BusinessConfigResProtocol.fromString(rst);
      return rstM;
    }
    else{
      var rstM = BusinessConfigResProtocol.fromMap(rst);
      if (rstM.code != 200 && rstM.code != 404)throw Exception('${rstM.msg}');
      return rstM;
    }
  }
}

class BusinessConfigResProtocol extends BaseModel{
  /// 主题色 colorA
  String themeColor;
  /// 辅助颜色 colorB
  String auxiliaryColor;
  /// 字体颜色 colorC
  String fontColor;
  /// 首页header LOGO
  String loginLogo;

  Map<String, dynamic> dataMap = Map();
  BaseModel baseModel = BaseModel();

  BusinessConfigResProtocol.fromMap(Map<String, dynamic>map): super.fromMap(map){
    dataMap = AiJson(map).getMap('data');

    var json = AiJson(dataMap);
    loginLogo = json.getString('loginLogo');
    themeColor = json.getString('themeColor');
    fontColor = json.getString('fontColor');
    auxiliaryColor = json.getString('auxiliaryColor');
  }
  BusinessConfigResProtocol.fromString(String value){
    baseModel = BaseModel.fromMap(_convert.jsonDecode(value));
  }
}