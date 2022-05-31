import 'package:dio/dio.dart';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';

/// 红包列表
class RedBagListProtocol{
  String systemId;
  RedBagListProtocol({
    this.systemId = ''
  });

  Future<RedBagListRspProtocol> request()async{
    var url = '${Api.RedPackList}?systemId=$systemId';
    var rst = await Net.get(url);
    var rstM = RedBagListRspProtocol.fromMap(rst);
//    if(rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
    return rstM;
  }
}

class RedBagListRspProtocol extends BaseModel {
  List<String> redBags = [];
  RedBagListRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map){
    print('RedBagListRspProtocol ===> ${map.toString()}');
    if(map == null || map.isEmpty){
      return;
    }

    AiJson(map).getArray('data').forEach((e){
      redBags.add(e);
    });
  }
}

/// 红包列表-添加倒计时
class RedBagListNewProtocol{
  String systemId;
  String liveId;
  RedBagListNewProtocol({
    this.systemId = '',
    this.liveId
  });

  Future<RedBagListNewRspProtocol> request()async{
    var url = '${Api.RedPackListNew}?systemId=$systemId&liveId=$liveId';
    var rst = await Net.get(url);
    var rstM = RedBagListNewRspProtocol.fromMap(rst);
    print('00-RedBagListNewProtocol-rst=$rst');
//    if(rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
    return rstM;
  }
}

class RedBagListNewRspProtocol extends BaseModel {
  List<RedPacketModel> redBags = [];
  RedBagListNewRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map){
    print('RedBagListNewRspProtocol ===> ${map.toString()}');
    if(map == null || map.isEmpty){
      return;
  }

    redBags = AiJson(map).getArray('data').map((map)=>RedPacketModel.from(map, systemTime)).toList();
  }
}

class RedPacketModel {
  String liveId;
  String packetId;
  int startTime;
  int systemTime;

  /// 协议外字段-统计需要
  String gidm;
  /// 协议外字段-统计需要
  String anchorId;
  RedPacketModel({this.packetId='', this.startTime=0, this.systemTime=0, this.gidm, this.anchorId});

  RedPacketModel.from(Map<String, dynamic> map, [int sysTime=0]) {
    packetId = AiJson(map).getString('packetId');
    startTime = AiJson(map).getTimestamp('startTime');
//    liveId = AiJson(map).getNum('liveId');
    liveId = AiJson(map).getString('liveId');
    systemTime = sysTime == 0 || sysTime == null ? AiJson(map).getNum('currentDate') : sysTime;

    config.session.setSystemTime(systemTime);
  }
}


/// 红包详情
class RedBagInfoProtocol{
  String packetId;//红包id
  RedBagInfoProtocol({
    this.packetId = ''
  });

  CancelToken _cancelToken = CancelToken();

  Future<RedBagInfoRspProtocol> request()async{
    var url = '${Api.RedPackInfo}?packetId=$packetId';
    var rst = await Net.get(url, timeout: 5000, cancelToken: _cancelToken);
    var rstM = RedBagInfoRspProtocol.fromMap(rst);
//    if(rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
    return rstM;
  }

  void cancel(){
    _cancelToken.cancel();
  }
}

class RedBagInfoRspProtocol extends BaseModel {
  RedBagInfo redBagInfo = RedBagInfo();
  RedBagInfoRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map){
    if(map == null || map.isEmpty){
      return;
    }
    redBagInfo = RedBagInfo.fromJson(AiJson(map).getMap('data'));
    redBagInfo.systemTime = this.systemTime;
  }
}



/// 抢红包
class OpenRedBagProtocol{
  String packetId;//红包id
  String systemId;
  String liveId; // 自由主播必传
  OpenRedBagProtocol({
    this.packetId = '',
    this.systemId = '',
    this.liveId = '',
  });

  Future<OpenRedBagRspProtocol> request()async{
    var url = Api.OpenRedPack;
    Map param = {
      'packetId' : packetId,
      'systemId' : systemId,
      'liveId' : liveId,
    };
    var rst = await Net.post(url, body: param, timeout: 5000);
    var rstM = OpenRedBagRspProtocol.fromMap(rst);
//    if(rstM.code != 200 && rstM.code != 404) throw Exception('${rstM.msg}');
    return rstM;
  }
}

class OpenRedBagRspProtocol extends BaseModel {
  OpenedRedBagData openRedBagData = OpenedRedBagData();
  OpenRedBagRspProtocol.fromMap(Map<String, dynamic> map) : super.fromMap(map){
    print('抢红包 >>>>> code=$code, $systemTime, msg=$msg');
    if(map == null || map.isEmpty){
      return;
    }
    openRedBagData = OpenedRedBagData.fromJson(AiJson(map).getMap('data'));
  }
}







/// 红包详情model
class RedBagInfo {
  String packetId;
  String anchorId;
  String nickName;
  String headImg;
  num totalAmount;
  String isFollow;
  int status;
  int startTime;
  int systemTime;
  String walletId;

  String gidm;
  ///保留2位小数
  String get totalAmountFixed => numString(totalAmount, fixed: 2);

  RedBagInfo(
      {this.packetId,
        this.anchorId,
        this.nickName,
        this.headImg,
        this.totalAmount,
        this.isFollow,
        this.status,
        this.startTime,
        this.systemTime,
        this.gidm,
      });

  RedBagInfo.fromJson(Map<String, dynamic> map) {
    var json = AiJson(map);
    packetId =json.getString('packetId');
    anchorId = json.getString('anchorId');
    nickName = json.getString('nickName');
    headImg = json.getString('headImg');
    totalAmount = json.getNum('totalAmount');
    isFollow = json.getString('isFollow');
    status = json.getNum('status');
    startTime = json.getTimestamp('startTime');
    walletId = json.getString('walletId');
  }

}

/// 红包记录model
class RedBagRecord {
  String playerId;
  String nickName;
  String headImg;
  num amount=0;
  int createTime;

  String get amountFixed => numString(amount, fixed: 2);

  RedBagRecord(
      {this.playerId,
        this.nickName,
        this.headImg,
        this.amount,
        this.createTime});

  RedBagRecord.fromJson(Map<String, dynamic> json) {
    playerId = json['playerId'];
    nickName = json['nickName'];
    headImg = json['headImg'];
    amount = json['amount'];
    createTime = new AiJson(json).getTimestamp('createTime');
  }
}

/// 抢红包
class OpenedRedBagData {
  String packetId;
  String nickName;
  num amount;
  num totalAmount;
  int status;
  String walletId;
  List<RedBagRecord> packetRecordData;

  String get amountFixed => numString(amount, fixed: 2);
  String get totalAmountFixed => numString(totalAmount, fixed: 2);

  OpenedRedBagData(
      {this.packetId,
        this.nickName,
        this.amount,
        this.totalAmount,
        this.status,
        this.packetRecordData});

  OpenedRedBagData.fromJson(Map<String, dynamic> json) {
    AiJson aiJson = AiJson(json);
    packetId = aiJson.getString('packetId');
    nickName = aiJson.getString('nickName');
    amount = aiJson.getNum('amount');
    totalAmount = aiJson.getNum('totalAmount');
    status = aiJson.getNum('status');
    walletId = aiJson.getString('walletId');
    if (json['packetRecordData'] != null) {
      packetRecordData = new List<RedBagRecord>();
      json['packetRecordData'].forEach((v) {
        packetRecordData.add(RedBagRecord.fromJson(v));
      });
    }
//    if((packetRecordData?.length ?? 0) != 0) {
//      packetRecordData.sort((a,b)=>b.amount.compareTo(a.amount));
//    }
  }
}
