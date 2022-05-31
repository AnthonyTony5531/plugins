import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';


///
///
class Live188WalletDataModel {

  Live188WalletDataModel();
  // 当前用户的钱包
  List<Live188WalletData> walletDatas = [];
  // 商户所支持所有的钱包
  List<Live188WalletData> walletAllDatas = [];


  Live188WalletDataModel.fromMap(List list){
    if(list == null) return;
    walletDatas.clear();
    //List list = AiJson(map).getArray('data');
    List.generate(list?.length ?? 0, (index) {
      walletDatas.add(Live188WalletData.fromMap(list[index]));
    });
  }

  Live188WalletDataModel.fromMapAll(List list){
    if(list == null) return;
    walletAllDatas.clear();
    //List list = AiJson(map).getArray('data');
    List.generate(list?.length ?? 0, (index) {
      walletAllDatas.add(Live188WalletData.fromMap(list[index]));
    });
  }

}

class Live188WalletData{
  String walletId;
  //String desc;
  //String icon;
  String currency;
  String balance;//
  Live188CurrencyName currencyName;

  Live188WalletData();

  ///
  Live188WalletData.fromMap(Map map){
    if(map == null) return;

    this.walletId = AiJson(map).getString('walletId', defaultValue: '0');
    //this.desc = AiJson(map).getString('desc', defaultValue: '');
    //this.icon = AiJson(map).getString('icon', defaultValue: '');
    this.currency = AiJson(map).getString('currency', defaultValue: '');
    currencyName = Live188CurrencyName.fromMap(AiJson(map).getMap('currencyName'));
  }

  ///
  Live188WalletData.fromMapCache(Map map){
    if(map == null) return;

    this.walletId = AiJson(map).getString('walletId', defaultValue: '0');
    this.currency = AiJson(map).getString('currency', defaultValue: '');
    this.balance = AiJson(map).getString('balance', defaultValue: '');
  }

  ///
  void setBalance(String balance){
    this.balance = balance;
  }

  @override
  String toString() {
    return 'WalletData{walletId: $walletId, currency: $currency, balance: $balance, currencyName: $currencyName}';
  }

  Map<String,dynamic> toJson() {
    return {'walletId': this.walletId, 'currency': this.currency, 'balance': this.balance, 'currencyName': currencyName.toJson()};
  }

}

class Live188CurrencyName{
  String defaultEn;
  String defaultCn;

  Live188CurrencyName();

  Live188CurrencyName.fromMap(Map map){
    if(map == null || map.length == 0) return;
    Map m = AiJson(map).getMap('default');
    this.defaultCn = AiJson(m).getString('cn');
    if (config.isTwLang) {
      this.defaultCn = config.langConfig.transToTwText(cnString: this.defaultCn);
    }
    this.defaultEn = AiJson(m).getString('en');
  }

  Live188CurrencyName.fromMapCache(Map map){
    if(map == null || map.length == 0) return;
    this.defaultCn = AiJson(map).getString('defaultCn');
    if (config.isTwLang) {
      this.defaultCn = config.langConfig.transToTwText(cnString: this.defaultCn);
    }
    this.defaultEn = AiJson(map).getString('defaultEn');
  }

  @override
  String toString() {
    return 'CurrencyName{defaultEn: $defaultEn, defaultCn: $defaultCn}';
  }

  Map<String,dynamic> toJson() {
    return {'defaultEn': this.defaultEn, 'defaultCn': this.defaultCn,};
  }

}


