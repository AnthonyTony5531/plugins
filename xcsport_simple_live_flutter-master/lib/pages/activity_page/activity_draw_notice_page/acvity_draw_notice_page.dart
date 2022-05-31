import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_notice_page/activity_draw_marquee/activity_draw_marquee_page.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_notice_page/activity_draw_marquee/activity_draw_marquee_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_notice_page/acvity_draw_notice_model.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_notice_page/acvity_draw_notice_style.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';

// 活动-翻牌-顶部title
class ActivityDrawNoticeStatefulView
    extends StatefulView<ActivityDrawNoticeStyle, ActivityDrawNoticeViewModel> {
  final ActivityDrawNoticeViewModel model;

  const ActivityDrawNoticeStatefulView({
    Key key,
    this.model,
  }) : super(key: key, model: model);

  @override
  _ActivityStatefulViewState createState() => _ActivityStatefulViewState();
}

class _ActivityStatefulViewState extends ViewState<ActivityDrawNoticeStyle,
    ActivityDrawNoticeViewModel, ActivityDrawNoticeStatefulView> {
  ActivityDrawNoticeViewModel _model;

  @override
  ActivityDrawNoticeViewModel get defaultModel =>
      _model ??= ActivityDrawNoticeViewModel();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ActivityDrawNoticeStatefulView oldWidget) {
    super.didUpdateWidget(oldWidget);

  }

  @override
  void onDataUpdatedAfter() {
    super.onDataUpdatedAfter();
  }

  @override
  Widget render(BuildContext context) {
    if (model.marqueeList.isEmpty) return SizedBox(height: 24.0,);
    return ClipPath(
      clipper: _ClipPath(),
      child: Container(
        width: MediaQuery.of(context).size.width - 50.0,
        height: 24.0,
        alignment: Alignment.center,
        color: Colors.white.withOpacity(0.1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10.0,
            ),
            AiImage.asset(style.noticeImg, width: 16.0, height: 14.0),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child:
              ActivityDrawMarqueeStatefulView(
                model:ActivityDrawMarqueeViewModel.create(
                  duration: 3,
                  stepOffset: 200.0,
                  paddingLeft: 10.0,
                  marqueeList: model.marqueeList
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _ClipPath extends CustomClipper<Path> {
  _ClipPath();

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(5, 0)
      ..lineTo(size.width - 5, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width - 5, size.height)
      ..lineTo(5, size.height)
      ..lineTo(0, size.height / 2)
      ..lineTo(5, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
