import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/api/net.dart';
import 'dart:async';

class DynamicFlag extends BaseModel {
  // 每60s轮询一次
  Timer timer;

  Function onChange;

  /// 红点状态(0没有新动态1有新动态)
  int redFlag = 1;

  DynamicFlag(this.onChange) {
//    this.init();
  }

  DynamicFlag.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.redFlag = map['data'] == null ? 0 : map['data']['redFlag'];
  }

  init () {
    update();
    // if (timer != null) timer?.cancel();
    // timer = Timer.periodic(Duration(seconds: 60), (t) {
    //     if (config.userInfo.isLogout()) {
    //       timer?.cancel();
    //       return;
    //     }
    //     update();
    //   }
    // );
  }

  Future update () async {
    DynamicFlag rst = await Net.queryDynamicFlag();
    if (rst.isSuccess) {
//      redFlag = rst.redFlag;
      onChange();
    }
  }

  cancel () {
    timer?.cancel();
  }
}