import 'dart:convert';
import 'dart:io';
import 'lib/locales/zh-cn/zh-cn.dart';
import 'lib/locales/vi-vn/vi-vn.dart';
import 'lib/locales/th-th/th-th.dart';
import 'lib/locales/zh-tw/zh-tw.dart';
import 'lib/locales/en-us/en-us.dart';
import 'package:fast_ai/config/app_info.dart';
/*
使用说明：
1、安装dart环境
2、执行：dart build_lang_json.dart
*/

Future main() async {
  final appInfo = AppInfo();
  String version = appInfo.versionName;
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprintCN = encoder.convert(zhCn);
  await _deleteFile('lang-zh-cn-min-$version.json');
  var fileCN = File('lang-zh-cn-min-$version.json')..createSync();
  fileCN.writeAsString(prettyprintCN);

  String prettyprintVIVN = encoder.convert(viVn);
  await _deleteFile('lang-vi-vn-min-$version.json');
  var fileVIVN = File('lang-vi-vn-min-$version.json')..createSync();
  fileVIVN.writeAsString(prettyprintVIVN);

  String prettyprintTH = encoder.convert(thTh);
  await _deleteFile('lang-th-th-min-$version.json');
  var fileTH = File('lang-th-th-min-$version.json')..createSync();
  fileTH.writeAsString(prettyprintTH);

  String prettyprintTW = encoder.convert(zhTw);
  await _deleteFile('lang-zh-tw-min-$version.json');
  var fileTW = File('lang-zh-tw-min-$version.json')..createSync();
  fileTW.writeAsString(prettyprintTW);

  String prettyprintUS = encoder.convert(enUs);
  await _deleteFile('lang-en-us-min-$version.json');
  var fileUS = File('lang-en-us-min-$version.json')..createSync();
  fileUS.writeAsString(prettyprintUS);
}

Future<bool> _deleteFile(String filePath) async {
  try {
    final file = File(filePath);
    bool exists = await file.exists();
    if (exists) await file.delete();
    return true;
  } catch (e) {
    print('delete failed filePath=$filePath error=$e');
  }
  return false;
}
