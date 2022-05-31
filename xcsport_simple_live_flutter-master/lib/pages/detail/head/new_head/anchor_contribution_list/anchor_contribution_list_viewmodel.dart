import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/api/protocols/detail/user_contribute_rank_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_info_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_list/anchor_contribution_item/anchor_contribution_item_viewmodel.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_list/anchor_contribution_list_style.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_my_contribution/anchor_my_contribution_viewmodel.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/fresh_listview.dart';
import 'package:flutter/material.dart';

class AnchorContributionListViewModel
    extends StatefulViewModel<AnchorContributionListStyle> {
//  String gidm;
  String anchorId;
  bool isLastContribution; // ture:7打赏榜 false:本场打赏
  String systemId;
  String roomNo;

  AnchorContributionListViewModel.create({
//    @required this.gidm,
    @required this.anchorId,
    @required this.isLastContribution,
    @required this.systemId,
    this.roomNo,
  });

  void update({
//    String gidm,
    String systemId,
    String anchorId,
    String roomNo,
    bool isLastContribution,
  }) {
//    this.gidm = gidm ?? this.gidm;
    this.systemId = systemId ?? this.systemId;
    this.anchorId = anchorId ?? this.anchorId;
    this.roomNo = roomNo ?? this.roomNo;
    this.isLastContribution = isLastContribution;
  }

  AnchorContributionListViewModel();

  @override
  List<AnchorContributionListStyle> get styleList =>
      [AnchorContributionListStyle()];

  bool isClear = false;
  String error = '';
  bool isFirstLoad = true;
  int page = 1;
  int size = 20;
  bool isTrue = false;
  String rightInfo = '';
  bool isHaveContribution = false;

  // 底部我的排行
  AnchorMyContributionViewModel myViewModel;

  UserContributeRankReqProtocol req;
  List<String> playIds = [];

  @override
  Future<bool> onInit() {
    rightInfo = config.langMap['baseLang']['detail']['contributionValue'];

    req = UserContributeRankReqProtocol(
        page: page,
        pageSize: size,
//        gidm: isLastContribution ? null : gidm,
        roomNo:  isLastContribution ? null : roomNo,
        systemId: isLastContribution ? null : systemId,
        anchorId: isLastContribution ? null : anchorId);

    myViewModel = AnchorMyContributionViewModel.create(
        isRank: false, rank: 0, contributeValue: '', nickName: '', headImg: '');

    return super.onInit();
  }

  Future onRefresh() async {
    isFirstLoad = true;
    isClear = true;
    error = "";
    notifyStateChanged();
  }

  Future<ListResult> loadData(int currentPage, int pageSize) async {
    ListResult result = ListResult();

    UserContributeRankReqProtocol req = UserContributeRankReqProtocol(
        page: currentPage,
        pageSize: pageSize,
//        gidm: isLastContribution ? null : gidm,
        roomNo:  isLastContribution ? null : roomNo,
        systemId: isLastContribution ? null : systemId,
        anchorId: isLastContribution ? null : anchorId);
    UserContributeRankRspProtocol rsp = await req.request();

    if (rsp.isSuccess) {
      if (1 == currentPage) {
        playIds.clear();
      }
      isFirstLoad = false;
      List<AnchorContributionItemViewModel> dataItemList = [];
      List<AnchorContributionInfoModel> dataList =
          rsp.anchorContributionBaseModel.userContributeList;
      var tempViewModelMap = <String, AnchorContributionItemViewModel>{};

      if (dataList.isNotEmpty) {
        dataList.forEach((element) {
          playIds.add(element.playerId);
          String contributeValue = configNumString(element.contributeValue);
          AnchorContributionItemViewModel itemViewModel =
              AnchorContributionItemViewModel.create(
                  isAttention: false,
                  rank: element.rank,
                  playerId: element.playerId,
                  nickName: element.nickName,
                  headImg: element.headImg,
                  contributeValue: contributeValue,
                  walletId: element.walletId);
          dataItemList.add(itemViewModel);
          tempViewModelMap[element.playerId] = itemViewModel;
        });
      }

      if (playIds.isNotEmpty) {
        var list = await Net.getUserInfo(playIds);
        list.forEach((aModel) {
          if (tempViewModelMap.containsKey(aModel.playerId)) {
            AnchorContributionItemViewModel viewModel =
                tempViewModelMap[aModel.playerId];
            viewModel.update(
              nickName: aModel.nickName,
              headImg: aModel.headImg,
              isAttention: aModel.isAttention,
            );
          }
        });
      }

      if (page == 1) {
        AnchorContributionInfoModel myContribute =
            rsp.anchorContributionBaseModel.myContribute;
        String contributeValue = configNumString(myContribute.contributeValue);

        myViewModel.upData(
            rank: myContribute.rank,
            contributeValue: contributeValue,
            nickName: myContribute.nickName,
            headImg: myContribute.headImg);

        if (myViewModel.headImg.isEmpty) {
          myViewModel.upDateHeadImg(headImg: config.userInfo.headImg);
        }
        if (myViewModel.nickName.isEmpty) {
          myViewModel.upDateNickName(nickName: config.userInfo.nickName);
        }
      }
      result.data = dataItemList;
      result.listCount = dataItemList.length;
      result.totalCount = rsp?.anchorContributionBaseModel?.total ?? 0;
      isTrue = result.totalCount > 0 ? true : false;
      isHaveContribution = result.totalCount > 0;
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
