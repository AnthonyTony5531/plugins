
import 'package:fast_ai/module/common/model/protocol_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class AnchorRankModel extends ProtocolModel{
  String id;
  String anchorId;
  String anchorName;
  String headPortrait;
  num goldAmount;
  num statisticsType;
  String walletId;

  String playerId;
  String nickName;
  String headImg;
  num isMe;

  @override
  void onParse(data) {
    AiJson aiJson = AiJson(data);
    id = aiJson.getString('id');
    anchorId = aiJson.getString('anchorId');
    anchorName = aiJson.getString('anchorName');
    headPortrait = aiJson.getString('headPortrait');
    goldAmount = aiJson.getNum('goldAmount',defaultValue: aiJson.getNum('winAmount',defaultValue: 0.0));
    statisticsType = aiJson.getNum('statisticsType');
    walletId = aiJson.getString('walletId');

    playerId = aiJson.getString('playerId');
    nickName = aiJson.getString('nickName');
    headImg = aiJson.getString('headImg');
    isMe = aiJson.getNum('isMe',defaultValue: 0);
  }

}
