import 'package:common_component/mvvm/viewmodel/style_viewmodel.dart';
import 'package:common_component/theme/view_style.dart';

/// @author king
/// @date 2021/5/29


///有状态的视图模型抽象类
abstract class  StateViewModel<S extends ViewStyle>  extends StyleViewModel<S>{
  Future<void> notifyStateChanged();
}


