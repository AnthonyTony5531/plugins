/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-11-1
 * 加载中......
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 *  1.0.0.1       Grey            更新优化
 **********************************************************/

import 'package:fast_ai/widgets/ai_skeleton_loading.dart';
import 'package:fast_ai/widgets/loading_widget/ai_flashing_loading.dart';
import 'package:fast_ai/widgets/loading_widget/arrow_loading/arrow_loading.dart';
import 'package:fast_ai/widgets/loading_widget/arrow_loading/arrow_loading_item.dart';
import 'package:fast_ai/widgets/loading_widget/arrow_loading/free_anchor_loading.dart';
import 'package:flutter/material.dart';

class MatchLoading extends StatelessWidget {
  final int count;
  final bool isListView;
  final bool isBlackStyle;
  final bool isDetailSlide;
  final Color backgroundColor;
  final bool isArrowStyle;
  final bool isFreeAnchor;
//  final Color _defaultColor = config.skin.list.backgroundColor;
  final Color _defaultColor = const Color(0xFFF4F5F8);

  const MatchLoading({
    Key key,
    count,
    isListView,
    isBlackStyle,
    isDetailSlide,
    this.backgroundColor,
    this.isArrowStyle =false,
    this.isFreeAnchor = false,
  })  : count = count ?? 3,
        isListView = isListView ?? false,
        isBlackStyle = isBlackStyle ?? false,
        isDetailSlide = isDetailSlide ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {

    if(isFreeAnchor) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 10),
        child: FreeAnchorLoading(count: this.count,),
      );
    }

    if(isArrowStyle){
      return Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: ArrowLoading(count: count,isListView: isListView,));
    }


    Color bgColor;
    Color cellBgColor = isBlackStyle ? const Color(0x0DFFFFFF) : Colors.white;
    Color cellColor = isBlackStyle ? const Color(0x0DFFFFFF) : _defaultColor;

    if (backgroundColor != null) {
      bgColor = backgroundColor;
    } else {
      bgColor = isBlackStyle ? const Color(0xE6000000) : _defaultColor;
    }

    var rows = List<Widget>();

    for (int i = 0; i < count; i++) {
      if (i != 0) rows.add(SizedBox(height: 10.0));
      rows.add(_ItemCellView(
        bgColor: cellBgColor,
        cellColor: cellColor,
        isDetailSlide: isDetailSlide,
      ));
    }

    Widget widget = Container(
      color: bgColor,
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: isListView ? ListView(children: rows) : Column(children: rows),
    );

    return AiSkeletonLoading(
      child: widget,
      isBlackStyle: isBlackStyle,
    );
  }
}

class _ItemCellView extends StatelessWidget {
  final Color bgColor;
  final Color cellColor;
  final bool isDetailSlide;

  _ItemCellView({this.bgColor, this.isDetailSlide, this.cellColor});

  final radius = const BorderRadius.all(const Radius.circular(3.0));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            _createLine(),
            _createSpaceView(),
            _createLine(),
            _createSpaceView(),
            _createLine(),
          ],
        ),
      ),
    );
  }

  Widget _createSpaceView() {
    return SizedBox(height: 16.0);
  }

  Widget _createLine() {
    List<Widget> w = [];
    w.add(_buildRoundnessView());
    w.add(SizedBox(width: 5.0));
    w.add(Expanded(child: _buildRectanglesView()));

    if (!isDetailSlide) {
      w.add(SizedBox(width: 57.0));
      w.add(_buildRectanglesView());
      w.add(SizedBox(width: 5.0));
      w.add(_buildRectanglesView());
    }

    w.add(Expanded(child: _buildRectanglesView()));

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: w,
    );
  }

  Widget _buildRoundnessView() {
    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        color: cellColor,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
    );
  }

  Widget _buildRectanglesView() {
    return Container(
      width: 83.0,
      height: 18.0,
      decoration: BoxDecoration(
        color: cellColor,
        borderRadius: const BorderRadius.all(Radius.circular(3.0)),
      ),
    );
  }
}
