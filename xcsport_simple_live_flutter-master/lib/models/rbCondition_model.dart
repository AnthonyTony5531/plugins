import 'package:fast_ai/utils/ai_json.dart';

class RBConditionModel {
  
  String gameType;
  int gameListCount;
  int liveCount;
  int liveAndAnchorCount;
  int liveAndAnchorAppCount;
  int count = 0;

  RBConditionModel({
    this.gameType = '',
    this.gameListCount = 0,
    this.liveCount = 0,
    this.liveAndAnchorCount = 0,
    this.liveAndAnchorAppCount = 0,
    this.count = 0,
  });

  RBConditionModel fromRBConditionReqProtocol(Map<String,dynamic> result){
    if (result.isEmpty) {
      return this;
    }
    gameType = AiJson(result).getString("gameType");
    liveCount = AiJson(result).getNum("liveCount");
    liveAndAnchorCount = AiJson(result).getNum("liveAndAnchorCount");
    liveAndAnchorAppCount = AiJson(result).getNum("liveAndAnchorAppCount");
    count = AiJson(result).getNum("count");
    return this;
  }
}