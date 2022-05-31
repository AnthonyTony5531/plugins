import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/module/common/util/sizebox_util.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottombar_view_style.dart';
import 'bottombar_view_model.dart';

///
/// {notes}
///
class BottombarView
    extends StatefulView<BottombarViewStyle, BottombarViewModel> {
  final BottombarViewModel model;

  BottombarView({Key key, this.model}) : super(model: model, key: key);

  @override
  _BottombarViewState createState() => _BottombarViewState();
}

class _BottombarViewState
    extends ViewState<BottombarViewStyle, BottombarViewModel, BottombarView> {
  BottombarViewModel _viewModel;
  @override
  BottombarViewModel get defaultModel {
    _viewModel ??= BottombarViewModel();
    return _viewModel;
  }

  @override
  Widget render(BuildContext context) {
    return Container(
      color: Color(0xFFFCFBFA),
      child: Row(
        children: model.itemViewModels
            .map(
              (e) => Expanded(
                child: itemView(
                  normalIcon: e['normalIcon'],
                  selectedIcon: e['selectedIcon'],
                  viewType: e['viewType'],
                  title: e['title'],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget itemView(
      {String normalIcon,
      String selectedIcon,
      HomePageViewType viewType,
      String title}) {
    bool isSelected = viewType == model.currentViewType;
    return GestureDetector(
      onTap: () {
        model.setCurrentViewType(viewType);
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             AiSvgPicture.asset(isSelected ? selectedIcon : normalIcon,
                width: 21, height: 21, fit: BoxFit.cover),
            sh(5),
            Text(
              title,
              style: isSelected
                  ? style.titleSelectedStyle
                  : style.titleNormalStyle,
            ),
          ],
        ),
      ),
    );
  }
}
