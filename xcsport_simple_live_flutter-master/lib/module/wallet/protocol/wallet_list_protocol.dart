import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/module/wallet/model/live188_wallet_data_model.dart';

///
///
class WalletListReqProtocol extends HttpRequestProtocol<WalletListRspProtocol> {

  final Map<String, String> header;
  final String serverUrl;

  WalletListReqProtocol({this.header, this.serverUrl});

  @override
  Future<WalletListRspProtocol> onRequest() {
    return get(
      api: '/merchantAccountServer/api/c/getCMerAccessWallet',
      responseProtocol: WalletListRspProtocol(),
      header: this.header,
      serverUrl: isEmpty(serverUrl) ? null : serverUrl,
    );
  }
}

class WalletListRspProtocol extends HttpResponseProtocol {

  Live188WalletDataModel walletData;

  @override
  void onParse(data) {
    try{
      if(data != null){
        walletData = Live188WalletDataModel.fromMap(data);
      }
    } catch(e){
      print("=======>>>Live188WalletDataModel  $e");
    }

  }
}