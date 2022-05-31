import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function_live_panel.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_anchor_model.dart';
import 'package:fast_ai/pages/detail/live_player/live_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/match_view_choose/match_view_choose_model.dart';
import 'package:fast_ai/pages/detail/selected_viewtype.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterswiper/flutter_swiper.dart';

class MoreFunctionLive extends StatefulWidget {
  final ValueChanged<FunctionType> onClickItem;
  NewHeadAnchorModel newHeadAnchorModel;
  CommonVideoPlayerController playerController;
//  ExtendModel extendModel;
  DetailSet detailSet;
  final double itemWidth;
  final double itemPadding;
  final bool isShowLivePanel; // 播放器面板上是否显示直播列表

  MoreFunctionLive({
    Key key,
    this.onClickItem,
    this.newHeadAnchorModel,
    this.playerController,
//    this.extendModel,
    this.detailSet,
    this.itemWidth ,
    this.itemPadding = 0,
    this.isShowLivePanel = false,
  }) : super(key: key);

  @override
  _MoreFunctionLiveState createState() => _MoreFunctionLiveState();
}

class _MoreFunctionLiveState extends State<MoreFunctionLive>  {

  var baseLang = config.langMap['baseLang'];
  List<String> liveTitles = [];
  List<String> liveImgs = [];
  ScrollController scrollController = ScrollController();
  NewHeadAnchorModel get newHeadAnchorModel => widget.newHeadAnchorModel;
  bool isShowLive = false;
  StreamSubscription<LiveChangeEvent> liveChangeEvent;
  double itemWidth = 54.0;
  SwiperController swiperController = SwiperController();


  @override
  void initState() {
    super.initState();
    String videoLive = baseLang['detail']['videoLive'];
    String animationLive = baseLang['detail']['animationLive'];
    String scoreLive1 = baseLang['detail']['scoreLive1'];
    liveTitles.add(videoLive);
    liveTitles.add(animationLive);
    liveTitles.add(scoreLive1);
    liveImgs.add('icon_detail_more_video.svg');
    liveImgs.add('icon_detail_more_score.svg');
    liveImgs.add('icon_detail_more_animation.svg');
    if(widget?.itemWidth != null){
      itemWidth = widget?.itemWidth;
    }
    liveChangeEvent = Event.eventBus.on<LiveChangeEvent>().listen((event) {

//       if(event.isShowLivePanel){
//         num betTotal = config?.userInfo?.roomFirstBettingTotal;
//         num currentBetTotal = config?.userInfo?.currLaunchAllBetGold;
//         num watchLiveTime = config?.userInfo?.watchLiveTime;
//         bool isUnallowWatchLive = (betTotal <= 0 && currentBetTotal <= 0 && watchLiveTime >= 0);
//
//        if(isUnallowWatchLive){
//          showToas(config.baseLang['forbidChangeLiver']);
//          return;
//        }
//      }

      if(isShowLive != event.isShowLivePanel){
        isShowLive = event.isShowLivePanel;
        if(mounted){
          setState(() {});
        }
      }


    });
  }

  @override
  void dispose() {
    liveChangeEvent?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // 播放列表上显示直播源
    if(widget.isShowLivePanel){
      if(!isShowLive){
        return Container();
      }
    }
    var anchorViews = <Widget>[];
    bool isSelectCurrentAnchor = false;

//    num betTotal = config?.userInfo?.roomFirstBettingTotal;
//    num currentBetTotal = config?.userInfo?.currLaunchAllBetGold;
    num betTotal = config?.userInfo?.videoBettingTotal;
    num currentBetTotal = config?.userInfo?.videoCurrAllBetGold;
    num watchLiveTime = config?.userInfo?.watchLiveTime;
    bool isUnallowWatchLive = (betTotal <= 0 && currentBetTotal <= 0 && watchLiveTime >= 0);
    // 用户长时间没有投注，主播和视频无法观看
    // if(!isUnallowWatchLive){
    if(ModuleSwitch.getInstance().videoAndAnchor()){
      if(true && !config.isDeleteInternationalAppointModule){
        //主播
        newHeadAnchorModel.anchors.forEach((item) {
//      if( widget.detailSet.selectViewType != SelectViewTypeVideo || item.anchorId != widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.vid){
          isSelectCurrentAnchor = item.anchorId == widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.vid;
          if(widget.detailSet.selectViewType != SelectViewTypeVideo){
            isSelectCurrentAnchor = false;
          }
//        print('主播ID----:${item.anchorId}');
//        print('主播----:${widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.vid}');
          // 强制下线的主播过滤掉
          if(config.userInfo.offlineAnchorIds.contains(item?.anchorId)){
            return;
          }
          anchorViews.add(GestureDetector(
            onTap: () {
              if(widget?.onClickItem != null){
                widget?.onClickItem(FunctionType.functionAnchorLive);
              }
              LiveVideoInfo liveVideoInfo = widget.playerController.toolPanel.anchorSelectorRight.model.anchors.firstWhere((e)=>e.vid == item.anchorId);
              widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor = liveVideoInfo;
              MatchViewChooseModel matchViewChooseModel = MatchViewChooseModel();
              widget.detailSet.selectViewType = SelectViewTypeVideo;
              widget.detailSet.isChangeViewType = true;
              widget.detailSet.detailParams.anchorId= item.anchorId;
              config.userInfo.detailSet.detailParams.liveParams={
                "flv":item.flv,
                "m3u8":item.m3u8,
                "url":item.url,
              };
              matchViewChooseModel.gidm = widget.playerController.toolPanel.topBar.model.gidm;
//              matchViewChooseModel.extendModel = widget.extendModel;
              matchViewChooseModel.selectItem = SelectViewTypeVideo;
              Event.eventBus.fire(DetailViewEvent(matchViewChooseModel));
              //LiveVideoInfo anchorInfo
              Event.eventBus.fire(DetailMoreChangeVideoEvent(videoType: VideoType.Video));
              Event.eventBus.fire(AnchorChooseEvent(liveVideoInfo));
              Event.eventBus.fire(ChatRoomChooseEvent(item.anchorId));
              Event.eventBus.fire(LiveChangeEvent(isShowLivePanel: false));

              widget.playerController.toolPanel.anchorSelectorFull.anchorVideoChanged.fire();
              isShowLive = false;
              // 记录是否选中主播
              widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.isSelectAnchorLive = true;
              if(mounted) setState(() {});
            },
            child: menuItem(item.name,item.icon,isSelectCurrentAnchor: isSelectCurrentAnchor),
          )
          );
        });
      }



      List<Map> typeArr = getMatchData();
      typeArr.forEach((item) {
        String icon = item['icon'];
        String type = item['type'];
        String name = item['name'];
        // 视频直播
        if (type == 'video') {
          // if(!isUnallowWatchLive){
          if(true){
            int index = 0;
            if(widget.playerController.hasVideLive){
              widget.playerController.toolPanel.anchorSelectorFull.model.anchors.forEach((f){
                //vid是主播anchorId
                if(isEmpty(f.vid) ){
//              if(!(f.m3u8 == widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.m3u8 ||f.flv == widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.flv ||f.rtmp == widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.rtmp ) || type != widget.detailSet.selectViewType){
//                anchorViews.add(createButton(type: type, icon: icon,name: name, liveVideoInfo: f));
//              }
                  bool isSelectItem = false;
                  icon = item['icon'];
                  name = item['name'];
                  if(((f.m3u8 != null && f.m3u8 == widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.m3u8) ||
                      (f.flv != null && f.flv == widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.flv) ||
                      (f.rtmp != null && f.rtmp == widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.rtmp )) && type == widget.detailSet.selectViewType){
                    isSelectItem = true;
                    icon = 'icon_detail_more_video_selected.svg';
                  }
                  index ++;
                  name = name + '$index';
                  // 已经选中主播，视频匹配选中标识清零，防止同时两个选中
                  if(isSelectCurrentAnchor){
                    isSelectItem = false;
                  }
                  anchorViews.add(createButton(type: type, icon: icon,name: name, liveVideoInfo: f,isSelectItem: isSelectItem));
                }
              });
            }
          }
        }
        // 动画，比分直播
        else{
//        if(widget.detailSet.selectViewType != type){
//          anchorViews.add(createButton(type: type, icon: icon, name: name));
//        }
          if(!widget.isShowLivePanel){
            bool isSelectItem = false;
            if(widget.detailSet.selectViewType == type && type == SelectViewTypeScore){
              icon = 'icon_detail_more_score_selected.svg';
              isSelectItem = true;
            }
            else if(widget.detailSet.selectViewType == type && type == SelectViewTypeAnimation){
              icon = 'icon_detail_more_animation_selected.svg';
              isSelectItem = true;
            }
            //多语言屏蔽动画直播
            if(!ModuleSwitch.getInstance().animationLive() && type == SelectViewTypeAnimation){
              return;
            }
            anchorViews.add(createButton(type: type, icon: icon, name: name,isSelectItem: isSelectItem));
          }
        }
      });

      // 播放器面板显示主播和视频直播
      if(widget.isShowLivePanel){
        if(anchorViews.isEmpty) return Container();
        int count = anchorViews.length;
        int section = 1;
        if(count % 8 == 0 && count > 1){
          section = count ~/ 8;
        }
        else if(count > 8 && count % 8 != 0){
          section = count ~/ 8 + 1;
        }
        List<Widget> lives = [];
        for(int index = 0; index < section; index ++){
          int startPosition = index * 8;
          if(anchorViews.length >= startPosition + 8){
            List<Widget> list = anchorViews.sublist(startPosition,startPosition + 8);
            lives.add(MoreFunctionLivePanel(items: list,));
          }
          else{
            List<Widget> list = anchorViews.sublist(startPosition,anchorViews.length);
            lives.add(MoreFunctionLivePanel(items: list,));
          }
        }
        return InkWell(
          child: Container(
              color: Colors.black.withOpacity(0.8),
              padding: EdgeInsets.only(left: 60.0,right: 60.0),
              child: Swiper(
                onIndexChanged: (index){
                },
                controller: swiperController,
                scrollDirection: Axis.horizontal,
                containerWidth: MediaQuery.of(context).size.width - 60 * 2,
                itemWidth: MediaQuery.of(context).size.width - 60 * 2,
                autoplay: false,
                loop: false,
                itemCount: section,
                itemBuilder: (BuildContext ctx, int index){
                  if(index >= lives.length) return Container();
                  return lives[index];
                },
              )
          ),
          onTap: (){
            Event.eventBus.fire(LiveChangeEvent(isShowLivePanel: false));
            isShowLive = false;
            if(mounted)setState(() {});
          },
        );
      }
      else{
        return Container(
          height: 100.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: anchorViews,
          ),
        );
      }
    }
    else {
      List<Map> typeArr = getMatchData();
      typeArr.forEach((item) {
        String icon = item['icon'];
        String type = item['type'];
        String name = item['name'];
        // 动画，比分直播
        if (type != 'video') {
          if (!widget.isShowLivePanel) {
            bool isSelectItem = false;
            if (widget.detailSet.selectViewType == type &&
                type == SelectViewTypeScore) {
              icon = 'icon_detail_more_score_selected.svg';
              isSelectItem = true;
            }
            else if (widget.detailSet.selectViewType == type &&
                type == SelectViewTypeAnimation) {
              icon = 'icon_detail_more_animation_selected.svg';
              isSelectItem = true;
            }
            //多语言屏蔽动画直播
            if(!ModuleSwitch.getInstance().animationLive() && type == SelectViewTypeAnimation){
              return;
            }
            anchorViews.add(createButton(type: type,
                icon: icon,
                name: name,
                isSelectItem: isSelectItem));
          }
        }
      });
      return Container(
        height: 100.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: anchorViews,
        ),
      );
    }

  }

  List<Map<String, dynamic>> getMatchData(){
    bool hasAnimateLive = widget?.newHeadAnchorModel?.hasAnimateLive ?? false;
    String scoreName = baseLang['detail']['scoreLive1'];
    String animationName = baseLang['detail']['animationLive'];
    String videoName = baseLang['detail']['videoLive'];
    List<Map<String, dynamic>> list = [
      {'type': SelectViewTypeVideo, 'icon': 'icon_detail_more_video.svg','name': videoName},
    ];
    if (hasAnimateLive) {
      list.add({'type': SelectViewTypeAnimation, 'icon': 'icon_detail_more_animation.svg','name': animationName});
    }
    list.add({'type': SelectViewTypeScore, 'icon': 'icon_detail_more_score.svg', 'name': scoreName});
    return list;
  }

  Widget menuItem(String text,String image,{bool isSelectCurrentAnchor = false,bool isSelectItem = false}){

    text = text ?? '';
    bool isNetworkImage = false;
    if(image.startsWith('http') || image.startsWith('/')){
      isNetworkImage = true;
    }

    return Container(
      padding: EdgeInsets.only(left: widget.itemPadding, right: widget.itemPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 42.0,
            width: 42.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              color: Colors.white.withOpacity(0.1),
              border: isSelectCurrentAnchor ? Border.all(color: Theme.of(context).colorScheme.secondary.withOpacity(0.4)) : Border.all(color: Colors.transparent),
            ),
            child:
            isNetworkImage
            ? Container(
                padding: EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19.0),
                    border: isSelectCurrentAnchor ? Border.all(color: Theme.of(context).colorScheme.secondary) : Border.all(color: Colors.transparent),
                  ),
                  child: AiImage.rankingUserLogo(image,size: 25.0),
                )
              )
            : Container(
                padding: EdgeInsets.all(8.0),
                child: AiImage.svgLogo('assets/images/detail/more/$image',size: 20.0),
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            alignment: Alignment.center,
            width: itemWidth,
            child: Text(
              text,
              style: isSelectCurrentAnchor || isSelectItem ? titleStyle().copyWith(color: Theme.of(context).colorScheme.secondary) : titleStyle(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget createButton({String type, String icon,String name,LiveVideoInfo liveVideoInfo,bool isSelectItem = false}){
    return GestureDetector(
      onTap: () {
        FunctionType functionType = FunctionType.functionNone;
        if (type == SelectViewTypeVideo) {
          functionType = FunctionType.functionVideoLive;
        }
        else if(type == SelectViewTypeScore){
          functionType = FunctionType.functionScoreLive1;
        }
        else if(type == SelectViewTypeAnimation){
          functionType = FunctionType.functionAnimationLive;
        }
        if(widget?.onClickItem != null){
          widget?.onClickItem(functionType);
        }
        MatchViewChooseModel matchViewChooseModel = MatchViewChooseModel();
        widget.detailSet.selectViewType = type;
        widget.detailSet.isChangeViewType = true;
        matchViewChooseModel.gidm = widget.playerController.toolPanel.topBar.model.gidm;
//        matchViewChooseModel.extendModel = widget.extendModel;
        matchViewChooseModel.selectItem = type;
        if(type == "video"){
          widget?.detailSet?.detailParams?.anchorId = '';
          widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor = liveVideoInfo;
          widget?.playerController?.toolPanel?.anchorSelectorFull?.model?.currentAnchor?.isSelectAnchorLive = false;
          Event.eventBus.fire(AnchorChooseEvent(liveVideoInfo));
          widget.playerController.toolPanel.anchorSelectorFull.anchorVideoChanged.fire();
        }else{
          if(widget.detailSet.selectViewType == SelectViewTypeVideo){
            //widget.playerController.videoPlayer.dispose();
            widget.playerController.dispose();
          }
          widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor = null;
        }
        VideoType videoType = VideoType.Score;
        if(type == SelectViewTypeVideo){
          videoType = VideoType.Video;
        }
        else if(type == SelectViewTypeAnimation){
          videoType = VideoType.Animation;
        }
        Event.eventBus.fire(DetailMoreChangeVideoEvent(videoType: videoType));
        Event.eventBus.fire(DetailViewEvent(matchViewChooseModel));
        Event.eventBus.fire(ChatRoomChooseEvent( null));
        Event.eventBus.fire(LiveChangeEvent(isShowLivePanel: false));
        isShowLive = false;
        if(mounted) setState(() {});
      },
      child: menuItem(name,icon,isSelectCurrentAnchor: false,isSelectItem: isSelectItem),
    );
  }

  TextStyle titleStyle(){
    return AiTextStyle(
      color: Color(0xFF999999),
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
    );
  }
}
