import 'dart:async';

import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:common_component/widget/sc_tabs.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_widget.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_list/anchor_rank_list_view.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'anchor_rank_page_style.dart';
import 'anchor_rank_page_view_model.dart';

///
/// 魅力榜 球王榜 打赏榜
///
class AnchorRankPage
    extends StatefulView<AnchorRankPageStyle, AnchorRankPageViewModel> {
  final AnchorRankPageViewModel model;
  final bool isFreeAnchorDetail;
  final int index;

  AnchorRankPage({Key key, this.model, this.isFreeAnchorDetail = false, this.index = 0}) : super(model: model, key: key);

  @override
  _AnchorRankPageState createState() => _AnchorRankPageState();
}

class _AnchorRankPageState extends ViewState<AnchorRankPageStyle,
    AnchorRankPageViewModel, AnchorRankPage> with TickerProviderStateMixin {
  AnchorRankPageViewModel _viewModel;
  TabController _tabController;

  StreamController<int> _streamController;

  @override
  AnchorRankPageViewModel get defaultModel {
    _viewModel ??= AnchorRankPageViewModel();
    return _viewModel;
  }

  @override
  void initState() {
    super.initState();
    int index = widget.index < model?.tabList?.length ? widget.index  : 0;
    _tabController = TabController(length: model?.tabList?.length ?? 3, vsync: this, initialIndex: index);
    _tabController.addListener(_configTabListener);
    _streamController = StreamController<int>();
    if (ccRoute.hasShowOverlay(FastAiRouteTableName.ActivityDrawFloat)) {
      FloatActivityDrawCarHelper.activityDrawStatus(false, isDetail: true);
    }
  }

  // 监听位置 改变背景图片
  void _configTabListener() {
    if (_tabController.index != model.index) {
      model.changeIndex(_tabController.index);
      _streamController.add(_tabController.index);
    }
  }

  @override
  void dispose() {
    _streamController?.close();
    _streamController = null;
    _tabController?.removeListener(_configTabListener);
    _tabController?.dispose();
    _tabController = null;
    if (ccRoute.hasShowOverlay(FastAiRouteTableName.ActivityDrawFloat)) {
      FloatActivityDrawCarHelper.activityDrawStatus(true, isDetail: true);
    }
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Stack(
            children: [
              _configBgWidget(),
              _configColumnWidget(),
            ],
          )),
    );
  }

  Widget _configBgWidget() {
    double screenWidth = AiMeasure.screenWidth(context);
    return Column(
      children: [
        Container(
          width: screenWidth,
          height: 320.0,
          color: style.whiteColor,
          child: StreamBuilder(
            initialData: model.index,
            stream: _streamController.stream,
            builder: (con, AsyncSnapshot<int> snap) {
              return AiImage.asset(
                  model.index == 0 ? style.charmImg : style.ballImg,
                  width: screenWidth,
                  height: 320.0,
                  fit: BoxFit.cover);
            },
          ),
        ),
        Expanded(
            child: Container(
          color: style.whiteColor,
        )),
      ],
    );
  }

  Widget _configColumnWidget() {
    return Column(
      children: [
        _configNavigatorWidget(),
        Expanded(
          child: (model.tabList != null && model.tabList.length > 0)
              ? TabBarView(
                  controller: _tabController,
                  children: [
//                    AnchorRankListView(
//                      model: model.ballViewModel,
//                    ),
                    AnchorRankListView(
                      model: model.charmViewModel,
                    ),
                    AnchorRankListView(
                      model: model.rewardViewModel,
                    ),
                  ],
                )
              : SizedBox(),
        ),
      ],
    );
  }

  Widget _configNavigatorWidget() {
    var backWidget = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (ccRoute.canPop()) {
          ccRoute.pop();
        }
      },
      child: Container(
        width: 40.0,
        height: 44.0,
        padding: EdgeInsets.only(left: 10.0),
        child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20.0),
      ),
    );

    var nearlyW = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        ccRoute.push(routeName: FastAiRouteTableName.AnchorRankRulePage);
      },
      child: Container(
        height: 44.0,
        width: 40.0,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 12.0),
        child: AiSvgPicture.asset(style.ruleImg, width: 12.0, height: 12.0),
      ),
    );

    var tabWidget = (model.tabList != null && model.tabList.length > 0)
        ? ScTabBar(
            controller: _tabController,
            tabs: model.tabList
                    .map((e) => ScTab(
                          child: Text(e, textAlign: TextAlign.center),
                        ))
                    .toList() ??
                [],
            type: ScTabType.none,
            labelColor: style.selectedColor,
            labelStyle: style.selectedStyle,
            unselectedLabelColor: style.normalColor,
            unselectedLabelStyle: style.normalStyle,
            tabAlignment: Alignment.center,
            labelPadding: EdgeInsets.zero,
            tabHeight: 44.0,
          )
        : SizedBox();

    return Container(
      height: 44.0,
      margin: EdgeInsets.only(top: widget.isFreeAnchorDetail ? 0.0 : AiMeasure.topOffset(context),),
      child: Row(
        children:
            widget.isFreeAnchorDetail
            ? [sw(40.0),Expanded(child: tabWidget), nearlyW]
            : [backWidget, Expanded(child: tabWidget), nearlyW],
      ),
    );
  }
}
