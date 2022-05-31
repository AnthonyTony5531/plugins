import 'package:fast_ai/widgets/xc_slide.dart';
import 'package:flutter/material.dart';

class _OffsetSaveData {
  double dx = 0.0;
  double dy = 0.0;
  bool isHorizontal;
  bool isEnd = false;
}

// #19876 聊天室右侧可滑出赛事列表
class ChatRoomSliderMatchWidget extends StatelessWidget {
  final Widget body;
  final bool isListDetail;
  final HorizontalDragCallBack horizontalDragCallBack;

  ChatRoomSliderMatchWidget({this.body, isListDetail, this.horizontalDragCallBack}) : isListDetail = isListDetail ?? false;

  final _OffsetSaveData startOffset = _OffsetSaveData();

  @override
  Widget build(BuildContext context) {
    double validArea = MediaQuery.of(context).size.width * 0.8;

    Widget w = body;

    if (!isListDetail) {
      w = Listener(
        behavior: HitTestBehavior.opaque,
        onPointerDown: (event) {
          startOffset.dx = event.localPosition.dx;
          startOffset.dy = event.localPosition.dy;
          if (startOffset.dx >= validArea) {
            startOffset.isHorizontal = null;
            horizontalDragCallBack?.call(HorizontalDragType.start, event);
          }
          return true;
        },
        onPointerMove: (event) {
          if (startOffset.dx >= validArea) {
            final moveX = startOffset.dx - event.localPosition.dx;
            final moveY = startOffset.dy - event.localPosition.dy;

            if (startOffset.isHorizontal == null) {
              startOffset.isHorizontal = moveX.abs() > moveY.abs();
            }

            if (startOffset.isHorizontal) {

              horizontalDragCallBack?.call(HorizontalDragType.update, event);
            }
          }
          return true;
        },
        onPointerUp: (event) {
          horizontalDragCallBack?.call(HorizontalDragType.end, event);
        },
        onPointerCancel: (event) {
          if (startOffset.dx >= validArea && startOffset.isHorizontal ?? false) {
            horizontalDragCallBack?.call(HorizontalDragType.cancel, null);
          }
        },
        child: body,
      );
    }

    return w;
//    return NotificationListener<ScrollUpdateNotification>(
//      onNotification: (notification){
//        print("NotificationListener ===========================> ${notification.metrics.pixels}");
//        return false;
//      },
//      child: w,
//    );
  }
}
