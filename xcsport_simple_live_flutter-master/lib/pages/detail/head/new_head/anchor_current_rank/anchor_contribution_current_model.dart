import 'dart:async';
import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/api/protocols/detail/rank_contribute_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_info_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_contribution_current_style.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_my_contribution/anchor_my_contribution_viewmodel.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/fresh_listview.dart';
import 'package:flutter/cupertino.dart';

import 'anchor_contribution_item_page/anchor_contribution_item_model.dart';

class AnchorCurrentContributionViewModel
    extends StatefulViewModel<AnchorCurrentContributionStyle> {
  String gidm;
  String anchorId;
  int index;
  String systemId;
  String playerId;

  String roomNo;
  bool isFreeAnchor; // 是否是自由主播详情页
  AnchorCurrentContributionViewModel({@required this.gidm,
    @required this.anchorId,
    @required this.index,
    @required this.systemId,
    @required this.playerId,
    this.roomNo,
    @required this.isFreeAnchor,
  });


  void update(
      {String gidm, String anchorId, int index, String systemId, String playerId,String roomNo,bool isFreeAnchor}) {
    this.gidm = gidm ?? this.gidm;
    this.anchorId = anchorId ?? this.anchorId;
    this.index = index ?? this.index;
    this.systemId = systemId ?? this.systemId;
    this.playerId = playerId ?? this.playerId;
    this.roomNo = roomNo ?? this.roomNo;
    this.isFreeAnchor = isFreeAnchor ?? this.isFreeAnchor;
  }

  @override
  List<AnchorCurrentContributionStyle> get styleList =>
      [AnchorCurrentContributionStyle()];

  bool isClear = false;
  String error = '';
  bool isFirstLoad = true;
  int page = 1;
  int size = 20;
  bool isTrue = false;
  List<String> playIds = [];

  RankContributeReqProtocol rankContributeReqProtocol; // 豪气榜请求

  String _rightInfo = '';
  String get rightInfo => _rightInfo;

  AnchorMyContributionViewModel myContributionViewModel;

  @override
  Future<bool> onInit() {

    rankContributeReqProtocol = RankContributeReqProtocol(
        page: page,
        pageSize: size,
        gidm: gidm,
        anchorId: anchorId,
        systemId: systemId,
        playerId: playerId,
        roomNo: roomNo,
        isFreeAnchor: isFreeAnchor,
    );

    _rightInfo = config.langMap['baseLang']['detail']['contributionValue1'];

    myContributionViewModel = AnchorMyContributionViewModel.create(
        isRank: true,
        rank: 0,
        contributeValue: '',
        nickName: '',
        headImg: '');

    return super.onInit();
  }

  @override
  void onDispose() {
    super.onDispose();
  }

  Future onRefresh() async {
    isFirstLoad = true;
    isClear = true;
    error = "";
    notifyStateChanged();
  }

  Future<ListResult> loadData(int currentPage, int pageSize) async {
    rankContributeReqProtocol.systemId = systemId;
    rankContributeReqProtocol.gidm = gidm;
    rankContributeReqProtocol.page = currentPage;
    rankContributeReqProtocol.pageSize = pageSize;
    rankContributeReqProtocol.anchorId = anchorId;
    rankContributeReqProtocol.playerId = playerId;
    rankContributeReqProtocol.roomNo = roomNo;
    rankContributeReqProtocol.isFreeAnchor = isFreeAnchor;

    RankContributeRankRspProtocol rsp = await rankContributeReqProtocol
        .request();

    ListResult result = ListResult();
    if (rsp.isSuccess) {
      isFirstLoad = false;
      if (1 == currentPage) {
        playIds.clear();
      }

      List<AnchorContributionInfoModel> dataList = rsp
          ?.anchorContributionBaseModel?.userContributeList ?? [];
      var viewModels = <AnchorCurrentContributionItemViewModel>[];
      var tempViewModelMap = <String, AnchorCurrentContributionItemViewModel>{};
      if (dataList.isNotEmpty) {
        dataList.forEach((model) {
          model.contributeValue = configNumString(model.contributeValue);
          if (!playIds.contains(model.playerId)) {
            playIds.add(model.playerId);
            var viewModel = AnchorCurrentContributionItemViewModel.
            create(playerId: model.playerId,
                rank: model.rank,
                walletId: model.walletId,
                contributeValue: model.contributeValue,
                isHaveContribution: model.isHaveContribution,
                nickName: model.nickName,
                headImg: model.headImg,
            );

            viewModels.add(viewModel);
            tempViewModelMap[model.playerId] = viewModel;
          }
        });
      }

      if (playIds.isNotEmpty) {
        var list = await Net.getUserInfo(playIds);
        list.forEach((aModel) {
          if (tempViewModelMap.containsKey(aModel.playerId)) {
            AnchorCurrentContributionItemViewModel viewModel = tempViewModelMap[aModel
                .playerId];
            viewModel.update(nickName: isNotEmpty(aModel.nickName) ? aModel.nickName : viewModel.nickName,
                headImg: isNotEmpty(aModel.headImg) ? aModel.headImg : viewModel.headImg,
                isAttention: aModel.isAttention ?? false,
                isLast: false);
          }
        });
      }


      result.data = viewModels;
      result.listCount = viewModels.length;
      result.totalCount = rsp?.anchorContributionBaseModel?.total ?? 0;

      if (page == 1) {
        AnchorContributionInfoModel myContribute = rsp.anchorContributionBaseModel.myContribute;
        if (isStrNullOrEmpty(myContribute.nickName)) {
          myContribute.nickName = config.userInfo.nickName;
        }
        if (isStrNullOrEmpty(myContribute.headImg)) {
          myContribute.headImg = config.userInfo.headImg;
        }
        String contributeValue = configNumString(myContribute.contributeValue);
        myContributionViewModel.upData(
            rank: myContribute.rank,
            contributeValue: contributeValue,
            nickName: myContribute.nickName,
            headImg: myContribute.headImg);
      }

      isTrue = result.totalCount > 0 ? true : false;
    } else {
      error = rsp?.msg ?? '';
      result.errorMsg = rsp?.msg ?? '';
      result.listCount = 0;
      result.totalCount = 0;
      isTrue = false;
    }

    notifyStateChanged();
    return result;
  }

  @override
  Future refresh([Map<String, dynamic> args]) async {
    return super.refresh(args);
  }
}
