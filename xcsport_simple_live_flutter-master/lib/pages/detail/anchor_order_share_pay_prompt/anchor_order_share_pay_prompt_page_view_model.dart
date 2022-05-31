import 'package:common_component/mvvm/viewmodel/stateless_viewmodel.dart';

import 'anchor_order_share_pay_prompt_page_style.dart';

class AnchorOrderSharePayPromptPageViewModel extends StatelessViewModel<AnchorOrderSharePayPromptPageStyle>{
 final  String currency,  money;
  //参数传给view时候，在这初始化统一入口初始化，自己要啥扩展参数
  AnchorOrderSharePayPromptPageViewModel.create({this.currency, this.money, }){
    super.init();
  }

  @override
  List<AnchorOrderSharePayPromptPageStyle> get styleList => [AnchorOrderSharePayPromptPageStyle()];

}