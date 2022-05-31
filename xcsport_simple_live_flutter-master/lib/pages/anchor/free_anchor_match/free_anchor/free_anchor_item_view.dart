import 'package:common_component/mvvm/view/stateless_view.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor_match_page_view_model.dart';
import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor_sub/free_anchor_sub_item_view.dart';
import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor_sub/free_anchor_sub_item_view_model.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/enter_game_detail_config.dart';
import 'package:flutter/material.dart';

import 'free_anchor_item_view_model.dart';
import 'free_anchor_page_style.dart';

///
/// {notes}
///
class FreeAnchorItemView extends StatelessView<FreeAnchorItemViewStyle, FreeAnchorItemViewModel>{

  final FreeAnchorItemViewModel anchorModel;
  final ValueChanged<AnchorSubCellModel> onAnchorMore;
  final ValueChanged<AnchorSubCellModel> onLookLive;
  final ValueChanged<AnchorSubCellModel> onLookAnchor;
  final VoidCallback goBack;
  final Color bgColor;
  final bool isNewFreeAnchor;
  final FreeAnchorPosition freeAnchorPosition;
  FreeAnchorItemView({
    Key key,
    @required this.anchorModel,
    this.onAnchorMore,
    this.onLookLive,
    this.bgColor,
    this.onLookAnchor,
    this.goBack,
    this.isNewFreeAnchor,
    this.freeAnchorPosition,
  }): super(key: key, model: anchorModel);

  AnchorSubCellModel get leftAnchorModel =>  anchorModel?.anchorMatchCellModel?.leftModel ?? AnchorSubCellModel();
  AnchorSubCellModel get rightAnchorModel =>  anchorModel?.anchorMatchCellModel?.rightModel ?? AnchorSubCellModel();
  AnchorSubCellModel get freeAnchorModel =>  anchorModel?.anchorMatchCellModel?.hotLiveModel ?? AnchorSubCellModel();


  @override
  Widget render(BuildContext context, FreeAnchorItemViewModel viewModel) {

    // 主播列表新布局
    if(isNewFreeAnchor){
      if(freeAnchorModel != null || freeAnchorModel.liveStatus != null || freeAnchorModel.isAnchorRank) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            clickItemView(context, freeAnchorModel);
          },
          child: FreeAnchorSubItemView(
              model: FreeAnchorSubItemViewModel.create(anchorSubCellModel: freeAnchorModel),
              onAnchorMore: this.onAnchorMore,
              onLookAnchor: onLookAnchor,
              freeAnchorPosition: freeAnchorPosition,
            ),
        );
      }
      return SizedBox.shrink();
    }

    Widget leftItemWidget = Container();
    Widget rightItemWidget = Container();
    if(leftAnchorModel != null && (leftAnchorModel.isAnchorRank)){
        leftItemWidget = FreeAnchorSubItemView(
          model: FreeAnchorSubItemViewModel.create(anchorSubCellModel: leftAnchorModel),
          onAnchorMore: this.onAnchorMore,
          onLookAnchor: onLookAnchor);
    }
    if(rightAnchorModel != null){
        rightItemWidget = FreeAnchorSubItemView(
          model: FreeAnchorSubItemViewModel.create(anchorSubCellModel: rightAnchorModel),
          onAnchorMore: this.onAnchorMore,
          onLookAnchor: onLookAnchor,
        );
    }
    if(leftAnchorModel == null){
      return SizedBox.shrink();
    }
    String sectionTitle = '';
    return Container(
        color: bgColor ?? config.skin.colors.bgColorGloabl,
        padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 10.0),
        child: Column(
          children: <Widget>[
            Offstage(
                offstage: sectionTitle.isEmpty,
                child: Container(
                    height: 30,
                    margin: EdgeInsets.only(bottom: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(sectionTitle, style: sectionTitleStyle(),)
                )
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(right: 6),
                        child: leftItemWidget,
                      ),
                      onTap: (){
                        clickItemView(context, leftAnchorModel);
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 6),
                        child: rightItemWidget,
                      ),
                      onTap: (){
                        clickItemView(context, rightAnchorModel);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }

  void clickItemView(BuildContext context ,AnchorSubCellModel anchorModel){

    // 详情页面切换
    if(freeAnchorPosition == FreeAnchorPosition.detail){
      DetailParams params = EntryGameDetailConfig.getDetailParams(
        anchorModel,
        playPriority: isEmpty(anchorModel.anchorId) ? PlayPriority.live : PlayPriority.anchor,
        isDetailMoreLiveChange: true,
      );
      Event.eventBus.fire(params);
    }
    else{
      if(onLookLive != null){
        onLookLive(anchorModel);
      }
      if(anchorModel.isAnchorRank){
        ccRoute.push(routeName: FastAiRouteTableName.AnchorRankPage, onBack: (value){
          goBack?.call();
        });
//        ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsHomeRank);
        return;
      }
//    if(anchorModel.isShowFreeAnchor && !anchorModel.isRBGame){
//      String toast = AiJson(config.langMap['baseLang']).getString('anchor.broadcastToast');
//      showToas(toast);
//      return;
//    }
//      print('000-right-gidm=${anchorModel.gidm}, anchorId=${anchorModel.anchorId}');
      Event.eventBus.fire(FreeAnchorEntryDetailEvent());
      DetailParams params = EntryGameDetailConfig.getDetailParams(anchorModel,isFreeAnchorListEntry: true);
      EntryGameDetailConfig.enterGameDetail(context, params, goBack: goBack);
      if(anchorModel.isShowFreeAnchor){
//        ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsFreeAnchorDetail);
//        ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsHomeFreeAnchor);
      }
      else{
//        ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsHomeAnchor);
      }
    }
  }

  TextStyle sectionTitleStyle() {
    return AiTextStyle(
        color: Color(0xFF222222),
        fontWeight: config.skin.fontWeight.medium,
        fontSize: config.skin.fontSize.h3,
        fontFamily: config.skin.fontFimaly.pingFang,
    );
  }

}