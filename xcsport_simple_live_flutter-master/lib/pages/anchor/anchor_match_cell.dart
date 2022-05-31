import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:flutter/material.dart';

import 'anchor_sub_cell/anchor_sub_cell_model.dart';

class AnchorMatchCell extends StatelessWidget{

  AnchorMatchCell({
    Key key,
    this.onAnchorMore,
    this.onLookLive,
    this.bgColor,
    this.isEntryDetail = true,
    this.titleStyle,
    this.isVlogEntry = false,
    this.isDetailChangeVideo = false,
    })
    : super(
      key: key,
    );
  final ValueChanged<AnchorSubCellModel> onAnchorMore;
  final ValueChanged<AnchorSubCellModel> onLookLive;
  final Color bgColor;
  final bool isEntryDetail;
  final TextStyle titleStyle;
  final bool isVlogEntry;
  final bool isDetailChangeVideo;
//  AnchorMatchCellStyle get style => super.style as AnchorMatchCellStyle;
//  AnchorMatchCellModel get model => super.model as AnchorMatchCellModel;
  
  @override
  Widget build(BuildContext context) {

    Widget leftItemWidget = Container();
    Widget rightItemWidget = Container();
//    if(this.model.leftModel != null &&
//    this.model.leftModel.gidm.length > 0){
//      leftItemWidget = AnchorItemView(subCellModel: this.model.leftModel,liveType: model.liveType,onAnchorMore: this.onAnchorMore,isVlogEntry: isVlogEntry,isDetailEntry: isDetailChangeVideo,);
//    }
//    if(this.model.rightModel != null &&
//    this.model.rightModel.gidm.length > 0){
//      rightItemWidget = AnchorItemView(subCellModel: this.model.rightModel,liveType: model.liveType,onAnchorMore: this.onAnchorMore,isVlogEntry: isVlogEntry,isDetailEntry: isDetailChangeVideo,);
//    }
    return Container(
      color: bgColor ?? config.skin.colors.bgColorGloabl,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: Container(
                    margin: EdgeInsets.only(right: 5),
                    child: leftItemWidget,
                  ),
                  onTap: (){
//                      if(isEntryDetail){
////                        AiRouter.pushToDetailPage(gidm: this.model.leftModel.gidm, anchorId: this.model.leftModel.anchorId);
//                        print('000-left-gidm=${this.model.leftModel.gidm}, anchorId=${this.model.leftModel.anchorId}');
//                        DetailParams detailParams = getDetailParams(this.model.leftModel);
////                        enterGameDetail(context, detailParams);
//                      }
//                      if(this?.onLookLive != null){
//                        this.onLookLive(this.model.leftModel);
//                      }
//                      if(this.isDetailChangeVideo){
//                        ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailChangeVideo);
//                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: Container(
                    margin: EdgeInsets.only(left: 5),
                    child: rightItemWidget,
                  ),
                  onTap: (){
//                      if(isEntryDetail){
//                        print('000-right-gidm=${this.model.rightModel.gidm}, anchorId=${this.model.rightModel.anchorId}');
//                        DetailParams detailParams = getDetailParams(this.model.rightModel);
////                        enterGameDetail(context, detailParams);
//                      }
//                      if(this?.onLookLive != null){
//                        this.onLookLive(this.model.rightModel);
//                      }
//                      if(this.isDetailChangeVideo){
//                        ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailChangeVideo);
//                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }

  TextStyle sectionTitleStyle(){
    return AiTextStyle(
      color: Colors.black,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontSize: config.skin.fontSize.h4,
      fontWeight: config.skin.fontWeight.regular,
    );
  }

  DetailParams getDetailParams(AnchorSubCellModel model) {
    String showtype = 'RB';
    String anchorId = model.anchorId;
    String anchorName = model.name;
    String anchorIcon = model.icon;
    String anchorCover = model.cover;
    String anchorUrl = model.url;
    String type = '1'; // 1表示主播，2表示视频
    if (isEmpty(model.anchorId)) {
      type = '2';
    }
    // String type = '2';
    // if (anchorId != null && anchorId.length > 0) {
    //   type = '1';
    // }
    return DetailParams(
      anchorId: anchorId,
      anchorName: anchorName,
      anchorIcon: anchorIcon,
      anchorCover: anchorCover,
      anchorUrl: anchorUrl,
      reverseVideoUrl: anchorUrl,
      isReserve: model.reserve ?? false ? '1' : '2',
      type: type,
      playPriority: PlayPriority.anchor,
      liveParams: {
        'flv' : model.flv,
        'm3u8' : model.m3u8,
        'rtmp' : model.rtmp,
        'url' : model.url,
      }
    );
  }
}
