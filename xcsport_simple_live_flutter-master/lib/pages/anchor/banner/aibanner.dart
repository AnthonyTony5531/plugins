import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/anchor/HitClearWidget.dart';
import 'package:fast_ai/pages/anchor/banner/aibanner_single/aibanner_single.dart';
import 'package:fast_ai/utils/ai_refrash_controller.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/bottom_oval_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutterswiper/flutter_swiper.dart';

import 'aibanner_model.dart';
import 'aibanner_single/aibanner_single_model.dart';
import 'aibanner_style.dart';

enum ContentLayout{
  row,
  column,tertret
}

class AiBanner extends StatefulWidget {
  final AiBannerStyle style;
  final AiBannerModel model;
  final AiRefrashController controller;
  final ValueChanged<AiBannerSingleModel> onBannerIndexChanged;
  final double bannerHeight;
  final double bannerWidth;
  final bool isHiddenBg;
  final bool isDetailActiveBanner;
  final bool isAutoplay;
  final bool isHomeBanner;
  final Color bgColor;
  final VoidCallback onClickBanner;
  final ValueChanged<AiBannerSingleModel> onClickCallback;
  final ValueChanged<int> onCurrentSelectIndex;
  final bool isOnlyFixUp;
  final VoidCallback goBack;

  AiBanner({
    Key key,
    this.style,
    this.model,
    this.controller,
    this.onBannerIndexChanged,
    this.bannerHeight = 106.0,
    this.bannerWidth,
    this.isHiddenBg = false,
    this.onClickBanner,
    this.isDetailActiveBanner = false,
    this.onClickCallback,
    this.onCurrentSelectIndex,
    this.isAutoplay = true,
    this.isHomeBanner = false,
    this.bgColor,
    this.isOnlyFixUp = false,
    this.goBack,
  }) : super(key: key);

  @override
  AiBannerState createState() => AiBannerState();
}

class AiBannerState extends State<AiBanner> {
  final defaultStyle = AiBannerStyle();
  final defaultModel = AiBannerModel();

  AiBannerStyle get style {
    return widget?.style ?? defaultStyle;
  }

  AiBannerModel get model {
    return widget?.model ?? defaultModel;
  }

  SwiperController swiperController = SwiperController();
  List<AiBannerSingleModel> enableBanners = [];
  int buildCount = 0;
  SwiperController _willDispose;
  bool loop = false;
  bool isDetailShowBanner = true;

  ContentLayout contentLayout = ContentLayout.row;

  @override
  void initState() {
    startTimer();
    WidgetsBinding.instance.addPostFrameCallback((Duration d) {
      WidgetsBinding.instance.addPersistentFrameCallback(frameCallback);
    });
    super.initState();
  }

  @override
  void dispose() {
    loop = false;
    swiperController.dispose();
    super.dispose();
    // print('6666666666---_AiBannerState----dispose');
  }

  void frameCallback(Duration d) {
    if (_willDispose != null) {
      _willDispose.dispose();
      _willDispose = null;
    }
  }

  Future startTimer() async {
    if (loop) return;
    loop = true;
    await sleep(10);
    while (loop) {
      await sleep((widget?.isDetailActiveBanner ?? false) ? 3000 : 5000);
      if (!loop) break;
      //取当前页数据
      if (widget.isAutoplay) {
        playNext();
      }
    }
    loop = false;
  }

  playNext() async {
    try {
      if (mounted) {
        swiperController.next();
      }
    } catch (e) {
      logError(e);
    }
  }

  Future fireOnIndexChanged(AiBannerSingleModel bannerModel) async {
    if (widget.onBannerIndexChanged != null) {
      try{
        widget.onBannerIndexChanged(bannerModel);
      }catch(e){
      }
    }
  }

  void updateBannerStatus(bool isShow) {
    isDetailShowBanner = isShow;
  }

  void updateEnableBanners() {
    enableBanners = model.enableBanners;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
//    enableBanners = model.enableBanners;
    if (enableBanners.length <= 0) {
      enableBanners = model.enableBanners;
    }
    if (enableBanners.length == 0) {
      fireOnIndexChanged(null);
      return Container();
    }

    var curIndex = model.currentIndex < enableBanners.length ? model.currentIndex : 0;
    fireOnIndexChanged(enableBanners[curIndex]);
    if (swiperController != null) {
      _willDispose = swiperController;
    }
    swiperController = SwiperController();

    final isFixUp = (widget.isOnlyFixUp ?? false) && enableBanners.length == 1;

    var body = Container(
        width: widget.bannerWidth ?? MediaQuery.of(context).size.width,
        height: widget?.bannerHeight ?? 160,
        margin: widget.isDetailActiveBanner
            ? EdgeInsets.zero
            : EdgeInsets.only(left: config.skin.list.cellMarginSize, right: config.skin.list.cellMarginSize),
        child: ClipRRect(
          borderRadius: widget.isDetailActiveBanner ? BorderRadius.circular(8.0) : BorderRadius.circular(10),
          child: isFixUp
              ? createAiBannerSingle(
                  model: enableBanners.first,
                  contentLayout: contentLayout,
                  isHomeBanner: widget?.isHomeBanner,
                )
              : Swiper(
                  key: Key("banner_${++buildCount}"),
                  // key: Key("banner1"),
                  onIndexChanged: (idx) {
                    try {
                      model.currentIndex = idx;
                      fireOnIndexChanged(enableBanners[idx]);
                      if (widget?.onCurrentSelectIndex != null) {
                        widget?.onCurrentSelectIndex(idx);
                      }
                    } catch (e) {
                      logError(e);
                    }
                  },
                  controller: swiperController,
                  index: curIndex,
                  autoplay: false,
                  autoplayDelay: 5000,
                  containerWidth: MediaQuery.of(context).size.width,
                  itemWidth: MediaQuery.of(context).size.width,
                  itemBuilder: (BuildContext context, int index) {
                    return createAiBannerSingle(
                        key: Key("banner_$index"),
                        model: enableBanners[index],
                        contentLayout: contentLayout,
                        isHomeBanner: widget?.isHomeBanner);
                  },
                  itemCount: enableBanners.length,
                  pagination: widget.isDetailActiveBanner ? null : (contentLayout == ContentLayout.row ? PaginationWidget.buildPagination() : null),
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(), //禁用滑动事件
                ),
        ));
    return HitClearWidget(
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: ClipPath(
                clipper: BottomOvalClipper(),
                child: Offstage(
                  offstage: widget?.isHiddenBg ?? false,
                  child: Container(
                    color: widget?.bgColor ?? config.skin.list.cellBackgroundColor,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                  ),
                )),
          ),
          body,
        ],
      ),
      onRedraw: () async {
        setState(() {});
      },
    );
  }

  AiBannerSingle createAiBannerSingle(
      {Key key, AiBannerSingleModel model, ContentLayout contentLayout, bool isHomeBanner = false}) {
    return AiBannerSingle(
      key: key,
      model: model,
      onClickBanner: widget?.onClickBanner,
      onClickCallback: widget?.onClickCallback,
      isDetailShowBanner: isDetailShowBanner,
      isDetailActiveBanner: widget?.isDetailActiveBanner,
      isHomeBanner: isHomeBanner,
      goBack: widget.goBack,
    );
  }
}

class PaginationWidget extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final double dv;

  const PaginationWidget({Key key, this.color = Colors.black, this.width = 5, this.height = 3, this.dv = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ClipPath(
        clipper: _PaginationClipper(dv: dv),
        child: Container(
          color: color,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }

  static SwiperPagination buildPagination(
      {Alignment alignment, Color defaultActiveColor, Color defaultColor, double selectWidth, double deselectWidth}) {
    return new SwiperPagination(
        alignment: alignment ?? Alignment(1, 1),
        builder: SwiperCustomPagination(builder: (BuildContext context, SwiperPluginConfig cf) {
          int itemCount = cf.itemCount;
          int activeIndex = cf.activeIndex;
          var activeColor = defaultActiveColor ?? Color(0xFFFFFFFF);
          var color = defaultColor ?? Color(0x88FFFFFF);

          List<Widget> list = [];
          for (int i = 0; i < itemCount; ++i) {
            bool active = i == activeIndex;
            list.add(Container(
              key: Key("pagination_$i"),
              margin: EdgeInsets.all(1),
              child: active
                  ? PaginationWidget(
                      color: activeColor,
                      width: selectWidth ?? 9,
                    )
                  : PaginationWidget(
                      color: color,
                      width: deselectWidth ?? 0,
                    ),
            ));
          }
          return new Row(
            mainAxisSize: MainAxisSize.min,
            children: list,
          );
        }));
  }
}

class _PaginationClipper extends CustomClipper<Path> {
  final double dv;

  _PaginationClipper({this.dv = 2});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(dv, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - dv, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(_PaginationClipper oldClipper) {
    return true;
  }
}
