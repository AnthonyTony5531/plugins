import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class ChatSeeVideoReqProtocol{

  ChatSeeVideoReqProtocol();
  Future<ChatSeeVideoRspProtocol> request()async{
    String url = '/chat/isSeeVideo';
    // URL不用拼接/ai/mobile
    var result = await Net.get(url,preUrl: Api.baseMainUrl);
    var resultM = ChatSeeVideoRspProtocol.fromMap(result);
    if(resultM.code != 200 && resultM.code != 404) throw Exception("${resultM.msg}");
    return resultM;
  }
}

class ChatSeeVideoRspProtocol extends BaseModel{

  int isSee = 2; // 获取视频是否可看:1不可看、2可看
  int userBet = 0; // 还需要投注的额度
  int betSet = 0;  // 投注限制总额
  ChatSeeVideoRspProtocol.fromMap(Map<String,dynamic>map):super.fromMap(map){
    if(map == null){
      return;
    }
    var json = AiJson(map);
    isSee = json.getNum('data.isSee');
    userBet = json.getNum('data.userBet');
    betSet = json.getNum('data.betSet');
    int money = betSet - userBet;
    if (config.userInfo.videoBettingTotal == 0 || money >= 0) {
      config.userInfo.videoBettingTotal = money;
      if(money >= 0){
        config.userInfo.videoCurrAllBetGold = 0;
      }
    }
    // 可以观看视频投注额清零
    if(isSee == 2){
      config.userInfo.videoBettingTotal = 0;
      config.userInfo.videoCurrAllBetGold = 0;
    }
  }
}
