import 'package:common_component/mvvm/viewmodel/stateless_viewmodel.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:flutter/material.dart';

import 'free_anchor_sub_page_style.dart';

class FreeAnchorSubItemViewModel extends StatelessViewModel<FreeAnchorSubItemViewStyle>{

  //参数传给view时候，在这初始化统一入口初始化，自己要啥扩展参数
  final AnchorSubCellModel anchorSubCellModel;
  FreeAnchorSubItemViewModel.create({@required this.anchorSubCellModel}){
    super.init();
  }

  @override
  List<FreeAnchorSubItemViewStyle> get styleList => [FreeAnchorSubItemViewStyle()];

}