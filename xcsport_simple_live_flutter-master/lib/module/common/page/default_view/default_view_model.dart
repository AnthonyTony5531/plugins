import 'package:common_component/mvvm/viewmodel/stateless_viewmodel.dart';
import 'package:flutter/cupertino.dart';

import 'default_style.dart';

enum DefaultViewType {
  emptyData,
  network,
}

class DefaultViewModel extends StatelessViewModel<DefaultStyle> {
  @override
  List<DefaultStyle> get styleList => [DefaultStyle()];

  final String text;
  final String refreshBtnTxt;
  final bool showRefreshBtn;
  final DefaultViewType viewType;
  final VoidCallback onTap;
  final Color bgColor;

  DefaultViewModel.create({
    @required this.viewType,
    this.text,
    this.showRefreshBtn = true,
    this.refreshBtnTxt,
    this.onTap,
    this.bgColor = const Color(0xFFf5f6fa),
  });

  final String defaultNetworkTxt = '没有网络，请刷新重试';
  final String defaultEmptyTxt = '暂无数据';
  final String defaultRefreshBtnTxt = '刷新';
}
