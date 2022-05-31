import 'package:common_component/mvvm/model/config/config.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/util/listeners/value_changed_listener.dart';
import 'package:fast_ai/module/common/matedata/cache_table_name.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';

/// 余额配置
class BalanceConfig extends IConfig {
  @override
  String get name => 'flutter_wallet_balanceconfig';

  var balanceListener = ValueChangedListener<String>();

  String _balance = '0.00';

  @override
  Future<void> init() async {
    await super.init();
    _loadBalanceFromCache();
  }

  //
  void _loadBalanceFromCache() {
    _balance = ccCache.getString(WalletCacheTableName.WalletBalance, '0.00');
  }

  //
  void saveBalance(String balance) {
    if(isEmpty(balance)){
      return;
    }
    if (_balance != balance) {
      _balance = balance;
      ccCache.setString(WalletCacheTableName.WalletBalance, balance,
          needNotify: true);
      balanceListener.fire(balance);
    }
  }

  //
  String getBalance() {
    return _balance ?? '0.00';
  }

  num getBalanceNum(){
    num balance = 0.00;
    try {
      balance = num.tryParse(_balance);
    } catch (_) {}

    return balance;
  }
}
