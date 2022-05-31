import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/new_head_anchor_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/common_video_player_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/anchor_selector/anchor_selector_model.dart';
import 'package:fast_ai/pages/detail/match_view_choose/match_view_choose_model.dart';
//import 'package:fast_ai/pages/detail/match_view_choose/match_view_choose_model.dart';
import 'package:fast_ai/pages/detail/selected_viewtype.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnchorCenter extends StatefulWidget {
  AnchorCenter({
    this.newHeadAnchorModel,
    this.playerController,
    this.extendModel,
    this.detailSet,
    Key key,
  }) : super(key: key);
  NewHeadAnchorModel newHeadAnchorModel;
  CommonVideoPlayerController playerController;
  ExtendModel extendModel;
  DetailSet detailSet;

  @override
  State<StatefulWidget> createState() {
    return _AnchorCenter();
  }
}

class _AnchorCenter extends State<AnchorCenter> {
  NewHeadAnchorModel get newHeadAnchorModel {
    return widget.newHeadAnchorModel;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TextStyle styleFont10 = AiTextStyle(fontSize: 10, color: Color.fromRGBO(255, 255, 255, 0.7), fontFamily: config.skin.fontFimaly.pingFang);

  bool get isAnchorLive => isNotEmpty(widget.playerController.toolPanel?.anchorSelectorFull?.model?.currentAnchor?.vid);



  Widget createButton({String type, String icon,String name,LiveVideoInfo liveVideoInfo}){

    return GestureDetector(
      onTap: () {
        MatchViewChooseModel matchViewChooseModel = MatchViewChooseModel();
        widget.detailSet.selectViewType = type;
        widget.detailSet.isChangeViewType = true;
//        MatchViewChooseModel.gidm = widget.playerController.toolPanel.topBar.model.gidm;
//        MatchViewChooseModel.extendModel = widget.extendModel;
        matchViewChooseModel.selectItem = type;
        if(type == "video"){
          widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor = liveVideoInfo;
          Event.eventBus.fire(AnchorChooseEvent(liveVideoInfo));
          widget.playerController.toolPanel.anchorSelectorFull.anchorVideoChanged.fire();
        }else{
          if(widget.detailSet.selectViewType == SelectViewTypeVideo){
            widget.playerController.player.dispose();
          }
          widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor = null;
        }
        Event.eventBus.fire(DetailViewEvent(matchViewChooseModel));
        Event.eventBus.fire(ChatRoomChooseEvent( null));

        setState(() {

        });
      },
               child: createCircle(icon: icon, isAsset: true,name: name),

    );
  }

  Widget createCircle({String icon, String name, bool isAsset = true}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.5),
      child: Align(
        child: Container(
          width: 26,
          height: 26,
          child: ClipOval(
            child: Stack(
              children: <Widget>[
                Container(
                  child:isAsset? AiImage.asset(icon, width: 26,height: 26,fit: BoxFit.cover):AiImage.userLogo(icon, size: 26),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: LineHelper.buildHLine(colors: [
                      0xFFFF1551,
                      0xFFFF615B,
                    ],bold: 8,)),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: TextHelper.build(name,fontSize: 5.5,textColor: Colors.white.value)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var anchorViews = <Widget>[];





    //主播
    newHeadAnchorModel.anchors.forEach((item) {
      if( widget.detailSet.selectViewType != SelectViewTypeVideo ||    item.anchorId != widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.vid){
        anchorViews.add(GestureDetector(
          onTap: () {
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
            matchViewChooseModel.extendModel = widget.extendModel;
            matchViewChooseModel.selectItem = SelectViewTypeVideo;
            Event.eventBus.fire(DetailViewEvent(matchViewChooseModel));
            //LiveVideoInfo anchorInfo

            Event.eventBus.fire(AnchorChooseEvent(liveVideoInfo));
            Event.eventBus.fire(ChatRoomChooseEvent(item.anchorId));

            widget.playerController.toolPanel.anchorSelectorFull.anchorVideoChanged.fire();
            setState(() {

            });
          },
          child: createCircle(icon: item.icon, isAsset: false,name: config.langMap['baseLang']['member']['userList']['anchor']),
        ));
      }

    });

    typeArr.forEach((item) {
      String icon = item['icon'];
      String type = item['type'];
      String name = item['name'];

      if (type == 'video') {
        if(widget.playerController.hasVideLive){
          widget.playerController.toolPanel.anchorSelectorFull.model.anchors.forEach((f){
            if(isEmpty(f.vid) ){
              if(!(f.m3u8 == widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.m3u8 ||f.flv == widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.flv ||f.rtmp == widget.playerController.toolPanel.anchorSelectorFull.model.currentAnchor.rtmp ) || type != widget.detailSet.selectViewType){
                anchorViews.add(createButton(type: type, icon: icon,name: name, liveVideoInfo: f));
              }
            }
          });
        }
      }
      else{
        if(widget.detailSet.selectViewType != type){
          anchorViews.add(createButton(type: type, icon: icon, name: name));
        }
      }

    });

    return Container(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: anchorViews,
      ),
    );
  }
}


//var baseLang = config.langMap['baseLang'];
List<Map> typeArr = [
  {'type': SelectViewTypeScore, 'icon': 'assets/images/detail/head/icon_detail_change_soccer.png', 'name': config.langMap['baseLang']['detail']['score']},
  {'type': SelectViewTypeAnimation, 'icon': 'assets/images/detail/head/icon_detail_change_animation.png','name':config.langMap['baseLang']['detail']['animation']},
  {'type': SelectViewTypeVideo, 'icon': 'assets/images/detail/head/icon_detail_change_video.png','name':config.langMap['baseLang']['detail']['video']},
];

String  selectViewLogo(String selectViewType){
  return (typeArr.where((e)=>e["type"]==selectViewType)).toList()[0]["icon"];
}


String  selectViewName(String selectViewType){
  return (typeArr.where((e)=>e["type"]==selectViewType)).toList()[0]["name"];
}