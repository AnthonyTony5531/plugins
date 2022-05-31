import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_item_page/activity_draw_item_page.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_item_page/activity_view_draw_item_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_turn_over_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_turn_over_style.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'activity_draw_item_page/activity_common_util.dart';

// 活动-翻牌-翻牌区域
class ActivityDrawTurnOverStatefulView extends StatefulView<
    ActivityDrawTurnOverStyle, ActivityDrawTurnOverViewModel> {
  final ActivityDrawTurnOverViewModel model;
  final Function(bool success) backClick;

  const ActivityDrawTurnOverStatefulView({
    Key key,
    this.model,
    this.backClick,
  }) : super(key: key, model: model);

  @override
  _ActivityDrawTurnOverStatefulViewState createState() =>
      _ActivityDrawTurnOverStatefulViewState();
}

class _ActivityDrawTurnOverStatefulViewState extends ViewState<
    ActivityDrawTurnOverStyle,
    ActivityDrawTurnOverViewModel,
    ActivityDrawTurnOverStatefulView> with TickerProviderStateMixin {
  ActivityDrawTurnOverViewModel _model;

  @override
  ActivityDrawTurnOverViewModel get defaultModel =>
      _model ??= ActivityDrawTurnOverViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void onDataUpdatedAfter() {
    super.onDataUpdatedAfter();
  }

  @override
  void dispose() {
    activityConfig.acNumber = 0;
    activityConfig.isTurn = true;
    activityConfig.isTrue = false;
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {

    Widget w;
    if (model.isRefreshing()) {
      w = SizedBox(height: 270.0,);
    } else if (model.isSuccess()) {
      w = model.pictureList.isNotEmpty ? configGridWidget() : configRefreshWidget();
    } else if (model.isError()) {
      w = configRefreshWidget();
    } else {

    }

    return Material(
      color: Colors.transparent,
      child: w,
    );
  }

  Widget configRefreshWidget(){
    double width = AiMeasure.screenWidth(context) - 60.0;
    return Column(
      children: [
        InkWell(
          onTap: () async {
            model.refresh();
          },
          child: AspectRatio(
            aspectRatio: width/270.0,
            child: Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              width: width,
              child: Text(model.loadFailMsg,textAlign: TextAlign.center,style: style.failStyle,),
            ),
          ),
        ),
      ],
    );
  }

  Widget configGridWidget(){
    return Column(
      children: [
        model.pictureList.isEmpty ? SizedBox() :
        GridView.builder(
            padding: EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0),
            physics: NeverScrollableScrollPhysics(),
            itemCount: activityConfig.activityNum,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // 横轴元素个数
                crossAxisCount: 4,
                // 纵轴间距
                mainAxisSpacing: 5.0,
                // 横轴间距
                crossAxisSpacing: 5.0,
                // 子组件宽高长度比例
                childAspectRatio: 78.0 / 90.0),
            itemBuilder: (BuildContext con, int index) {
              ActivityDrawItemViewModel itemViewModel = model.pictureList[index];

              return ActivityDrawItemStatefulView(
                model: itemViewModel,
                onOverTurnTap: (imageLevel) async {
                  if (imageLevel == 'X') {
                    model.thanksList.add(imageLevel);
                    if (model.thanksList.length >= 3) {
                      activityConfig.isTrue = true;
                      model.configThanks();
                      widget.backClick(false);
                    }
                  } else {
                    _configOnOverTurnTap(imageLevel,index);
                  }
                },
              );
            }),
        SizedBox(
          height: 5.0,
        ),
        // 底部提示文字
        _configBottomText(),
      ],
    );
  }

  Widget _configBottomText() {
    return Container(
      width: MediaQuery.of(context).size.width - 60.0,
      child: Text(
        model.hint,
        textAlign: TextAlign.center,
        style: style.hintTextStyle,
      ),
    );
  }

  void _configOnOverTurnTap(String imageLevel,int index) async {
    num value = await model.configLotteryPicture(imageLevel,index);
    // "0失败、1成功、2禁用 3未到发奖数量"
    if (value == 1) {
      widget.backClick(true);
    } else if (value == 2) {
      widget.backClick(false);
    } else if (value == 0) {
      Fluttertoast.showToast(
          msg: model.failMsg,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xFF000000).withOpacity(0.7),
          fontSize: 14.0,
          textColor: Color(0xFFFFFFFF));
    } else {

    }
  }
}
