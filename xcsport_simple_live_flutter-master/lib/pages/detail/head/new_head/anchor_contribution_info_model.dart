
import 'package:fast_ai/utils/ai_json.dart';
class AnchorContributionInfoModel{

  bool isHaveContribution = false;
  bool isAttention; // 是否已经关注
  int rank;         // 我的排行
  String playerId;
  String nickName;
  String headImg;
  String contributeValue; //贡献值
  String walletId;
  AnchorContributionInfoModel({
    this.nickName = '',
    this.headImg = '',
    this.contributeValue = '0.00',
    this.rank = 0,
    this.isAttention = false,
    this.playerId,
    this.walletId,
  });

  factory AnchorContributionInfoModel.fromJson(Map<String,dynamic> json) {
    AiJson aiJson = AiJson(json);
    return AnchorContributionInfoModel(
        nickName:aiJson.getString('nickName'),
        headImg: aiJson.getString('headImg'),
        contributeValue: aiJson.getString('contributeValue',defaultValue: '0.00'),
        playerId : aiJson.getString('playerId'),
        rank: aiJson.getNum('rank'),
        walletId : aiJson.getNum('walletId').toString(),
        isAttention : false,
    );
  }
}