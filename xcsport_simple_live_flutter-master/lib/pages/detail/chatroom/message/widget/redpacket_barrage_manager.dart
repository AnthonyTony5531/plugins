
import 'package:fast_ai/pages/detail/chatroom/redbag/global_redpacket_helper.dart';

class RedpacketBarrageManager {
  bool show = false;
  List<GlobalRedPacketModel> _redPackets = [];

  void parseData(Map<String,dynamic> msg) {
    try {
      GlobalRedPacketMsgModel model = GlobalRedPacketMsgModel.fromJson(msg);
      print('抢全局红包推送 11--robGlobalRedPacketCallback>>>> nickName=${model.redpackets[0].nickName}');
      print('抢全局红包推送 22--robGlobalRedPacketCallback>>>> ${msg.toString()}, length=${model.redpackets.length}');
      if(model.redpackets.length != 0) {
        _redPackets.addAll(model.redpackets);
        print('抢全局红包推送 33--robGlobalRedPacketCallback>>>> len=${_redPackets.length}');
      }
    } catch (e) {
      print('抢全局红包推送 33--robGlobalRedPacketCallback>>>> e=$e');
    }
  }

  void clearBarrageData(){
    _redPackets.clear();
  }

  void removeBarrageData(){
    if(_redPackets.length == 0) return;
    _redPackets.removeAt(0); 
    
    print('left BarrageData length=${_redPackets.length}');   
  }

  int get barrageDataLen => _redPackets.length;

  bool get canShowBarrage => _redPackets.length != 0;

  GlobalRedPacketModel get barrageData => _redPackets.length != 0 ? _redPackets.first : null;
}