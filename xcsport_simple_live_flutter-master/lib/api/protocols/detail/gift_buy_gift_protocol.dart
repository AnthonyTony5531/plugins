import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:dio/dio.dart';

class GiftBuyGiftReqProtocol {

  String goodsId; //物品id
  int buyCounts; //	购买数量
  String roomNo; // 房间号
  String anchorId; // 主播id
  String gidm;  // 赛事id
  String anchorType; // 自由播字段
  String source;  // 送礼物平台来源
  GiftBuyGiftReqProtocol({
    this.goodsId,
    this.buyCounts,
    this.roomNo,
    this.anchorId,
    this.gidm,
    this.anchorType,
    this.source = "LIVE-LG"
  });

  Future<GiftBuyGiftRspProtocol> request({CancelToken cancelToken})async{
    var url = "gift/buyGift";
    var params = {
      "goodsId": goodsId,
      "buyCounts": buyCounts,
      "roomNo": roomNo,
      "anchorId": anchorId,
      "gidm": gidm,
      "anchorType": anchorType,
      "source": source,
    };
    var rst = await Net.post(url,body: params,cancelToken: cancelToken);
    if(rst is BaseModel && rst.code != 200 && rst.code != 404){
      throw (rst.code);
    }
    if(!(rst is Map<String, dynamic>)){
      throw ('');
    }
    var rstM = GiftBuyGiftRspProtocol.fromMap(rst);
    if(rstM.code != 200 && rstM.code != 404 && rstM.code != 602017) throw('${rstM.msg}');
    return rstM;
  }
}

class GiftBuyGiftRspProtocol extends BaseModel {

  String tradeRemark = '';
  int status = 0; // 交易状态0:失败 1:成功
  bool isTradeSuccess = false;
  GiftBuyGiftRspProtocol.fromMap(Map<String, dynamic> map)
      : super.fromMap(map) {
    if(map == null || map.isEmpty){
      return;
    }
    tradeRemark = AiJson(map).getString("data.tradeRemark");
    status = AiJson(map).getNum('data.status');
    if(status == 1){
      isTradeSuccess = true;
    }
  }
}
