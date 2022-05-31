import 'dart:typed_data';

import 'package:common_component/component/route/route.dart';
import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_label_page/activity_draw_label_page.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_lottery_result/activity_draw_lottery_result_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_notice_page/acvity_draw_notice_page.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_style.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_turnover_page/activity_draw_turn_over_page.dart';
import 'package:fast_ai/pages/activity_page/activity_view_draw_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/imagecache/xc_cache_file_image.dart';
import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

/// 活动-翻牌
class ActivityDrawStatefulView
    extends StatefulView<ActivityDrawStyle, ActivityDrawViewModel> {
  final ActivityDrawViewModel model;

  const ActivityDrawStatefulView({
    Key key,
    this.model,
  }) : super(key: key, model: model);

  @override
  _ActivityStatefulViewState createState() => _ActivityStatefulViewState();
}

class _ActivityStatefulViewState extends ViewState<
    ActivityDrawStyle,
    ActivityDrawViewModel,
    ActivityDrawStatefulView> with SingleTickerProviderStateMixin {
  ActivityDrawViewModel _model;

  @override
  ActivityDrawViewModel get defaultModel => _model ??= ActivityDrawViewModel();

  SVGAAnimationController animationController;

  XcCacheFileImage _cacheFileImage = XcCacheFileImage();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      if (model.activityImg.contains('.svga')) {
        this.animationController = SVGAAnimationController(vsync: this);
        loadAnimation(path: model.activityImg);
      }
    });
  }

  void loadAnimation({String path}) async {
    if (path == null && path == "") {
      return;
    }
    var videoItem;
    final Uint8List cacheBytes = await _cacheFileImage.getFileBytes(path);
    if (cacheBytes != null) {
      videoItem = await SVGAParser.shared.decodeFromBuffer(cacheBytes.toList());
    } else {
      videoItem = await SVGAParser.shared.decodeFromURL(path);
    }

    this.animationController.videoItem = videoItem;
    this.animationController.repeat();
  }

  @override
  void didUpdateWidget(covariant ActivityDrawStatefulView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    animationController?.stop();
    animationController?.dispose();
    animationController = null;
    super.dispose();
  }

  @override
  Widget render(BuildContext context) {
    double width = AiMeasure.screenWidth(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            GestureDetector(
              onTap: (){
                /// ...
              },
              child: Container(
                height: 700.0,
                width: width,
                child: model.activityImg.contains('.svga')
                    ? SVGAImage(
                  this.animationController,
                  fit: BoxFit.fill,
                )
                    : AiImage.fromUrl(
                    model.activityImg, '', BoxFit.fill),
              ),
            ),
            _configColumnWidget(),
            Positioned(
                top: 20.0 + MediaQuery.of(context).padding.top,
                right: 20.0,
                child: _configCloseWidget()),
          ],
        ),
      ),
    );
  }

  Widget _configCloseWidget(){
    return Material(color: Colors.transparent,child: InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: (){
        if (ccRoute.canPop()) {
          ccRoute.pop();
        }
      },
      child: Container(
        width: 32.0,
        height: 32.0,
        color: Colors.transparent,
        child: AiSvgPicture.asset(style.cancelImg, fit: BoxFit.cover),
      ),
    ),);
  }


  Widget _configColumnWidget() {
    return GestureDetector(
      onTap: (){
        // ...
      },
      child: Container(
        margin: EdgeInsets.only(top: 290.0, left: 19.0, right: 19.0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 获奖奖池种类
            model.activityDrawLabelViewModel == null
                ? SizedBox()
                : ActivityLabelStatefulView(
              model: model.activityDrawLabelViewModel,
            ),
            SizedBox(
              height: 5.0,
            ),
            // 公告
            model.activityDrawNoticeViewModel == null
                ? SizedBox()
                : ActivityDrawNoticeStatefulView(
              model: model.activityDrawNoticeViewModel,
            ),
            SizedBox(
              height: 5.0,
            ),
            // 翻牌区域
            model.activityDrawTurnOverViewModel == null
                ? SizedBox()
                : ActivityDrawTurnOverStatefulView(
              model: model.activityDrawTurnOverViewModel,
              backClick: (success) async {
                await _showLotteryResultWidget(success);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future _showLotteryResultWidget(bool success) async {
    await sleep(900);
    ActivityDrawResultViewModel resultViewModel = ActivityDrawResultViewModel(
      title: model.title,
      describe: model.describe,
      money: model.money,
      state: success ? 1 : 2,
    );
    ccRoute.push(routeName: FastAiRouteTableName.ActivityDrawResult,routeParams: resultViewModel,pushType: PushType.Dialog,onBack: _configMaybePop);
  }

  void _configMaybePop(value) async {
    if (ccRoute.canPop()) {
      ccRoute.pop();
    }
  }
}
