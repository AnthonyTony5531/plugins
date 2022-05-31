import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';

class BetWinNoticeModel extends BaseModel {
  BetWinNoticeModel();
  List<BetWinNoticeItemModel> data;

  BetWinNoticeModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.data = map['data'] == null
        ? null
        : map['data'].map<BetWinNoticeItemModel>((v) => BetWinNoticeItemModel.fromMap(v)).toList();
  }
}

class BetWinNoticeItemModel {
  BetWinNoticeItemModel();
  dynamic orderId, gameType, gold, winGold, winAndLossGold, playerId, nickname, headImg, resultDate,totalCount,ior,levelMsg;
  num level;
  String dayMaxWinAmount, thanRatio;
  int walletId;
  BetWinNoticeItemModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.orderId = map['orderId'];
    this.gameType = map['gameType'];
    this.gold = map['gold'];
    this.winGold = map['winGold'];
    this.winAndLossGold = map['winAndLossGold'];
    this.playerId = map['playerId'];
    this.nickname = map['nickname'];
    this.headImg = map['headImg'] ?? '';
    this.totalCount = map['totalCount'];
    this.resultDate = new AiJson(map).getTimestamp('resultDate');
    this.ior = string(map['ior'], defaultVal: map['ioRatio']);
    this.levelMsg = map['levelMsg'];
    if (config.isTwLang) {
      this.levelMsg = config.langConfig.transToTwText(cnString: levelMsg);
    }
    this.dayMaxWinAmount = AiJson(map).getString('dayMaxWinAmount');
    this.thanRatio = AiJson(map).getString('thanRatio');
    this.level = AiJson(map).getNum('level');
    this.walletId = AiJson(map).getNum('walletId');
  }
}
