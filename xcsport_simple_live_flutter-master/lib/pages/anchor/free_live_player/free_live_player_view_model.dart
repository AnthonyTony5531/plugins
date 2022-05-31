import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/utils/util.dart';
import 'free_live_player_view_style.dart';


///生命周期onAttach->onInit->onDetach->onDispose. refresh不属于生命周期，外面掉用，外部没调用可以不实现。
//其中onAttach, onDetach属于视图的生命周期期间同步方法
class FreeLivePlayerViewModel extends StatefulViewModel<FreeLivePlayerViewStyle>{

  FreeLivePlayerViewModel();
  CommonVideoPlayerController playerController;
  MatchesDetailModel matchesDetailModel = MatchesDetailModel();
  ExtendModel extendModel = ExtendModel();
  AnchorSubCellModel freeAnchorModel;
//  final FreeAnchorScoreViewModel freeAnchorScoreViewModel = FreeAnchorScoreViewModel.create();
  bool isShowLivePlayer = false;

  //参数传给view时候，在这初始化统一入口初始化，自己要啥扩展参数。注意。Page和Dialog.page参数来源于View的构造函数，
  FreeLivePlayerViewModel.create();

  //更新统一走这个方法
  void update(){

  }

 //initState时候同步调用，同步方法。这里不能做io, cache读写.查询等耗时操作。
  @override
  void onAttach() {
    playerController = CommonVideoPlayerController();
    playerController?.toolPanel?.bottomBar?.model?.videoType = VideoType.Video;
    loadGameData();
  }

  void loadGameData() async{
    String gidm = '';
    // 自由播
    if(freeAnchorModel.isShowFreeAnchor && freeAnchorModel.isRBGame){
      isShowLivePlayer = true;
      Future.delayed(Duration(milliseconds: 100),(){
        notifyStateChanged();
      });
      return;
    }
    // 赛事直播
    if(isStrNullOrEmpty(gidm)) return;
    String groupId = '${config.userInfo.sportPlatformId}';
//    matchesDetailModel = await Net.getMatchesDetail(params: {'gidm': gidm});
    extendModel = await Net.getExtend(params: {'gidm': gidm, 'groupId': groupId});
    DetailParams detailParams = DetailParams(
      anchorId: freeAnchorModel?.anchorId ?? '',
    );
//    freeAnchorScoreViewModel.extendModel = extendModel;
//    freeAnchorScoreViewModel.matchesDetailModel = matchesDetailModel;
    playerController.updateExtendModel(extendModel, detailParams, true);
    isShowLivePlayer = false;
    String systemId = matchesDetailModel?.data?.systemId ?? '';
    String resultGidm = matchesDetailModel?.data?.gidm ?? '';
    if(!isStrNullOrEmpty(systemId) && !isStrNullOrEmpty(resultGidm)){
      isShowLivePlayer = true;
    }
    notifyStateChanged();
//    freeAnchorScoreViewModel?.notifyStateChanged();
    // 主播更新需要更新相应的大幕消息
    Event.eventBus.fire(RefreshFreeAnchorEvent(anchorId: freeAnchorModel?.anchorId ?? '', gidm: gidm));
    if(isPaused()){
      Future.delayed(Duration(milliseconds: 100),(){
        play();
      });
    }
  }

  void updateData(bool isShowLive){
    if(isShowLive){
      isShowLivePlayer = isShowLive;
      notifyStateChanged();
      Future.delayed(Duration(milliseconds: 50),(){
        loadGameData();
      });
    }
    else{
      loadGameData();
    }
  }

  void stopPlay(){
    playerController?.player?.pause();
  }

  void play(){
    playerController?.player?.start();
  }

  bool isPaused() {
    return playerController?.player?.isPaused ?? false;
  }

  //返回true会调用notifyStateChanged, model变化时候也会重新执行。
  @override
  Future<bool> onInit() async{

    return false;
  }


  //对应widget didUpdateWidget执行后，这个方法会执行，并且oldeViewModel会在这之前执行onDispose。通常在这判断model有没有变动，获取之前的状态做处理。
  @override
  void didModelUpdate(IViewModel o, IViewModel n){
   FreeLivePlayerViewModel  oldeViewModel = o as FreeLivePlayerViewModel;
   FreeLivePlayerViewModel  newViewModel = n as FreeLivePlayerViewModel;
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
  List<FreeLivePlayerViewStyle> get styleList => [ FreeLivePlayerViewStyle()];
}