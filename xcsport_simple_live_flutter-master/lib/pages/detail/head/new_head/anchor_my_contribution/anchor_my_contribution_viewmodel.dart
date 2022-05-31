import 'package:common_component/mvvm/viewmodel/stateless_viewmodel.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_my_contribution/anchor_my_contribution_style.dart';
import 'package:flutter/material.dart';

class AnchorMyContributionViewModel
    extends StatelessViewModel<AnchorMyContributionStyle> {
  bool isRank; // 本场投注额
  int rank; // 我的排行
  String contributeValue; //贡献值
  String nickName;
  String headImg;

  AnchorMyContributionViewModel.create({
    @required this.isRank,
    @required this.rank,
    @required this.contributeValue,
    @required this.nickName,
    @required this.headImg,
  });

  void upData({
    @required int rank, // 我的排行
    @required String contributeValue, //贡献值
    @required String nickName,
    @required String headImg,
  }) {
    this.rank = rank;
    this.headImg = headImg;
    this.nickName = nickName;
    this.contributeValue = contributeValue;
  }

  void upDateNickName({@required String nickName}) {
    this.nickName = nickName;
  }

  void upDateHeadImg({@required String headImg}) {
    this.headImg = headImg;
  }


  AnchorMyContributionViewModel();

  Map _square = config.langMap['baseLang']['square'];

  String _me = '';
  String get me => _me;

  String _askForLottery = '';
  String get askForLottery => _askForLottery;

  String _askForGift = '';
  String get askForGift => _askForGift;

  String _sendGift = '';
  String get sendGift => _sendGift;

  @override
  void onInit(){
    _me = _square['me'];
    _askForLottery = _square['askForLottery'];
    _askForGift = _square['askForGift'];
    _sendGift = _square['sendGift'];
  }

  @override
  List<AnchorMyContributionStyle> get styleList =>
      [AnchorMyContributionStyle()];
}
