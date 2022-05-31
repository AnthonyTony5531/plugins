import 'dart:async';

import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:common_component/widget/sc_refresh_view/sc_refresh_view.dart';
import 'package:common_component/widget/sliver/loadmore_view/loadmore_view_model.dart';
import 'package:fast_ai/api/free_anchor_live_protocol.dart';
import 'package:fast_ai/api/rank_config_protocol.dart';
import 'package:fast_ai/api/watch_anchor_live_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/widget/refresh_list_view/ai_refresh_grid_view.dart';
import 'package:fast_ai/pages/anchor/anchor_match_cell_model.dart';
import 'package:fast_ai/pages/anchor/anchor_sub_cell/anchor_sub_cell_model.dart';
import 'package:fast_ai/pages/anchor/banner/aibanner_model.dart';
import 'package:fast_ai/pages/anchor/free_anchor_match/free_anchor/free_anchor_item_view_model.dart';
import 'package:fast_ai/pages/anchor/free_live_player/free_live_player_view_model.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/widgets/cover_picture.dart';
import 'free_anchor_match_page_style.dart';

// 主播显示的位置
enum FreeAnchorPosition {
  none,
  sport, // 主页列表
  found, // 发现页
  detail // 详情页(直播结束显示)
}

///生命周期onAttach->onInit->onDetach->onDispose. refresh不属于生命周期，外面掉用，外部没调用可以不实现。
//其中onAttach, onDetach属于视图的生命周期期间同步方法
class FreeAnchorMatchPageViewModel extends StatefulViewModel<FreeAnchorMatchPageStyle> {
  FreeAnchorMatchPageViewModel();

  FreshGridListViewModel<IViewModel> anchorViewModel;
  ScRefreshViewController scRefreshViewController;
  List<IViewModel> freeAnchors = [];
  bool isAddRBSectionTitle = false;
  int totalCount = 0;
  bool isRBSingular = false;
  bool isHiddenVideo = false;
  AiBannerModel bannerModel = AiBannerModel();
  String anchorRankImage = '';
  StreamController<bool> liveStream;
  AnchorLiveListReqProtocol req;
  bool betListStopPlay = false; // 切换底部投注单暂停和播放视频
  bool isLeaveFreeAnchorPage = false;
  bool isHaveRBGame = true;
  bool isExitApp = false;
  FreeAnchorPosition freeAnchorPosition = FreeAnchorPosition.none;
  bool isFirstLoad = true;

//  bool isNeedQuestBannerData = false; // 是否需要请求banner数据
  final FreeLivePlayerViewModel freeLivePlayerViewModel = FreeLivePlayerViewModel();

  String anchorRank = 'anchorRank';
  String gameImage = 'gameImage';

  //参数传给view时候，在这初始化统一入口初始化，自己要啥扩展参数。注意。Page和Dialog.page参数来源于View的构造函数，
  FreeAnchorMatchPageViewModel.create();

  //更新统一走这个方法
  void update() {}

  //initState时候同步调用，同步方法。这里不能做io, cache读写.查询等耗时操作。
  @override
  void onAttach() {
    scRefreshViewController = ScRefreshViewController();
    anchorViewModel = FreshGridListViewModel.create(page: 1, size: 100, onPageLoad: pageLoad);
  }

  Future<void> pageLoad(int page, int size, LoadMoreViewModel viewModel, bool isDataFromTimer) async {
    List<IViewModel> modelList = [];
    try {
      req = AnchorLiveListReqProtocol(
        page: page?.toString() ?? 1,
        pageSize: "100",
        rbType: freeAnchorPosition == FreeAnchorPosition.detail ? '1' : ''
      );
      var rsp = await req.request();
      // 屏蔽掉赛事主播
      rsp.freeAnchors?.clear();
      rsp.total = 0;
      FreeAnchorItemViewModel firstLiveModel;
      if (rsp.isSuccess) {
        isFirstLoad = false;
        if (freeAnchors.isNotEmpty && freeAnchors.length > 1) {
          firstLiveModel = freeAnchors[1];
        }
        if (page == 1) {
          freeAnchors.clear();
          // 添加主播排行
          if (rsp.liveRooms != null && (rsp.liveRooms is List) && freeAnchorPosition != FreeAnchorPosition.detail) {
            var rankMap = {anchorRank: 'true', gameImage: anchorRankImage ?? ''};
            rsp.liveRooms.insert(0, rankMap);
          }
        }
        int count = rsp.total + rsp.totalRooms + (freeAnchorPosition != FreeAnchorPosition.detail ? 1 : 0);
        totalCount = count;
        int listLength = rsp.freeAnchors.length;
        int liveLength = rsp.liveRooms.length;
        int length = listLength > liveLength ? listLength : liveLength;
        List list = [...rsp.liveRooms, ...rsp.freeAnchors];

        // 临时排序model
        List<_LiveRoomTemporaryModel> temporaryList = [];

        for (int i = 0; i < list.length; i++) {
          temporaryList.add(_LiveRoomTemporaryModel(list[i], i));
        }

        // 排序
        // 排行版放第一
        // -> 开播(自由播(服务器排序index)->赛事播(服务器排序index))
        // -> 未开播(自由播(服务器排序index)->赛事播(服务器排序index))
        temporaryList.sort((a, b) {
          // 排行版置顶
          if (a.typeInt >= 30) return -1;
          if (b.typeInt >= 30) return 1;

          // 根据播放状态排序
          if (true == a.isOpen && false == b.isOpen) return -1;
          if (false == a.isOpen && true == b.isOpen) return 1;

          // 根据类型排序
          if (a.typeInt > b.typeInt) return -1;
          if (a.typeInt < b.typeInt) return 1;

          // 服务器排序
          if (a.listIndex < b.listIndex) return -1;
          if (a.listIndex > b.listIndex) return 1;
          return 0;
        });

        for (var i = 0; i < temporaryList.length; i++) {
          var g1 = temporaryList[i];
          // 设置默认图片
          CoverPicture.anchorAddDefaultIcon(i, g1.jsonData, null);
          AnchorMatchCellModel model = (AnchorMatchCellModel()..liveType = RBLiveType.HotAnchorType).fromAnchorReqProtocolWithGame(g1.jsonData);
          FreeAnchorItemViewModel itemViewModel = FreeAnchorItemViewModel.create(anchorMatchCellModel: model);
          modelList.add(itemViewModel);
        }


        freeAnchors.addAll(modelList);

        viewModel.update(newData: modelList, total: totalCount ?? 0, isNetError: rsp.isError);

        bool isShowVideo = false;
        if (freeAnchors.isNotEmpty && freeAnchors.length > 1) {
          FreeAnchorItemViewModel anchorModel = freeAnchors[1];
          AnchorSubCellModel cellModel = anchorModel?.anchorMatchCellModel?.hotLiveModel;
          isHaveRBGame = false;
          if (cellModel?.isRBGame ?? false) {
            isShowVideo = true;
            isHiddenVideo = false;
            isHaveRBGame = true;
          }
        }
        makeNoneStatus();
        notifyStateChanged();
        bool flag = count > 1 && isShowVideo && !config.userInfo.isCloseFreeAnchor ? true : false;
        liveStream.add(flag);
      }
      if (page == 1) {
        // 广告
        // 不用一分钟调一次
//        List enableBanners = bannerModel.enableBanners ?? [];
//        if (enableBanners.isEmpty) {
//          bannerModel.requestAnchorBanner(callBack: () {
//            notifyStateChanged();
//          });
//        }
//        // 主播排行图片
//        RankConfigReqProtocol req = RankConfigReqProtocol();
//        req.onRequest().then((value) {
//          if (freeAnchors.isNotEmpty && freeAnchors.length > 0) {
//            FreeAnchorItemViewModel viewModel = freeAnchors[0];
//            if ((viewModel?.anchorMatchCellModel?.hotLiveModel?.isAnchorRank ?? false)) {
//              viewModel?.anchorMatchCellModel?.hotLiveModel?.gameImage = value.picture;
//              viewModel?.anchorMatchCellModel?.hotLiveModel?.anchorCover = value.defaultPicture;
//              anchorRankImage = value.picture;
//              notifyStateChanged();
//            }
//          }
//        });
        // 上一场比赛结束通知视频更新数据
        if (!config.userInfo.isCloseFreeAnchor) {
          if (freeAnchors.isNotEmpty && freeAnchors.length > 1) {
            FreeAnchorItemViewModel viewModel = freeAnchors[1];
            AnchorSubCellModel subCellModel = viewModel?.anchorMatchCellModel?.hotLiveModel;
            AnchorSubCellModel bufferSubCellModel = firstLiveModel?.anchorMatchCellModel?.hotLiveModel;
            if (!(subCellModel.isAnchorRank ?? false)) {
              Future.delayed(Duration(milliseconds: 50), () {
//                freeLivePlayerViewModel?.updateData(isShowLive);
              });
            }
          }
        }
      }
    } catch (e) {
      print('自由主播接口报错----:${e.toString()}');
    }
  }

  // 预约直播
//  GameAnchorReserveReqProtocol reserveReq = GameAnchorReserveReqProtocol();

//  Future<GameAnchorReserveRspProtocol> requestAnchorReserveFromServer(String reserve, String anchorId, String gidm,
//      {String videoUrl = '', String videoType = '1'}) async {
//    var body = {
//      'anchorId': anchorId ?? '',
//      'gidm': gidm ?? '',
//      'videoUrl': videoUrl ?? '',
//      'videoType': videoType ?? '',
//      'reserve': reserve ?? '',
//    };
//    var rsp = await reserveReq.request(body);
//    return rsp;
//  }

  // 观看赛事主播直播
//  GameLookAnchorLiveReqProtocol lookAnchorReq = GameLookAnchorLiveReqProtocol();

//  Future<GameLookAnchorLiveResProtocol> requestLookAnchorLiveFromServer(String anchorId, String gidm,
//      {String videoUrl = '', String videoType = '1'}) async {
//    var body = {
//      'anchorId': anchorId ?? '',
//      'gidm': gidm ?? '',
//      'videoUrl': videoUrl ?? '',
//      'videoType': videoType ?? '',
//    };
//    var rsp = await lookAnchorReq.request(body);
//    return rsp;
//  }

  // 观看自由主播直播
  Future<WatchAnchorRspProtocol> requestWatchAnchorLiveFromServer({String liveId}) async {
    var rsp;
    try {
      WatchAnchorLiveReqProtocol watchAnchorLiveReq = WatchAnchorLiveReqProtocol(liveId: liveId);
      rsp = await watchAnchorLiveReq.onRequest();
    } catch (e) {
      print('观看自由播报错');
    }
    return rsp;
  }

  // 关注主播
//  GameAnchorAttentionReqProtocol attentionReq = GameAnchorAttentionReqProtocol();

//  Future<BaseModel> requestAnchorAttentionFromServer(params) async {
//    var rsp = await attentionReq.request(params);
//    return rsp;
//  }

  //返回true会调用notifyStateChanged, model变化时候也会重新执行。
  @override
  Future<bool> onInit() async {
    await refresh();
    return false;
  }

  //对应widget didUpdateWidget执行后，这个方法会执行，并且oldeViewModel会在这之前执行onDispose。通常在这判断model有没有变动，获取之前的状态做处理。
  @override
  void didModelUpdate(IViewModel o, IViewModel n) {
    FreeAnchorMatchPageViewModel oldeViewModel = o as FreeAnchorMatchPageViewModel;
    FreeAnchorMatchPageViewModel newViewModel = n as FreeAnchorMatchPageViewModel;
  }

  //view 摧毁时候会调用，或者model变更被移除的时候也会被执行
  @override
  void onDispose() {}

  // 临时解决AiRefreshGideView低层架构的问题
  bool isLoading = false;

  //这是给外面掉用的
  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) {
    if (isLoading) return null;
    isLoading = true;
    anchorViewModel.refresh().whenComplete(() => isLoading = false);
    return super.refresh();
  }

  @override
  List<FreeAnchorMatchPageStyle> get styleList => [FreeAnchorMatchPageStyle()];
}

class _LiveRoomTemporaryModel {
  dynamic jsonData;
  int typeInt; // 自由播20,赛事播10,排行榜30
  bool isOpen; // 是否播放
  int listIndex; // 服务器排序位置

  _LiveRoomTemporaryModel(dynamic data, int index) {
    var aiJson = AiJson(data);
    jsonData = data;
    bool isRank = aiJson.getBool('anchorRank', defaultValue: false);
    // 旁行榜
    if (isRank) {
      typeInt = 30;
      return;
    }
    // 自由播
    num liveStatus = aiJson.getNum('liveStatus', defaultValue: -1);
    if (liveStatus != -1) {
      typeInt = 20;
      isOpen = liveStatus == 1;
      listIndex = index;
      return;
    }
    // 赛事播
    num status = aiJson.getNum('status', defaultValue: 0);
    typeInt = 10;
    isOpen = status == 1;
    listIndex = index;
  }
}
