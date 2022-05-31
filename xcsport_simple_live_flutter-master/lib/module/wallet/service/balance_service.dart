import 'package:common_component/mvvm/model/service/service.dart';
import 'package:fast_ai/module/wallet/config/flutter_wallet_centerconfig.dart';
import 'package:fast_ai/module/wallet/protocol/balance_protocol.dart';

class BalanceService extends IService {

  @override
  String get name => 'flutter_wallet_balance_service';

  @override
  Future<void> init() async {
    await super.init();
  }

  Future<void> refreshBalance() async {
    var protocol = await BalanceReqProtocol(walletId: walletCenterConfig.walletConfig.walletId).request();
    if (protocol.isSuccess) {
      walletCenterConfig.balanceConfig.saveBalance(protocol.balance.balance);
    }
    return;
  }
}
