import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_contribution_item_page/anchor_contribution_item_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_contribution_item_page/anchor_contribution_item_style.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/material.dart';

class AnchorCurrentContributionItemStatefulView extends StatefulView<
    AnchorCurrentContributionItemStyle,
    AnchorCurrentContributionItemViewModel> {
  final AnchorCurrentContributionItemViewModel model;

  const AnchorCurrentContributionItemStatefulView({
    Key key,
    this.model,
  }) : super(key: key, model: model);

  @override
  _AnchorCurrentContributionItemStatefulViewState createState() =>
      _AnchorCurrentContributionItemStatefulViewState();
}

class _AnchorCurrentContributionItemStatefulViewState extends ViewState<
    AnchorCurrentContributionItemStyle,
    AnchorCurrentContributionItemViewModel,
    AnchorCurrentContributionItemStatefulView> with TickerProviderStateMixin {
  AnchorCurrentContributionItemViewModel _model;

  @override
  AnchorCurrentContributionItemViewModel get defaultModel =>
      _model ??= AnchorCurrentContributionItemViewModel();


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {

    return Container(
      height: 55.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: _configItemBackColor(),
      )),
      child: _configColumnWidget(),
    );
  }

  Widget _configColumnWidget() {
    return Column(
      children: [
        _configTotalItemWidget(),
        Divider(
          color: (model.isLast || model.rank <= 3) ? Colors.transparent : style.dividerColor,
          height: 1.0,
          indent: 81.0,
        )
      ],
    );
  }

  // 整体Item
  Widget _configTotalItemWidget() {
    return Container(
      height: 54.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _configLeftItemWidget(),
          _configRightItemWidget(),
        ],
      ),
    );
  }

  // 左侧的部分Widget
  Widget _configLeftItemWidget() {
    return Row(
      children: [
        SizedBox(
          width: 6.0,
        ),
        Container(
          alignment: Alignment.center,
          width: 34.0,
          child: _configIconTextWidget(),
        ),
        SizedBox(
          width: 4.0,
        ),
        _configIconWidget(),
        SizedBox(
          width: 9.0,
        ),
        Text(
          model.nickName ?? '',
          style: model.rank <= 3
              ? style.whiteNameStyle
              : style.nameStyle,
        )
      ],
    );
  }

  // 右侧部分Widget
  Widget _configRightItemWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          model.contributeValue ?? '',
          style: style.moneyStyle,
        ),
        SizedBox(
          width: 19.0,
        ),
        (model.playerId == config.userInfo.playerId)
            ? SizedBox(
                width: 38.0,
              )
            : _configOtherFollowWidget(),
        SizedBox(
          width: 16.0,
        ),
      ],
    );
  }

  // 关注Widget
  Widget _configFollowWidget() {
    var followWidget = Container(
      width: 38.0,
      height: 24.0,
      alignment: Alignment.center,
      color: style.followBackColor,
      child: Text(
        model.followText,
        textAlign: TextAlign.center,
        style: style.followStyle,
      ),
    );

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        // 关注
        model.attentionUser();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: followWidget,
      ),
    );
  }

  // 已关注过了 未关注过的
  Widget _configOtherFollowWidget() {
    return model.isAttention
        ? Container(
            alignment: Alignment.center,
            width: 38.0,
            child: AiImage.asset(style.fansImg,
                width: 22.0, height: 30.0, fit: BoxFit.contain),
          )
        : _configFollowWidget();
  }

  // 头像Widget
  Widget _configIconWidget() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
        var params = {
          "playerId": model.playerId,
          "playerName": model.nickName,
        };
//        showMaterialPageRoute(context, PersonalPage(params: params)).then((value) {
//          if(!isStrNullOrEmpty(config.userInfo.recordVideoStatus) && config.userInfo.recordVideoStatus == 'stop'){
//            Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
//          }
//        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: 30.0,
          height: 30.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _configRankBorderColors(),
          )),
          child: AiImage.userLogo(
              model.headImg ?? '',
              size: 28.0),
        ),
      ),
    );
  }

  // 背景色
  List<Color> _configItemBackColor() {
    List<Color> colors = [];
    switch (model.rank) {
      case 1:
        colors = [
          style.itemBackColorF,
          style.whiteColor,
        ];
        break;
      case 2:
        colors = [
          style.itemBackColorS,
          style.whiteColor,
        ];
        break;
      case 3:
        colors = [
          style.itemBackColorT,
          style.whiteColor,
        ];
        break;
      default:
        colors = [style.whiteColor, style.whiteColor];
        break;
    }
    return colors;
  }

  // 前三名头像外框颜色
  List<Color> _configRankBorderColors() {
    List<Color> colors = [];
    switch (model.rank) {
      case 1:
        colors = [style.iconBorderColor, style.iconBorderColorF];
        break;
      case 2:
        colors = [style.iconBorderColorS, style.iconBorderColorSs];
        break;
      case 3:
        colors = [style.iconBorderColorT, style.iconBorderColorTt];
        break;
      default:
        colors = [style.whiteColor, style.whiteColor];
        break;
    }
    return colors;
  }

  // 标题 icon或者text
  Widget _configIconTextWidget() {
    return model.rank <= 3
        ? AiImage.asset(
            style.configRankImg(model.rank),
            width: 25.0,
            height: 25.0,
            fit: BoxFit.fill)
        : Text(
            '${model.rank}',
            style: style.indexStyle,
          );
  }
}
