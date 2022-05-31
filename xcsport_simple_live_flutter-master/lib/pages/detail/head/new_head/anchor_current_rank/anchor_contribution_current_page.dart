import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_title.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_contribution_current_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_contribution_current_style.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_contribution_item_page/anchor_contribution_item_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_contribution_item_page/anchor_contribution_item_page.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_my_contribution/anchor_my_contribution_view.dart';
import 'package:fast_ai/widgets/default_views/default_view.dart';
import 'package:fast_ai/widgets/default_views/load_fail.dart';
import 'package:fast_ai/widgets/fresh_listview.dart';
import 'package:flutter/material.dart';
// 本场豪气榜
class AnchorCurrentContributionStatefulView extends StatefulView<
    AnchorCurrentContributionStyle, AnchorCurrentContributionViewModel> {
  final AnchorCurrentContributionViewModel model;
  final Function oddsClick;
  const AnchorCurrentContributionStatefulView({Key key, this.model,this.oddsClick})
      : super(key: key,model:model);

  @override
  _AnchorCurrentContributionStatefulViewState createState() =>
      _AnchorCurrentContributionStatefulViewState();
}

class _AnchorCurrentContributionStatefulViewState extends ViewState<
    AnchorCurrentContributionStyle,
    AnchorCurrentContributionViewModel,
    AnchorCurrentContributionStatefulView> {

  AnchorCurrentContributionViewModel _model;

  @override
  AnchorCurrentContributionViewModel get defaultModel =>
      _model ??= AnchorCurrentContributionViewModel();

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
      backgroundColor: style.backColor,
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

  Widget _configAnchorMyContribution(){
    return Offstage(
      offstage: !model.isTrue,
      child: Container(
        height: 73.0,
        child: AnchorMyContributionStatelessView(
          model: model.myContributionViewModel,
          onShowGift: (){
            Event.eventBus.fire(ShowGiftEvent());
          },
        )
      ),
    );
  }

  Widget _configAnchorContributionTitle(){
    return Offstage(
      offstage: !model.isTrue,
      child: AnchorContributionTitle(
        userInfoClick: () async {
          // 提示框
          widget.oddsClick();
        },
        rightInfo: model.rightInfo,
      ),
    );
  }

  Widget _configRefreshWidget(){
    return FreshListView(
      isNoDateMagin: false,
      controller: _scrollController,
      freshListController: _freshListController,
      loadData: model.loadData ,
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
            name: 'rank_list',
            height: 300.0,
            onTap: () => model.onRefresh()
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
    List<AnchorCurrentContributionItemViewModel> list =
        listResult.data as List<AnchorCurrentContributionItemViewModel>;
    if (index >= list.length) return SizedBox();
    AnchorCurrentContributionItemViewModel aModel = list[index];
    aModel.update(isLast: index >= list.length - 1);
    return AnchorCurrentContributionItemStatefulView(
      model: aModel,
    );
  }
}
