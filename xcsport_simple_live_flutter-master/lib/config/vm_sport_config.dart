import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/utils/ai_json.dart';

//https://vgcommonstaging.aitcloud.de/srvg-launcher/stable/bwg.html?clientId=4803&lang=zh&product=vflm&id=26a605041f924985bf0d51417ca4fc59
class VmSportApiConfig{

  bool isSuccess = false;
  String code;

  String clientId;
  String id;
  String lang;

  String vmSportDetailHost;
  String vmSportNavHost;
  String vmSportDetailPath;
  String vmSportNavPath = '/navigation';


  VmSportApiConfig.from(Map map){
    if(map == null || map.isEmpty) return;
    String url = AiJson(map).getString('data',defaultValue: '');
    code = AiJson(map).getString('code',defaultValue: '');
    if(isNullOrEmpty(url)) return;

    var uri = Uri.parse(url);
    vmSportDetailHost = uri.scheme+"://"+uri.host;
    vmSportNavHost = uri.scheme+"://"+ 'configstaging' + uri.host.substring(uri.host.indexOf('.'));
    vmSportDetailPath = uri.path;
    var params = uri.queryParameters;
    if(params != null){
      clientId = params['clientId'] ?? '';
      id = params['id'] ?? '';
      lang = params['lang'] ?? '';
    }
    isSuccess = true;
  }

}