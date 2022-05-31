import 'package:fast_ai/performance/bean/data/http_gather_data.dart';
import 'package:fast_ai/performance/bean/data/http_info.dart';
import 'package:fast_ai/performance/manager/performance_manager.dart';
import 'package:flutter/material.dart';

import 'http_info_view.dart';

/// @author grey
/// Function :

class HttpListInfoView extends StatelessWidget {
  final HttpGatherData gatherData;

  const HttpListInfoView({@required this.gatherData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 16.0),
          _buildTitle(gatherData.httpUrlStr),
          Expanded(
            child: ListView.separated(
              itemCount: gatherData?.size ?? 0,
              separatorBuilder: (cxt, index) => SizedBox(height: 10.0),
              itemBuilder: (cxt, index) => _buildItemView(gatherData.item(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String url) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        url ?? '',
        style: TextStyle(color: const Color(0xff333333), fontSize: 14.0),
      ),
    );
  }

  Widget _buildItemView(HttpInfo info) {
    return GestureDetector(
      onTap: () => PerformanceManager.instance.showDetail(HttpInfoView(info: info)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: info.state ? Colors.blue : Colors.red.shade400,
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Row(
          children: [
            Expanded(child: Text('请求时间:${info.createTime}', maxLines: 1)),
            Text('${info.state ? '请求成功' : '请求异常'}'),
            const SizedBox(width: 10.0),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12.0),
          ],
        ),
      ),
    );
  }
}
