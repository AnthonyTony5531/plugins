
import 'package:fast_ai/module/common/model/protocol_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class BrokeRankModel extends ProtocolModel {

  int total;
  List<BrokeRankItemModel> list;
  
  @override
  void onParse(data) {
    AiJson aiJson = AiJson(data);
    total = aiJson.getNum('total');
    list = aiJson.getArray('list')?.map((e) => BrokeRankItemModel()..onParse(e))?.toList() ?? [];
  }
}

class BrokeRankItemModel extends ProtocolModel {

  String playerId;
  String playerAccount;
  String nickName;
  String merchantName;
  num profitRate;
  num winRate;
  num tipOffOrderNum;
  String walletId;
  String headImg;
  bool attention;
  List<BrokeRankTitleModel> titles = [];

  @override
  void onParse(data) {
    AiJson aiJson = AiJson(data);
    playerId = aiJson.getString('playerId');
    playerAccount = aiJson.getString('playerAccount');
    nickName = aiJson.getString('nickName');
    merchantName = aiJson.getString('merchantName');
    profitRate = aiJson.getNum('profitRate',defaultValue: 0);
    winRate = aiJson.getNum('winRate',defaultValue: 0);
    tipOffOrderNum = aiJson.getNum('tipOffOrderNum',defaultValue: 0);
    walletId = aiJson.getString('walletId');
    headImg = aiJson.getString('headImg');
    attention = aiJson.getBool('attention',defaultValue: false);
//    1, 近20中X
//    2,  X连红
//    3, 段位
//    4 天梯第几名
//    5 胜率第X名
    // 6 盈利率第X名
    Map titlesMap = aiJson.getMap('titles');
    if (titlesMap.isNotEmpty) {
      titlesMap.forEach((key, value) {
        BrokeRankTitleModel brokeRankTitleModel = BrokeRankTitleModel(content: value,titleKey: key,isTi: key == '4' ? true : false);
        titles.add(brokeRankTitleModel);
      });
    }
  }

}

class BrokeRankTitleModel {
  String content;
  String titleKey;
  bool isTi; // 是否为天梯
  BrokeRankTitleModel({this.content,this.titleKey,this.isTi});
}