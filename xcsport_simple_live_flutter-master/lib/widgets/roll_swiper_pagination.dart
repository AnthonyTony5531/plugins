/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-21
 * 说明：比赛单元格显示
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 *  1.0.1.0       south           添加扩展面板   11-5
 **********************************************************/

import 'dart:math';

import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/pages/hot/banner/aibanner.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterswiper/flutter_swiper.dart';

class RollSwiperPagination extends StatefulWidget {
  final SwiperPluginConfig config;
  RollSwiperPagination({Key key, this.config}) : super(key: key);

  @override
  _RollSwiperPaginationState createState() => _RollSwiperPaginationState();
}

class _RollSwiperPaginationState extends State<RollSwiperPagination>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    widget.config.pageController.addListener(pagelistener);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    widget.config.pageController.removeListener(pagelistener);
    super.dispose();
  }

  pagelistener() {
    // print(widget.config.pageController.page);
    _animationController.value =
        widget.config.pageController.page / widget.config.itemCount;
  }

  double isize = 10;
  Widget get indicatorIcon {
    return config.customStyle
        .loadCustomImg('match_indicator_icon', width: isize, height: isize);
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = widget.config.itemCount == 0 ? 1 : widget.config.itemCount;
//    var color = config.skin.colors.deviderColor;
    var color = Colors.black.withOpacity(0.2);
    double size = 10;
    double span = 5;

    return Container(
        width: (size + span) * itemCount,
        height: isize,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget child) {
            return CustomMultiChildLayout(
                delegate:
                    RollSwiperLayout(itemCount, _animationController.value),
                children: List.generate(itemCount, (idx) {
                  return LayoutId(
                      id: idx,
                      child: Container(
                        margin: EdgeInsets.only(top: 2.0, left: 2.0),
                        width: size - 4.0,
                        height: size - 4.0,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10)),
                      ));
                })
                  ..add(LayoutId(
                      id: 'roll',
                      child: Transform.rotate(
                        angle: pi * _animationController.value * itemCount,
                        child: indicatorIcon,
                      ))));
          },
        ));
  }
}

class RollSwiperPaginationBuilder extends SwiperPlugin {
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return RollSwiperPagination(
      config: config,
    );
  }
}

class RollSwiperLayout extends MultiChildLayoutDelegate {
  final int count;
  final double offset;
  RollSwiperLayout(this.count, this.offset);

  @override
  void performLayout(Size size) {
    var width = size.width / count;
    for (var i = 0; i < count; i++) {
      layoutChild(i, BoxConstraints.loose(size));
      positionChild(i, Offset(i * width, 0.5));
    }

    var ox = offset * size.width;
    var maxRight = (count - 1) * width;
    if (ox <= maxRight) {
      layoutChild('roll', BoxConstraints.loose(size));
      positionChild('roll', Offset(offset * size.width, 0));
    } else {
      if (count >= 1) {
        var o = maxRight * (1 - offset) / (1 / (count));
        layoutChild('roll', BoxConstraints.loose(size));
        positionChild('roll', Offset(o, 0));
      } else {
        layoutChild('roll', BoxConstraints.loose(size));
        positionChild('roll', Offset(maxRight, 0));
      }
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    var old = oldDelegate as RollSwiperLayout;
    return offset != old.offset || count != old.count;
  }
}
