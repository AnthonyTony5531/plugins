import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
//import 'package:fast_ai/pages/member/personal/personal_page.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_page_view_model.dart';
//import 'package:fast_ai/pages/rank/ba_rank_utils.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/material.dart';

import 'anchor_rank_before_view_model.dart';
import 'anchor_rank_before_view_style.dart';

///
///
///
class AnchorRankBeforeView
    extends StatefulView<AnchorRankBeforeViewStyle, AnchorRankBeforeViewModel> {
  final AnchorRankBeforeViewModel model;

  AnchorRankBeforeView({Key key, this.model}) : super(model: model, key: key);

  @override
  _AnchorRankBeforeViewState createState() => _AnchorRankBeforeViewState();
}

class _AnchorRankBeforeViewState extends ViewState<AnchorRankBeforeViewStyle,
    AnchorRankBeforeViewModel, AnchorRankBeforeView> {
  AnchorRankBeforeViewModel _viewModel;

  @override
  AnchorRankBeforeViewModel get defaultModel {
    _viewModel ??= AnchorRankBeforeViewModel();
    return _viewModel;
  }

  @override
  Widget render(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: (){
//          Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
//          if (isNotEmpty(model?.anchorId)) {
//            var params = {
//              "anchorId": model.anchorId,
//              "playerName": model.name,
//              "anchorIcon": model.userIcon,
//              "isAnchor": true,
//            };
//            showMaterialPageRoute(context, PersonalPage(params: params)).then((value) {
//              if(!isStrNullOrEmpty(config.userInfo.recordVideoStatus) && config.userInfo.recordVideoStatus == 'stop'){
//                Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
//              }
//            });
//          } else {
//            var params = {
//              "playerId": model.playerId,
//              "playerName": model.name,
////              "isAnchorRank": true,
////              "anchorIcon": model.userIcon,
//            };
//            showMaterialPageRoute(context, PersonalPage(params: params)).then((value){
//              if(!isStrNullOrEmpty(config.userInfo.recordVideoStatus) && config.userInfo.recordVideoStatus == 'stop'){
//                Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
//              }
//            });
//          }
        },
        child: Container(
          width: model.bgWidth ?? 0.0,
          height: model.bgHeight ?? 0.0,
          alignment: Alignment.bottomCenter,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                  top: 16.0,
                  child: AiImage.rankingUserLogo(
                    model.userIcon,
                    size: model.imgWidth,
                  )),
              AiImage.asset(model.bgImg,
                  width: model.bgWidth, height: model.bgHeight, fit: BoxFit.cover),
              _configWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // 底部
  Widget _configWidget() {
    Widget rowWidget;
    if (model.titleType == AnchorTitleType.charmType) {
      rowWidget = _configCharmWidget();
    } else if (model.titleType == AnchorTitleType.ballType) {
      rowWidget = _configBallWidget();
    } else if (model.titleType == AnchorTitleType.rewardType) {
      rowWidget = _configRewardWidget();
    } else {
      rowWidget = SizedBox();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 6.0, right: 6.0),
          child: Text(
            model.name,
            textAlign: TextAlign.center,
            style: style.nameStyle,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        rowWidget,
        SizedBox(height: 20.0,)
      ],
    );
  }

  Widget _configRewardWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AiImage.asset(style.moneyImg, width: 14.0, height: 14.0),
        SizedBox(
          width: 2.0,
        ),
        _configRowValueWidget(),
      ],
    );
  }

  Widget _configBallWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          model.defaultString,
          style: style.defaultStyle,
        ),
        SizedBox(
          height: 2.0,
        ),
        model.isWan
            ? RichText(
                text: TextSpan(children: [
                TextSpan(
                  text: model.valueString,
                  style: style.valueStyle,
                ),
                TextSpan(
                  text: 'w',
                  style: style.wanStyle,
                ),
              ]))
            : Text(
                model.valueString,
                style: style.valueStyle,
              ),
      ],
    );
  }

  Widget _configCharmWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AiImage.asset(style.loveImg, width: 14.0, height: 12.0),
        SizedBox(
          width: 2.0,
        ),
        _configRowValueWidget(),
      ],
    );
  }

  Widget _configRowValueWidget() {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: model.valueString,
        style: style.valueStyle,
      ),
      if (model.isWan) TextSpan(text: 'w', style: style.wanStyle),
      TextSpan(text: model.defaultString, style: style.defaultStyle),
    ]));
  }
}
