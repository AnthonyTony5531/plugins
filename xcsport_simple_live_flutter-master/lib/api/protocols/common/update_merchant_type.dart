import '../../net.dart';

class UpdateMerchantTypeReqProtocol {
  // 商户类型：1默认，2新体育
  String merchantType;
  UpdateMerchantTypeReqProtocol({
    this.merchantType = '1',
  });

  Future<dynamic> request()async{
    var url = "player/updateMerchantType?merchantType=$merchantType";
    var rst = await Net.get(url);
    return rst;
  }
}



