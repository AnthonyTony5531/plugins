import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/module/common/widget/refresh_list_view/ai_refresh_list_view.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_before/anchor_rank_before_view.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_item/anchor_rank_item_view.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_item/anchor_rank_item_view_model.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/widgets/bottom_rank_hint.dart';
import 'package:fast_ai/widgets/default_views/default_view.dart';
import 'package:flutter/material.dart';

import 'anchor_rank_list_view_model.dart';
import 'anchor_rank_list_view_style.dart';

///
/// 主播排行榜list
///
class AnchorRankListView extends StatefulView<AnchorRankListViewStyle, AnchorRankListViewModel> {
  final AnchorRankListViewModel model;

  AnchorRankListView({Key key,  this.model }) : super(model: model, key: key);

  @override
  _AnchorRankListViewState createState() => _AnchorRankListViewState();
}

class _AnchorRankListViewState extends ViewState<AnchorRankListViewStyle, AnchorRankListViewModel, AnchorRankListView> {
  AnchorRankListViewModel _viewModel;
  @override
  AnchorRankListViewModel get defaultModel {
    _viewModel ??= AnchorRankListViewModel();
    return _viewModel;
  }

  @override
  Widget render(BuildContext context) {
    double defaultHeight =
        AiMeasure.screenHeight(context) - 44.0 - AiMeasure.topOffset(context);
    return _configListView(defaultHeight);
  }

  Widget _configListView(double defaultHeight){
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: AiRefreshListView(
        refreshViewController: model.scRefreshViewController,
          model: model.listViewViewModel,
          bottomWidget: BottomRankWidget(),
          emptyView: (model.firstViewModel != null) ? SizedBox() : DefaultView(
              backgroundColor: Colors.transparent,
              name: 'rank_list',
              height: defaultHeight,
              enableBtn: true,
              onTap: () => model.scRefreshViewController.autoRefresh()
          ),
          errorView: DefaultView(
            name: 'rank_error',
            enableBtn: true,
            imageAssetFile: style.netErrorImg,
            onTap: () => model.scRefreshViewController.autoRefresh(),
          ),
          headers: [
            _configHeaderWidget(),
          ],
          builder: (viewModel,index){
            if (viewModel is AnchorRankItemViewModel) {
              return AnchorRankItemView(model: viewModel);
            } else {
              return SizedBox();
            }
          }),
    );
  }

  Widget _configHeaderWidget(){
    return model.firstViewModel != null ? Container(
      height: 232.0,
      padding: EdgeInsets.only(bottom: 24.0),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AnchorRankBeforeView(
            model: model.secondViewModel,
          ),
          AnchorRankBeforeView(
            model: model.firstViewModel,
          ),
          AnchorRankBeforeView(
            model: model.thirdViewModel,
          ),
        ],
      ),
    ) : SizedBox(height: 0.0,);
  }
}