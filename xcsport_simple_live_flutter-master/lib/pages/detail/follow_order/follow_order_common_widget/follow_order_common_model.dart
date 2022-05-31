import 'dart:math';

import 'package:common_component/mvvm/viewmodel/stateless_viewmodel.dart';
import 'package:fast_ai/pages/detail/follow_order/follow_order_common_widget/follow_order_common_style.dart';
import 'package:fast_ai/pages/detail/follow_order/follow_order_common_widget/follow_order_title_model.dart';
import 'package:flutter/cupertino.dart';

class FollowOrderCommonViewModel extends StatelessViewModel<FollowOrderCommonStyle> {
  final String playName;
  final String talkMsg;
  final List<FollowOrderTitleModel> titles;
  FollowOrderCommonViewModel({@required this.playName, @required this.talkMsg, @required this.titles});

  @override
  List<FollowOrderCommonStyle> get styleList => [FollowOrderCommonStyle()];

  List<FollowOrderTitleModel> get modelList {
    if (titles.length <= 0) return [];
   return titles.sublist(0,min(titles.length, 3));
  }
}