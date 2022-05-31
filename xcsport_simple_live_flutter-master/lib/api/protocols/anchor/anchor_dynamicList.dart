
import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/pages/anchor/anchor_home_model.dart';

/// 主播动态协议
class AnchorDynamicListReqProtocol extends BaseReqProtocol<AnchorHomeModel> {
  // page 页码数，从1开始，每一页后端最多返回10条
  AnchorDynamicListReqProtocol({String anchorId,int page}) {
    param = {
      'anchorId' : anchorId??'',
      'groupId' : '${config.userInfo.sportPlatformId}',
      'page' : page,
    };
  }

  @override
  String get apiUrl => 'anchor/dynamicList';

  @override
  Future<AnchorHomeModel> result(Map<String, dynamic > map) async{
    var model = AnchorHomeModel();
    await model.parse(map);
    return model;
//    return AnchorHomeModel.fromMap(map);
  }
}


class AnchorDynamicPraiseOrStepReqProtocol extends BaseReqProtocol<BaseModel> {
  // type:1-点赞，2-踩
  AnchorDynamicPraiseOrStepReqProtocol({String dynamicId, int type=1}) {
    param = {'dynamicId' : dynamicId, 'type': type, 'groupId' : '${config.userInfo.sportPlatformId}'};
  }

  @override
  RequestMethodType get requestType => RequestMethodType.get;

  @override
  String get apiUrl => 'anchor/anchorDynamicPraiseOrStep';

  @override
  Future<BaseModel> result(Map<String, dynamic > map) async{
    return BaseModel.fromMap(map);
  }
}




