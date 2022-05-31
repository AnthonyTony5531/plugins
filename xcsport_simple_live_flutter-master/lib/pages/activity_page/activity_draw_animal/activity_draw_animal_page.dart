import 'dart:typed_data';
import 'package:common_component/component/route/route.dart';
import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_animal/activity_draw_animal_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_animal/activity_draw_animal_style.dart';
import 'package:fast_ai/pages/activity_page/activity_view_draw_model.dart';
import 'package:fast_ai/widgets/imagecache/xc_cache_file_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

// 屏幕动画-红包
class ActivityDrawAnimalStatefulView
    extends StatefulView<ActivityDrawAnimalStyle, ActivityDrawAnimalViewModel> {
  final ActivityDrawAnimalViewModel model;

  const ActivityDrawAnimalStatefulView({
    Key key,
    this.model,
  }) : super(key: key, model: model);

  @override
  _ActivityDrawAnimalStatefulViewState createState() =>
      _ActivityDrawAnimalStatefulViewState();
}

class _ActivityDrawAnimalStatefulViewState extends ViewState<
    ActivityDrawAnimalStyle,
    ActivityDrawAnimalViewModel,
    ActivityDrawAnimalStatefulView>
    with SingleTickerProviderStateMixin {
  ActivityDrawAnimalViewModel _model;

  @override
  ActivityDrawAnimalViewModel get defaultModel =>
      _model ??= ActivityDrawAnimalViewModel();

  SVGAAnimationController animationController;

  XcCacheFileImage _cacheFileImage = XcCacheFileImage();

  bool isShow = false;

  @override
  void initState() {
    super.initState();
    this.animationController = SVGAAnimationController(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadAnimation(path: model.popupImg);
    });

  }

  void loadAnimation({String path}) async {
    if(isEmpty(path)) {
      return;
    }
    var videoItem;
    final Uint8List cacheBytes = await _cacheFileImage.getFileBytes(path);
    if(cacheBytes != null){
      videoItem = await SVGAParser.shared.decodeFromBuffer(cacheBytes.toList());
    } else {
      videoItem = await SVGAParser.shared.decodeFromURL(path);
    }

    this.animationController.videoItem = videoItem;
    this.animationController.reset();
    this.animationController
        .forward()
        .whenComplete(() async {
     await _configPop();
    });
  }

  Future _configPop() async {
    if (isShow == false) {
      isShow = true;
      await _configShowDialog();
    }
  }

  Future _configShowDialog() async {

    ActivityDrawViewModel drawViewModel = ActivityDrawViewModel.create(
      prizePoolList: model.prizePoolList,
      activityImg: model.activityImg,
      awardType: model.awardType,
      id: model.id,
      imageList: model.imageList,
      lotteryId: model.lotteryId,
      cardImg: model.cardImg,
    );
    ccRoute.push(routeName: FastAiRouteTableName.ActivityDrawView,routeParams: drawViewModel,pushType: PushType.Dialog,onBack: _configMaybePop);
  }

  void _configMaybePop(value) async {
    if (ccRoute.canPop()) {
      ccRoute.pop();
    }
  }

  @override
  void didUpdateWidget(covariant ActivityDrawAnimalStatefulView oldWidget) {
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
    Size mediaSize = MediaQuery
        .of(context)
        .size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            await _configPop();
          },
          child: Container(
            width: mediaSize.width,
            height: mediaSize.height,
            child: SVGAImage(
              this.animationController,
            ),
          ),
        ),
      ),
    );
  }
}
