import 'package:common_component/mvvm/model/config/config.dart';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/module/common/matedata/package_info.dart';
import 'package:fast_ai/module/common/matedata/server_env.dart';

///@autho king
///@date 8/2/21
///

//服务器地址配置
class ServerUrlConfig extends IConfig {
  String _imUrl; //IM
  String _imgUrl; //图片
  String _bet;

  String get imgUrl => _imgUrl;

  String get imUrl => _imUrl;

  @override
  String get name => 'flutter_common_server_url_config';

  //C端目前只有这个商城服务，但不能作为默认地址
  String get betServer => _bet;

  @override
  Future<void> init() async {
    await super.init();
    _initUrl(PackageInfo.Env);
    return super.init();
  }

  void _initUrl(String envName) {
    _bet = Api.baseMainUrl;
    _imgUrl = Api.baseImgUrl;
    _imUrl = Api.baseImUrl;
  }

//  String _getString({String value, String defualtVal}) {
//    if (null == value || value.isEmpty || value.contains('@')) {
//      return defualtVal;
//    }
//    return value;
//  }

}
