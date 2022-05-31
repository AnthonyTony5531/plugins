

import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/net_host.dart';
import 'package:fast_ai/api/protocols/firstscreen/firstscreenprotocol.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image_helper.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/cupertino.dart';

import 'firstsceen.dart';

class FirstScreenViewModel{
    final date = Map<String, bool>();

    final    activityImages = <FirstScreenChldViewModel>[];
  //如果存在活动就显示
    Future<bool> showActivitiesIfExist(BuildContext context)async{
      //当天是否显示过
      var date = "showActivitiesIfExist^${yyyy_MM_dd(DateTime.now().millisecondsSinceEpoch)}";
      var hasShow = AiCache.get().getBool(date)??false;
      bool game = ModuleSwitch.getInstance().game();
      if(!hasShow){
        var protocol = await FirstScreenReqProtocol().request();
        if(protocol.isSuccess && isNotEmpty(protocol.rspData)){
          protocol.rspData.forEach((f){
            // 小游戏
            int urlType = f.urlType;
            if(urlType == 4 && !game){
              return;
            }
            activityImages.add(FirstScreenChldViewModel(
//              url: f.isInner?"${Api.baseMainUrl}/${f.url}":f.url,
              url: f.url,
              urlType: f.urlType,
              image: f.image,
              name: f.name,
              id: f.id,
              gameType: f.gameType,
              gidm: f.gidm,
              gameKey: f.gameKey,
              supplierId: f.supplierId,
            ));
          });

          AiCache.get().setBool(date, true);
          if(activityImages.isNotEmpty) {
            return showModalBottomSheetRoute(context , child:FirstSceen(model: this,), height: AiMeasure.screenHeight(context) ).then((v){
              return true;
            });
          }
        }
      }
      return false;

   }

   bool pop(){
     if(isNotEmpty(activityImages)){
       activityImages.removeAt(0);
     }
     return isNotEmpty(activityImages);
   }

    FirstScreenChldViewModel get top => isNotEmpty(activityImages)?activityImages[0]:null;

}


class FirstScreenChldViewModel{
  final String url;  // urlType=1(url是比赛Id) urlType=2(url是联赛Id) urlType=3(url是外部链接);
  final String image;
  final String name;
  final num id;
  final num urlType; // 1比赛、2外部、3联赛
  final String gameType;
  final String gidm;
  final String supplierId; // 商户
  final String gameKey;

  FirstScreenChldViewModel({this.url, this.image, this.name, this.id, this.urlType, this.gameType, this.gidm, this.supplierId, this.gameKey});
}

