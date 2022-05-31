import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:common_component/util/listeners/value_changed_listener.dart';
import 'package:fast_ai/locales/en-us/baseLang.dart';
import 'bottombar_view_style.dart';

///生命周期onAttach->onInit->onDetach->onDispose. refresh不属于生命周期，外面掉用，外部没调用可以不实现。
//其中onAttach, onDetach属于视图的生命周期期间同步方法
class BottombarViewModel extends StatefulViewModel<BottombarViewStyle> {
  ValueChangedListener<HomePageViewType> onHomePageViewTypeChanged =
      new ValueChangedListener<HomePageViewType>();

  BottombarViewModel();

  //参数传给view时候，在这初始化统一入口初始化，自己要啥扩展参数。注意。Page和Dialog.page参数来源于View的构造函数，
  BottombarViewModel.create();

  List<Map<String, dynamic>> get itemViewModels {
    return [
      {
        'normalIcon': 'assets/images/attention/icon_follow_clock_black.svg',
        'selectedIcon': 'assets/images/attention/icon_follow_clock_yellow.svg',
        'viewType': HomePageViewType.Index,
        'title': baseLang['tabs']['home'],
      },
      {
         'normalIcon': 'assets/images/attention/icon_follow_clock_black.svg',
        'selectedIcon': 'assets/images/attention/icon_follow_clock_yellow.svg',
        'viewType': HomePageViewType.Match,
        'title': baseLang['tabs']['league1'],
      },
      {
          'normalIcon': 'assets/images/attention/icon_follow_clock_black.svg',
        'selectedIcon': 'assets/images/attention/icon_follow_clock_yellow.svg',
        'viewType': HomePageViewType.BetList,
        'title': baseLang['order']['guessBetSheet'],
      },
      {
          'normalIcon': 'assets/images/attention/icon_follow_clock_black.svg',
        'selectedIcon': 'assets/images/attention/icon_follow_clock_yellow.svg',
        'viewType': HomePageViewType.PersonalCenter,
        'title': baseLang['page']['mine'],
      },
    ];
  }

  HomePageViewType _currentViewType = HomePageViewType.Index;

  HomePageViewType get currentViewType => _currentViewType;

  void setCurrentViewType(HomePageViewType viewType) {
    if (_currentViewType != viewType) {
      this._currentViewType = viewType;
      onHomePageViewTypeChanged.fire(viewType);
      notifyStateChanged();
    }
  }

//更新统一走这个方法
  void update() {}

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
    BottombarViewModel oldeViewModel = o as BottombarViewModel;
    BottombarViewModel newViewModel = n as BottombarViewModel;
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
  List<BottombarViewStyle> get styleList => [BottombarViewStyle()];
}

enum HomePageViewType {
  Index, //主页
  Match, //比赛
  Anchor, //主播
  BetList, //投注单
  PersonalCenter, //我的
}
