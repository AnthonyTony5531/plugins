import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/package/page/bottombar/bottombar_view.dart';
import 'package:flutter/material.dart';

import 'ai_home_page_style.dart';
import 'ai_home_page_view_model.dart';

///
/// 4.0 主页面
///
class AiHomePage
    extends StatefulView<AiHomePagePageStyle, AiHomePagePageViewModel> {
  final AiHomePagePageViewModel model;

  AiHomePage({Key key, this.model}) : super(model: model, key: key);

  @override
  _AiHomePagePageState createState() => _AiHomePagePageState();
}

class _AiHomePagePageState extends ViewState<AiHomePagePageStyle,
    AiHomePagePageViewModel, AiHomePage> {
  AiHomePagePageViewModel _viewModel;
  @override
  AiHomePagePageViewModel get defaultModel {
    _viewModel ??= AiHomePagePageViewModel();
    return _viewModel;
  }

  @override
  Widget render(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text('4.0'),
            ),
          ),
          BottombarView(
            model: model.bottombarViewModel,
          )
        ],
      ),
    );
  }
}
