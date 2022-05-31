import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/module/wallet/model/live188_wallet_data_model.dart';

///
///
class AllWalletListReqProtocol extends HttpRequestProtocol<AllWalletListRspProtocol> {


  AllWalletListReqProtocol();

  @override
  Future<AllWalletListRspProtocol> onRequest() {
    return get(
      api: '/walletmanager/api/c/getWalletAll',
      responseProtocol: AllWalletListRspProtocol(),
    );
  }
}

class AllWalletListRspProtocol extends HttpResponseProtocol {

  Live188WalletDataModel allWalletData;

  @override
  void onParse(data) {
    try{
      if(data != null){
        allWalletData = Live188WalletDataModel.fromMapAll(data);
      }
    } catch(e){
      print("=======>>>AllWalletListRspProtocol  $e");
    }

  }
}