import 'dart:async';
import 'dart:core';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/migrate_plugins/flushbar/flushbar_helper.dart';
//import 'package:fast_ai/pages/wallet/wallet_model.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ai_refresh_indicator.dart';
import 'bottom_line.dart';

typedef LoadCallback =  Future<PageResult> Function(int currentPage, int pageSize);
typedef DrawWidgetCallback = Widget Function(PageResult listResult, int index);

class PageResult {
  String errorMsg;
  int listCount = 0;
  int totalCount = 0;
  dynamic data;
}

///刷新ListView
class LoadListView extends StatefulWidget {

  LoadListView({
    @required this.loadData,
    @required this.drawWidget,
    this.onClear,
    this.isClear = false,
    this.page = 1,
    this.pageSize = 20,
    this.maxPage = -1,
    this.divider,
    this.nonDataWidget,
    this.loadingWidget,
    this.loadingListCount = 8, 
    List<Widget> fixList, 
    this.bottomWidget,
    this.controller, 
    this.showBottomCount = 0,
    this.bottomTextColor,
    this.topMargin = 30,
    this.bottomMargin = 30,
    this.isRequestError = false,
    this.errorWidget,
    this.physics,
    Key key,
  }):super(key:key){
    this.fixList = fixList ?? [];

  }

  bool isClear;//是否重新刷新 
  final int page;
  final int pageSize;
  final int maxPage;
  final LoadCallback loadData;
  final DrawWidgetCallback drawWidget;
  final ValueChanged<bool> onClear;
  final Widget divider;
  final Widget nonDataWidget;
  final Widget loadingWidget;
  final Widget bottomWidget;
  final int loadingListCount;
  final ScrollController controller;
  final int showBottomCount;
  //固定列表
  List<Widget> fixList;
  //底部文字颜色
  final Color bottomTextColor;
  final double topMargin;
  final double bottomMargin;
  // hank请求超时
  final bool isRequestError;
  final Widget errorWidget;
  final ScrollPhysics physics;

  @override
  State<StatefulWidget> createState() => FreshListState(
      loadData: this.loadData,
      drawWidget: this.drawWidget,
      page: this.page,
      pageSize: this.pageSize,
      divider: this.divider
  );
}



class FreshListState extends State<LoadListView> {
  int page;
  int pageSize;
  LoadCallback loadData;
  List<PageResult> datas;
  DrawWidgetCallback drawWidget;
  Widget divider;
  int __totalCount = 0;
//  WalletModel walletModel = WalletModel();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _onRefresh();
  }

  final GlobalKey<AiRefreshIndicatorState> _freshKey =new GlobalKey();

  void pulldown2Refresh(){

    _freshKey.currentState?.show();
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
    if(listResult.totalCount > __totalCount){
      __totalCount = listResult.totalCount;
    }
    if(this.mounted)
      setState(() {});
  }

  bool _isLoading = false;
  Future<void> _reloadMore() async {
    if(_isLoading)return;
    
    var page = this.page + 1;
    _isLoading = true;
    PageResult listResult;
    try {
      listResult = await loadData(page, this.pageSize);
    } catch (e) {
      logError(e);
    }
    _isLoading = false;

    if(page - 1 == this.datas.length){
      this.page = page;
      if((listResult?.data?.length ?? 0) > 0){
        this.datas.add(listResult);
      }
      if(listResult.data.length < this.pageSize){
        __totalCount = listResult.totalCount;
      }
      else if(listResult.totalCount > __totalCount){
        __totalCount = listResult.totalCount;
      }
      if(this.mounted)
        setState(() {});
    }
  }

  Widget _getLoading() {
    if(this.widget.loadingWidget == null) {
      return Text('');
    }
    return Column(children: List(this.widget.loadingListCount)..fillRange(0, this.widget.loadingListCount, this.widget.loadingWidget));
  }
  void _showErrorMsg(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100)).then((v){
      FlushbarHelper.createError(
        message: this.datas[0].errorMsg
      )..show(context);
    });
  }
  bool get isNoData{
    int listCount = (this.datas == null || this.datas.length == 0) ? 0 : this.datas.map((item)=>item.listCount).reduce((curr, next) => curr + next);
    int totalCount = __totalCount;
    if(listCount == 0 && totalCount == 0){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if(widget.isClear){
      widget.isClear = false;
      if(widget.onClear != null){
        widget.onClear(widget.isClear);
        _onRefresh();
      }
    }
    if(this.datas != null && this.datas.length > 0 && this.datas[0].errorMsg!=null){
      _showErrorMsg(context);
    }
    int listCount = (this.datas == null || this.datas.length == 0) ? 0 : this.datas.map((item)=>item.listCount).reduce((curr, next) => curr + next);
    return AiRefreshIndicator(
      onRefresh: () async {
//        walletModel.getWalletList();
        _onRefresh();
      },
      key: _freshKey,
      child: 
      MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.separated(
        physics: widget.physics ?? (isNoData ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics()),
        controller: widget.controller,
        itemCount: widget.fixList.length + listCount + 1,
        itemBuilder: (BuildContext _context, int idx) {
          if(idx < widget.fixList.length){
            return widget.fixList[idx];
          }

          int index = idx - widget.fixList.length;
          int totalCount = __totalCount;
          if((listCount == 0 || index == listCount)) {
            //未加载完
            if(listCount > 0 && (listCount < totalCount && widget.maxPage == -1)
                || (listCount == this.page * pageSize && this.page < widget.maxPage)) {
              _reloadMore();
              return Container(
                margin: EdgeInsets.only(top: widget.topMargin,bottom: widget.bottomMargin),
                alignment: Alignment(0, 0),
                child: this.widget.loadingWidget ?? Text('${config.langMap['baseLang']['message']['loading']}'),
              );
            }
            else if(totalCount == 0) {
//              try{
//                if(this.datas != null && this.datas.length == 1 && this.datas[index].errorMsg != null) {
//                  //请求错误
//                  _showErrorMsg(_context);
//                }
//              } on Exception catch(e){
//                print(e.toString());
//              }

              Widget noDataWidget = Container();
              // 请求出错(超时，无网络)
              if (widget.isRequestError) {
                noDataWidget = widget.errorWidget;
              }
              else if (this.datas == null) {
                noDataWidget = _getLoading();
              }
              else if(this.datas.length>0&&this.datas[0].totalCount==0){
                noDataWidget = widget.nonDataWidget ?? Container();
              }
              // else {
              //   noDataWidget = widget.nonDataWidget ?? Container();
              // }
              return Container(
                  margin: EdgeInsets.only(top: widget.topMargin,bottom: widget.bottomMargin),
                  alignment: Alignment(0, 0),
                  // child: this.datas == null ? _getLoading() : Container(), //this.widget.nonDataWidget ?? Text('${config.langMap['baseLang']['noData']}'),
                  child: noDataWidget,
              );
            } 
            else {
              if(widget.fixList.length + listCount >= widget.showBottomCount && widget.showBottomCount>0){
                return Container(
                    margin: EdgeInsets.only(top: widget.topMargin,bottom: widget.bottomMargin),
                    alignment: Alignment(0, 0),
                    child: widget.bottomWidget ?? BottomLine(textColor: widget.bottomTextColor,),
                  //padding: EdgeInsets.all(20.0),
                  // child: Text(''),
                  //child: Text('已经触碰到我的底线了'),
                );
              }else{
                return Container(
                    margin: EdgeInsets.only(top: widget.topMargin,bottom: widget.bottomMargin),
                    alignment: Alignment(0, 0),
                );
              }
            }
          } 
          else {
            return drawWidget(this.datas[index ~/ this.pageSize], index % this.pageSize);
          }
        },
        separatorBuilder: (context, index) {
          return this.divider ?? Divider(height: 1, color: Theme.of(context).backgroundColor);
        },
      ),
      )
      
    );
  }
}

