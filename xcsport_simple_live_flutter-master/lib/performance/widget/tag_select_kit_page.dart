import 'package:fast_ai/performance/bean/storage/tag_logger_storage.dart';
import 'package:fast_ai/performance/bean/tag_logger_kit.dart';
import 'package:fast_ai/performance/bean/tag_select_kit.dart';
import 'package:fast_ai/performance/manager/common_kit_manager.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function :  日志标签 - 筛选

class TagSelectKitPage extends StatefulWidget {
  @override
  _TagSelectKitPageState createState() => _TagSelectKitPageState();
}

class _TagSelectKitPageState extends State<TagSelectKitPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final items = (KitManager.instance.getKit<TagLoggerKit>(KitRouter.KII_LOGGER).storage as TagLoggerStorage).getKeys();
    bool isNotEmpty = items != null && items.length != 0;

    return Container(
      child: isNotEmpty
          ? Container(
              child: ListView.separated(
                itemBuilder: (cxt, index) {
                  return GestureDetector(
                    onTap: () {
                      TagSelectKit.selectTag = items[index];
                      CommonKitManager.instance.getKit(CommonKitRouter.KIT_LOGGER_TAG).quitAction();
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      alignment: Alignment.center,
                      child: Text(
                        items[index] ?? '',
                        style: const TextStyle(color: Color(0xff333333), fontSize: 14.0),
                      ),
                    ),
                  );
                },
                separatorBuilder: (cxt, ids) {
                  return Container(
                    width: width,
                    height: 1.0,
                    color: const Color(0xffeefafa),
                  );
                },
                itemCount: items.length,
              ),
            )
          : Container(
              child: GestureDetector(
                onTap: () {
                  CommonKitManager.instance.getKit(CommonKitName.KIT_LOGGER_TAG).quitAction();
                },
                behavior: HitTestBehavior.translucent,
                child: Center(
                  child: Text(
                    '暂无日志类型可选',
                    style: const TextStyle(color: Color(0xff333333), fontSize: 14.0),
                  ),
                ),
              ),
            ),
    );
  }
}
