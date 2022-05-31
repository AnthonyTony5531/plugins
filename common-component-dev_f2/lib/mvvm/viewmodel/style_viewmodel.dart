import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:common_component/theme/view_style.dart';

/// @author king
/// @date 2021/5/29
///具备样式的视图模型抽象类
abstract class StyleViewModel <S extends ViewStyle>  implements IViewModel{

  S _style;


  // ignore: unnecessary_getters_setters
  S get style => _style;

  // ignore: unnecessary_getters_setters
  set style(S value) {
    _style = value;
  }

  List<S> get styleList;
}

