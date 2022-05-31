/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-12-19
 * 说明：头部工具栏
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/anchor_selector_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'anchor_selector_full.dart';
import 'anchor_selector_model.dart';


class AnchorSelectorRight extends StatefulWidget {
  final AnchorSelectorController controller;
  final Size size;

  AnchorSelectorRight({Key key, 
    @required this.controller, 
    @required this.size,
  }) : 
  assert(controller != null),
  super(key: key);

  @override
  _AnchorSelectorRightState createState() => _AnchorSelectorRightState();
}

class _AnchorSelectorRightState extends State<AnchorSelectorRight> with TickerProviderStateMixin {

  AnchorSelectorController get controller => widget.controller;
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
    if (widget.controller.toolPanel.bottomBar.model.screenDirection == ScreenDirection.TopDown) return Container();

    controller.animationController = _animationController;
    var width = 256.0;
    var height = widget.size.height;

    return AnimatedBuilder(
      animation: _animationController, 
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(width * (1-_animationController.value), 0),
          child: StreamBuilder<AnchorSelectorModel>(
            stream: controller.stream(),
            initialData: controller.model,
            builder: (context, as) {
              return InkWell(
                onTap: (){
                  controller.hide(false);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 56,right: 58, top: 16, bottom: 80),
                  color: Colors.black.withOpacity(0.9),
                  width: width,
                  height: height,
                  child: Column(
                    children: <Widget>[
                      TextHelper.buildContentTitle(config.langMap['baseLang']['detail']['livePlayer']['changeVideoSource'],textColor: Colors.white.value),
                      InterValHelper.h(10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: as.data.anchors.length,
                          itemBuilder: (ctx,idx){
                            return AnchorSelectorHelper.createItem(controller, as.data, as.data.anchors,idx);
                          },
                        ),
                      ),
                    ],
                  )
                )
              );
            }
          ),
        );
      },
    );
  }
}

