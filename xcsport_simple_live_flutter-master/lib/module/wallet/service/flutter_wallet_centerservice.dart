import 'package:common_component/mvvm/model/service/service.dart';
import 'package:fast_ai/module/wallet/service/balance_service.dart';
import 'package:fast_ai/module/wallet/service/live188_wallet_service.dart';

class FlutterWalletCenterService extends IService {
  BalanceService balanceService = new BalanceService();
  Live188WalletService walletService = new Live188WalletService();
  @override
  String get name => 'flutter_wallet_balance';

  @override
  Future<void> init() async {
    await super.init();
    walletService.init();
    balanceService.init();
  }
}

FlutterWalletCenterService walletCenterService =  FlutterWalletCenterService();
