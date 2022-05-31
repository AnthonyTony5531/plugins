import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';


class AnchorRankInfoModel {

  final String headImg;
  final String nickName;
  final String playerId;
  final bool isAttention; // 是否已经关注
  AnchorRankInfoModel({this.nickName,this.headImg,this.playerId,this.isAttention});

  factory AnchorRankInfoModel.fromJson(Map<String,dynamic> json){
    AiJson aiJson = AiJson(json);
    String nickName = aiJson.getString('nickName');
    return AnchorRankInfoModel(
      headImg: aiJson.getString('headImg'),
      nickName: nickName,
      playerId: aiJson.getString('playerId'),
      isAttention: aiJson.getBool('attention'),
    );
  }
}