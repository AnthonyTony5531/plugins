import 'package:fast_ai/performance/bean/data/http_gather_data.dart';
import 'package:fast_ai/performance/bean/http_kit.dart';
import 'package:fast_ai/performance/bean/port/i_data.dart';
import 'package:fast_ai/performance/bean/query_kit.dart';
import 'package:fast_ai/performance/manager/common_kit_manager.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:fast_ai/performance/manager/performance_manager.dart';
import 'package:fast_ai/performance/widget/view/border_button_view.dart';
import 'package:fast_ai/performance/widget/view/net/http_list_info_view.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function :  网络请求

class HttpKitPage extends StatefulWidget {
  @override
  _HttpKitPageState createState() => _HttpKitPageState();
}

class _HttpKitPageState extends State<HttpKitPage> {
  bool _isOnlyError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f6fa),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTopBtnView(),
          _buildHttpInfoListView(),
        ],
      ),
    );
  }

  Widget _buildTopBtnView() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BorderButtonView(
            '清空数据',
            onClick: () {
              KitManager.instance.getKit<HttpKit>(KitRouter.KIT_HTTP).storage.clear();
              _uploadData();
            },
          ),
          SizedBox(width: 10.0),
          BorderButtonView(
            '刷新',
            onClick: () => _uploadData(),
          ),
          SizedBox(width: 10.0),
          BorderButtonView(
            QueryKit.queryStr,
            hint: '查询条件',
            onClick: () => CommonKitManager.instance.getKit(CommonKitRouter.KIT_QUERY).tabAction(),
            onLongClick: () {
              QueryKit.queryStr = null;
              _uploadData();
            },
          ),
          SizedBox(width: 10.0),
          BorderButtonView(
            '异常记录',
            isSelect: _isOnlyError,
            onClick: () {
              _isOnlyError = !_isOnlyError;
              _uploadData();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHttpInfoListView() {
    List<IData> item = KitManager.instance.getKit<HttpKit>(KitRouter.KIT_HTTP).storage.getAll().where((element) {
      if (element is HttpGatherData) {
        // 异常过滤
        if (_isOnlyError) {
          if (!element.isHasError) return false;
        }
        // 条件查询过滤
        if (QueryKit.queryStr != null) {
          return element.key.contains(QueryKit.queryStr.trim());
        }
      }
      return true;
    }).toList();

    // 排序
    item.sort((a, b) {
      if (a is HttpGatherData && b is HttpGatherData) {
        if (a.uploadTime > b.uploadTime) return -1;
        return 1;
      }
      return 0;
    });

    return Expanded(
      child: Container(
        child: ListView.separated(
          itemCount: item.length,
          separatorBuilder: (cxt, index) => const SizedBox(height: 10.0),
          itemBuilder: (cxt, index) {
            return HttpInfoItemView(
              item: item[index] as HttpGatherData,
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

class HttpInfoItemView extends StatelessWidget {
  final HttpGatherData item;
  final int index;

  HttpInfoItemView({this.item, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PerformanceManager.instance.showListView(HttpListInfoView(gatherData: item));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(6.0)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.httpUrlStr,
                        style: const TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12.0)
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextView(item.lastRequestTimeStr),
                    buildTextView(item.averageRequestTimeStr),
                    buildTextView(item.lastServerTimeStr),
                    buildTextView(item.averageServerTimeStr),
                    buildTextView(item.successStr),
                    buildTextView(item.errorStr),
                    buildTextView(item.totalStr),
                    buildTextView(item.successRateStr),
                    buildTextView(item.uploadTimeStr),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildTextView(String title, {int maxLine}) {
    return Text(
      title,
      maxLines: maxLine ?? 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(color: Color(0xff333333), fontSize: 12.0, height: 1.5),
    );
  }
}
