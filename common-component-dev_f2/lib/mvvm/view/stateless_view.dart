

//无状态的视图
import 'package:common_component/mvvm/viewmodel/stateless_viewmodel.dart';
import 'package:common_component/theme/view_style.dart';
import 'package:flutter/widgets.dart';

//无状态的视图模型
abstract class StatelessView<S extends ViewStyle, M extends StatelessViewModel<S>>
    extends StatelessWidget {

  final M model;

  S get style {
    assert(null != model.style,
    "warn: style is null or empty");
    return model.style;
  }

  const StatelessView({Key key, @required this.model}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, this.model);
  }

  Widget render(BuildContext context, M viewModel);
}


