import 'package:fast_ai/performance/manager/performance_manager.dart';
import 'package:fast_ai/performance/widget/resident_page.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function : 性能工具 - 悬浮入口

class PerformanceBtnView extends StatefulWidget {
  static GlobalKey<_PerformanceBtnState> performanceBtnKey = GlobalKey<_PerformanceBtnState>();

  PerformanceBtnView() : super(key: performanceBtnKey);

  @override
  _PerformanceBtnState createState() {
    return _PerformanceBtnState();
  }
}

class _PerformanceBtnState extends State<PerformanceBtnView> {
  _PerformanceBtnState();

  Offset offsetA;
  OverlayEntry debugPage;
  bool showDebugPage = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offsetA?.dx,
      top: offsetA?.dy,
      right: offsetA == null ? 20 : null,
      bottom: offsetA == null ? 120 : null,
      child: Draggable<dynamic>(
        child: _buildBtn(),
        feedback: _buildBtn(),
        childWhenDragging: Container(),
        onDragEnd: (detail) {
          final Offset offset = detail.offset;
          setState(() {
            final Size size = MediaQuery.of(context).size;
            final double width = size.width;
            final double height = size.height;
            double x = offset.dx;
            double y = offset.dy;
            if (x < 0) x = 0;
            if (x > width - 80) x = width - 80.0;
            if (y < 0) y = 0;
            if (y > height - 26) y = height - 26.0;
            offsetA = Offset(x, y);
          });
        },
        onDraggableCanceled: (velocity, offset) {},
      ),
    );
  }

  Widget _buildBtn() {
    return GestureDetector(
      onTap: () => openDebugPage(),
      child: ClipOval(
        child: SizedBox(
          width: 50.0,
          height: 50.0,
//          child: Image.asset('assets/images/kit/suspend_btn.png', fit: BoxFit.cover),
          child: AiImage.asset(
            'assets/images/kit/suspend_btn.png',
            width: 50.0,
            height: 50.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void openDebugPage() {
    debugPage ??= OverlayEntry(builder: (cxt) => ResidentPage());
    if (showDebugPage) {
      closeDebugPage();
    } else {
      showDebugPage = true;
      PerformanceManager.instance.overlayState.insert(debugPage, below: PerformanceManager.instance.owner);
    }
  }

  void closeDebugPage() {
    if (debugPage != null && showDebugPage) {
      showDebugPage = false;
      debugPage.remove();
      debugPage = null;
    }
  }
}
