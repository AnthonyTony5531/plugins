import 'package:fast_ai/config/config.dart';
/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-12-19
 * 说明：头部工具栏
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/anchor_selector_controller.dart';
//import 'package:fast_ai/pages/hot/banner/aibanner.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterswiper/flutter_swiper.dart';

import 'anchor_selector_model.dart';


class AnchorSelectorFull extends StatefulWidget {
  final AnchorSelectorController controller;
  final Size size;

  AnchorSelectorFull({Key key, 
    @required this.controller, 
    @required this.size, 
  }) : 
  assert(controller != null),
  super(key: key);

  @override
  _AnchorSelectorFullState createState() => _AnchorSelectorFullState();
}

class _AnchorSelectorFullState extends State<AnchorSelectorFull> with TickerProviderStateMixin {

  AnchorSelectorController get controller{ return widget.controller; }

  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration : Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _animationController?.dispose();
    controller.animationController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.animationController = _animationController;
    var width = widget.size.width;
    var height = widget.size.height;

    return AnimatedBuilder(
      animation: _animationController, 
      builder: (BuildContext context, Widget child) {
        // print('width:$width  height:$height');
        return Transform.translate(
          offset: Offset(0, (height) * (1-_animationController.value)),
          child: StreamBuilder<AnchorSelectorModel>(
            stream: widget.controller.stream(),
            initialData: widget.controller.model,
            builder: (context, as) {
              if((as.data?.anchors?.length ?? 0) == 0) return IgnorePointer(child: Container(),);

              return InkWell(
                onTap: (){
                  controller.hide(false); // 和其他controller的show/hide相反
                },
                child: Container(
                  color: Color(0xB0000000),
                  width: width,
                  height: height,
                  child: Swiper(
                    index: controller.currentIndex,
                    onIndexChanged: (idx){
                      controller.currentIndex = idx;
                    },
                    loop: false,
                    containerWidth: width,
                    itemWidth: width,
                    itemBuilder: (BuildContext context, int index){
                      return createPage(as.data,index);
                    },
                    itemCount: as.data.pageCount,
//                    pagination: PaginationWidget.buildPagination(alignment: Alignment(0, 1)),
                    scrollDirection: Axis.horizontal,
                    physics:AlwaysScrollableScrollPhysics(),//禁用滑动事件
                  ),
                )
              );
            },
          ),
        );
      },
    );
  }

  Widget createPage(AnchorSelectorModel model, int page){
      var anchors = model.getAnchors(page);
      return Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment(0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(flex: 1,child: AnchorSelectorHelper.createItem(controller, model, anchors,0),),
              Expanded(flex: 1,child: AnchorSelectorHelper.createItem(controller, model, anchors,1),),
              Expanded(flex: 1,child: AnchorSelectorHelper.createItem(controller,model, anchors,2),),
            ],),
            Row(children: <Widget>[
              Expanded(flex: 1,child: AnchorSelectorHelper.createItem(controller,model, anchors,3),),
              Expanded(flex: 1,child: AnchorSelectorHelper.createItem(controller,model, anchors,4),),
              Expanded(flex: 1,child: AnchorSelectorHelper.createItem(controller,model, anchors,5),),
            ],)
          ],
        ),
      );
  }
}

class AnchorSelectorHelper {
  static Widget createItem(AnchorSelectorController controller, AnchorSelectorModel model, List<LiveVideoInfo> anchors, int index){
    LiveVideoInfo anchorInfo = index < anchors.length ? anchors[index] : null;
    if(anchorInfo == null)
      return Container(height: 40,);

    var borderColor = Colors.transparent;
    var bgColor = Colors.transparent;
    var fontColor = Colors.white;
    if(anchorInfo?.equal(model.currentAnchor)??false){
      borderColor = config.customStyle.themeColor;
      bgColor = Color(0x80000000);
      fontColor = Color(0xFFFFCC28);
    }
    var body = Container(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: bgColor,
          border: Border.all(color: borderColor)
        ),
        padding: EdgeInsets.all(3),
        child: TitleText(
          spanSize: 0,
          textExpanded: true,
          title: isNullOrEmpty(anchorInfo.headImg) ? 
           ClipOval(child:Container(width: 24,height: 24,child: AiImage.asset("assets/images/liveplayer/icon_live_video_play.png"),))
           : AiImage.userLogo(anchorInfo.headImg,size: 24),
          text: Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              anchorInfo.nickName, 
              overflow: TextOverflow.ellipsis,
              style: AiTextStyle(
                color: fontColor
              ),
            ),
          ),
        ),
      ),
    );

    return InkWell(
      onTap: (){
        model.currentAnchor = anchorInfo;
        controller.anchorVideoChanged.fire();
        controller.hide(false);
        Event.eventBus.fire(AnchorChooseEvent(anchorInfo));
        Event.eventBus.fire(ChatRoomChooseEvent(anchorInfo.vid));
      },
      child: body,
    );
  }

}
