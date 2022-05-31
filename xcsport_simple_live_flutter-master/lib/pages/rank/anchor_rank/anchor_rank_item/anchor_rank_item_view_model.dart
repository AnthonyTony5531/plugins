import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:flutter/foundation.dart';

import 'anchor_rank_page_style.dart';

///生命周期onAttach->onInit->onDetach->onDispose. refresh不属于生命周期，外面掉用，外部没调用可以不实现。
//其中onAttach, onDetach属于视图的生命周期期间同步方法
class AnchorRankItemViewModel
    extends StatefulViewModel<AnchorRankItemViewStyle> {
  String rank;
  String name;
  String userIcon;
  String valueString; // 值
  String defaultString;
  bool isPlaying;
  bool isWan;
  bool isMe;
  bool isDetailPage; // 是否在详情里面

  String anchorId;
  String playerId;
  AnchorRankItemViewModel();

  //参数传给view时候，在这初始化统一入口初始化，自己要啥扩展参数。注意。Page和Dialog.page参数来源于View的构造函数，
  AnchorRankItemViewModel.create({
    @required this.rank,
    @required this.name,
    @required this.userIcon,
    @required this.valueString,
    @required this.defaultString,
    @required this.isPlaying,
    @required this.isWan,
    this.isMe,
    this.isDetailPage = false,
    @required this.anchorId,
    @required this.playerId,
  });

  //更新统一走这个方法
  void update({
    String rank,
    String name,
    String userIcon,
    String valueString,
    String defaultString,
    bool isPlaying,
    bool isMe,
    String anchorId,
    String playerName,
    String playerId,
  }) {
    this.rank = rank ?? this.rank;
    this.name = name ?? this.name;
    this.userIcon = userIcon ?? this.userIcon;
    this.valueString = valueString ?? this.valueString;
    this.defaultString = defaultString ?? this.defaultString;
    this.isPlaying = isPlaying ?? this.isPlaying;
    this.isWan = isWan ?? this.isWan;
    this.isMe = isMe ?? this.isMe;
    this.anchorId = anchorId ?? this.anchorId;
    this.playerId = playerId ?? this.playerId;
  }

  //initState时候同步调用，同步方法。这里不能做io, cache读写.查询等耗时操作。
  @override
  void onAttach() {}

  //返回true会调用notifyStateChanged, model变化时候也会重新执行。
  @override
  Future<bool> onInit() async {
    return false;
  }

  //对应widget didUpdateWidget执行后，这个方法会执行，并且oldeViewModel会在这之前执行onDispose。通常在这判断model有没有变动，获取之前的状态做处理。
  @override
  void didModelUpdate(IViewModel o, IViewModel n) {
    AnchorRankItemViewModel oldeViewModel = o as AnchorRankItemViewModel;
    AnchorRankItemViewModel newViewModel = n as AnchorRankItemViewModel;
  }

  //view 摧毁时候会调用，或者model变更被移除的时候也会被执行
  @override
  void onDispose() {}

  //这是给外面掉用的
  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) {
    //
    return null;
  }

  @override
  List<AnchorRankItemViewStyle> get styleList => [AnchorRankItemViewStyle()];
}
