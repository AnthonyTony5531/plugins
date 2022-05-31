import 'package:common_component/mvvm/view/stateless_view.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/utils/ai_appbar.dart';
import 'package:flutter/material.dart';

import 'anchor_rank_rule_page_view_model.dart';
import 'anchor_rank_rule_page_style.dart';

///
/// 主播排行榜规则
///
class AnchorRankRulePage extends StatelessView<AnchorRankRulePageStyle, AnchorRankRulePageViewModel>{

  final AnchorRankRulePageViewModel model;

  const AnchorRankRulePage({Key key,@required this.model}):super(key: key, model: model);

  @override
  Widget render(BuildContext context, AnchorRankRulePageViewModel viewModel) {

    List<Widget> widgets = [];
//    widgets.add(Text(
//      viewModel.titlesList.first,
//      style: style.listStyle,
//    ));
//    widgets.add(Text(
//      viewModel.contentList.first,
//      style: style.contentStyle,
//    ));

//    widgets.add(SizedBox(height: 15.0,));

    widgets.add(Text(
      viewModel.titlesList[0],
      style: style.listStyle,
    ));
    widgets.add(Text(
      viewModel.contentList[1],
      style: style.contentStyle,
    ));

    widgets.add(SizedBox(height: 15.0,));

    widgets.add(Text(
      viewModel.titlesList[1],
      style: style.listStyle,
    ));
    widgets.add(Text(
      viewModel.contentList[2],
      style: style.contentStyle,
    ));
    widgets.add(SizedBox(height: 15.0,));
    widgets.add(Text(
      viewModel.contentList.last,
      style: style.contentStyle,
    ));

    return Scaffold(
     appBar: AiAppBar(
       backgroundColor: Colors.white,
       elevation: 0.0,
       centerTitle: true,
       leading: GestureDetector(
           behavior: HitTestBehavior.translucent,
           onTap: (){
             ccRoute.pop();
           },
           child: Icon(Icons.arrow_back_ios, size: 16.0, color: style.textColor,)
       ),
       title: Text(
         viewModel.title,
         style: style.titleStyle,
       ),
       brightness: Brightness.light,
     ),
     backgroundColor: style.backColor,
     body: Container(
       color: style.backColor,
       padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: widgets,
       ),
     ),
   );
  }

}