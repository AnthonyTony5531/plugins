import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_draw_info_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_model/activity_draw_progress_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_notice_page/acvity_draw_notice_style.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_protocol/activity_lottery_list_protocol.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_protocol/activity_user_protocol.dart';

class ActivityDrawNoticeViewModel extends StatefulViewModel<ActivityDrawNoticeStyle> {

  @override
  List<ActivityDrawNoticeStyle> get styleList => [ActivityDrawNoticeStyle()];

  var marqueeList = <String>[];
  Map _dataMap = config.baseLang['activityDraw'];
  String walletCoinName = '';
  @override
  Future<bool> onInit() async {
    walletCoinName = config.userInfo.walletCoinName;
    await refresh();
    return false;
  }

  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) async {
    marqueeList.clear();

    var tempViewModelMap = <String, String>{};
    List<String> playIds = [];
    // 获取所有中奖用户
    ActivityLotteryListRspProtocol listRspProtocol = await ActivityLotteryListRepProtocol().request();

    List<PrizePoolModel> poolList = listRspProtocol.modelList;

    String getMoney = _dataMap['getMoney'];
    String user = _dataMap['user'];

    if (poolList.isNotEmpty) {
      poolList.forEach((element) {
        if (element.isTrue == 0) { // 假数据  playerId为名字
          var text = '$getMoney$walletCoinName: ${element.awardAmount}';
          marqueeList.add('$user ${element.playerId} $text');
        } else {
          playIds.add(element.playerId);
          var text = '$getMoney$walletCoinName: ${element.awardAmount}';
          tempViewModelMap[element.playerId] = text;
        }
      });
    }

    // 根据用户id集合获取所有的用户信息
    if (playIds.isNotEmpty) {
      ActivityUserRspProtocol activityUserRspProtocol = await ActivityUserRepProtocol(playIds: playIds).request();
      List<ActivityDrawInfoModel> list = activityUserRspProtocol.modelList;

      if (list.isNotEmpty) {
        list.forEach((element) {
          String mapText = tempViewModelMap[element.playerId];
          marqueeList.add('$user ${element.nickName} $mapText');
        });
      }
    }
    notifyStateChanged();
    return super.refresh(args);
  }
}