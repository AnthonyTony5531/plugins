import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_list/anchor_contribution_item/anchor_contribution_item_view.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_list/anchor_contribution_item/anchor_contribution_item_viewmodel.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_list/anchor_contribution_list_style.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_list/anchor_contribution_list_viewmodel.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_title.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_my_contribution/anchor_my_contribution_view.dart';
import 'package:fast_ai/widgets/default_views/default_view.dart';
import 'package:fast_ai/widgets/default_views/load_fail.dart';
import 'package:fast_ai/widgets/fresh_listview.dart';
import 'package:flutter/material.dart';

// 本场打赏 7天榜
class AnchorContributionListStatefulView extends StatefulView<
    AnchorContributionListStyle, AnchorContributionListViewModel> {
  final AnchorContributionListViewModel model;

  const AnchorContributionListStatefulView({Key key, this.model})
      : super(key: key, model: model);

  @override
  _AnchorContributionListStatefulViewState createState() =>
      _AnchorContributionListStatefulViewState();
}

class _AnchorContributionListStatefulViewState extends ViewState<
    AnchorContributionListStyle,
    AnchorContributionListViewModel,
    AnchorContributionListStatefulView> {
  AnchorContributionListViewModel _model;

  @override
  AnchorContributionListViewModel get defaultModel =>
      _model ??= AnchorContributionListViewModel();

  FreshListController _freshListController = FreshListController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: style.backGroundColor,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: body(),
      ),
    );
  }

  Widget body() {
    if (model.error.isNotEmpty) {
      return Container(
        color: Theme.of(context).backgroundColor,
        child: LoadFail(
          error: model.error,
          onRefresh: () => model.onRefresh(),
        ),
      );
    }
    return Column(
      children: [
        _configAnchorContributionTitle(),
        Expanded(
          child: _configRefreshWidget(),
        ),
        _configAnchorMyContribution(),
      ],
    );
  }

  Widget _configAnchorContributionTitle() {
    return Offstage(
      offstage: !model.isHaveContribution,
      child: AnchorContributionTitle(
        rightInfo: model.rightInfo,
      ),
    );
  }

  Widget _configAnchorMyContribution() {
    return Offstage(
      offstage: !model.isHaveContribution,
      child: Container(
        height: 73.0,
        child: AnchorMyContributionStatelessView(
          model: model.myViewModel,
          onShowGift: (){
            Event.eventBus.fire(ShowGiftEvent());
          },
        ),
      ),
    );
  }

  Widget _configRefreshWidget() {
    return FreshListView(
      isNoDateMagin: false,
      controller: _scrollController,
      freshListController: _freshListController,
      loadData: model.loadData,
      isClear: model.isClear,
      pageSize: model.size,
      onClear: (v) => model.isClear = v,
      drawWidget: drawWidget,
      nonDataWidget: Container(
        margin: EdgeInsets.only(top: 50.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Theme.of(context).backgroundColor,
        ),
        child: DefaultView(
            backgroundColor: Colors.transparent,
            name: 'anchor_contribution_empty',
            height: 300.0,
            enableBtn: false,
            onTap: (){
              model.onRefresh();
            }
        ),
      ),
      loadingWidget: SizedBox(),
      divider: SizedBox(),
      isFirstLoad: model.isFirstLoad,
      matchLoadingCount: 2,
      showBottomCount: 7,
    );
  }

  //列表页生成显示单元格
  Widget drawWidget(ListResult listResult, int index) {
    List<AnchorContributionItemViewModel> list =
        listResult.data as List<AnchorContributionItemViewModel>;
    if (index >= list.length) return SizedBox();
    AnchorContributionItemViewModel anchorContributionInfoModel = list[index];
    anchorContributionInfoModel.upDateLast(isLast: index >= list.length - 1);
    return AnchorContributionItemStatefulView(
      model: anchorContributionInfoModel,
    );
  }
}
