import "package:fast_ai/utils/ai_image.dart";

/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-11-06
 * 可计算当前显示项的ListView
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/material.dart';

class ScrollHeaderFade extends StatefulWidget {
  final ScrollController controller;
  final List<Widget> scrollHeaders;
  final List<Widget> fixHeaders;
  final Widget body;
  final double expandedHeight;
  final Widget title;
  final Widget titleText;
  final Color barColor;
  const ScrollHeaderFade({Key key, this.scrollHeaders, this.fixHeaders, this.body, this.expandedHeight = 20, this.controller, this.title, this.titleText, 
    this.barColor = Colors.white
  }) : super(key: key);

  @override
  _ScrollHeaderFadeState createState() => _ScrollHeaderFadeState();
}

class _ScrollHeaderFadeState extends State<ScrollHeaderFade> {

  ScrollController _scrollController;
  GlobalKey _headerKey = GlobalKey();
  ScrollController get controller{
    return widget.controller ?? _scrollController;
  }

  @override
  void initState() {
    _scrollController =  ScrollController();
    controller.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double _headerOp = 0;
  setHeaderOp(double value){
    if(_headerOp == value)return;
    if(mounted)setState(() {
      _headerOp = value;
    });
  }
  scrollListener(){
    if(_headerKey.currentContext == null)
      return;
    
    var headerHeight = _headerKey.currentContext.size.height;
    var showHeight = widget.expandedHeight - headerHeight + MediaQuery.of(context).padding.top;
    var restShowHeight = showHeight - controller.offset;
    
    if(restShowHeight >= 0){
      setHeaderOp(1-restShowHeight / showHeight);
      //setHeaderOp(0);
    }else if(restShowHeight < 0){
      setHeaderOp(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    var main = NestedScrollView(
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
              expandedHeight: widget.expandedHeight,
              flexibleSpace: Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: 1 - _headerOp,
                      child: widget.scrollHeaders == null ? Container() : Column(
                        children: widget.scrollHeaders
                      ),
                    )
                  ),
                ],
              )
            )
          ),
        ];
      },
      body: MediaQuery.removePadding(
          removeTop: true,
          child: Column(
          children: (widget.fixHeaders ?? [])..addAll(<Widget>[
            Expanded(
              child: widget.body
            )
          ]),
        ), context: context,
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        main,
        Positioned(
          top: 0,
          child: Opacity(
            opacity: _headerOp,
            child: Container(
              key: _headerKey,
              padding: EdgeInsets.only(top: AiMeasure.topOffset(context)),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: widget.barColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12, offset: Offset(0, 1),
                    blurRadius: 5
                  )
                ],
              ),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 50
                ),
                alignment: Alignment(0, 0),
                child: widget.title ?? Text(widget.titleText ?? "${config.langMap['baseLang']['widgets']['title']}", style: AiTextStyle(
                  fontFamily: config.skin.fontFimaly.pingFang,
                  fontSize: config.skin.fontSize.h3,
                  fontWeight: config.skin.fontWeight.medium
                ),),
              ),
            ),
          )
        ),
        Positioned(
          top: AiMeasure.topOffset(context) + 10,
          left: 15,
          child: createBackBtn(),
        )
      ],
    );
  }

  Widget createBackBtn(){
    Widget backBtn = InkWell(
        child: Container(
          child: Icon(Icons.arrow_back_ios, size: 20,color: Colors.black),
        ),
        onTap: () {
          AiRouter.pop(context);
        },
      );
    return backBtn;
  }
}

