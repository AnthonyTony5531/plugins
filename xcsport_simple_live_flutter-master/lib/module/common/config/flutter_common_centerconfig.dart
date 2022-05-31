import 'package:common_component/mvvm/model/config/config.dart';
import 'package:fast_ai/module/common/config/l188_token_config.dart';
import 'package:fast_ai/module/common/config/server_url_config.dart';
import 'package:fast_ai/module/common/config/timezone_config.dart';

class FlutterCommonCenterConfig extends IConfig {
  final ServerUrlConfig serverUrlConfig = new ServerUrlConfig();
  final Live188TokenConfig live188tokenConfig = Live188TokenConfig();
  final TimeZoneConfig timeZoneConfig = new TimeZoneConfig();
  @override
  String get name => "flutter_wallet_config";

  @override
  Future<void> init() async {
    await super.init();
    await Future.wait([
      serverUrlConfig.init(),
      live188tokenConfig.init(),
      timeZoneConfig.init()
    ]);
  }
}
