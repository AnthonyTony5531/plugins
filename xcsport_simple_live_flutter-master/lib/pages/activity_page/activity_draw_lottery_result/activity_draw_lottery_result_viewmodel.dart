import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_lottery_result/activity_draw_lottery_result_style.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:flutter/cupertino.dart';

class ActivityDrawResultViewModel
    extends StatefulViewModel<ActivityDrawResultStyle> {
  String title; // 中奖等级标题
  String money; // 中奖金额
  String describe; // 中奖描述
  final int state; // 0: 无抽奖次数 1:发奖成功 2:发奖失败
  ActivityDrawResultViewModel(
      {@required this.title,
      @required this.describe,
      @required this.money,
      @required this.state});

  void upDate({@required String title,@required String money,@required String describe}){
    this.title = title;
    this.money = money;
    this.describe = describe;
  }

  @override
  List<ActivityDrawResultStyle> get styleList => [ActivityDrawResultStyle()];

  String _hintText = '.';

  String get hintText => _hintText;

  String _moneyYuan = '';

  String get moneyYuan => _moneyYuan;

  String _moneyS = '';

  String get moneyS => _moneyS;

  String _walletS = '';

  String get walletS => _walletS;

  String _successDescribe = '';
  String get successDescribe => _successDescribe;

  @override
  Future<bool> onInit() {
    if (state == 1) {
      Map activityDraw = config.baseLang['activityDraw'];
      String moneyString = configNumString(money);
      List<String> list = moneyString.split('.');
      _moneyS = list.first;
      _moneyYuan = '${list.last}';
      _walletS = config.userInfo.walletCoinName;
      _successDescribe = activityDraw['successDescribe'] ?? '奖金可在我的➡注单️➡体育钱包查看噢!';
    } else if (state == 2){
      Map activityDraw = config.baseLang['activityDraw'];
      String title = activityDraw['regret'];
      String thank = activityDraw['thank'];
      String describe = activityDraw['encourage'];
      upDate(title: title, money: thank, describe: describe);
    } else {

    }
    return super.onInit();
  }
}
