//**********************************************************************
//* author:Sam
//* date:2020-05-11
//**********************************************************************


import 'package:dio/dio.dart';
import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/api/exception/customize_exception.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class AiGameURlRequestProtocol extends BaseReqProtocol<AiGameURlResponseProtocol>{

  final String supplierId;
  final String gameKey;

  AiGameURlRequestProtocol({this.supplierId, this.gameKey}){
    param = {
      'supplierId':supplierId,
      'gameKey':gameKey,
    };

  }

  @override
  String get apiUrl => 'game/url';

  @override
  Future<AiGameURlResponseProtocol> result(Map<String,dynamic > map) async{
    return AiGameURlResponseProtocol(map);
  }

}

class AiGameURlResponseProtocol extends BaseModel{
  String url;
  AiGameURlResponseProtocol(Map<String,dynamic > map):super.fromMap(map){
    if (isSuccess) {
      url = AiJson(map).getString('data.url');
    }
  }

}

class GameURlReqProtocol{
  final String supplierId;
  final String gameKey;
  GameURlReqProtocol({
    this.supplierId,
    this.gameKey,
  });

  Future<GameURlRspProtocol> request({CancelToken cancelToken}) async {

    var url = 'game/url?supplierId=$supplierId&gameKey=$gameKey';
    var rst = await Net.get(url,cancelToken: cancelToken);
    var rstM = GameURlRspProtocol.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) {
      throw Exception('${rstM.msg}');
    }
    return rstM;
  }

}

class GameURlRspProtocol extends BaseModel{

  String url;
  GameURlRspProtocol.fromMap(Map<String, dynamic> map) {
    super.fromMap(map);
    if (map == null || map.isEmpty) {
      return;
    }
    url = AiJson(map).getString('data.url');
  }
}

// 新游戏url
class GameURlNewReqProtocol{
  final String supplierId;
  final String gameKey;
  GameURlNewReqProtocol({
    this.supplierId = '',
    this.gameKey = '',
  });

  Future<GameURlNewRspProtocol> request({CancelToken cancelToken}) async {

    var url = 'game/url/new?supplierId=$supplierId&gameKey=$gameKey';
    var rst = await Net.get(url,cancelToken: cancelToken);
    var rstM = GameURlNewRspProtocol.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) {
      throw CustomizeException('${rstM.msg}');
    }
    return rstM;
  }

}

class GameURlNewRspProtocol extends BaseModel{
  String url;
  String sha256Api;
  String downloadApi;
  String sha256Code;
  GameURlNewRspProtocol.fromMap(Map<String, dynamic> map) {
    super.fromMap(map);
    if (map == null || map.isEmpty) {
      return;
    }
    url = AiJson(map).getString('data.url');
    sha256Api = AiJson(map).getString('data.sha256Api');
    downloadApi = AiJson(map).getString('data.downloadApi');
    sha256Code = AiJson(map).getString('data.sha256Code');
  }
}




