import 'package:common_component/mvvm/model/config/config.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';

class Live188TokenConfig extends IConfig {
  String _token;
  String get token => _token;
  bool loginShow = false;

  @override
  String get name => 'flutter_common_l188_token_config';

  bool isLogout() {
    return token == null;
  }

  void saveToken(String token) {
    _token = token;
    if(isNotEmpty(token)){
      loginShow = false;
    }
    ccCache.setString('$name token', token);
  }

  @override
  Future<void> init() async {
    await super.init();
    _token = ccCache.getString('$name token', null);
  }
}
