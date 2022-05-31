import 'dart:async';

import 'package:common_component/mvvm/model/service/service.dart';
import 'package:common_component/util/listeners/void_listener.dart';
import 'package:connectivity/connectivity.dart';

enum XYConnectivityResult {
  /// WiFi: Device connected via Wi-Fi
  wifi,

  /// Mobile: Device connected to cellular network
  mobile,

  /// None: Device not connected to any network
  none
}

class ConnectivityService extends IService {
  @override
  Future<void> init() async {
    await super.init();
    await initConnectivity();
  }

  @override
  String get name => 'connectivity_service';

  XYConnectivityResult get status => _status;
  XYConnectivityResult _status = XYConnectivityResult.wifi;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  VoidListener onChanged = new VoidListener();
  Future initConnectivity() async {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    ConnectivityResult result = ConnectivityResult.wifi;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      print(e.toString());
    }
    _updateConnectionStatus(result);
  }

  void disPose() {
    _connectivitySubscription?.cancel();
  }

  Future _updateConnectionStatus(ConnectivityResult result) async {
    print('XYConnectivityResult=${result.toString()}');
    switch (result) {
      case ConnectivityResult.wifi:
        {
          _status = XYConnectivityResult.wifi;
          break;
        }
      case ConnectivityResult.mobile:
        {
          _status = XYConnectivityResult.mobile;
          break;
        }
      case ConnectivityResult.none:
      default:
        {
          _status = XYConnectivityResult.none;
          break;
        }
    }
    onChanged.fire();
  }
}
