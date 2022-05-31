import 'package:common_component/mvvm/view/stateless_view.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_item/activity_draw_label_item_style.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_item/activity_draw_label_item_viewmodel.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

class ActivityLabelItemStatelessView extends StatelessView<
    ActivityDrawLabelItemStyle, ActivityLabelItemViewModel> {
  final ActivityLabelItemViewModel model;

  const ActivityLabelItemStatelessView({Key key, this.model})
      : super(key: key, model: model);

  @override
  Widget render(BuildContext context, ActivityLabelItemViewModel viewModel) {
    return _configIconColumnWidget();
  }

  Widget _configIconColumnWidget() {
    return Container(
      child: Stack(
        children: [
          AiImage.fromUrl(model.poolImg, '', BoxFit.fill),
          Positioned(
            top: 0.0,
            left: 37.0,
            child: _configRightWidget(),
          ),
        ],
      ),
    );
  }

  Widget _configRightWidget(){
    return Container(
      height: 32.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AiImage.asset(model.lotteryImg,width: 21.0,height: 12.0,),
          SizedBox(height: 2.0,),
          Text(
            '${model.awardAmount}',
            style: style.moneyTextStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
