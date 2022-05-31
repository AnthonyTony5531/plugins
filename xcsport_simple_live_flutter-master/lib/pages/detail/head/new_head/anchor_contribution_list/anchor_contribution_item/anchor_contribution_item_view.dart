import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/util/sizebox_util.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_list/anchor_contribution_item/anchor_contribution_item_style.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_list/anchor_contribution_item/anchor_contribution_item_viewmodel.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/material.dart';

// 本场打赏 7天榜
class AnchorContributionItemStatefulView extends StatefulView<
    AnchorContributionItemStyle, AnchorContributionItemViewModel> {
  final AnchorContributionItemViewModel model;

  const AnchorContributionItemStatefulView({Key key, this.model})
      : super(key: key, model: model);

  @override
  _AnchorContributionItemStatefulViewState createState() =>
      _AnchorContributionItemStatefulViewState();
}

class _AnchorContributionItemStatefulViewState extends ViewState<
    AnchorContributionItemStyle,
    AnchorContributionItemViewModel,
    AnchorContributionItemStatefulView> {
  AnchorContributionItemViewModel _model;

  @override
  AnchorContributionItemViewModel get defaultModel =>
      _model ??= AnchorContributionItemViewModel();

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
    return Container(
      height: 54.0,
      color: Colors.white,
      child: Column(
        children: [
          _configTotalWidget(),
          _configContainer(),
        ],
      ),
    );
  }

  Widget _configTotalWidget() {
    return Container(
      height: 53.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _configRankNickNameWidget(),
          _configRowWidget(),
        ],
      ),
    );
  }

  Widget _configRankNickNameWidget() {
    return Container(
      child: Row(
        children: [
          _configRankWidget(),
          _configUserImgWidget(),
          _configNickNameWidget(),
        ],
      ),
    );
  }

  Widget _configNickNameWidget() {
    return Container(
      width: 110.0,
      margin: EdgeInsets.only(left: 10.0),
      child: Text(
        model.nickName,
        style: style.titleStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _configUserImgWidget() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
        var params = {
          "playerId": model.playerId,
          "playerName": model.nickName,
        };
//        showMaterialPageRoute(
//          context,
//          PersonalPage(params: params),
//        ).then((value){
//          if(!isStrNullOrEmpty(config.userInfo.recordVideoStatus) && config.userInfo.recordVideoStatus == 'stop'){
//            Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
//          }
//        });
      },
      child: Container(
        height: 28.0,
        width: 28.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: model.rank <= 3
                ? _configColorList(model.rank)
                : [Colors.transparent, Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          margin: EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.5),
          ),
          child: AiImage.rankingUserLogo(model.headImg,
              size: model.rank <= 3 ? 26.0 : 28.0),
        ),
      ),
    );
  }

  Widget _configRankWidget() {
    return Container(
      width: 44.0,
      alignment: Alignment.center,
      child: Text(
        '${model.rank}',
        style: model.rank > 3
            ? style.numStyle
            : style.numStyle.copyWith(
                color: _configNumColor(model.rank),
              ),
      ),
    );
  }

  Widget _configRowWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _configContributionValue(),
          _configTotalFollowWidget(),
        ],
      ),
    );
  }

  Widget _configTotalFollowWidget() {
    // return model.playerId == config.userInfo.playerId
    //     ? SizedBox(
    //         width: 54.0,
    //       )
    //     : _configFollowWidget();
    return sw(0);
  }

  Widget _configFollowWidget() {
    return model.isAttention
        ? Container(
            margin: EdgeInsets.only(right: 16.0),
            width: 38.0,
            child: Align(
              child: AiImage.asset(style.topFansImg,
                  width: 22.0, height: 30.0, fit: BoxFit.contain),
            ),
          )
        : GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 38.0,
              height: 24.0,
              margin: EdgeInsets.only(right: 16.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: style.decorationColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(19.0),
                ),
              ),
              child: Text(
                model.followText,
                textAlign: TextAlign.center,
                style: style.attentionStyle,
              ),
            ),
            onTap: () async {
              model.attentionUser();
            },
          );
  }

  Widget _configContributionValue() {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Text(
        model.contributeValue,
        style: style.contributionValueStyle,
      ),
    );
  }

  Widget _configContainer() {
    return Divider(
      color: model.isLast ? Colors.transparent : style.dividerColor,
      height: 1.0,
      indent: 81.0,
    );
  }

  List<Color> _configColorList(int rank) {
    List<Color> colors = [];
    switch (rank) {
      case 1:
        colors = style.firstColors;
        break;
      case 2:
        colors = style.secondColors;
        break;
      case 3:
        colors = style.thirdColors;
        break;
      default:
        colors = [Colors.transparent, Colors.transparent];
        break;
    }
    return colors;
  }

  Color _configNumColor(int rank) {
    Color color;
    switch (rank) {
      case 1:
        color = style.firstNumColor;
        break;
      case 2:
        color = style.secondNumColor;
        break;
      case 3:
        color = style.thirdNumColor;
        break;
      default:
        color = style.black;
        break;
    }
    return color;
  }
}
