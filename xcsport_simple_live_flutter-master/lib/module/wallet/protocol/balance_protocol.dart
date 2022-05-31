import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/module/common/util/http/http_request_protocol.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/module/wallet/model/player_balance.dart';

///
///
class BalanceReqProtocol extends HttpRequestProtocol<BalanceRspProtocol> {

  final String walletId;
  final Map<String, String> header;
  final String serverUrl;

  BalanceReqProtocol({this.walletId, this.header, this.serverUrl});

  @override
  Future<BalanceRspProtocol> onRequest() {
    return get(
      api: '/player/getBalance',
      responseProtocol: BalanceRspProtocol(),
      urlParams: isEmpty(this.walletId) ? null : {'wid': this.walletId},
      header: this.header,
      serverUrl: isEmpty(serverUrl) ? null : serverUrl,
    );
  }
}

class BalanceRspProtocol extends HttpResponseProtocol {

  PlayerBalance balance;

  @override
  void onParse(data) {
    try{
      if(data != null){
        balance = PlayerBalance.from(data);
      } else {
        balance = PlayerBalance.from(null);
      }
    } catch(e){
      print("=======>>>BalanceReqProtocol  $e");
    }

  }
}