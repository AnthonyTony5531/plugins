import 'package:common_component/mvvm/viewmodel/stateless_viewmodel.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_json.dart';

import 'anchor_rank_rule_page_style.dart';

class AnchorRankRulePageViewModel extends StatelessViewModel<AnchorRankRulePageStyle>{

  List<String> _titlesList = [];
  List<String> get titlesList => _titlesList;

  String _title = '';
  String get title => _title;

  List<String> _contentList = [];
  List<String> get contentList => _contentList;


  //参数传给view时候，在这初始化统一入口初始化，自己要啥扩展参数
  AnchorRankRulePageViewModel.create(){
    AiJson aiJson = AiJson(config.baseLang);
    _title = aiJson.getString('brokeRule',defaultValue: '上榜规则');
    _titlesList.clear();
    var list = aiJson.getArray('anchortabList');
    if (list.isNotEmpty) {
      List<String> dataList = List<String>.from(list);
      _titlesList.addAll(dataList);
      titlesList.removeAt(0);
    } else {
      _titlesList.addAll(['魅力榜','球王榜','土壕榜']);
    }

    _contentList.clear();
    var contentList = aiJson.getArray('anchorRule');
    if (contentList.isNotEmpty) {
      List<String> dataList = List<String>.from(contentList);
      _contentList.addAll(dataList);
    } else {
      _contentList.addAll([
        "统计数据为主播收到的礼物,按照收到礼物价值从大到小排列",
//        "主播带用户盈利值排行,按照从大到小排列",
        "用户送出的礼物价值排行,按照从大到小排列",
        "榜单只统计近7天的数据",
      ]);
    }

    super.init();
  }

  @override
  List<AnchorRankRulePageStyle> get styleList => [AnchorRankRulePageStyle()];

}