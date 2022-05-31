import 'package:common_component/mvvm/model/service/service.dart';
import 'package:fast_ai/module/wallet/config/flutter_wallet_centerconfig.dart';
import 'package:fast_ai/module/wallet/model/live188_wallet_data_model.dart';
import 'package:fast_ai/module/wallet/protocol/all_wallet_list_protocol.dart';
import 'package:fast_ai/module/wallet/protocol/balance_protocol.dart';
import 'package:fast_ai/module/wallet/protocol/wallet_list_protocol.dart';

///
class Live188WalletService extends IService {

  @override
  String get name => 'live188_wallet_wallet_service';

  @override
  Future<void> init() async {
    await super.init();
    await getWalletList();
  }

  /// 商户传进来时只有一个钱包币种，如果出现多个只取第一个
  Future<void> getWalletList() async {
    var rsp = await WalletListReqProtocol().request();
    Live188WalletDataModel walletDataModel = rsp.walletData;
    if(rsp?.isSuccess ?? false){
      if(walletCenterConfig.walletConfig.merchantWalletConfig?.length ?? 0 > 0){
        walletDataModel.walletDatas.forEach((w) {
          w.balance = walletCenterConfig.walletConfig.merchantWalletConfig.firstWhere((cacheWallet) => cacheWallet.walletId == w.walletId,orElse: ()=>null)?.balance;
        });
      }
      if(walletDataModel.walletDatas.length >= 1){
        var wIds = walletDataModel.walletDatas.map((e) => e.walletId)?.toList() ?? [];
        walletCenterConfig.walletConfig.saveMerchantWalletConfig(walletDataModel.walletDatas,wIds[0]);
      }
    }
    if(walletCenterConfig.walletConfig.merchantWalletConfig.length > 0){
      List<Future<Map<String,dynamic>>> funs = [];
      walletCenterConfig.walletConfig.merchantWalletConfig.forEach((w) {
        funs.add(_getWalletBalance(w.walletId));
      });

      Future.wait(funs).then((List balances) {
        for(Map<String,dynamic> b in balances){
          if(b.length > 0){
            var walletId = b['walletId'];
            var balance = b['balance'];
            Live188WalletData wd = walletCenterConfig.walletConfig.merchantWalletConfig.firstWhere((walletData) => walletData.walletId == walletId,orElse: ()=>null);
            if(wd != null){
              wd.balance = balance;
            }
          }
        }
        walletCenterConfig.walletConfig.setMerchantWalletConfigCache(walletCenterConfig.walletConfig.merchantWalletConfig);
      });
    }
    // 获取商户支持的所有钱包
    AllWalletListReqProtocol().request().then((value) {
      if (value.isSuccess ?? false) {
        walletCenterConfig.walletConfig.merchantAllWalletConfig = value.allWalletData.walletAllDatas;
      }
    });
    return walletDataModel;
  }

  Future<Map<String,dynamic>> _getWalletBalance(String walletId) async {
    var protocol = await BalanceReqProtocol(walletId: walletId).request();
    if (protocol.isSuccess) {
      if(walletId == walletCenterConfig.walletConfig.walletId){
        walletCenterConfig.balanceConfig.saveBalance(protocol.balance.balance);
      }
      return {
        'walletId': walletId,
        'balance': protocol.balance.balance,
      };
    }
    return {};
  }
}
