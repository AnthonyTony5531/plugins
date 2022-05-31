import 'dart:async';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_list/anchor_contribution_list_view.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_list/anchor_contribution_list_viewmodel.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_contribution_current_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_contribution_current_page.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_info_message_data_model/anchor_info_page.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_info_message_data_model/anchor_player_info_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_state_ful_view.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/ai_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnchorContribution extends StatefulWidget {
  final String gidm;
  final String anchorId;
  final String roomNo;
  final String systemId;
  final bool isFreeAnchor; // 是否为自由主播详情
  bool isFreeLiveGameAnchor; // 游戏自由播正在播
  AnchorContribution(
      {Key key, this.gidm, this.anchorId, this.roomNo, this.systemId,this.isFreeAnchor, this.isFreeLiveGameAnchor = false})
      : super(key: key);

  @override
  _AnchorContributionState createState() => _AnchorContributionState();
}

class _AnchorContributionState extends State<AnchorContribution>
    with TickerProviderStateMixin {
  TabController _tabController;
  int initialIndex = 0;
  List<Widget> tabs = [];
  bool isTap = true; // true 可以点击 false 不可以点击
  StreamController<bool> _streamController;
  String oddsString = '';

  // 豪气榜
  AnchorCurrentContributionViewModel viewModel;

  // 本场打赏帮
  AnchorContributionListViewModel currentListViewMode;

  // 7天打赏帮
  AnchorContributionListViewModel sevenListViewMode;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _streamController = StreamController<bool>();
    loadPlayData();
     tabs.add(
        AiTab(
          text: config.langMap['baseLang']['detail']['contributionTab1'],
        ),
      );
      tabs.add(
        AiTab(
          text: config.langMap['baseLang']['detail']['contributionTab2'],
        ),
      );
    _tabController = TabController(vsync: this, length: tabs.length, initialIndex: initialIndex);
    _tabController.addListener(listenerTabIndex);
  }

  void listenerTabIndex(){
    if(_tabController.index != 0 && !isTap){
      isTap = true;
      if(mounted)setState(() {});
    }
  }

  Future loadPlayData() async {
    AnchorPlayerInfoModel infoModel = await Net.getAnchorRankPlayerInfo();
    String odds = config.langMap['baseLang']['detail']['anchor_odds'];
    String total = config.langMap['baseLang']['detail']['anchor_odds_total'];
    oddsString = '$odds${infoModel.odds}$total';
    isTap = true;
    if(mounted)setState(() {});
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _streamController?.close();
    _tabController?.removeListener(listenerTabIndex);
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          _body(),
          StreamBuilder(
              initialData: isTap,
              stream: _streamController.stream,
              builder: (con, AsyncSnapshot<bool> snap) {
                return Positioned(
                  left: 14.0,
                  top: 33.0,
                  child: Offstage(
                      offstage: isTap, child: AnchorInfoPage(text: oddsString)),
                );
              }),
        ],
      ),
    );
  }

  Widget _body() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 44.0,
            child: _tabBar(),
          ),
          Expanded(
            child: _tabBarView(),
          ),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return AiTabBar(
      controller: this._tabController,
      tabs: tabs,
      paddingBottom: 5,
      labelPadding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
      labelColor: Color(0xff202F4C),
      labelStyle: AiTextStyle(
        fontWeight: config.skin.fontWeight.medium,
        //fontFamily: config.skin.fontFimaly.pingFang,
        fontSize: 14.0,
        color: Color(0xff202F4C),
      ),
      unselectedLabelColor:  Color(0xff202F4C),
      unselectedLabelStyle: AiTextStyle(
        fontWeight: config.skin.fontWeight.medium,
        //fontFamily: config.skin.fontFimaly.pingFang,
        fontSize: 14.0,
        color: Color(0xff202F4C),
      ),
    );
  }

  Widget _tabBarView() {
    if (viewModel == null) {
      viewModel = AnchorCurrentContributionViewModel(
        gidm: widget.gidm,
        anchorId: widget.anchorId,
        index: 0,
        systemId: widget.systemId,
        playerId: config.userInfo.playerId,
        roomNo: widget.roomNo,
        isFreeAnchor: widget.isFreeAnchor,
      );
    } else {
      viewModel.update(
        gidm: widget.gidm,
        anchorId: widget.anchorId,
        index: 0,
        systemId: widget.systemId,
        playerId: config.userInfo.playerId,
        roomNo: widget.roomNo,
        isFreeAnchor: widget.isFreeAnchor,
      );
    }

    if (currentListViewMode == null) {
      currentListViewMode = AnchorContributionListViewModel.create(
          systemId: widget.systemId,
          anchorId: widget.anchorId,
          roomNo: widget.isFreeAnchor ? widget.roomNo : null,
          isLastContribution: false);
    } else {
      currentListViewMode.update(
          roomNo: widget.isFreeAnchor ? widget.roomNo : null,
          systemId: widget.systemId,
          anchorId: widget.anchorId,
          isLastContribution: false);
    }

    if (sevenListViewMode == null) {
      sevenListViewMode = AnchorContributionListViewModel.create(
          systemId: widget.systemId,
          anchorId: widget.anchorId,
          isLastContribution: true);
    } else {
      sevenListViewMode.update(
          systemId: widget.systemId,
          anchorId: widget.anchorId,
          isLastContribution: true);
    }

    return TabBarView(
      children: [
          AnchorStatefulView(
            child: AnchorContributionListStatefulView(
              model: currentListViewMode,
            ),
          ),
          AnchorStatefulView(
            child: AnchorContributionListStatefulView(
              model: sevenListViewMode,
            ),
          )
        ],
      controller: _tabController,
    );
  }
}
