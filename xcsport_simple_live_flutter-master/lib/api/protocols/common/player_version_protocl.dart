import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';

class PlayerVersionReqProtocol{

  String terVersion;
  String event;
  PlayerVersionReqProtocol({
    this.terVersion,
    this.event,
  });

  Future<bool> request()async{
    terVersion = config.appInfo.iosVersion;
    event = '1';
    String url = 'player/playerVersion';
    var params = {
      'terVersion': terVersion,
      'event': event,
    };
    var result = await Net.post(url,body: params);
    return true;
  }
}