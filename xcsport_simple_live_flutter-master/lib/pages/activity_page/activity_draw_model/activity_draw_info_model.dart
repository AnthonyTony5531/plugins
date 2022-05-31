import 'package:fast_ai/utils/ai_json.dart';

class ActivityDrawInfoModel {

  final String playerId;
  final String nickName;
  ActivityDrawInfoModel({this.nickName,this.playerId});

  factory ActivityDrawInfoModel.fromJson(Map<String,dynamic> json){
    AiJson aiJson = AiJson(json);
    return ActivityDrawInfoModel(
      playerId: aiJson.getString('playerId'),
      nickName: aiJson.getString('nickName'),
    );
  }
}