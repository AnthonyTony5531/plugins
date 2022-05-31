

import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/api/net_host.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/util.dart';

import '../../api.dart';

//{
//"code" : 200,
//"msg"  : "success",
//"data": [
//{
//"pushType": 1,
//"name": "优惠活动",
//"image": "1",
//"startTime": 1603155814000,
//"endTime": 1603168403000,
//"sorts": 1,
//"url": "www.baidu.com",
//"urlType": 1
//},
//{
//"pushType": 2,
//"name": "湖人队",
//"image": "02.jpg",
//"startTime": 1603159414000,
//"endTime": 1603168403000,
//"sorts": 2,
//"url": "www.trent.com",
//"urlType": 2
//}
//]
//}
class FirstScreenReqProtocol extends  BaseReqProtocol<FirstScreenRspProtocol> {

  FirstScreenReqProtocol({int modeType = 1}) {
    param = {
      'modeType' : modeType, // 1:Ai 3:小金
    };
  }

  @override
  String get apiUrl => "ai/getFirstScreenPushC";

  @override
  String get baseUrl => Api.baseMainUrl;

  @override
  Future<FirstScreenRspProtocol> result(Map<String, dynamic> map) async{
    return FirstScreenRspProtocol(map);
  }

}

class FirstScreenRspProtocol extends BaseModel{
  List<FirstScreenRspData> rspData = [];
  FirstScreenRspProtocol(Map<String, dynamic> map):super.fromMap(map){
      if(isSuccess){
        AiJson json = AiJson(map);
        var data = json.getArray("data");
        data.forEach((f){
          AiJson j = AiJson(f);
          String url = j.getString("url");
          num urlType = j.getNum("urlType");
          String gameType = '';
          //urlType: 1比赛、2外部、3联赛 4小游戏
          if(urlType == 1 || urlType == 3){
            if(!isStrNullOrEmpty(url) && url.contains('&')){
              var list = url?.split('&') ?? [];
              if(list.isNotEmpty){
                if(list.length > 0){
                  url = list.first;
                }
                if(list.length > 1){
                  gameType = list[1];
                }
              }
            }
          }
          rspData.add(FirstScreenRspData(
            pushType: j.getNum("pushType"),
            image : j.getString("image"),
            name : j.getString("name"),
            sorts : j.getNum("sorts"),
            url : url,
            urlType : urlType,
            id : j.getNum("id"),
            isPush: j.getNum('isPush'),
            gameType: gameType,
            gidm: j.getString('gidm'),
            supplierId: j.getString('factory'),
            gameKey: url,
          ));
        });
      }
      rspData.sort((a,b)=>a.sorts.compareTo(b.sorts));
  }
}

class FirstScreenRspData{
  final String supplierId; // 商户
  final String gameKey;
  final num pushType;
  final String name;
  final String image;
  final num sorts;
  final String url;  // urlType=1(url是比赛Id) urlType=2(url是联赛Id) urlType=3(url是外部链接)
  final int urlType; // 1比赛、2外部、3联赛 4小游戏
  final num id;
  final String gameType;
  final int isPush; //Live188新增加字段 1新的、2旧的
  final String gidm;
  bool get isInner => urlType == 1;
  const FirstScreenRspData({this.id,this.pushType, this.name, this.image, this.sorts, this.url, this.urlType, this.isPush, this.gameType, this.gidm, this.supplierId, this.gameKey});
}
