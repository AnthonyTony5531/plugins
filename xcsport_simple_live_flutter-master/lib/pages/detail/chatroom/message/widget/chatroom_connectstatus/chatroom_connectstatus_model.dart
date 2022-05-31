

import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'chatroom_connectstatus_style.dart';

class ChatroomConnectstatusModel extends StatefulViewModel<ChatroomConnectstatusStyle> {

  String statusPrompt = "";

  @override
  Future<bool> onInit()async {
    statusPrompt =  config.langMap['baseLang']['detail']['waiting'];
    XCStompClient.ins.onConnected(onConnected);
    XCStompClient.ins.onDisconnected(onDisconnected);
    if(XCStompClient.ins.isConnected){
      makeSuccessStatus();
    }else{
      makeRefreshingStatus();
    }
    return true;
  }

  void onConnected() {
    if(isSuccess()){
      return;
    }
    makeSuccessStatus();
    notifyStateChanged();
  }

  void onDisconnected() {
    if(isRefreshing()){
      return;
    }
    makeRefreshingStatus();
    notifyStateChanged();
  }

  @override
  void onDispose() {
    XCStompClient.ins.clearConnected(onConnected);
    XCStompClient.ins.clearDisconnected(onDisconnected);

    super.onDispose();
  }



  @override
  List<ChatroomConnectstatusStyle> get styleList => [ChatroomConnectstatusStyle()];
}


