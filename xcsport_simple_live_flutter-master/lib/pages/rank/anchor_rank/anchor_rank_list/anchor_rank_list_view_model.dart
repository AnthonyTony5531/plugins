import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:common_component/widget/sc_refresh_view/sc_refresh_view.dart';
import 'package:common_component/widget/sliver/loadmore_view/loadmore_view_model.dart';
import 'package:fast_ai/api/protocols/rank/anchor_charm_rank.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/widget/refresh_list_view/ai_refresh_list_view.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_before/anchor_rank_before_view_model.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_item/anchor_rank_item_view_model.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_page_view_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:flutter/cupertino.dart';

import 'anchor_rank_list_view_style.dart';

///生命周期onAttach->onInit->onDetach->onDispose. refresh不属于生命周期，外面掉用，外部没调用可以不实现。
//其中onAttach, onDetach属于视图的生命周期期间同步方法
class AnchorRankListViewModel
    extends StatefulViewModel<AnchorRankListViewStyle> {
  AnchorTitleType titleType;

  AnchorRankListViewModel();

  //参数传给view时候，在这初始化统一入口初始化，自己要啥扩展参数。注意。Page和Dialog.page参数来源于View的构造函数，
  AnchorRankListViewModel.create({@required this.titleType});

  //更新统一走这个方法
  void update({AnchorTitleType titleType}) {
    this.titleType = titleType ?? this.titleType;
  }

  String _defaultS = '';

  FreshListViewViewModel<IViewModel> listViewViewModel;
  ScRefreshViewController scRefreshViewController;

  AnchorRankBeforeViewModel firstViewModel;
  AnchorRankBeforeViewModel secondViewModel;
  AnchorRankBeforeViewModel thirdViewModel;

  String _firstBgImg = 'assets/images/new_rank/img_anchor_rank_frame_first.png';
  String _secondBgImg =
      'assets/images/new_rank/img_anchor_rank_frame_second.png';
  String _thirdBgImg = 'assets/images/new_rank/img_anchor_rank_frame_third.png';

  //initState时候同步调用，同步方法。这里不能做io, cache读写.查询等耗时操作。
  @override
  void onAttach() {
    AiJson aiJson = AiJson(config.baseLang);

    if (titleType == AnchorTitleType.charmType) {
      _defaultS = aiJson.getString('charmValue');
    } else if (titleType == AnchorTitleType.ballType) {
      _defaultS = aiJson.getString('fanProfitValue');
    } else if (titleType == AnchorTitleType.rewardType) {
      _defaultS = aiJson.getString('moatValue');
    } else {}

    listViewViewModel =
        FreshListViewViewModel.create(page: 1, size: 20, onPageLoad: pageLoad);
    scRefreshViewController = ScRefreshViewController();
  }

  //返回true会调用notifyStateChanged, model变化时候也会重新执行。
  @override
  Future<bool> onInit() async {
    await refresh();
    return false;
  }

  Future<void> pageLoad(int page, int size, LoadMoreViewModel viewModel,
      bool isDataFromTimer) async {
    int rank = 0;
    String url = '';
    if (titleType == AnchorTitleType.charmType) {
      url = '/anchorCharmRank';
    } else if (titleType == AnchorTitleType.ballType) {
      url = '/orderQueryServer/api/c/anchor/ballKingRank';
    } else if (titleType == AnchorTitleType.rewardType) {
      url = '/richUserRank';
    } else {}

    AnchorCharmRspProtocol rspProtocol = await AnchorCharmRepProtocol(
            url: url,
            params: titleType == AnchorTitleType.ballType
                ? {'walletId': config.userInfo.walletId}
                : null)
        .request();
    List<AnchorRankItemViewModel> modelList = [];
    if (rspProtocol.isSuccess) {

      rspProtocol.dataList.forEach((element) {
        rank += 1;
        String goldAmountS = '';
        double floatD = element.goldAmount / 10000;
        bool isWan = floatD > 1.0;
        if (floatD > 1.0) {
          goldAmountS = floatD.toStringAsFixed(2);
        } else {
          goldAmountS = element.goldAmount.toString();
        }

        String nickName = '';
        String headImg = '';
        if (titleType == AnchorTitleType.charmType) {
          nickName = element.anchorName;
          headImg = element.headPortrait;
        } else if (titleType == AnchorTitleType.ballType) {
          nickName = element.anchorName;
          headImg = element.headPortrait;
        } else if (titleType == AnchorTitleType.rewardType) {
          nickName = element.nickName;
          headImg = element.headImg;
        } else {}

        AnchorRankItemViewModel rankItemViewModel =
            AnchorRankItemViewModel.create(
          rank: '$rank',
          name: nickName,
          userIcon: headImg,
          valueString: goldAmountS,
          defaultString: _defaultS,
          isPlaying: false,
          isWan: isWan,
          isMe: element.isMe == 1 ? true : false,
          anchorId: element.anchorId ?? '',
          playerId: element.playerId ?? '',
        );
        modelList.add(rankItemViewModel);
      });
    }

    if (modelList.isNotEmpty && modelList.length > 0) {
      if (page == 1) {
        AnchorRankItemViewModel firstM = modelList.first;

        if (firstViewModel == null) {
          firstViewModel = AnchorRankBeforeViewModel.create(
              name: firstM.name,
              valueString: firstM.valueString,
              isWan: firstM.isWan,
              userIcon: firstM.userIcon,
              isPlaying: firstM.isPlaying,
              defaultString: _defaultS,
              bgImg: _firstBgImg,
              titleType: titleType,
              bgWidth: 113.0,
              bgHeight: 165.0,
              imgWidth: 67.0,
              imgHeight: 67.0,
              anchorId: firstM.anchorId,
              playerId: firstM.playerId,
          );
        } else {
          firstViewModel.update(
            name: firstM.name,
            valueString: firstM.valueString,
            userIcon: firstM.userIcon,
            isPlaying: firstM.isPlaying,
            isWan: firstM.isWan,
            anchorId: firstM.anchorId,
            playerId: firstM.playerId,
          );
        }

        if (modelList.length >= 2) {
          AnchorRankItemViewModel secondM = modelList[1];
          if (secondViewModel == null) {
            secondViewModel = AnchorRankBeforeViewModel.create(
                defaultString: _defaultS,
                bgImg: _secondBgImg,
                titleType: titleType,
                bgWidth: 113.0,
                bgHeight: 144.0,
                imgWidth: 55.0,
                imgHeight: 55.0,
                name: secondM.name,
                valueString: secondM.valueString,
                isWan: secondM.isWan,
                userIcon: secondM.userIcon,
                isPlaying: secondM.isPlaying,
                anchorId: secondM.anchorId,
                playerId: secondM.playerId
            );
          } else {
            secondViewModel.update(
              name: secondM.name,
              valueString: secondM.valueString,
              isWan: secondM.isWan,
              userIcon: secondM.userIcon,
              isPlaying: secondM.isPlaying,
              anchorId: secondM.anchorId,
              playerId: secondM.playerId,
            );
          }
        } else {
          if (secondViewModel == null) {
            secondViewModel = AnchorRankBeforeViewModel.create(
                defaultString: _defaultS,
                bgImg: _secondBgImg,
                titleType: titleType,
                bgWidth: 113.0,
                bgHeight: 144.0,
                imgWidth: 55.0,
                imgHeight: 55.0,
                name: '',
                valueString: '',
                isWan: false,
                userIcon: '',
                isPlaying: false);
          } else {
            secondViewModel.update(
              name: '',
              valueString: '0',
              isWan: false,
              userIcon: '',
              isPlaying: false,
              anchorId: '',
              playerId: '',
            );
          }
        }

        if (modelList.length >= 3) {
          AnchorRankItemViewModel thirdM = modelList[2];
          if (thirdViewModel == null) {
            thirdViewModel = AnchorRankBeforeViewModel.create(
              defaultString: _defaultS,
              bgImg: _thirdBgImg,
              titleType: titleType,
              bgWidth: 113.0,
              bgHeight: 144.0,
              imgWidth: 55.0,
              imgHeight: 55.0,
              name: thirdM.name,
              valueString: thirdM.valueString,
              isWan: thirdM.isWan,
              userIcon: thirdM.userIcon,
              isPlaying: thirdM.isPlaying,
              anchorId: thirdM.anchorId,
              playerId: thirdM.playerId,
            );

          } else {
            thirdViewModel.update(
              name: thirdM.name,
              valueString: thirdM.valueString,
              isWan: thirdM.isWan,
              userIcon: thirdM.userIcon,
              isPlaying: thirdM.isPlaying,
              anchorId: thirdM.anchorId,
              playerId: thirdM.playerId,
            );
          }
        } else {
          if (thirdViewModel == null) {
            thirdViewModel = AnchorRankBeforeViewModel.create(
              defaultString: _defaultS,
              bgImg: _thirdBgImg,
              titleType: titleType,
              bgWidth: 113.0,
              bgHeight: 144.0,
              imgWidth: 55.0,
              imgHeight: 55.0,
              name: '',
              valueString: '',
              isWan: false,
              userIcon: '',
              isPlaying: false,
            );

          } else {
            thirdViewModel.update(
              name: '',
              valueString: '0',
              isWan: false,
              userIcon: '',
              isPlaying: false,
              anchorId: '',
              playerId: '',
            );
          }
        }
      }    }

    viewModel.update(
        newData: (modelList.isNotEmpty && modelList.length >= 3)
            ? modelList.sublist(3)
            : [],
        total: 0,
        isNetError: rspProtocol.isError);
    notifyStateChanged();
  }

  //对应widget didUpdateWidget执行后，这个方法会执行，并且oldeViewModel会在这之前执行onDispose。通常在这判断model有没有变动，获取之前的状态做处理。
  @override
  void didModelUpdate(IViewModel o, IViewModel n) {
    AnchorRankListViewModel oldeViewModel = o as AnchorRankListViewModel;
    AnchorRankListViewModel newViewModel = n as AnchorRankListViewModel;
  }

  //view 摧毁时候会调用，或者model变更被移除的时候也会被执行
  @override
  void onDispose() {}

  //这是给外面掉用的
  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) {
    listViewViewModel.refresh();
    return super.refresh();
  }

  @override
  List<AnchorRankListViewStyle> get styleList => [AnchorRankListViewStyle()];
}
