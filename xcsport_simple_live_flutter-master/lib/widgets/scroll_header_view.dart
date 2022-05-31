
/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-11-06
 * 可计算当前显示项的ListView
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:flutter/material.dart';

class ScrollHeaderView extends StatelessWidget {
  final ScrollController controller;
  final List<Widget> scrollHeaders;
  final List<Widget> fixHeaders;
  final Widget body;
  final double expandedHeight;
  const ScrollHeaderView({Key key, this.scrollHeaders, this.fixHeaders, this.body, this.expandedHeight = 20, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: controller,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
              elevation: 0,
              forceElevated: true,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              expandedHeight: expandedHeight,
              flexibleSpace: Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  Positioned(
                    bottom: 0,
                    child: scrollHeaders == null ? Container() : Column(
                      children: scrollHeaders
                    ),
                  )
                ],
              )
            )
          ),
        ];
      },
      body: MediaQuery.removePadding(
          removeTop: true,
          child: Column(
          children: (fixHeaders ?? [])..addAll(<Widget>[
            Expanded(
              child: body
            )
          ]),
        ), context: context,
      ),
    );
  }
}

