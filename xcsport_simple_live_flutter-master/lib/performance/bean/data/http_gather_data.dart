import 'dart:collection';

import 'package:fast_ai/performance/bean/data/http_info.dart';
import 'package:fast_ai/performance/bean/port/i_data.dart';


/// @author grey
/// Function : 网络请求信息数据

class HttpGatherData extends IData {
  final num maxHttpInfoSize = 30;

  Queue<HttpInfo> _infoList = Queue<HttpInfo>();

  String key;
  num successCount = 0;
  num errorCount = 0;
  num lastServerTime = 0;
  num lastRequestTime = 0;
  num totalServerTime = 0;
  num totalRequestTime = 0;

  num uploadTime = 0;
  String _uploadTimeName;

  HttpGatherData(this.key);

  HttpInfo item(int index) {
    if (index > size) return null;
    return _infoList.elementAt(index);
  }

  int get size => _infoList.length ?? 0;

  String get httpUrlStr => '请求地址 : $key';

  String get lastServerTimeStr => '最后服务器耗时(ms) : $lastServerTime';

  String get lastRequestTimeStr => '最后请求耗时(ms) : $lastRequestTime';

  String get averageServerTimeStr {
    num average = totalServerTime / successCount;
    return '服务器平均耗时(ms) : ${average.toStringAsFixed(2)}';
  }

  String get averageRequestTimeStr {
    num average = totalRequestTime / successCount;
    return '请求平均耗时(ms) : ${average.toStringAsFixed(2)}';
  }

  String get successStr => '请求成功 : $successCount';

  String get errorStr => '请求失败 : $errorCount';

  String get totalStr => '请求总次数 : ${successCount + errorCount}';

  String get successRateStr {
    num total = successCount + errorCount;
    if (total == 0) return '请求成功率 : --';
    num rate = successCount / total * 100;
    return '请求成功率 : ${rate.toStringAsFixed(2)}';
  }

  String get uploadTimeStr => '最后更新时间 : ${_uploadTimeName ?? uploadTime}';

  bool get isHasError => errorCount != 0;

  void addData(HttpInfo info) {
    if (info.checkData) {
      var time = DateTime.now();
      uploadTime = time.millisecondsSinceEpoch;
      _uploadTimeName = time.toIso8601String();
      if (info.state) {
        successCount++;
        lastServerTime = info.serverTime ?? 0;
        num requestTime = info.onResponseTime - info.onRequestTime;
        lastRequestTime = requestTime;
        totalServerTime += lastServerTime;
        totalRequestTime += requestTime;
      } else {
        errorCount++;
      }
      _saveHttpInfo(info);
    }
  }

  void _saveHttpInfo(HttpInfo info) {
    if (_infoList.length > 20) _infoList.removeFirst();
    _infoList.add(info);
  }

  @override
  getValue() {
    return this.toString();
  }

  @override
  String toString() {
    return 'HttpGatherData{key: $key, successCount: $successCount, errorCount: $errorCount, lastServerTime: $lastServerTime, lastRequestTime: $lastRequestTime, totalServerTime: $totalServerTime, totalRequestTime: $totalRequestTime, uploadTime: $uploadTime}';
  }
}
