import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';

typedef ItemClickCallback = void Function(int position);
typedef ItemBuilder = Widget Function(BuildContext context,int index);

class AiHorizontalListView extends StatefulWidget {
  final ItemClickCallback clickCallback;
  final EdgeInsets margin;
  final double leftMargin;
  final double rightMargin;
  final double width;
  final double height;
  final int length;
  final ItemBuilder itemBuilder;
  final bool showScrollbar;

  AiHorizontalListView({
    Key key,
    @required this.width,
    @required this.height,
    @required this.length,
    @required this.itemBuilder,
    this.clickCallback,
    this.margin = const EdgeInsets.all(0),
    this.leftMargin = 0,
    this.rightMargin = 0,
    this.showScrollbar,
  }) : super(key: key);

  @override
  _AiHorizontalListViewState createState() => _AiHorizontalListViewState();
}

class _AiHorizontalListViewState extends State<AiHorizontalListView> {
  ScrollController _scrollController;
  static const double indicatorMinWidth = 12;
  bool isScroll = false;
  double indicatorWidth = 12;
  double indicatorContainerWidth = 32;
  double canScrollWidth;
  double scrollWidth = 0;
  bool showIndicator = false;

  GlobalKey<__HorizontalScrollBarState> globalKey = GlobalKey<__HorizontalScrollBarState>();

  bool get showScrollbar => widget.showScrollbar ?? showIndicator;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    Future.delayed(Duration(milliseconds: 600),(){
      if(mounted){
        setState(() {
          frameCallback(null);
        });
      }
    });
    super.initState();
  }

  void frameCallback(cb){
    try {
      if (mounted) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        if(maxScrollExtent <= 0){
          showIndicator = false;
        } else {
          showIndicator = true;
        }
        if (maxScrollExtent < 0) {
          indicatorWidth = indicatorContainerWidth;
        }
        if (indicatorWidth < 12) {
          indicatorWidth = 12;
        }
        canScrollWidth = indicatorContainerWidth - indicatorWidth;
      }
    } catch (_) {}

  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    scrollWidth = _scrollController.position.pixels /
        _scrollController.position.maxScrollExtent *
        canScrollWidth;
    if (scrollWidth < 0) {
      scrollWidth = 0;
    } else if (scrollWidth > canScrollWidth) {
      scrollWidth = canScrollWidth;
    }
    globalKey.currentState.updateOffset(scrollWidth);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.length == null || widget.length == 0) {
      return Container();
    }
    return Container(
      width: widget?.width ?? MediaQuery.of(context).size.width,
      margin: widget.margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: widget.height,
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification){
                frameCallback(null);
                return true;
              },
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      if(widget?.clickCallback != null){
                        widget.clickCallback(index);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: index == 0 ? widget.leftMargin : 0,
                          right: index == widget.length - 1
                              ? widget.rightMargin
                              : 0),
                      child: widget.itemBuilder(context,index),
                    ),
                  );
                },
                itemCount: widget.length ?? 0,
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          showScrollbar ? _HorizontalScrollBar(key: globalKey, indicatorWidth: indicatorWidth,) : SizedBox(),
        ],
      ),
    );
  }
}


class _HorizontalScrollBar extends StatefulWidget {

  final double indicatorWidth;


  _HorizontalScrollBar({Key key,this.indicatorWidth}) : super(key: key);

  @override
  __HorizontalScrollBarState createState() => __HorizontalScrollBarState();
}

class __HorizontalScrollBarState extends State<_HorizontalScrollBar> {

  double scrollWidth = 0;

  void updateOffset(double offset){
    if(mounted){
      setState(() {
        this.scrollWidth = offset;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: config.isCnTwLang ? 2 : 5, bottom: 2),
      color: Colors.transparent,
      child: Container(
        width: 32,
        height: 3,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(1.5),
        ),
        child: Container(
          width: widget.indicatorWidth,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.only(left: scrollWidth),
          height: 3,
          decoration: BoxDecoration(
            color: Color(0xFFD8D8D8),
            borderRadius: BorderRadius.circular(1.5),
          ),
          child: SizedBox(),
        ),
      ),
    );
  }
}

