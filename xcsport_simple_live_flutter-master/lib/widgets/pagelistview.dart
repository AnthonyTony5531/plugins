//**********************************************************************
//* author:Sam
//* date:2020-09-12
//**********************************************************************

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/ai_refresh_indicator.dart';
import 'package:fast_ai/widgets/default_views/match_loading.dart';
import 'package:fast_ai/widgets/loading_widget/loading_circular.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';

//返回总数
typedef OnPageRequest<PageData> = Future Function(
    int postion, int size, List list);

typedef WidgetBuilder = Widget Function(
    BuildContext context, int index, List list);

class PageListView extends StatefulWidget {
  final int position;

  final int size;

  final OnPageRequest onPageRequest;

  final WidgetBuilder builder;

  //
  final Widget emptyWidget;

  final Widget noMoreDataWidget;
  final int showNoMoreDataItemCount;

  PageListView({
    @required this.onPageRequest,
    @required this.builder,
    this.position = 1,
    this.showNoMoreDataItemCount=4,
    this.emptyWidget,
    this.noMoreDataWidget,
    this.size = 20,
    PageListController pageListController,
  }):super(key:pageListController?._key);

  @override
  _PageListViewState createState() => _PageListViewState();
}

class PageListController{
  GlobalKey<_PageListViewState> _key = GlobalKey<_PageListViewState>();
  void reload(){
    _key?.currentState?.freshKey?.currentState?.show();
  }
}

class _PageListViewState extends State<PageListView> {
  List list = [];
  final ScrollController controller = ScrollController();
  int total = 0;
  int _currentPage = 1;
  int currentListCount;
  LoadPageStatus status = LoadPageStatus.none;
  bool isInited = false;
  GlobalKey<AiRefreshIndicatorState> freshKey =
  new GlobalKey<AiRefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    controller.addListener(() async{
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if ((currentListCount ?? list.length) < total && _currentPage > 1) {
          status = LoadPageStatus.loadMoreLoading;
          setState(() {});
          await sleep(3*1000);
          PageData data =
          await widget.onPageRequest(_currentPage, widget.size, list);
          processData(data);
        }
      }
      if ((currentListCount ?? list.length) >= total && (currentListCount ?? list.length) >=widget.showNoMoreDataItemCount) {
        status = LoadPageStatus.loadMorenoData;
      }
      setState(() {});

    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      status = LoadPageStatus.firstLoading;
      setState(() {});
      freshKey.currentState?.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AiRefreshIndicator(
      onRefresh: onRefresh,
      key: freshKey,
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (list.isNotEmpty && index < list.length) {
            return widget.builder(context, index, list);
          }
          if (LoadPageStatus.loadMoreLoading == status) {
            return Container(
                height: 40,
                child: Center(child: LoadingCircular()));
          }
          if (LoadPageStatus.firstLoading == status) {
            return MatchLoading(
              isListView: false,
              count: 5,
            );
          }
          if (LoadPageStatus.loadMorenoData == status) {
            return widget.noMoreDataWidget??loadMoreNoData();
          }
          if (isInited && list.isEmpty) {
            return widget.emptyWidget ?? Container();
          }
          return Container();
        },
        itemCount: list.length + 1,
        controller: controller,
      ),
    );
  }

  Future<void> onRefresh() async {
    _currentPage = 1;
    isInited = false;
    total = 0;
    if (list.isEmpty) {
      status = LoadPageStatus.firstLoading;
    }
    setState(() {});
    PageData data = await widget.onPageRequest(_currentPage, widget.size, list);


    processData(data);
    status = LoadPageStatus.none;
    setState(() {});
  }

  void processData(PageData data) {
    total = data.total ?? total;
    list = data.list ?? list ?? [];
    isInited = true;
    if ((data.childList ?? []).isNotEmpty) {
      list.addAll(data.childList);
    }
    currentListCount = data.currentListCount;
    if ((data.reuqestSuccess ?? false) && ((currentListCount??list.length)<total)) {
      _currentPage++;
    }
  }

  Widget loadMoreNoData() {
    return Container(
      height: 60,
      child: Align(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 100,
              child: LineHelper.buildHBrokenLine(color: Color(0xFFcccccc)),
            ),
            w(10),
            TextHelper.buildContentTitle(config.langMap['baseLang']['widgets']['bottomContent']),
            w(10),
            Container(
              width: 100,
              child: LineHelper.buildHBrokenLine(color: Color(0xFFcccccc)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class PageData<T> {
  ////请求成功当前页数+1.必传
  final bool reuqestSuccess;

  //必传
  final int total;

  //可不传。需要加入的数据
  final List<T> childList;

  //当前的全部列表数据， 可不传。默认当前的列表数据
  final List<T> list;

  //当前列表的总数，可不传。默认为list的len.作用是用来，当列表的数目不是list.len时候，需要手动加计算时候赋值。
  final int currentListCount;

  const PageData(
      {@required this.reuqestSuccess,
        @required this.total,
        this.childList,
        this.list,
        this.currentListCount});
}

enum LoadPageStatus {
  none,
  firstLoading,
  loadMoreLoading,
  loadMorenoData,
}
