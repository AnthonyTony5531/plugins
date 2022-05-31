import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/pages/detail/bottom_nav/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_current_rank/anchor_contribution_item_page/anchor_contribution_item_style.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/cupertino.dart';

class AnchorCurrentContributionItemViewModel
    extends StatefulViewModel<AnchorCurrentContributionItemStyle> {
  bool isLast;

  bool isHaveContribution = false;
  int rank; // 我的排行
  String playerId;
  String contributeValue; //贡献值
  String walletId;

  String nickName;
  String headImg;
  bool isAttention; // 是否已经关注

  AnchorCurrentContributionItemViewModel.create(
      {@required this.rank,
      @required this.playerId,
      @required this.isHaveContribution,
      @required this.contributeValue,
      @required this.walletId,
        this.nickName,
        this.headImg,
      });

  void update({
    String nickName,
    String headImg,
    bool isAttention,
    bool isLast,
  }) {
    this.nickName = nickName ?? this.nickName;
    this.headImg = headImg ?? this.headImg;
    this.isAttention = isAttention ?? this.isAttention;
    this.isLast = isLast ?? this.isLast;
  }

  AnchorCurrentContributionItemViewModel();

  @override
  List<AnchorCurrentContributionItemStyle> get styleList =>
      [AnchorCurrentContributionItemStyle()];

  bool isSendRequest = false;
  CancelToken cancelRequestToken = CancelToken();

  // 关注
  String _followText = '';
  String get followText => _followText;
  String _followSuccess = '';
  String _followFail = '';

  @override
  Future<bool> onInit() {
    _followText = config.langMap['baseLang']['follow'] ?? '';
    _followSuccess = config.langMap['baseLang']['anchor']['followed'];
    _followFail = config.langMap['baseLang']['anchor']['followFailed'];
    return super.onInit();
  }

  void attentionUser() async {
    if (Hooks.ins.isBlocked(HookName.StartAttentionAnchor, {})) return;
    if (isSendRequest) {
      return;
    }
    isSendRequest = true;
    if (this.isAttention == null ||
        this.playerId == null) {
      return;
    }
    cancelRequestToken?.cancel(stopAllRequestError);
    cancelRequestToken = CancelToken();
    int follow = this.isAttention ? 2 : 1;
    var params = {
      'playerId': this.playerId,
      'followType': 1, // 关注类型-1.大神 2.主播
      'follow': follow, //关注/取消关注	-1.关注 2.取消关注
    };
    var result = await Net.attentionFriend(
        params: params, cancelToken: cancelRequestToken);
    if (result.code == 200) {
      List followList = config?.userInfo?.account?.data?.followPlayerIds;
      this.isAttention = !this.isAttention;
      if (!this.isAttention) {
        followList.remove(this.playerId);
      } else {
        showToas(_followSuccess);
        followList.add(this.playerId);
      }
      notifyStateChanged();
    } else {
      showToas(_followFail);
    }
    isSendRequest = false;
  }
}
