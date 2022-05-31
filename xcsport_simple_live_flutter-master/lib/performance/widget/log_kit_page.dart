import 'package:fast_ai/performance/bean/data/log_info_data.dart';
import 'package:fast_ai/performance/bean/log_kit.dart';
import 'package:fast_ai/performance/bean/port/i_data.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:fast_ai/performance/manager/logger_kit_manager.dart';
import 'package:fast_ai/performance/manager/performance_manager.dart';
import 'package:fast_ai/performance/widget/view/border_button_view.dart';
import 'package:fast_ai/performance/widget/view/logger/log_info_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class TagKitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TagKitPageState();
}

class TagKitPageState extends State<TagKitPage> {
  static bool _showError = false;

  static bool get isJustError => _showError;

  final ScrollController _offsetController = ScrollController(); //定义ListView的controller

  bool _isAutoSlideBottom = true;

  Future<void> _listener(LogInfoData data) async {
    if (!mounted && !_isAutoSlideBottom) return;
    // if there's a current frame,
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      // wait for the end of that frame.
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return;
    }
    setState(() {
      if (_isAutoSlideBottom) {
        _offsetController.jumpTo(0);
      }
    });
    return;
  }

  @override
  void initState() {
    super.initState();
    LoggerKitManager.instance.registerListener(_listener);
  }

  @override
  void dispose() {
    LoggerKitManager.instance.unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff5f6fa),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTopBtnView(),
          _buildHintView(),
          const SizedBox(height: 10.0),
          _buildLoggerInfoListView(),
        ],
      ),
    );
  }

  Widget _buildHintView() {
    return Text('点击日志查看详情，长按可复制日志信息!!', style: TextStyle(color: Colors.blue.shade300, fontSize: 10.0));
  }

  Widget _buildTopBtnView() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BorderButtonView(
            '清空日志',
            onClick: () {
              KitManager.instance.getKit<LogKit>(KitRouter.KIT_LOG).cleanLog();
              _uploadData();
            },
          ),
          const SizedBox(width: 10.0),
          BorderButtonView(
            '自动滚动',
            isSelect: _isAutoSlideBottom,
            onClick: () {
              _isAutoSlideBottom = !_isAutoSlideBottom;
              _uploadData();
            },
          ),
          const SizedBox(width: 10.0),
          BorderButtonView(
            '只看异常',
            isSelect: _showError,
            onClick: () {
              _showError = !_showError;
              _uploadData();
            },
          ),
          const SizedBox(width: 10.0),
          BorderButtonView(
            '滑到顶部',
            onClick: () => _offsetController.jumpTo(0),
          ),
        ],
      ),
    );
  }

  Widget _buildLoggerInfoListView() {
    final List<IData> items = !_showError
        ? KitManager.instance.getKit<LogKit>(KitRouter.KIT_LOG)?.storage?.getAll()
        : KitManager.instance.getKit<LogKit>(KitRouter.KIT_LOG)?.error?.getAll();

    // 排序
    items.sort((a, b) {
      if (a is LogInfoData && b is LogInfoData) {
        if (a.timestamp.isAfter(b.timestamp)) return -1;
        return 1;
      }
      return 0;
    });

    return Expanded(
      child: Container(
        child: ListView.separated(
          controller: _offsetController,
          itemCount: items.length,
          separatorBuilder: (cxt, index) => const SizedBox(height: 10.0),
          itemBuilder: (cxt, index) {
            return LogInfoItemView(
              data: items[index],
              index: index,
            );
          },
        ),
      ),
    );
  }

  void _uploadData() {
    if (mounted) setState(() {});
  }
}

class LogInfoItemView extends StatefulWidget {
  final LogInfoData data;
  final int index;

  LogInfoItemView({this.data, this.index});

  @override
  State<StatefulWidget> createState() => _LogInfoItemState();
}

class _LogInfoItemState extends State<LogInfoItemView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => copyData(widget.data.msg),
      onTap: () {
        PerformanceManager.instance.showDetail(LogInfoView(infoData: widget.data));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(bottom: BorderSide(width: 0.5, color: Color(0xffeeeeee))),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: RichText(
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: widget.data.toTimeString,
                style: TextStyle(
                  color: widget.data.type == LogInfoData.TYPE_ERROR ? Colors.red : const Color(0xff333333),
                  height: 1.4,
                  fontSize: 10.0,
                ),
              ),
              TextSpan(
                text: widget.data.msg,
                style: TextStyle(
                  color: widget.data.type == LogInfoData.TYPE_ERROR ? Colors.red : const Color(0xff333333),
                  height: 1.4,
                  fontSize: 10.0,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  void copyData(String value) {
    Clipboard.setData(ClipboardData(text: value)).then((value) {
      PerformanceManager.instance.showOverlayToast('复制成功');
    });
  }
}
