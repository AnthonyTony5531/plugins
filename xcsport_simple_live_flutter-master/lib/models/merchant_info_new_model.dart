
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/utils/ai_json.dart';

class MerchantInfoNewModel{

  String _platformId;// '1,2' / '1' / '2'

  bool showSportPlatFormSwitch = false;

  List<dynamic> _platformInfos;


  MerchantInfoNewModel.fromMap(Map map){
    if(map == null) return;

    SportPlatform.ins.setPlatformInfos(AiJson(map).getArray('data'));

//    _platformInfos = AiJson(map).getArray('data');
//    try{
//      if(_platformInfos != null && _platformInfos.length > 1){
//        showSportPlatFormSwitch = true;
//        if(_platformInfos[0] is Map){
//          _platformInfos[0].forEach((key, value) {
//            SportPlatform.AI = int.tryParse(key);
//          });
//        }
//        if(_platformInfos[1] is Map){
//          _platformInfos[1].forEach((key, value) {
//            SportPlatform.BI = int.tryParse(key);
//          });
//        }
//      } else if(_platformInfos != null && _platformInfos.length == 1){
//        showSportPlatFormSwitch = false;
//        _platformInfos[0].forEach((key, value) {
//          SportPlatform.AI = int.tryParse(key);
//        });
//      }
//    } catch(e){
//      print("e");
//    }
//    Event.eventBus.fire(MerchantInfoUpdateEvent());
  }

//  MerchantInfoNewModel.parse(List<dynamic> platformInfo) {
//    if(platformInfo == null) return;
//
//    SportPlatform.ins.setPlatformInfos(platformInfo);
//
////    _platformInfos = platformInfo;
////    try{
////      if(_platformInfos != null && _platformInfos.length > 1){
////        showSportPlatFormSwitch = true;
////        if(_platformInfos[0] is Map){
////          _platformInfos[0].forEach((key, value) {
////            SportPlatform.AI = int.tryParse(key);
////          });
////        }
////        if(_platformInfos[1] is Map){
////          _platformInfos[1].forEach((key, value) {
////            SportPlatform.BI = int.tryParse(key);
////          });
////        }
////      } else if(_platformInfos != null && _platformInfos.length == 1){
////        showSportPlatFormSwitch = false;
////        _platformInfos[0].forEach((key, value) {
////          SportPlatform.AI = int.tryParse(key);
////        });
////      }
////    } catch(e){
////      print("e");
////    }
//
//    Event.eventBus.fire(MerchantInfoUpdateEvent());
//  }


}