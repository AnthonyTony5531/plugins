// 通过游戏key获得游戏Url
import 'package:dio/dio.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class AiGameSelectByGameKeyReqProtocol{
  final String gameKey;
  AiGameSelectByGameKeyReqProtocol({
    this.gameKey = '',
  });

  Future<AiGameSelectByGameKeyRspProtocol> request({CancelToken cancelToken}) async {

    var url = 'game/selectByGameKey?gameKey=$gameKey';
    var rst = await Net.get(url,cancelToken: cancelToken);
    var rstM = AiGameSelectByGameKeyRspProtocol.fromMap(rst);
    if (rstM.code != 200 && rstM.code != 404) {
      throw Exception('${rstM.msg}');
    }
    return rstM;
  }

}

class AiGameSelectByGameKeyRspProtocol extends BaseModel{
  AiGameCellModel gameModel;

  AiGameSelectByGameKeyRspProtocol.fromMap(Map<String, dynamic> map) {
    super.fromMap(map);
    if (map == null || map.isEmpty) {
      return;
    }
    List list = AiJson(map).getArray('data');
    if(list.isNotEmpty){
      var data = list[0];
      String gameKey = AiJson(data).getString('gameKey');
      String gameName = AiJson(data).getString('gameName');
      String gameNameRaw = AiJson(data).getString('gameNameRaw');
      String gameType = AiJson(data).getString('gameType');
      String icon = AiJson(data).getString('icon');
      String img = AiJson(data).getString('img');
      String order = AiJson(data).getString('order');
      String screen = AiJson(data).getString('screen');
      String supplierId = AiJson(data).getString('supplierId');
      gameModel = AiGameCellModel(
        gameKey: gameKey,
        supplierId: supplierId,
        gameType: gameType,
        icon: icon,
        img: img,
        screen: screen,
        gameName: gameName,
      );
    }
  }
}