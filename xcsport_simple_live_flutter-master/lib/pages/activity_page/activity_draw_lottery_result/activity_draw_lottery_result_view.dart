// 中奖结果
import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_lottery_result/activity_draw_lottery_result_style.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_lottery_result/activity_draw_lottery_result_viewmodel.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/material.dart';

class ActivityDrawResultStatefulView
    extends StatefulView<ActivityDrawResultStyle, ActivityDrawResultViewModel> {
  final ActivityDrawResultViewModel model;

  const ActivityDrawResultStatefulView({
    Key key,
    this.model,
  }) : super(key: key, model: model);

  @override
  _ActivityDrawResultStatefulViewState createState() =>
      _ActivityDrawResultStatefulViewState();
}

class _ActivityDrawResultStatefulViewState extends ViewState<
    ActivityDrawResultStyle,
    ActivityDrawResultViewModel,
    ActivityDrawResultStatefulView> {
  ActivityDrawResultViewModel _model;

  @override
  ActivityDrawResultViewModel get defaultModel =>
      _model ??= ActivityDrawResultViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    double width = AiMeasure.screenWidth(context) - 90.0;

    Widget contentWidget;
    if (model.state == 0) {
      contentWidget = _configNoDataWidget(width);
    } else if (model.state == 1) {
      contentWidget = _configSuccessContentWidget(width);
    } else if (model.state == 2) {
      contentWidget = _configContentWidget(width);
    } else {
      contentWidget = SizedBox();
    }

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [

          Positioned(
            top: 108.0,
            left: 299.0,
            child: _configCancelButton(),
          ),
          Positioned(
            top: 172.0,
            left: 45.0,
            right: 45.0,
            child: GestureDetector(
              onTap: (){
                //... 图片区域点击不了
              },
              child: Container(
                height: 390.0,
                padding: EdgeInsets.only(top: 164.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AiImage.assetImage(
                      style.backgroundImg,
                    ),
                  ),
                ),
                child: contentWidget,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 无翻牌数量内容
  Widget _configNoDataWidget(double width){
    return Container(
      width: width - 80.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15.0,),
          Container(
            width: 150.0,
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: style.failMoneyTextStyle,
            ),
          ),
          SizedBox(
            height: config.isNotCnTwLang ? 8.0 : 15.0,
          ),
          _configFailDescribeWidget(),
          SizedBox(
            height: config.isNotCnTwLang ? 30.0 : 35.0,
          ),
          _configBottomButton(),
        ],
      ),
    );
  }

  // 成功内容
  Widget _configSuccessContentWidget(double width) {
    return Container(
      width: width - 80.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 150.0,
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: style.titleTextStyle,
            ),
          ),
          SizedBox(
            height: config.isNotCnTwLang ? 4.0 : 10.0,
          ),
          Container(
            width: width - 80.0,
            alignment: Alignment.center,
            child: _configSuccessWidget(),
          ),
          SizedBox(
            height: config.isNotCnTwLang ? 4.0 : 10.0,
          ),
          _configSuccessDescribeWidget(),
          SizedBox(
            height: config.isNotCnTwLang ? 10.0 : 20.0,
          ),
          _configBottomButton(),
        ],
      ),
    );
  }

  // 失败内容
  Widget _configContentWidget(double width) {
    return Container(
      width: width - 80.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 150.0,
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: style.titleTextStyle,
            ),
          ),
          SizedBox(
            height: config.isNotCnTwLang ? 8.0 : 15.0,
          ),
          Container(
            width: width - 80.0,
            alignment: Alignment.center,
            child: _configFailWidget(),
          ),
          SizedBox(
            height: config.isNotCnTwLang ? 8.0 : 15.0,
          ),
          _configFailDescribeWidget(),
          SizedBox(
            height: config.isNotCnTwLang ? 30.0 : 42.0,
          ),
          _configBottomButton(),
        ],
      ),
    );
  }

  // 中奖成功的描述
  Widget _configSuccessDescribeWidget() {
    Widget rowWidget = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _configWalletWidget(),
        SizedBox(
          width: 2.0,
        ),
        Container(
          width: 120.0,
          child: Text(
            model.describe,
            textAlign: TextAlign.center,
            style: style.describeStyle,
          ),
        ),
      ],
    );
    return Column(
      children: [
        rowWidget,
        SizedBox(height: 3.0,),
        Container(
          width: 150.0,
          child: Text(
            model.successDescribe,
            textAlign: TextAlign.center,
            style: style.describeStyle,
          ),
        )
      ],
    );
  }

  // 中奖失败的描述
  Widget _configFailDescribeWidget() {
    return Container(
      width: 150.0,
      child: Text(
        model.describe,
        textAlign: TextAlign.center,
        style: style.describeStyle,
      ),
    );
  }

  Widget _configWalletWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        alignment: Alignment.center,
        color: style.labelBackColor,
        child: Text(
          model.walletS,
          style: style.walletStyle,
        ),
      ),
    );
  }

  // 中奖失败的信息提示
  Widget _configFailWidget() {
    return Text(
      model.money,
      style: style.failMoneyTextStyle,
    );
  }

  // 中奖成功的金额显示
  Widget _configSuccessWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          model.moneyS,
          style: style.moneyTextStyle,
        ),
        Text(
          model.hintText,
          style: style.moneyTextStyle,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 4.0),
          child: Text(
            model.moneyYuan,
            style: style.smallMoneyStyle,
          ),
        ),
      ],
    );
  }

  // 关闭按钮
  Widget _configCancelButton() {
    return InkWell(
      onTap: _configPop,
      child: Container(
        width: 32.0,
        height: 32.0,
        child: AspectRatio(
          aspectRatio: 32 / 32,
          child: AiSvgPicture.asset(style.cancelImg, fit: BoxFit.cover),
        ),
      ),
    );
  }

  // 底部按钮
  Widget _configBottomButton() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: _configPop,
      child: Container(
        width: 220.0,
        height: 68.0,
        child: AspectRatio(
          aspectRatio: 220 / 68,
          child: AiImage.asset(style.knownImg, fit: BoxFit.cover),
        ),
      ),
    );
  }

  void _configPop() async {
    if (ccRoute.canPop()) {
      ccRoute.pop();
    }

    if (model.state == 1) {
      // 通知余额刷新
      String _ = await config.userInfo.tryLoadBalance(isUpdate: true);
      Event.eventBus.fire(RefreshBalanceEvent());
      Event.eventBus.fire(RefreshWalletEvent());
    }
  }
}
