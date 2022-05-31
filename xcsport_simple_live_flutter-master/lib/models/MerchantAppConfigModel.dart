import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/models/business_config_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class MerchantAppConfigModel extends BaseModel {
  String platformId = '';
  String merchantId = '';
  String merchantName = '';
  String name = '';
  String businessLogo = '';
  LogoModel betFont;
  LogoModel topLogo;
  LogoModel loadingImage;
  List<dynamic> platformInfo;
  num pushSwitch; // 是否开启点水定时推送

  String sdkLaunchUrl;

  // 赔率自动更新,暂不上线默认关
  // bool get isOpenAutoOdds => false;
  bool get isOpenAutoOdds => (pushSwitch ?? 0) == 1;

  MerchantAppConfigModel(
      {this.platformId, this.merchantId, this.merchantName, this.name, this.betFont, this.topLogo, this.loadingImage, this.sdkLaunchUrl});

  MerchantAppConfigModel.fromMap(Map<String, dynamic> json) : super.fromMap(json) {
    var map = AiJson(json).getMap('data');
    AiJson mapJson = AiJson(map);

    platformId = mapJson.getString('platformId');
    merchantId = mapJson.getString('merchantId');
    merchantName = mapJson.getString('merchantName');
    businessLogo = mapJson.getString('businessLogo');
    name = mapJson.getString('name');

    betFont = LogoModel().fromMap(mapJson.getMap('betFont'));
    topLogo = LogoModel().fromMap(mapJson.getMap('topLogo'));
    loadingImage = LogoModel().fromMap(mapJson.getMap('loadingImage'));

    platformInfo = mapJson.getArray('platformInfo');

    pushSwitch = mapJson.getNum('pushSwitch', defaultValue: 0);
  }

  @override
  String toString() {
    return 'isSuccess=${this.isSuccess} merchantName=$merchantName, merchantId=$merchantId, name=$name, platformId=$platformId, betFont=${betFont.toString()}, topLogo=${topLogo.toString()}, loadingImage=${loadingImage.toString()} , pushSwitch=$pushSwitch';
  }
}
