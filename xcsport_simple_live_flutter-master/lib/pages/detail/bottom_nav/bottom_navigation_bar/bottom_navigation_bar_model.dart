import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:common_component/util/listeners/value_listener.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/common/service/connectivity_service.dart';
import 'package:flutter/cupertino.dart';
import 'bottom_navigation_bar_style.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';

///
class BottomNavBarModel extends StatefulViewModel<BottomNavBarStyle> {
  @override
  List<BottomNavBarStyle> get styleList => [BottomNavBarStyle()];

  ConnectStatus connectStatus = ConnectStatus.Success;

  //是否有推单按钮
  bool hasSharedRecordBtn = false;

  ValueListener hasSharedBetBtnChangedListener = ValueListener();

  void updateHasSharedRecordBtn(bool value) {
    if (this.hasSharedRecordBtn != value) {
      hasSharedRecordBtn = value;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        hasSharedBetBtnChangedListener.fire(hasSharedRecordBtn);
      });
    }
  }

  bool get isReconnecting => !XCStompClient.ins.isConnected;

  @override
  Future<bool> onInit() {
    connectStatus = XCStompClient.ins.isConnected
        ? ConnectStatus.Success
        : ConnectStatus.Connecting;
    XCStompClient.ins.onConnected(onConnected);
    XCStompClient.ins.onDisconnected(onDisconnected);
    cmPackage.service.connectivityService.onChanged
        .addListener(onNetworkChanged);
    return super.onInit();
  }

  void onConnected() {
    if (ConnectStatus.Success == connectStatus) return;
    connectStatus = ConnectStatus.Success;
    notifyStateChanged();
  }

  void onNetworkChanged() {
    //断网第一时间通知socket断开
    if (cmPackage.service.connectivityService.status ==
        XYConnectivityResult.none) {
      // XCStompClient.ins.forceClosed();
    }
  }

  void onDisconnected() {
    if (ConnectStatus.Connecting == connectStatus) return;
    connectStatus = ConnectStatus.Connecting;
    notifyStateChanged();
  }

  @override
  void onDispose() {
    cmPackage.service.connectivityService.onChanged
        .removeListener(onNetworkChanged);
    XCStompClient.ins.clearConnected(onConnected);
    XCStompClient.ins.clearDisconnected(onDisconnected);

    super.onDispose();
  }
}

enum ConnectStatus {
  Success,
  Connecting,
}
