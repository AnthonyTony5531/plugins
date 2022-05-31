import 'dart:async';

import 'package:fast_ai/performance/bean/memory_kit.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:fast_ai/performance/manager/performance_manager.dart';
import 'package:fast_ai/performance/tool/vm/vm_helper.dart';
import 'package:fast_ai/performance/widget/view/memory/memory_action_view.dart';
import 'package:fast_ai/performance/widget/view/memory/memory_explanation_view.dart';
import 'package:flutter/material.dart';
import 'package:vm_service/vm_service.dart';

/// @author grey
/// Function :

class MemoryKitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemoryKitState();
}

class _MemoryKitState extends State<MemoryKitPage> {
  final MemoryKit _kit = KitManager.instance.getKit<MemoryKit>(KitRouter.KIT_MEMORY);
  final List<ClassHeapStats> _heaps = <ClassHeapStats>[];

  bool _isCanTouch = true;

  @override
  void initState() {
    super.initState();
    _kit.update();
    initHeaps();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildMemoryInfoView(),
              Expanded(child: SizedBox.shrink()),
              _buildActionView(),
              _buildActionView2(),
            ],
          ),
          const SizedBox(height: 12.0),
          _buildMemoryItemTitleView(),
          _buildMemoryItemList(),
        ],
      ),
    );
  }

  Widget _buildMemoryInfoView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Memory State Info',
          style: const TextStyle(color: Color(0xff333333), fontWeight: FontWeight.bold, fontSize: 16),
        ),
        StreamBuilder<dynamic>(
          stream: Stream<dynamic>.periodic(const Duration(seconds: 2), (int value) => _kit.update()),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Container(
              margin: const EdgeInsets.only(top: 3),
              alignment: Alignment.topLeft,
              child: VmHelper.instance.memoryInfo != null && VmHelper.instance.memoryInfo.isNotEmpty
                  ? MemoryInfoView(infoMap: VmHelper.instance.memoryInfo)
                  : const Text('获取Memory数据失败(release模式下无法获取数据)', style: const TextStyle(color: Color(0xff999999), fontSize: 12.0)),
            );
          },
        ),
      ],
    );
  }

  Widget _buildActionView() {
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (_isCanTouch) {
                _delayTouch();
                _kit.gc();
              } else {
                PerformanceManager.instance.showOverlayToast('大佬慢点~会卡!');
              }
            },
            child: Container(
              width: 50.0,
              height: 28.0,
              decoration: BoxDecoration(
                color: Colors.green.shade400,
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              alignment: Alignment.center,
              child: Text('GC', style: TextStyle(color: Colors.white, fontSize: 10.0)),
            ),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () => PerformanceManager.instance.showDetail(MemoryActionView(), onCloseTap: () => initHeaps()),
            child: Container(
              width: 50.0,
              height: 28.0,
              decoration: BoxDecoration(
                color: Colors.blue.shade400,
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              alignment: Alignment.center,
              child: Text('筛选', style: TextStyle(color: Colors.white, fontSize: 10.0)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionView2() {
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (_isCanTouch) {
                _delayTouch();
                initHeaps();
              } else {
                PerformanceManager.instance.showOverlayToast('大佬慢点~会卡!');
              }
            },
            child: Container(
              width: 50.0,
              height: 28.0,
              decoration: BoxDecoration(
                color: Colors.orange.shade400,
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              alignment: Alignment.center,
              child: Text('刷新', style: TextStyle(color: Colors.white, fontSize: 10.0)),
            ),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () => PerformanceManager.instance.showDetail(MemoryExplanationView()),
            child: Container(
              width: 50.0,
              height: 28.0,
              decoration: BoxDecoration(
                color: Colors.red.shade400,
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              alignment: Alignment.center,
              child: Text('说明', style: TextStyle(color: Colors.white, fontSize: 10.0)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemoryItemTitleView() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      child: Container(
        color: Colors.blue,
        height: 34.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text('ClassName', style: TextStyle(color: Color(0xffffffff), fontSize: 14)),
              ),
            ),
            Container(
              width: 80.0,
              alignment: Alignment.center,
              child: const Text('Count', style: TextStyle(color: Color(0xffffffff), fontSize: 14.0)),
            ),
            Container(
              width: 80.0,
              alignment: Alignment.center,
              child: const Text('Size', style: TextStyle(color: Color(0xffffffff), fontSize: 14.0)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemoryItemList() {
    return Expanded(
      child: Container(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: _heaps.length,
          itemExtent: 46.0,
          itemBuilder: (BuildContext context, int index) {
            return MemoryItemView(
              item: _heaps[index],
              index: index,
            );
          },
        ),
      ),
    );
  }

  void initHeaps() {
    if (_kit.getAllocationProfile() != null) {
      _heaps.clear();

      if (MemoryKit.selClassNames.length > 0) {
        _kit.getAllocationProfile().members.forEach((element) {
          if (MemoryKit.selClassNames.contains(element.classRef.name.toLowerCase())) {
            _heaps.add(element);
          }
        });
      } else {
        _kit.getAllocationProfile().members.forEach((element) {
          // 初始化值展示32个
          if (_heaps.length < 32) _heaps.add(element);
        });
      }
      // 排序
      _heaps.sort((ClassHeapStats left, ClassHeapStats right) => right.bytesCurrent.compareTo(left.bytesCurrent));
    }
    setState(() {});
  }

  void _delayTouch() {
    if (_isCanTouch) {
      _isCanTouch = false;
      Future.delayed(Duration(milliseconds: 500)).then((value) => _isCanTouch = true).catchError((_) => _isCanTouch = true);
    }
  }
}

class MemoryInfoView extends StatelessWidget {
  final Map<IsolateRef, MemoryUsage> infoMap;

  final TextStyle titleStyle = const TextStyle(fontSize: 10.0, color: Color(0xff333333), height: 1.5);
  final TextStyle subStyle = const TextStyle(fontSize: 10.0, color: Color(0xff666666), height: 1.5);

  MemoryInfoView({this.infoMap});

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = <Widget>[];

    infoMap.forEach((IsolateRef key, MemoryUsage value) {
      widgets.add(RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(text: 'IsolateName: ', style: titleStyle),
        TextSpan(text: key.name, style: subStyle),
        TextSpan(text: '\nHeapUsage: ', style: titleStyle),
        TextSpan(text: _toByteString(value.heapUsage), style: subStyle),
        TextSpan(text: '\nHeapCapacity: ', style: titleStyle),
        TextSpan(text: _toByteString(value.heapCapacity), style: subStyle),
        TextSpan(text: '\nExternalUsage: ', style: titleStyle),
        TextSpan(text: _toByteString(value.externalUsage), style: subStyle),
      ])));
    });
    return Column(children: widgets);
  }

  String _toByteString(int bytes) {
    if (bytes <= (1 << 10)) {
      return '${bytes}B';
    } else if (bytes <= (1 << 20)) {
      return '${(bytes >> 10).toStringAsFixed(2)}K';
    } else {
      return '${(bytes >> 20).toStringAsFixed(2)}M';
    }
  }
}

class MemoryItemView extends StatelessWidget {
  final int index;
  final ClassHeapStats item;

  MemoryItemView({this.item, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index % 2 == 1 ? const Color(0xfffafafa) : Colors.white,
      height: 46.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(item.classRef.name, style: const TextStyle(color: Color(0xff333333), fontSize: 12.0)),
            ),
          ),
          Container(
            width: 80.0,
            alignment: Alignment.center,
            child: Text('${item.instancesCurrent}', style: const TextStyle(color: Color(0xff333333), fontSize: 12.0)),
          ),
          Container(
            width: 80.0,
            alignment: Alignment.center,
            child: Text(_toByteString(item.bytesCurrent), style: const TextStyle(color: Color(0xff333333), fontSize: 12.0)),
          ),
        ],
      ),
    );
  }

  String _toByteString(int bytes) {
    if (bytes <= (1 << 10)) {
      return '${bytes}B';
    } else if (bytes <= (1 << 20)) {
      return '${(bytes >> 10).toStringAsFixed(2)}K';
    } else {
      return '${(bytes >> 20).toStringAsFixed(2)}M';
    }
  }
}
