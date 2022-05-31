import 'dart:async';
import 'dart:core';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ai_refresh_indicator.dart';
import 'bottom_line.dart';
import 'default_views/match_loading.dart';

typedef ReloadCallback = Future<ListResult> Function(int currentPage, int pageSize);
typedef DrawWidgetCallback = Widget Function(ListResult listResult, int index);

class ListResult {
  String errorMsg;
  int listCount = 0;
  int totalCount = 0;
  dynamic data;
}

///刷新ListView
class FreshListView extends StatefulWidget {

  FreshListView({
    Key key,
    @required this.loadData,
    @required this.drawWidget,
    this.onClear,
    this.isClear = false,
    this.page = 1,
    this.pageSize = 20,
    this.divider,
    this.nonDataWidget,
    this.isNoDateMagin = true,
    this.loadingWidget,
    this.loadingListCount = 8,
    List<Widget> fixList,
    this.bottomWidget,
    this.controller,
    this.showBottomCount = 0,
    this.bottomTextColor,
    this.isFirstLoad = false,
    this.freshListController,
    this.matchLoadingCount = 3,
    this.cacheExtent,
    this.loadingIsBlackStyle = false,
    this.isDetailSlide = false,
    this.tailWidget,
    this.backgroundColor
  }) :super(key: key) {
    this.fixList = fixList ?? [];
  }

  bool isClear; //是否重新刷新 
  final int page;
  final int pageSize;
  final ReloadCallback loadData;
  final DrawWidgetCallback drawWidget;
  final ValueChanged<bool> onClear;
  final Widget divider;
  final Widget nonDataWidget;
  final Widget loadingWidget;
  final bool isNoDateMagin;
  final Widget bottomWidget;
  final int loadingListCount;
  final ScrollController controller;
  final int showBottomCount;
  final FreshListController freshListController;
  final double cacheExtent;

  //固定列表
  List<Widget> fixList;

  //底部文字颜色
  final Color bottomTextColor;
  final Color backgroundColor;
  final Widget tailWidget;


  // hank 第一次加载时显示骨架图(Bug 5849)
  bool isFirstLoad;
  int matchLoadingCount;
  bool loadingIsBlackStyle;
  bool isDetailSlide;


  @override
  State<StatefulWidget> createState() =>
      FreshListState(
          loadData: this.loadData,
          drawWidget: this.drawWidget,
          page: this.page,
          pageSize: this.pageSize,
          divider: this.divider
      );
}


class FreshListState extends State<FreshListView> {
  int page;
  int pageSize;
  ReloadCallback loadData;
  List<ListResult> datas;
  DrawWidgetCallback drawWidget;
  Widget divider;
  int __totalCount = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _onRefresh();
  }

  final GlobalKey<AiRefreshIndicatorState> aiFreshKey = new GlobalKey();

  void autoPullDown2Fresh() {
    aiFreshKey.currentState?.show();
  }

  void fresh(){
    _onRefresh();
  }

  FreshListState({
    @required this.loadData,
    @required this.drawWidget,
    this.page = 1,
    this.pageSize = 20,
    this.divider
  });

  Future<void> _onRefresh() async {
    this.page = 1;
    this.__totalCount = 0;

    var listResult = await loadData(this.page, this.pageSize);
    this.datas = this.datas ?? List();
    this.datas.clear();
    this.datas.add(listResult);
    if (listResult.totalCount > __totalCount) {
      __totalCount = listResult.totalCount;
    }
    widget.isFirstLoad = false;
    isNoMore = false;
    if (this.mounted)
      setState(() {});
  }

  bool isNoMore = false;

  Future<void> _reloadMore() async {
    if (isNoMore)
      return;
    this.page++;
    var listResult = await loadData(this.page, this.pageSize);
    //必须加上这句，不然有些后台的沙雕写的代码，滚到底部时候，给你总数为0
    if (0 == listResult.listCount) {
      isNoMore = true;
      setState(() {

      });
      return;
    }
    if (this.page - 1 == this.datas.length) {
      this.datas.add(listResult);
      if (listResult.totalCount > __totalCount) {
        __totalCount = listResult.totalCount;
      }
      widget.isFirstLoad = false;
      if (this.mounted)
        setState(() {});
    }
  }

  Widget _getLoading() {
    if (this.widget.loadingWidget == null) {
      return Text('');
    }
    return Column(children: List(this.widget.loadingListCount)
      ..fillRange(0, this.widget.loadingListCount, this.widget.loadingWidget));
  }

  void _showErrorMsg(BuildContext context) {
    // Future.delayed(Duration(milliseconds: 100)).then((v){
    //   FlushbarHelper.createError(
    //     message: '网络请求超时..请检查网络'
    //   )..show(context);
    // });
    showToas('${config.langMap['baseLang']['networkError']['netWorkOverTimeAndCheckNet']}');
  }

  bool get isNoData {
    int listCount = (this.datas == null || this.datas.length == 0) ? 0 : this.datas.map((item) => item.listCount)
        .reduce((curr, next) => curr + next);
    int totalCount = __totalCount;
    if (listCount == 0 && totalCount == 0) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    if (widget.freshListController != null) {
      widget.freshListController.state = this;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isClear) {
      widget.isClear = false;
      if (widget.onClear != null) {
        widget.onClear(widget.isClear);
        _onRefresh();
      }
    }
    if (this.datas != null && this.datas.length > 0 && this.datas[0].errorMsg != null) {
      _showErrorMsg(context);
    }
    int listCount = (this.datas == null || this.datas.length == 0) ? 0 : this.datas.map((item) => item.listCount)
        .reduce((curr, next) => curr + next);
    return AiRefreshIndicator(
        onRefresh: _onRefresh,
        key: aiFreshKey,
        child: Stack(children: <Widget>[
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
              physics: isNoData ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
              controller: widget.controller ?? ScrollController(),
              itemCount: widget.fixList.length + listCount + 1,
              cacheExtent: widget.cacheExtent,
              itemBuilder: (BuildContext _context, int idx) {
                if (idx < widget.fixList.length) {
                  return widget.fixList[idx];
                }

                int index = idx - widget.fixList.length;
                int totalCount = __totalCount;
                if (listCount == 0 || index == listCount) {
                  //未加载完
                  if (listCount > 0 && listCount < totalCount) {
                    _reloadMore();
                    return widget.tailWidget ?? Container(
                      margin: EdgeInsets.only(top: 30, bottom: 30),
                      alignment: Alignment(0, 0),
                      child: isNoMore ? (widget.bottomWidget ??
                          (this.page > 1 ? BottomLine(textColor: widget.bottomTextColor,) : Container())) : this.widget
                          .loadingWidget ?? Text('${config.langMap['baseLang']['message']['loading']}'),
                    );
                  }
                  else if (totalCount == 0) {
//              try{
//                if(this.datas != null && this.datas.length == 1 && this.datas[index].errorMsg != null) {
//                  //请求错误
//                  _showErrorMsg(_context);
//                }
//              } on Exception catch(e){
//                print(e.toString());
//              }
                    return Container(
                      margin: this.widget.isNoDateMagin ? EdgeInsets.only(top: 30, bottom: 30) : EdgeInsets.all(0),
                      alignment: Alignment(0, 0),
                      child: this.datas == null ? _getLoading() : (listCount > 0 ? Container() : this.widget
                          .nonDataWidget ?? Text('${config.langMap['baseLang']['noData']}')),
                    );
                  }
                  else {
                    if (widget.fixList.length + listCount >= widget.showBottomCount) {
                      return widget?.tailWidget ?? Container(
                        margin: EdgeInsets.only(top: 30, bottom: 30),
                        alignment: Alignment(0, 0),
                        child: widget.bottomWidget ?? ((this.page >= 1 && listCount >= 5)
                            ? BottomLine(textColor: widget.bottomTextColor,)
                            : Container()),
                        //padding: EdgeInsets.all(20.0),
                        // child: Text(''),
                        //child: Text('已经触碰到我的底线了'),
                      );
                    } else {
                      return widget?.tailWidget ?? Container(
                        margin: EdgeInsets.only(top: 30, bottom: 30),
                        alignment: Alignment(0, 0),
                      );
                    }
                  }
                }
                else {

                  if(this.pageSize > 0){
                    num ber = index ~/ this.pageSize;
                    if(ber<datas.length){
                      return drawWidget(this.datas[ber], index % this.pageSize);
                    }
                  }
                  return Container();
                }
              },
              separatorBuilder: (context, index) {
                return this.divider ?? Divider(height: 1, color: Theme
                    .of(context)
                    .backgroundColor);
              },
            ),
          ),
          widget.isFirstLoad
              ? MatchLoading(
            count: widget?.matchLoadingCount ?? 3,
            isListView: false,
            isBlackStyle: widget?.loadingIsBlackStyle,
            isDetailSlide: widget?.isDetailSlide,
            backgroundColor: widget?.backgroundColor,
          )
              : Container()
        ],)
    );
  }
}

class FreshListController {

  FreshListState state;

  void autoPullDown2Fresh() {
    state?.autoPullDown2Fresh();
  }

  void refresh(){
    state?.fresh();
  }
}

