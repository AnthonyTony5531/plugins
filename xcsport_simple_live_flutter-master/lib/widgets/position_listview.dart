/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-11-06
 * 可计算当前显示项的ListView
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'dart:async';
import 'dart:math';

import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef OnScrolling = void Function(double offset, ScrollController controller, int firstIndex, int lastIndex, {double headerHeight});
typedef OnScrollStopCallBack = void Function(int firstIndex, int lastIndex);

class PositionListView extends StatefulWidget {
  final Axis scrollDirection;
  final bool reverse;
  final PScrollController controller;
  final bool primary;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final double itemExtent;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double cacheExtent;
  final int semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final OnScrolling onScrolling;
  final int evaluateCount;
  final IndexedWidgetBuilder separatorBuilder;
  final List<Widget> children;
  final bool disableController;
  final OnScrollStopCallBack onScrollStopCallBack;

  PositionListView({
    Key key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.itemExtent,
    this.itemBuilder,
    this.itemCount,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.onScrolling,
    this.evaluateCount = 8,
    this.separatorBuilder,
    this.children,
    this.disableController = false,
    this.onScrollStopCallBack,
  }) : super(key: key);

  @override
  _PositionListViewState createState() => _PositionListViewState();

  static PositionListView builder({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    PScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    double itemExtent,
    @required IndexedWidgetBuilder itemBuilder,
    int itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double cacheExtent,
    int semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    OnScrolling onScrolling,
    IndexedWidgetBuilder separatorBuilder,
    //估计一次能显示多少个
    int evaluateCount = 8,
    bool disableController = false,
    Function onScrollStopCallBack,
  }) {
    return PositionListView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      itemExtent: itemExtent,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      onScrolling: onScrolling,
      evaluateCount: evaluateCount,
      separatorBuilder: separatorBuilder,
      disableController: disableController,
      onScrollStopCallBack: onScrollStopCallBack,
    );
  }
}

class CellController {
  GlobalKey cellKey = GlobalKey();
  GlobalKey cellSpritKey = GlobalKey();
  bool calcCell = false;
  bool calcSprit = false;

  double cellHeight = 0;
  double spritHeight = 0;
  double height = 0;
  double offset = 0;
  final int index;

  CellController(this.index);
}

class CellIndex {
  int index = 0;
  bool isSprit = false;
}

class _PositionListViewState extends State<PositionListView> {
  PScrollController _scrollController;

  PScrollController get scrollController {
    return _scrollController ?? widget.controller;
  }

  Timer _sendScrollStopTimer;

  //用于计算当前显示的单元格的位置
  GlobalKey _listViewKey = GlobalKey();
  List<CellController> _cells = List<CellController>();

  CellController getCellController(int index) {
    if (index >= _cells.length) {
      for (var i = _cells.length; i < index + 1; i++) {
        _cells.add(CellController(i));
      }
    }
    return _cells[index];
  }

  double getIndexOffset(int index) {
    return _cells.take(index).map((f) => f.height).fold(0, (a, b) => a + b);
  }

  int stateId = 0;

  @override
  void initState() {
    if (widget.onScrolling != null) {
      if (widget.controller == null) {
        _scrollController = PScrollController();
        _scrollController.addListener(onScrolling);
      } else {
        widget.controller.addListener(onScrolling);
      }
    }
    stateId = Random().nextInt(10000);
    WidgetsBinding.instance.addPostFrameCallback((d) {
      onScrolling();
    });
    super.initState();
  }

  bool disposed = false;

  @override
  void dispose() {
    disposed = true;
    _cancelTimer();
    if (_scrollController != null) {
      _scrollController.removeListener(onScrolling);
      _scrollController.dispose();
      _scrollController = null;
    }
    if (widget.controller != null) {
      widget.controller.removeListener(onScrolling);
    }
    super.dispose();
  }

  calcHeightCell(CellController cell, bool isSprit) {
    if (isSprit)
      cell.calcSprit = true;
    else
      cell.calcCell = true;

    if (cell.calcCell) {
      cell.calcCell = false;
      RenderBox box = cell.cellKey.currentContext?.findRenderObject();
      if (box != null) {
        cell.cellHeight = box.size?.height ?? 0;
        cell.height = cell.cellHeight + cell.spritHeight;
        // print('index: ${cell.index} cellHeight:${cell.cellHeight}');
      }
    }
    if (cell.calcSprit) {
      cell.calcSprit = false;
      RenderBox box = cell.cellSpritKey.currentContext?.findRenderObject();
      if (box != null) {
        cell.spritHeight = box.size.height;
        cell.height = cell.cellHeight + cell.spritHeight;
        // print('index: ${cell.index} spritHeight:${cell.spritHeight}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    scrollController.state = this;
    if (widget.children != null) {
      var ret = Container(
        key: _listViewKey,
        child: ListView.separated(
            key: widget.key,
            scrollDirection: widget.scrollDirection,
            reverse: widget.reverse,
            controller: (widget.disableController ?? false) ? null : scrollController.innerScrollController,
            primary: widget.primary,
            physics: widget.physics,
            shrinkWrap: widget.shrinkWrap,
            padding: widget.padding,
            itemBuilder: cellBuilderChildren,
            // (BuildContext ctx, int idx) => widget.children[idx],
            itemCount: widget.children.length,
            addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
            addRepaintBoundaries: widget.addRepaintBoundaries,
            addSemanticIndexes: widget.addSemanticIndexes,
            cacheExtent: widget.cacheExtent,
            separatorBuilder: cellSeparatorBuilder),
      );
      return ret;
    } else {
      var ret = Container(
        key: _listViewKey,
        child: ListView.separated(
            key: widget.key,
            scrollDirection: widget.scrollDirection,
            reverse: widget.reverse,
            controller: (widget.disableController ?? false) ? null : scrollController.innerScrollController,
            primary: widget.primary,
            physics: widget.physics,
            shrinkWrap: widget.shrinkWrap,
            padding: widget.padding,
            // itemExtent : widget.itemExtent,
            itemBuilder: cellBuilder,
            itemCount: widget.itemCount,
            addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
            addRepaintBoundaries: widget.addRepaintBoundaries,
            addSemanticIndexes: widget.addSemanticIndexes,
            cacheExtent: widget.cacheExtent,
            separatorBuilder: cellSeparatorBuilder
            // semanticChildCount : widget.semanticChildCount,
            // dragStartBehavior : widget.dragStartBehavior,
            ),
      );
      return ret;
    }
  }

  Widget cellBuilderChildren(BuildContext ctx, int idx) {
    //用于计算显示的单元格的位置
    var ret = widget.children[idx];
    var cellController = getCellController(idx);
    WidgetsBinding.instance.addPostFrameCallback((d) {
      calcHeightCell(cellController, false);
    });
    return Container(
      key: cellController.cellKey,
      child: ret,
    );
  }

  Widget cellBuilder(BuildContext ctx, int idx) {
    //用于计算显示的单元格的位置
    Widget ret;
    ret = widget.itemBuilder(ctx, idx);
    var cellController = getCellController(idx);
    WidgetsBinding.instance.addPostFrameCallback((d) {
      calcHeightCell(cellController, false);
    });
    return Container(
      key: cellController.cellKey,
      child: ret,
    );
  }

  Widget cellSeparatorBuilder(BuildContext context, int index) {
    Widget ret;
    if (widget.separatorBuilder != null) ret = widget.separatorBuilder(context, index);

    var cellController = getCellController(index);
    WidgetsBinding.instance.addPostFrameCallback((d) {
      calcHeightCell(cellController, true);
    });
    if (ret == null) {
      return Container(
        key: cellController.cellSpritKey,
      );
    } else {
      return Container(
        key: cellController.cellSpritKey,
        child: ret,
      );
    }
  }

  int firstIndex = 0;
  double firstOffset = 0;
  double firstHeight = 0;

  int lastIndex = 0;
  double lastOffset = 0;
  double lastHeight = 0;

  int runningCount = 0;

  double _saveScrollPosition = 0;
  int _saveFistIndex = 0;
  int _saveLastIndex = 0;

  void onScrolling() async {
    if (disposed) return;
    if (widget.onScrolling == null) return;

    if (runningCount > 0) {
      runningCount++;
      // print('current $stateId isRunning: $runningCount');
      return;
    }
    runningCount++;
    await sleep(200);
    runningCount = 0;

    try {
      double offset = scrollController.offset;
      if (offset > firstOffset + firstHeight) {
        //向后
        var startIndex = firstIndex;
        for (var i = startIndex; i < _cells.length; i++) {
          firstHeight = _cells[firstIndex].height;
          if (firstIndex != i) {
            firstIndex = i;
            firstOffset += firstHeight;
            firstHeight = _cells[firstIndex].height;
            // print('down update $stateId firstIndex: $firstIndex');
          }
          if (offset < firstOffset + firstHeight) {
            break;
          }
        }
      } else if (offset < firstOffset) {
        //向前
        var startIndex = firstIndex;
        for (var i = startIndex; i >= 0; i--) {
          firstHeight = _cells[firstIndex].height;
          if (firstIndex != i) {
            firstIndex = i;
            firstHeight = _cells[firstIndex].height;
            firstOffset -= firstHeight;
            // print('up update $stateId firstIndex: $firstIndex');
          }
          if (offset >= firstOffset) {
            break;
          }
        }
      }
      // print('current $stateId firstIndex: $firstIndex');
      offset = offset + context.size.height;
      if (offset > lastOffset + lastHeight) {
        //向后
        var startIndex = lastIndex;
        for (var i = startIndex; i < _cells.length; i++) {
          lastHeight = _cells[lastIndex].height;
          if (lastIndex != i) {
            lastIndex = i;
            lastOffset += lastHeight;
            lastHeight = _cells[lastIndex].height;
            // print('down update $stateId lastIndex: $lastIndex');
          }
          if (offset < lastOffset + lastHeight) {
            break;
          }
        }
      } else if (offset < lastOffset) {
        //向前
        var startIndex = lastIndex;
        for (var i = startIndex; i >= 0; i--) {
          lastHeight = _cells[lastIndex].height;
          if (lastIndex != i) {
            lastIndex = i;
            lastHeight = _cells[lastIndex].height;
            lastOffset -= lastHeight;
            // print('up update $stateId lastIndex: $lastIndex');
          }
          if (offset >= lastOffset) {
            break;
          }
        }
      }
      // print('current $stateId lastIndex: $lastIndex');
      double headerHeight = 0;
      for (int i = 0; i < 4; i++) {
        headerHeight += _cells.length > i ? _cells[i].height : 1;
      }

      double difOffset = (scrollController.offset - _saveScrollPosition).abs();
      debugPrint('difOffset = $difOffset');
      if (scrollController.hasClients && _saveScrollPosition == scrollController.offset || difOffset <= 20) {
        starSendStopEventTimer();
      } else {
        _cancelTimer();
        _saveScrollPosition = scrollController.offset;
      }

      widget.onScrolling(scrollController.offset, scrollController.innerScrollController, firstIndex, lastIndex, headerHeight: headerHeight);
    } catch (e) {
      logError(e);
    }
  }

  void starSendStopEventTimer() {
    _cancelTimer();
    _sendScrollStopTimer = Timer(const Duration(milliseconds: 500), () {
      // 记录最后一次需要更新位置,下次滑动没有变化着不发事件
      if (_saveFistIndex != firstIndex || _saveLastIndex != lastIndex) {
        _saveFistIndex = firstIndex;
        _saveLastIndex = lastIndex;
        widget.onScrollStopCallBack?.call(_saveFistIndex, _saveLastIndex);
      }
    });
  }

  void _cancelTimer() {
    _sendScrollStopTimer?.cancel();
    _sendScrollStopTimer = null;
  }
}

class PScrollController {
  _PositionListViewState state;
  ScrollController innerScrollController = ScrollController();

  double get offset {
    return innerScrollController.offset;
  }

  bool get hasClients {
    return innerScrollController.hasClients;
  }

  void dispose() {
    innerScrollController.dispose();
  }

  void addListener(VoidCallback listener) {
    innerScrollController.addListener(listener);
  }

  void removeListener(VoidCallback listener) {
    innerScrollController.removeListener(listener);
  }

  void jumpTo(double value) {
    innerScrollController.position.maxScrollExtent;
    innerScrollController.jumpTo(value);
  }

  void animateTo(double offset, {@required Duration duration, @required Curve curve}) {
    innerScrollController.animateTo(offset, duration: duration, curve: curve);
  }

// void jumpIndex(int index){
//   if(state == null)return;
//   if(!state.mounted)return;
//   if(!innerScrollController.hasClients)return;
//   double offset = state.getIndexOffset(index);
//   jumpTo(offset);
// }
}
