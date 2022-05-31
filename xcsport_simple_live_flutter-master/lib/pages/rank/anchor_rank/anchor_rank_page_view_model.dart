import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_list/anchor_rank_list_view_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'anchor_rank_page_style.dart';

// 魅力榜 球王榜(贡献榜) 打赏榜
enum AnchorTitleType {
  charmType,
  ballType,
  rewardType,
}

// 胜率 返还率
enum TitleType {
  winType,
  returnType,
}

///生命周期onAttach->onInit->onDetach->onDispose. refresh不属于生命周期，外面掉用，外部没调用可以不实现。
//其中onAttach, onDetach属于视图的生命周期期间同步方法
class AnchorRankPageViewModel extends StatefulViewModel<AnchorRankPageStyle>{

  AnchorRankPageViewModel();

  //参数传给view时候，在这初始化统一入口初始化，自己要啥扩展参数。注意。Page和Dialog.page参数来源于View的构造函数，
  AnchorRankPageViewModel.create();

  //更新统一走这个方法
  void update(){

  }

  List<String> _tabList = [];
  List<String> get tabList => _tabList;

  int get index => _index;
  int _index = 0;

  AnchorRankListViewModel charmViewModel;
  AnchorRankListViewModel ballViewModel;
  AnchorRankListViewModel rewardViewModel;

  void changeIndex(int value) {
    _index = value;
  }


 //initState时候同步调用，同步方法。这里不能做io, cache读写.查询等耗时操作。
  @override
  void onAttach() {
    charmViewModel = AnchorRankListViewModel.create(titleType: AnchorTitleType.charmType);
    ballViewModel = AnchorRankListViewModel.create(titleType: AnchorTitleType.ballType);
    rewardViewModel = AnchorRankListViewModel.create(titleType: AnchorTitleType.rewardType);
    AiJson aiJson = AiJson(config.baseLang);
    _tabList.clear();
    var list = aiJson.getArray('anchortabList');
    if (list.isNotEmpty) {
      List<String> dataList = List<String>.from(list);
      _tabList.addAll(dataList);
      _tabList.removeAt(0);
    } else {
      _tabList.addAll(['魅力榜','球王榜','土壕榜']);
    }
  }

  //返回true会调用notifyStateChanged, model变化时候也会重新执行。
  @override
  Future<bool> onInit() async{

    return false;
  }


  //对应widget didUpdateWidget执行后，这个方法会执行，并且oldeViewModel会在这之前执行onDispose。通常在这判断model有没有变动，获取之前的状态做处理。
  @override
  void didModelUpdate(IViewModel o, IViewModel n){
   AnchorRankPageViewModel  oldeViewModel = o as AnchorRankPageViewModel;
   AnchorRankPageViewModel  newViewModel = n as AnchorRankPageViewModel;
  }


  //view 摧毁时候会调用，或者model变更被移除的时候也会被执行
  @override
  void onDispose() {

  }

  //这是给外面掉用的
  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) {
      //
    return null;
  }

  @override
  List<AnchorRankPageStyle> get styleList => [ AnchorRankPageStyle()];
}