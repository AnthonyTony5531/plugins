import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:flutter/material.dart';

import 'anchor_rank_item_view_model.dart';
import 'anchor_rank_page_style.dart';

///
/// 魅力榜 球王榜 打赏榜itemView
///
class AnchorRankItemView extends StatefulView<AnchorRankItemViewStyle, AnchorRankItemViewModel> {
  final AnchorRankItemViewModel model;

  AnchorRankItemView({Key key,  this.model }) : super(model: model, key: key);

  @override
  _AnchorRankItemViewState createState() => _AnchorRankItemViewState();
}

class _AnchorRankItemViewState extends ViewState<AnchorRankItemViewStyle, AnchorRankItemViewModel, AnchorRankItemView> {
  AnchorRankItemViewModel _viewModel;
  @override
  AnchorRankItemViewModel get defaultModel {
    _viewModel ??= AnchorRankItemViewModel();
    return _viewModel;
  }

  @override
  Widget render(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      height: 56.0,
      padding: EdgeInsets.only(right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: 48.0,
            child: Text(model.rank,style: style.rankStyle,),
          ),
          _configUserIconWidget(),
          SizedBox(width: 10.0,),
          Expanded(child: Text(model.name,style: style.nameStyle,),),
          SizedBox(width: 10.0,),
          _configValueWidget(),
        ],
      ),
    );
  }

  // 魅力值 豪气值 粉丝盈利额
  Widget _configValueWidget(){
    return RichText(text: TextSpan(children: [
      TextSpan(
        text: model.valueString,
        style: style.valueStyle,
      ),
      if (model.isWan)
        TextSpan(
            text: 'w',
            style: style.wanStyle
        ),

      TextSpan(
        text: model.defaultString,
        style: style.defaultStyle,
      )
    ]));
  }

  // 头像
  Widget _configUserIconWidget(){
    var iconWidget = AiImage.rankingUserLogo(model.userIcon,size: 40.0);
    return GestureDetector(
      onTap: (){
//        if (isEmpty(model.anchorId) && isEmpty(model.playerId)) return;
//
//        Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
//        if (isNotEmpty(model?.anchorId)) {
//          var params = {
//            "anchorId": model.anchorId,
//            "playerName": model.name,
//            "anchorIcon": model.userIcon,
//            "isAnchor": true,
//          };
//          showMaterialPageRoute(context, PersonalPage(params: params)).then((value){
//            if(!isStrNullOrEmpty(config.userInfo.recordVideoStatus) && config.userInfo.recordVideoStatus == 'stop'){
//              Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
//            }
//          });
//        } else {
//          var params = {
//            "playerId": model.playerId,
//            "playerName": model.name,
////            "isAnchorRank": true,
////            "anchorIcon": model.userIcon,
//          };
//          showMaterialPageRoute(context, PersonalPage(params: params)).then((value){
//            if(!isStrNullOrEmpty(config.userInfo.recordVideoStatus) && config.userInfo.recordVideoStatus == 'stop'){
//              Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
//            }
//          });
//        }
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        child: model.isPlaying ? Stack(
          alignment: Alignment.bottomRight,
          children: [
            iconWidget,
            _configGifWidget(),
          ],
        ) : iconWidget,
      ),
    );
  }

  Widget _configGifWidget(){
    return Container(
      width: 17.0,
      height: 12.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: style.colors
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.0),
            bottomRight: Radius.circular(6.0),
          )
      ),
      child: AiImage.asset(style.playImg, width: 17.0, height: 12.0),
    );
  }
}