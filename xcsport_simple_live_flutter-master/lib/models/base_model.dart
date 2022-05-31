import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';

class BaseModel {
  int code;
  String msg;
  num systemTime;
  String whTime;  // 系统维护时间
  String whCode; // 系统维护code为字符串
  BaseModel({
    this.code = 0,
    this.msg = '',
    this.systemTime = 0,
    this.whTime = '',
    this.whCode = '',
  });
  BaseModel.fromMap(Map<String, dynamic> map) {
    this.fromMap(map);
  }

  bool  get is404{
    return code == 404;
  }

  bool  get is403{
    return code == 403;
  }

  //token失效
  bool  get isLogout{
    return code == 405 || code == 401;
  }
  //超时
  bool get isOvertime{
    return code == 406;
  }
  //服务器维护中
  bool  get is503{
    return whCode == '503' || code == 503;
  }

  // 104015 商户禁用
  bool get isMerchantForbit{
    return code == 104015;
  }
  // 202019 应用禁用
  bool get isAppForbit{
    return code == 202019;
  }

  bool  get isSuccess{
    return code == 200;
  }

  //是否未充值过
  bool  get isUnRecharge{
    return code == 204 || code == 413;
  }

  bool get isResultSuccess{
    return is404 || isSuccess;
  }

  //错误
  bool  get isError{
    return code != 200;
  }

  //网络异常
  bool  get isNetError{
    return !(isSuccess ||isLogout ||is404||is503);
  }

  /*
  * 902010   爆料内容不能为空
  * 902009   发布内容不能超过1500
  * 711004   内容包含敏感词
  * */
  bool get isShareError {
    return code == 902010 || code == 902009 || code == 711004;
  }

  // 902003 爆料被删除
  bool get isRemoveShare {
    return code == 902003;
  }

  fromMap(Map<String, dynamic> map) {
    var whCode = map['code'];
    if (whCode is String) {
      this.whCode = whCode;
    }
    else{
      this.code = whCode;
    }

    if (isShareError) {
      AiJson aiJson = AiJson(config.baseLang);
      this.msg = aiJson.getString('shareOrderError.$code',defaultValue: this.msg);
    } else {
      this.msg = map['msg'];
      if (config.isTwLang) {
        this.msg = config.langConfig.transToTwText(cnString: this.msg);
      }
    }

    this.systemTime = new AiJson(map).getTimestamp('systemTime');
    this.whTime = map['whTime'];
    config.session.setSystemTime(systemTime);
  }

  toMap() {
    return {'code': this.code, 'msg': this.msg, 'systemTime': this.systemTime??0};
  }
}
