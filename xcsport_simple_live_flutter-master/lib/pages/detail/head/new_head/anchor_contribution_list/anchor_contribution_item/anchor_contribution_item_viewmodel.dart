import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/pages/detail/bottom_nav/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_contribution_list/anchor_contribution_item/anchor_contribution_item_style.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/material.dart';

class AnchorContributionItemViewModel
    extends StatefulViewModel<AnchorContributionItemStyle> {

  bool isHaveContribution = false;
  bool isAttention; // 是否已经关注
  int rank; // 我的排行
  String playerId;
  String nickName;
  String headImg;
  String contributeValue; //贡献值
  String walletId;
  bool isLast;
  AnchorContributionItemViewModel.create({
    @required this.isHaveContribution,
    @required this.isAttention,
    @required this.rank,
    @required this.playerId,
    @required this.nickName,
    @required this.headImg,
    @required this.contributeValue,
    @required this.walletId,
  });

  void update({
    @required String nickName,
    @required String headImg,
    @required bool isAttention,
  }) {
    this.isAttention = isAttention ?? this.isAttention;
    this.nickName = nickName ?? this.nickName;
    this.headImg = headImg ?? this.headImg;
  }

  void upDateLast({bool isLast}){
    this.isLast = isLast;
  }

  AnchorContributionItemViewModel();

  @override
  List<AnchorContributionItemStyle> get styleList =>
      [AnchorContributionItemStyle()];

  bool isSendRequest = false;
  CancelToken cancelRequestToken = CancelToken();

  String _followText = '';
  String get followText => _followText;

  @override
  Future<bool> onInit() {
    _followText = config.langMap['baseLang']['follow'];
    return super.onInit();
  }

  void attentionUser() async {
    if (Hooks.ins.isBlocked(HookName.StartAttentionAnchor, {})) return;
    if (isSendRequest) {
      return;
    }
    isSendRequest = true;
    Future.delayed(Duration(milliseconds: 1000), () {
      isSendRequest = false;
    });
    if (isAttention == null || playerId == null) {
      return;
    }
    cancelRequestToken?.cancel(stopAllRequestError);
    cancelRequestToken = CancelToken();
    int follow = isAttention ? 2 : 1;
    var params = {
      'playerId': playerId,
      'followType': 1, // 关注类型-1.大神 2.主播
      'follow': follow, //关注/取消关注	-1.关注 2.取消关注
    };
    var result = await Net.attentionFriend(params: params,cancelToken: cancelRequestToken);
    if (result.code == 200) {
      List followList = config?.userInfo?.account?.data?.followPlayerIds;
      isAttention = !isAttention;
      if (!isAttention) {
        followList.remove(playerId);
      } else {
        String followed = config.langMap['baseLang']['anchor']['followed'];
        showToas(followed);
        followList.add(playerId);
      }
      notifyStateChanged();
    } else {
      String followFailed = config.langMap['baseLang']['anchor']['followFailed'];
      showToas(followFailed);
      notifyStateChanged();
    }
  }

  @override
  Future refresh([Map<String, dynamic> args]) async {
    return super.refresh(args);
  }
}
