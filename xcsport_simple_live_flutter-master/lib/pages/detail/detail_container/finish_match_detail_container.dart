import 'dart:async';

import 'package:fast_ai/event/event.dart';
//import 'package:fast_ai/pages/finish/detail/finish_detail_page.dart';
import 'package:fast_ai/widgets/loading_widget/ai_page_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishMatchDetailContainer extends StatefulWidget {
  final String gidm;
  final bool isListDetail;
  final bool isLoading;
  final VoidCallback onEndRefresh;

  FinishMatchDetailContainer({Key key, this.gidm = '', this.isLoading = false, this.isListDetail = false, this.onEndRefresh}) : super(key: key);

  @override
  _FinishMatchDetailContainerState createState() => _FinishMatchDetailContainerState();
}

class _FinishMatchDetailContainerState extends State<FinishMatchDetailContainer> {
  StreamSubscription<RefinedDetailEvent> refinedDetailEvent;
  bool isListDetail = false;
  bool isHiddenTip = false;
  StateSetter stateSetterTip;

  @override
  void initState() {
    isListDetail = widget.isListDetail;
    bindEvent();
    super.initState();
  }

  @override
  void dispose() {
    unbindEvent();
    super.dispose();
  }

  void bindEvent() {
    refinedDetailEvent = Event.eventBus.on<RefinedDetailEvent>().listen(showRefinedDetail);
  }

  void unbindEvent() {
    refinedDetailEvent?.cancel();
  }

  void showRefinedDetail(event) {
    RefinedDetailEvent detailEvent = event;
    isListDetail = !detailEvent.isShowRefinedDetail;
    if (mounted) setState(() {});
//    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//      swiperController?.move(1);
//    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = widget.isLoading ?? false;
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Opacity(
            opacity: isLoading ? 0.0 : 1.0,
//            child: FinishDetailPage(
//              gidm: widget.gidm ?? '',
//              isListDetail: isListDetail,
//              onFinishGameEmpty: (bool isEmptyData) {
//                isHiddenTip = isEmptyData;
//                if (stateSetterTip != null) {
//                  stateSetterTip(() {});
//                }
//              },
//              onEndRefresh: widget.onEndRefresh,
//            ),
          ),
//          Positioned(
//            left: 0,
//            top: 0,
//            right: 0,
//            bottom: 0,
//            child: StatefulBuilder(
//              builder: (BuildContext ctx, StateSetter stateSetter) {
//                stateSetterTip = stateSetter;
//                return Offstage(
//                  offstage: !isListDetail || isHiddenTip,
//                  child: GestureDetector(
//                    behavior: HitTestBehavior.opaque,
//                    child: Container(
//                      color: Colors.transparent,
//                      child: DetailCover(
//                        showType: RefinedMatch?.refinedMatchModel?.showType ?? '',
//                        isFinishGame: RefinedMatch?.refinedMatchModel?.isFinish ?? '',
//                      ),
//                    ),
//                    onTap: () {
//                      config.userInfo.isShowRefinedFinishGameDetail = true;
//                      config.userInfo.isShowRefinedDetail = true;
//                      if (mounted) setState(() {});
//                      Event.eventBus.fire(RefinedDetailEvent(isShowRefinedDetail: true));
//                      if(config.isTabSDK){
//                        XcSdkApi.hideBottomBar();
//                      }
//                    },
//                  ),
//                );
//              },
//            ),
//          ),
          if (isLoading)
            Positioned.fill(
              child: AiPageLoading(isHiddenClose: isListDetail, isListDetail: isListDetail),
            ),
        ],
      ),
    );
  }
}
