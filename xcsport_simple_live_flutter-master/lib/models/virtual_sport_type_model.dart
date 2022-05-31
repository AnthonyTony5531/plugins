import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/ai_common.dart';
import 'package:fast_ai/utils/util.dart';



class VirtualSportTypeModel{

  List<VirtualSportType> data = [];

  VirtualSportTypeModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return;

    var list = AiJson(map).getArray('navigation.products');
    data?.clear();
    List.generate(list.length ?? 0, (index) {
      var st = VirtualSportType.fromMap(list[index]);
      if(st != null && !isNullOrEmpty(st?.type?.toLowerCase()?.trim()) && AiCommon.virtualSportTypes.containsKey(st?.type?.toLowerCase()?.trim())){
        var other = data.firstWhere((d) => d.type == st.type,orElse: ()=>null);
        if(other == null){
          data.add(st);
        }
      }
    });
    if((data?.isEmpty ?? false) && config.vmApiConfig.isSuccess) {
      config.fiexd.vmSportTypes.forEach((type) {
        data.add(VirtualSportType(
          maintenance: true,
          clientId: config.vmApiConfig.clientId,
          type: type,
        ));
      });
    }

  }
}


class VirtualSportType{

  bool maintenance;
  String type;
  String clientId;

  VirtualSportType({this.maintenance, this.type, this.clientId});

  VirtualSportType.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    
    this.maintenance = AiJson(map).getBool('maintenance', defaultValue: false);

    this.type = AiJson(map).getString('parameters.sport');
    this.clientId = AiJson(map).getString('parameters.client_id');

  }
}

