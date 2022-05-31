// 名称 标签  描述

import 'package:common_component/mvvm/view/stateless_view.dart';
import 'package:fast_ai/pages/detail/follow_order/follow_order_common_widget/follow_order_common_model.dart';
import 'package:fast_ai/pages/detail/follow_order/follow_order_common_widget/follow_order_common_style.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/default_msg_talk_lang.dart';

class FollowOrderCommonView
    extends StatelessView<FollowOrderCommonStyle, FollowOrderCommonViewModel> {
  final FollowOrderCommonViewModel model;

  const FollowOrderCommonView({Key key, this.model,}) : super(key: key, model: model);

  @override
  Widget render(BuildContext context, FollowOrderCommonViewModel viewModel) {
    double screenWidth = AiMeasure.screenWidth(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _configNameLabelWidget(screenWidth),
        SizedBox(height: isStrNullOrEmpty(model.talkMsg) ? 0.0 : 7.0,),
        _configDescribeWidget(screenWidth),
      ],
    );
  }

  Widget _configNameLabelWidget(double screenWidth){
    return Row(
        children: [
        _configNameWidget(screenWidth),
        SizedBox(width: 3.0,),
        Expanded(child: _configLabelsWrapWidget()),
    ]);
  }

  // 描述
  Widget _configDescribeWidget(double screenWidth){
    return Container(
      width: screenWidth - 76.0,
      child: Text(
        msgTalkLang(model.talkMsg),
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: style.describeTextStyle,
      ),
    );
  }

  // 名称
  Widget _configNameWidget(double screenWidth){
    double width = AiMeasure.measureTextWidth(model.playName, style.nameTextStyle);
    if (model.titles.length > 0) {
      if (width > 70.0) {
        width = 70.0;
      }
    } else {
      width = screenWidth - 80.0;
    }
    return Container(
      width: width,
      child: Text(
        model.playName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style.nameTextStyle,
      ),
    );
  }

  // labels
  ///⑴ 近20中X：只有20中12以及以上注单笔数才显示
  ///⑵ X连红：只有3连红以及以上注单笔数才显示
  ///⑶ 赛季段位：只有本赛季白银以及以上段位才显示
  ///⑷ 天梯第X名：只有本赛季胜率前100名以内才会显示
  ///⑸ 胜率第X名：只有本赛季胜率前100名以内才会显示，综合、足球、篮球只显示1个标签，优先显示综合>足球>篮球
  ///⑹ 盈利率第X名：只有本赛季盈利率前100名以内才会显示，综合、足球、篮球只显示1个标签，优先显示综合>足球>篮球
  ///⑺ 总场次：本赛季的全部注单
  Widget _configLabelsWrapWidget() {
    return Wrap(
      spacing: 4.0,
      runSpacing: 4.0,
      children: model.modelList.map((e) {
        return _configLabelWidget(e.content,e.isTianTi);
      }).toList(),
    );
  }

  // label
  Widget _configLabelWidget(String labelName,bool isRank) {
    return Container(
      decoration: BoxDecoration(
        color: isRank ? style.rankBackColor : style.labelBackColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      width: AiMeasure.measureTextWidth(labelName, style.rankTextStyle) +
          10.0,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
      child: Text(
        labelName,
        style: isRank ? style.rankTextStyle : style.labelTextStyle
      ),
    );
  }

}