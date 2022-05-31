import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/free_anchor/free_anchor_model/wish_gift_model.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_page.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/widgets/news_report/news_report.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

import 'free_anchor_rank_view_style.dart';
import 'free_anchor_rank_view_model.dart';

///
/// {notes}
///
class FreeAnchorRankView extends StatefulView<FreeAnchorRankViewStyle, FreeAnchorRankViewModel> {
  final String anchorId;
  final String liveId;
  final num wishGiftSwitch; // 心愿礼物开关(0=关闭 1=开启)
  final bool isFreeLiveGameAnchor;
  final bool isFreeAnchor; //自由播主播
  final VoidCallback onMoreVideo;

  FreeAnchorRankView({
    Key key,
    this.anchorId,
    this.liveId,
    this.wishGiftSwitch,
    this.isFreeLiveGameAnchor,
    this.isFreeAnchor = false,
    this.onMoreVideo,
  }) : super(model: null, key: key);

  @override
  _FreeAnchorRankViewState createState() => _FreeAnchorRankViewState();
}

class _FreeAnchorRankViewState extends ViewState<FreeAnchorRankViewStyle, FreeAnchorRankViewModel, FreeAnchorRankView> {
  FreeAnchorRankViewModel _viewModel;
  String moreLiveText;

  Map get _langMap => config.langMap['baseLang'] ?? {};

  @override
  FreeAnchorRankViewModel get defaultModel {
    _viewModel ??= FreeAnchorRankViewModel();
    return _viewModel;
  }

  @override
  void initState() {
    moreLiveText = AiJson(config.langMap['baseLang']).getString('detail.moreLive');
    super.initState();
    model.initModel(widget.anchorId, widget.liveId, widget.wishGiftSwitch, widget.isFreeLiveGameAnchor);
  }

  @override
  void didUpdateWidget(covariant FreeAnchorRankView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.anchorId != oldWidget.anchorId ||
        widget.liveId != oldWidget.liveId ||
        widget.wishGiftSwitch != oldWidget.wishGiftSwitch ||
        widget.isFreeLiveGameAnchor != oldWidget.isFreeLiveGameAnchor) {
      model.initModel(widget.anchorId, widget.liveId, widget.wishGiftSwitch, widget.isFreeLiveGameAnchor);
    }
  }

  @override
  Widget render(BuildContext context) {
    bool isVertical = MediaQuery.of(context).orientation == Orientation.portrait;
    Widget anchorChild = const SizedBox.shrink();
    if (isVertical) {
      anchorChild = Container(
        child: Row(
          children: [anchorRank(), anchorGift()],
        ),
      );
    }
    return MediaQuery.removeViewPadding(
        removeTop: true,
        context: context,
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              anchorChild,
              Expanded(child: Container()),
              moreLive(),
            ],
          ),
        ));
  }

  Widget anchorRank() {
    String rankStr = widget.isFreeLiveGameAnchor ? '魅力榜' : '贡献榜';
    String anchorContributionRankText = widget.isFreeLiveGameAnchor ? '魅力榜第' : '贡献榜第';
    if (model.anchorRank > 0 && model.anchorRank <= 10) {
      rankStr = '$anchorContributionRankText${model.anchorRank}';
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showModalBottomSheetRoute(
          context,
          barrierColor: Colors.transparent,
          height: MediaQuery.of(context).size.height * 0.7,
          child: AnchorRankPage(
            index: widget.isFreeLiveGameAnchor ? 1 : 0,
            isFreeAnchorDetail: true,
          ),
        );
      },
      child: Container(
        height: 20.0,
        margin: EdgeInsets.only(left: 12.0, bottom: 8.0),
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AiImage.svgLogo('assets/images/detail/chatroom/icon_details_live_rank.svg', size: 16),
            Text(
              ' $rankStr',
              style: style.rankStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget anchorGift() {
    if (model.wishGifts.length == 0 || widget.wishGiftSwitch == 0 || widget.wishGiftSwitch == null) return const SizedBox();

    List<Widget> widgetList = [];

    model.wishGifts.forEach((value) {
      widgetList.add(Container(
        height: 20.0,
        width: value.giftWidth + 16.0 + 5.0 * 2,
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
//            AiImage.svgLogo('assets/images/detail/chatroom/icon_details_live_rank.svg', size: 16),
              AiImage.fromUrl(value.giftImage, 'assets/images/detail/chatroom/icon_details_live_rank.svg', BoxFit.cover, 16.0, 16.0),
            Text(
              '${value.giftName}(${value.implementationNumber}/${value.number})',
              style: style.rankStyle,
            ),
          ],
        ),
      ));
    });
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Event.eventBus.fire(ShowGiftEvent(isDelay: false));
      },
      child: Container(
        height: 20.0,
        width: 150.0,
        margin: EdgeInsets.only(left: 6.0, bottom: 8.0),
        child: NewsReportCarousel(
          itemHeight: 20.0,
          widgetList: widgetList,
          showCount: 1,
          carouselTime: 10,
          isAutoScoll: widgetList.length > 1,
          isAdjustWidth: true,
        ),
      ),
    );
  }

  Widget moreLive() {
    Orientation orientation = MediaQuery.of(context).orientation;
    if(widget.isFreeAnchor && orientation == Orientation.landscape){
      return SizedBox.shrink();
    }
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          widget.onMoreVideo?.call();
        },
        child: Container(
          height: 20.0,
          margin: EdgeInsets.only(bottom: 8.0),
          padding: EdgeInsets.only(left: 5.0, right: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
            color: Colors.white.withOpacity(0.05),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AiImage.svgLogo('assets/images/detail/chatroom/icon_details_live_more.svg', size: 16),
              Text(
                ' $moreLiveText',
                style: style.rankStyle,
              ),
              sw(2.0),
              Icon(
                Icons.arrow_forward_ios,
                size: 10.0,
                color: Colors.white,
              )
            ],
          ),
        ));
  }
}
