import 'package:common_component/mvvm/model/config/config.dart';
import 'package:fast_ai/module/wallet/config/balance_config.dart';

import 'live188_wallet_config.dart';

class FlutterWalletCenterConfig extends IConfig {

  BalanceConfig balanceConfig = BalanceConfig();
  Live188WalletConfig walletConfig = Live188WalletConfig();

  @override
  String get name => "flutter_wallet_config";

  @override
  Future<void> init() async {
    await super.init();
    walletConfig.init();
    balanceConfig.init();
  }
}

FlutterWalletCenterConfig walletCenterConfig = FlutterWalletCenterConfig();
