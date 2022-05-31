import 'package:fast_ai/performance/bean/data/tag_logger_gather_data.dart';
import 'package:fast_ai/performance/bean/data/tag_logger_info_data.dart';
import 'package:fast_ai/performance/bean/storage/tag_logger_storage.dart';
import 'package:fast_ai/performance/bean/tag_logger_kit.dart';
import 'package:fast_ai/performance/bean/tag_select_kit.dart';
import 'package:fast_ai/performance/manager/common_kit_manager.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:fast_ai/performance/manager/performance_manager.dart';
import 'package:fast_ai/performance/widget/view/border_button_view.dart';
import 'package:fast_ai/performance/widget/view/logger/logger_info_view.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function : 标签日志 - 界面

class TagLoggerKitPage extends StatefulWidget {
  @override
  _TagLoggerKitPageState createState() => _TagLoggerKitPageState();
}

class _TagLoggerKitPageState extends State<TagLoggerKitPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff5f6fa),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTopBtnView(),
          _buildLoggerInfoListView(),
        ],
      ),
    );
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
              KitManager.instance.getKit(KitRouter.KII_LOGGER).storage.clear();
              _uploadData();
            },
          ),
          const SizedBox(width: 10.0),
          BorderButtonView(
            '刷新',
            onClick: () => _uploadData(),
          ),
          SizedBox(width: 10.0),
          BorderButtonView(
            TagSelectKit.selectTag,
            hint: '选择标签',
            onClick: () => CommonKitManager.instance.getKit<TagSelectKit>(CommonKitRouter.KIT_LOGGER_TAG).tabAction(),
            onLongClick: () {
              TagSelectKit.selectTag = null;
              _uploadData();
            },
          ),
          if (TagSelectKit.selectTag != null) SizedBox(width: 10.0),
          if (TagSelectKit.selectTag != null)
            BorderButtonView(
              '清空标签日志',
              onClick: () {
                final gather =
                    (KitManager.instance.getKit(KitRouter.KII_LOGGER).storage as TagLoggerStorage).getLoggerInfoData(TagSelectKit.selectTag);
                gather?.clean();
                _uploadData();
              },
            )
        ],
      ),
    );
  }

  Widget _buildLoggerInfoListView() {
    TagLoggerGatherData gatherData =
        (KitManager.instance.getKit<TagLoggerKit>(KitRouter.KII_LOGGER).storage as TagLoggerStorage).getLoggerInfoData(TagSelectKit.selectTag);

    var list = gatherData?.loggers?.toList() ?? [];

    // 排序
    list.sort((a, b) {
      if (a is TagLoggerInfoData && b is TagLoggerInfoData) {
        if (a.createTime > b.createTime) return -1;
        return 1;
      }
      return 0;
    });

    return Expanded(
      child: Container(
        child: ListView.separated(
          itemCount: list.length,
          separatorBuilder: (cxt, index) => const SizedBox(height: 10.0),
          itemBuilder: (cxt, index) {
            return TagLoggerInfoItemView(
              item: list[index],
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

class TagLoggerInfoItemView extends StatelessWidget {
  final TagLoggerInfoData item;
  final int index;

  TagLoggerInfoItemView({this.item, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => PerformanceManager.instance.showDetail(LoggerInfoView(infoData: item)),
      child: Container(
//        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleView(item.tagStr),
            buildTextView(item.createTimeStr),
            buildTextView(item.messageStr, maxLine: 10),
            buildTextView(item.stackStr, maxLine: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleView(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(6.0)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
          const SizedBox(width: 10.0),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12.0)
        ],
      ),
    );
  }

  Widget buildTextView(String title, {int maxLine}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        title,
        maxLines: maxLine ?? 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Color(0xff333333), fontSize: 12.0, height: 1.5),
      ),
    );
  }
}
