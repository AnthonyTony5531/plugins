import 'package:common_component/mvvm/viewmodel/stateless_viewmodel.dart';
import 'package:fast_ai/pages/anchor/anchor_match_cell_model.dart';

import 'free_anchor_page_style.dart';

class FreeAnchorItemViewModel extends StatelessViewModel<FreeAnchorItemViewStyle>{

  //参数传给view时候，在这初始化统一入口初始化，自己要啥扩展参数
  AnchorMatchCellModel anchorMatchCellModel; // 比赛主播
  FreeAnchorItemViewModel.create({this.anchorMatchCellModel}){
    super.init();
  }

  @override
  List<FreeAnchorItemViewStyle> get styleList => [FreeAnchorItemViewStyle()];

}