import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:dio/dio.dart';

class PlayerGiftLimitReqProtocol {

  String walletId;    // 钱包id
  String playerId;    // 用户id
  String merchantId;  // 商户id
  PlayerGiftLimitReqProtocol({
    this.walletId,
    this.playerId,
    this.merchantId,
  });
  Future<PlayerGiftLimitRsqProtocol> request({CancelToken cancelToken})async{
    var url = "anchorConfig/api/c/gift/getPlayerGiftLimit?walletId=$walletId&playerId=$playerId&merchantId=$merchantId";
    var rst = await Net.get(url);
    if(rst is BaseModel && rst.code != 200 && rst.code != 404){
      throw (rst.code);
    }
    if(!(rst is Map<String, dynamic>)){
      throw ('');
    }
    var rstM = PlayerGiftLimitRsqProtocol.fromMap(rst);
    if(rstM.code != 200 && rstM.code != 404 && rstM.code != 602017) throw('${rstM.msg}');
    return rstM;
  }
}

class PlayerGiftLimitRsqProtocol extends BaseModel {

  String isOpen = 'N';  // Y 开启  N关闭(没有限制可以任意送礼物)
  num giftLimit = 0;    // 剩余送礼物额度
  PlayerGiftLimitRsqProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    if(map == null || map.isEmpty){
      return;
    }
    var json = AiJson(map);
    isOpen = json.getString("data.isOpen");
    giftLimit = json.getNum('data.giftLimit');
  }
}
