import 'package:common_component/widget/sc_refresh_view/sc_refresh_view.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
//import 'package:fast_ai/module/live188/package/flutter_live188_package.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';

class RefreshView extends StatelessWidget {
  final Widget child;

  final VoidCallback onRefresh;
  final ScRefreshViewController refreshViewController; //用来做自动下拉刷新，或者拦截下拉处理
  final Color animateColor;
  const RefreshView(
      {Key key,
      this.onRefresh,
      this.child,
      this.refreshViewController,
      this.animateColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScRefreshView(
      child: child,
      controller: refreshViewController,
      onRefresh: onRefresh,
      freshHeaderBuilder: (context, value, freshStatus) {
        String text = "下拉刷新";
        if (RefreshIndicatorMode.drag == freshStatus) {
          text = "下拉刷新";
        } else if (RefreshIndicatorMode.armed == freshStatus) {
          text = "松手即可刷新";
        } else if (RefreshIndicatorMode.refresh == freshStatus) {
          text = "加载中";
        } else if (RefreshIndicatorMode.done == freshStatus) {
          text = "已刷新";
        } else if (RefreshIndicatorMode.canceled == freshStatus) {
          text = "已取消";
        }
        return Container(
          padding: EdgeInsets.only(top: 25),
          height: 100,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Show(
                isShow: value > 0.1,
                child: SizedBox(
                  width: 40 * value,
                  height: 40 * value,
                  // child: CircularProgressIndicator(
                  //   strokeWidth: 1,
                  //   valueColor: new AlwaysStoppedAnimation(animateColor ?? ThemeColor188.colorA),
                  // )
                  // child: live188ImageCreator
                  //     .assetImage('assets188/images/loading/loading_white.gif'),
//                  child: live188ImageCreator
//                      .assetImage('assets188/images/loading/loading_grey.gif'),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Show(
                isShow: RefreshIndicatorMode.done != freshStatus,
                child: Text(
                  text,
                  style: cmPackageTextCreator.style(
                      color: Colors333, fontSize: 14 * value),
                ),
              ),
              SizedBox(
                height: 18 * value,
              ),
            ],
          ),
        );
      },
    );
  }
}
