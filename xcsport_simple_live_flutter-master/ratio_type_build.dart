import 'dart:convert';
import 'dart:io';
import 'lib/locales/zh-cn/match_config/radioTypes/radio_types.dart';
// import 'lib/locales/th-th/match_config/radioTypes/radio_types.dart';
// import 'lib/locales/vi-vn/match_config/radioTypes/radio_types.dart';
// import 'lib/locales/zh-tw/match_config/radioTypes/radio_types.dart';
// import 'lib/locales/en-us/match_config/radioTypes/radio_types.dart';

/*
使用说明：
1、安装dart环境
2、执行：dart ratio_type_build.dart
*/

Future main() async {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(radioTypeLang);
  String fileName = 'ratiotype-zh-cn.js';
  // String fileName = 'ratiotype-th-th.js';
  // String fileName = 'ratiotype-vi-vn.js';
  // String fileName = 'ratiotype-zh-tw.js';
  // String fileName = 'ratiotype-en-us.js';

  await _deleteFile(fileName);
  var file = File(fileName)..createSync();
  file.writeAsString(prettyprint);
}

Future<bool> _deleteFile(String filePath) async {
  try {
    final file = File(filePath);
    bool exists = await file.exists();
    if(exists) await file.delete();
    return true;
  } catch (e) {
    print('delete failed filePath=$filePath error=$e');
  }
  return false;
}