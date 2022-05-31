import 'dart:convert' as _convert;
import 'package:common_component/mvvm/model/config/config.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/module/wallet/model/live188_wallet_data_model.dart';
import 'package:flutter/material.dart';

import 'flutter_wallet_centerconfig.dart';

/// 余额配置
class Live188WalletConfig extends IConfig {
  @override
  String get name => 'live188_wallet_config';



  @override
  Future<void> init() async {
    await super.init();
  }

  List<Live188WalletData> _merchantWalletConfig;
  List<Live188WalletData> merchantAllWalletConfig = [];
  // 用户当前选择的钱包id
  String _walletId;
  // 用户当前选择的钱包name
  String _walletCoinName;

  String get walletCoinName {
    if(_walletCoinName == null){
      _walletCoinName = ccCache.getString('live188_userWalletCoinName','CNY');
    }
    if(_walletCoinName == null || _walletCoinName == 'CNY'){
      return 'RMB';
    }
    return _walletCoinName ?? 'RMB';
  }
  String get walletId => _walletId ?? '1';

  String getCoinNameByWalletId(String wId){
    if(merchantAllWalletConfig == null || merchantAllWalletConfig.isEmpty){
      return 'RMB';
    }
    var w = merchantAllWalletConfig.firstWhere((e) => e.walletId == wId,orElse: ()=>null);
    if(w == null || w.currency == 'CNY'){
      return 'RMB';
    }

    return w.currency;
  }

  void saveMerchantWalletConfig(List<Live188WalletData> data, String widOnServer) {
    if (data == null || data.length == 0) {
      return;
    }

    setMerchantWalletConfigCache(data);
    _merchantWalletConfig = data;
    String defaultWalletId;
    if (!isEmpty(widOnServer)) {
      defaultWalletId = widOnServer;
      ccCache.setString('live188_userWalletId', widOnServer);
    } else {
      defaultWalletId = ccCache.getString('live188_userWalletId',null);
    }
    if (isEmpty(defaultWalletId)) {
      var walletData = data.first;
      setDefaultWallet(walletId: walletData.walletId);
    } else {
      var walletData = _merchantWalletConfig.firstWhere((walletData) => walletData.walletId == defaultWalletId, orElse: () => null);
      setDefaultWallet(walletId: walletData.walletId);
    }
  }

  void getMerchantWalletConfig() {}

  bool setDefaultWallet({@required String walletId}) {
    var walletData = merchantWalletConfig.firstWhere((walletData) => walletData.walletId == walletId, orElse: () => null);
    if (walletData == null || isEmpty(walletData.walletId) || isEmpty(walletData.currency)) {
      return false;
    }
    this._walletId = walletData.walletId;
    this._walletCoinName = walletData.currency;
    ccCache.setString('live188_userWalletId', _walletId);
    ccCache.setString('live188_userWalletCoinName', _walletCoinName);
    if (isNotEmpty(walletData.balance)) {
      walletCenterConfig.balanceConfig.saveBalance(walletData.balance);
    }
    return true;
  }

  //
  void setMerchantWalletConfigCache(List<Live188WalletData> data) {
    ccCache.setString('live188_merchantWalletConfig', _convert.jsonEncode(data));
  }

  List<Live188WalletData> get merchantWalletConfig {
    if (_merchantWalletConfig == null || _merchantWalletConfig.length == 0) {
      String walletConfigCache = ccCache.getString('live188_merchantWalletConfig',null);
      if (!isEmpty(walletConfigCache)) {
        var walletConfigList = _convert.jsonDecode(walletConfigCache);
        if (walletConfigList is List && walletConfigList.length > 0) {
          walletConfigList?.forEach((cache) {
            Live188WalletData walletData = Live188WalletData.fromMapCache(cache);
            Live188CurrencyName currencyName = Live188CurrencyName.fromMapCache(cache['currencyName']);
            walletData.currencyName = currencyName;
            _merchantWalletConfig?.add(walletData);
          });
        }
      }
    }
    if (_walletId == null) {
      _walletId = ccCache.getString('live188_userWalletId',null);
    }
    if (_walletCoinName == null) {
      _walletCoinName = ccCache.getString('live188_userWalletCoinName',null);
    }
    return _merchantWalletConfig;
  }
}
