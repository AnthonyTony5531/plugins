
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';

class MerchantInfoModel{

  String _platformId;// '1,2' / '1' / '2'

  bool showSportPlatFormSwitch = false;
  

  MerchantInfoModel.fromMap(Map map){
    if(map == null) return;

    _platformId = string(AiJson(map).getString('data.platformId'), defaultVal: '1');

    if(_platformId.contains(",")){
      Set<String> platformIds = _platformId?.replaceAll(' ', '')?.split(',')?.toSet();
      int len = platformIds?.where((id)=>!isNullOrEmpty(id?.trim()))?.length ?? 0;
      if(len > 1){
        showSportPlatFormSwitch = true;
      } else if(len == 1){
        config.userInfo.sportPlatformId = int.tryParse(platformIds.first);
      }
      Event.eventBus.fire(MerchantInfoUpdateEvent());
    }
  }

  MerchantInfoModel.parse(String value) {
    if(value == null) return;

    _platformId = value;
    if(_platformId.contains(",")){
      Set<String> platformIds = _platformId?.replaceAll(' ', '')?.split(',')?.toSet();
      int len = platformIds?.where((id)=>!isNullOrEmpty(id?.trim()))?.length ?? 0;
      if(len > 1){
        showSportPlatFormSwitch = true;
      } else if(len == 1){
        config.userInfo.sportPlatformId = int.tryParse(platformIds.first);
      }
      Event.eventBus.fire(MerchantInfoUpdateEvent());
    }
  }


}