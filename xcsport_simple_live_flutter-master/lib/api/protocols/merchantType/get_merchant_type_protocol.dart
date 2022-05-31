import 'dart:io';

import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';

class GetMerchantTypeProtocol {
  Future<GetMerchantTypeRespProtocol> request() async {
    var url = "merchantAccountServer/api/c/getCMerAccessType";
    var rst = await Net.get(url);
    var rstM = GetMerchantTypeRespProtocol.fromMap(rst);
    return rstM;
  }
}

class GetMerchantTypeRespProtocol extends BaseModel {
  /// 商户接入类型：1、3
  /// 1：ai，默认有Gbet，是否有虚拟体育看appList的appType为11/12 appStatus是否为1
  /// 3：仅Gbet(或称188或小金)，AI和虚拟体育禁止进入
  int sourceType = 1;
  List<MerchantApp> appList = [];
  bool aiEnable = true;
  bool gBetEnable = true;
  bool vsEnable = false;

  GetMerchantTypeRespProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    print('00-map=${map.toString()}');
    if (isSuccess || isNotEmpty(map)) {
      var json = AiJson(map);
      sourceType = json.getNum('data.sourceType');
      appList = json.getArray('data.appList').map((e) => MerchantApp.from(e)).toList();

      if(sourceType == 1) {
        var app = appList?.firstWhere((e) => e?.appType == (Platform.isIOS ? '11' : '12'),orElse: ()=> null);
        vsEnable = app?.appStatus == '1';
      }
      else {
        aiEnable = false;
      }
    }
  }
}

class MerchantApp {
  // 商户接入应用信息:1-8传统体育、9-12虚拟体育应用
  /// 1:pc、2:h5、3:ios、4:android、5:Gbeth5、6:Gbetios、7Gbet安卓、8Gbetpc、9虚拟体育pc、10虚拟体育h5、11虚拟体育isos、12虚拟体育安卓
  String appType;
  /// 1.正常 2.禁用
  String appStatus;
  MerchantApp.from(Map<String, dynamic> map) {
    var json = AiJson(map);
    appType = json.getString('appType');
    appStatus = json.getString('appStatus');
  }
}
