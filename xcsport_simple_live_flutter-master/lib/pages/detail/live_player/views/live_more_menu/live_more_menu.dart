import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_anchor_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/base/panel_mixin.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_frame/live_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//更多
class LiveMoreMenu extends StatefulWidget {
  final MoreMenuController controller;
  final MatchesDetailModel matchesDetailModel;
  final ExtendModel extendModel;
  final NewHeadAnchorModel newHeadAnchorModel;
  final DetailSet detailSet;
  final VoidCallback onShowMatchInfo;
  final String roomNo;
  final String anchorId;

  LiveMoreMenu({
    this.roomNo,
    this.anchorId,
    this.controller,
    this.matchesDetailModel,
    this.extendModel,
    this.newHeadAnchorModel,
    this.detailSet,
    this.onShowMatchInfo,
    Key key
  }) : super(key: key);

  @override
  LiveMoreMenuState createState() => LiveMoreMenuState();
}

class LiveMoreMenuState extends State<LiveMoreMenu> {

  final LiveFrameController controller   = new LiveFrameController();

  void show(){
    if(mounted){
      controller.show();
    }
  }

  void dismiss(){
    if(mounted){
      controller.dismiss();
    }
  }
  var baseLang = config.langMap['baseLang'];
  @override
  Widget build(BuildContext context) {
    if(widget.controller.toolPanel.bottomBar.model.screenDirection == ScreenDirection.TopDown) return Container();
    return SafeArea(
      child: LiveFrame(
          width: 300,
          liveFrameController: controller,
          child: body
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.controller.onPanel = onPanel;
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.onPanel = null;
  }

  void onPanel(PanelActionModel action) {
    switch(action.type) {
      case PanelActionType.show : {
        show();
        break;
      }
      case PanelActionType.hide : {
        dismiss();
        break;
      }
      default : {
        break;
      }
    }
  }

  Widget get body {
    return MoreFunction(
      anchorId: widget.anchorId,
      roomNo: widget.roomNo,
//      matchesDetailModel: widget.matchesDetailModel,
//      extendModel: widget.extendModel,
      newHeadAnchorModel: widget.newHeadAnchorModel,
      playerController: widget.controller.videoPlayer,
      detailSet: widget.detailSet,
      onShowMatchInfo: widget.onShowMatchInfo,
      isLandscape: widget.controller.toolPanel.bottomBar.model.screenDirection == ScreenDirection.LeftRight,
    );
//     return Container(
//       child: Column(
//         children: <Widget>[
//           InterValHelper.h(16),
//           TextHelper.buildContentTitle("${config.langMap['baseLang']['more']}",textColor: Colors.white.value),
//           InterValHelper.h(49),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(left: 20, right: 20),
//               child: GridView(
//                 padding: EdgeInsets.all(0),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 14,
//                   mainAxisSpacing: 14,
// //                childAspectRatio: (MediaQuery.of(context).size.width-80)/3/68,
//                 ),
//                 children: _getChildren(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
  }

  /*
  List<Widget> _getChildren(){
    String anchorId = widget.ToolPanelController.anchorSelectorFull.model?.currentAnchor?.vid??'';
    bool hasVideo = widget.controller.player?.hasVideLive??false;
    bool hasAnimation = widget.controller?.player?.hasAnimateLive??false;
    var headImg = widget.ToolPanelController.anchorSelectorFull.currentModel
        .currentAnchor?.headImg ??
        "";

    List<Widget> children = [];
    if(ModuleSwitch.getInstance().videoAndAnchor() && hasVideo){
      children.add(menuItemCell(path:  "assets/images/detail/icon_detail_live_${config.userInfo.detailSet.selectViewType == SelectViewTypeVideo ? "yellow" : "gray"}.svg", title: baseLang['detail']['videoLive'], onTag: (){
        if(!hasVideo)return;
        if (config.userInfo.detailSet.selectViewType == 'video' && widget.ToolPanelController.topBar.model?.showType != 'RB') {
          Fluttertoast.showToast(msg: baseLang['detail']['waitMatch']);
          return;
        }
        BarrageManager.get().show();
        _selectViewType(SelectViewTypeVideo);
      }));
    }

    if(ModuleSwitch.getInstance().animationLive() && hasAnimation){
      children.add(menuItemCell(path: "assets/images/liveplayer/${config.userInfo.detailSet.selectViewType == SelectViewTypeAnimation ?"icon_live_animation_selected.svg":"icon_live_animation_normal.svg"}", title: baseLang['detail']['animationLive'], onTag: (){
        if(!hasAnimation)return;
        BarrageManager.get().close();
        BarrageManager.get().clear();
        Event.eventBus.fire(WifiEvent(AiFluxMode.ArrowMobile));
        _selectViewType(SelectViewTypeAnimation);
      }));
    }

    children.add(menuItemCell(path: "assets/images/liveplayer/icon_live_score_${config.userInfo.detailSet.selectViewType == SelectViewTypeScore?'selected':'normal'}.svg", title: baseLang['detail']['scoreBlack'], onTag: (){
      _selectViewType(SelectViewTypeScore);
    }));

    children.add(menuItemCell(path: "assets/images/${hasCollected ? "collected" : "uncollect"}.svg", title: baseLang['detail']['collectMatch'], onTag: (){
      collected(!hasCollected);
    }));

    children.add(isNotEmpty(anchorId)&&( widget.ToolPanelController?.anchorSelectorFull?.model?.currentAnchor?.liveVideoType == LiveVideoType.Anchor)?menuItemCell(path: headImg, placeholder: "assets/images/liveplayer/img_default_beauty_normal.png", title: config.langMap['baseLang']['anchor']['anchorPage'], onTag: ()async{
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      var detailParam =  await  showMaterialPageRoute(context, AnchorHomePage(anchorId: anchorId,fromPage: 'detailPage',));
      if (detailParam is DetailParams) {
        Event.eventBus.fire(detailParam);
      }else{
        OrientationPlugin.setPreferredOrientations([
          DeviceOrientation.landscapeRight
        ]);
      }
    }):Container());

    return children;
  }
   */


  /*
  void _selectViewType(String selectViewType){
    var model = MatchViewChooseModel();
    model.extendModel = widget.ToolPanelController.topBar.model.extendModel;
    model.gidm =widget.ToolPanelController.topBar.model.gidm;
    model.selectItem = selectViewType;
    model.userConfirmed = true;
    config.userInfo.detailSet.isChangeViewType =true;
    config.userInfo.detailSet.selectViewType =  selectViewType;
    Event.eventBus.fire(DetailViewEvent(model));
  }
   */


/*
  Widget menuItemCell({String path, String placeholder,   String title , VoidCallback onTag}){
    return InkWell(
      onTap: onTag,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:Color.fromRGBO(201,201,201,0.1),
            ),
            child: Align(child: null == placeholder?AiSvgPicture.asset(path, width:24, height: 24, fit: BoxFit.cover,):SizedBox(
              width: 24,
              height: 24,
              child: AiImage.fromUrl(path, placeholder,BoxFit.cover ),
            )),
          ),
          InterValHelper.h(4),
          TextHelper.buildNormal(title, textColor: Colors.white.value)

        ],
      ),
    );
  }
 */


/*
  //收藏操作
  void collected(bool collected) async{

    List collectList = config?.userInfo?.followGames ?? [];

    if (collected) {
        if (collectList.length >= 10) {
        showToas(baseLang['detail']['collectUpperLimit']);
        return;
      }
    }
    
    final gidm  =  widget.ToolPanelController.topBar.model.gidm;
    LoadingDialog loadingDialog = LoadingDialog.create(
      baseLang['message']['loadWaiting'],
      onForceClose: () async {},
    );

    loadingDialog.show(context);
    Future(() async {
      var rsp = await CollectGameReqProtocol(
          gidm: widget.ToolPanelController.topBar.model.gidm,
          option: collected
              ? CollectedOption.collected
              : CollectedOption.cancel)
          .request();
      loadingDialog.dismiss();
      if (200 == rsp.code) {
        if (hasCollected) {
          // config.userInfo.account.data?.followGames?.remove(gidm);
          config.userInfo?.followGames?.remove(gidm);
        } else {
          // config.userInfo.account.data?.followGames?.add(gidm);
          config.userInfo?.followGames?.add(gidm);
        }
        if (mounted) {
          setState(() {});
        }
        // 更新收藏比赛id
        collectList = config.userInfo?.followGames ?? [];
        CollectListReqProtocol req = CollectListReqProtocol();
        if(collectList.length >= 7){
          var rsp = await req.request();
          FollowMatchModel().fromCollectListReqProtocolUpdate(rsp);
        }

      } else {
        Flushbar(
          title: "${config.langMap['baseLang']['message']['title']}",
          message: "${config.langMap['baseLang']['networkError']['networkErrorRetry']}",
          duration: Duration(seconds: 2),
        ).show(context);
      }
    });
  }
 */


  /*
  bool get hasCollected{
    return config.userInfo.hasFollowGame( widget.ToolPanelController.topBar.model.gidm);
  }
   */



}
