import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/play_type_local.dart';
import 'package:fast_ai/config/play_type_local_en.dart';
import 'package:fast_ai/locales/en-us/en-us.dart';
import 'package:fast_ai/locales/th-th/th-th.dart';
import 'package:fast_ai/locales/vi-vn/vi-vn.dart';
import 'package:fast_ai/models/many_name/lang_type.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert' as _convert;
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:fast_ai/locales/zh-cn/zh-cn.dart';
import 'package:fast_ai/locales/zh-tw/zh-tw.dart';

///
/// 玩法获取与更新服务，优先获取本地磁盘数据，然后异步拉取远程数据；
///
class PlayTypeServer {
  static PlayTypeServer ins = PlayTypeServer._();

  String _playTypeDirName;

  Map<String, dynamic> cache = Map<String, dynamic>();

  PlayTypeServer._() {
    _initPlayType();
  }

  void init() {
    _initPlayType();
  }

  ///初始化文件存储目录
  Future _createDir() async {
    String dirPath;
    if (Platform.isIOS) {
      dirPath = (await getApplicationSupportDirectory()).path;
    } else {
      dirPath = (await getApplicationDocumentsDirectory()).path;
    }

    if (isNullOrEmpty(dirPath)) {
      return;
    }

    String playTypeDirName = dirPath + "/" + "playtype";
    Directory dir = Directory(playTypeDirName);
    if (!(await dir.exists())) {
      dir.createSync();
    }
    _playTypeDirName = playTypeDirName;
  }

  //加载玩法
  Future _initPlayType() async {
    await _createDir();
    var rst;
    if (_localExist()) {
      rst = await _fromLocalFetch(); //从本地文件中读取
      setPlayType(rst);
    }

    updatePlayTypeFromNet();
  }

  void updatePlayTypeFromNet(){
    //通过网络获取
    _fromRemoteFetch().then((rsp) {
      setPlayType(rsp);
    });
  }


  void setPlayType(dynamic rst) {
    if (!isStrNullOrEmpty(rst)) {
      String lang = Translations.langCode;
      if (lang == AiLangType.cn) {
        zhCn['baseLang']['wf'] = rst;
      } else if (lang == AiLangType.tw) {
        zhTw['baseLang']['wf'] = rst;
      } else if (lang == AiLangType.en) {
        enUs['baseLang']['wf'] = rst;
      } else if (lang == AiLangType.vn) {
        viVn['baseLang']['wf'] = rst;
      } else if (lang == AiLangType.th) {
        thTh['baseLang']['wf'] = rst;
      } else {
        zhCn['baseLang']['wf'] = rst;
      }
    }
  }

  ///本地是否存在
  bool _localExist() {
    String fileName = _getFilePath();
    File file = File(fileName);
    if (file.existsSync() && file.lengthSync() > 0) {
      return true;
    }
    return false;
  }

  ///从本地获取玩法数据
  Future<dynamic> _fromLocalFetch() async {
    try {
      String fileName = _getFilePath();
      File file = File(fileName);
      String content = file?.readAsStringSync();
      if (isNullOrEmpty(content) && content.indexOf('FT_OU') < 0) {
        return null;
      }
      return _convert.jsonDecode(content);
    } catch (_) {
      return null;
    }
  }

  ///从远程获取玩法组数据
  Future<dynamic> _fromRemoteFetch() async {
    String result;
    //玩法名称
    try {
      String lang = Translations.langCode;
      String url = Api.baseImgUrl +
          '/files/base/playtype/js/$lang.js?r=' +
          Random().nextInt(10000).toString();
      Dio dio = new Dio();
      Response response = await dio.get(url);
      if (!isStrNullOrEmpty(response?.data) &&
          response.data.length > 20 &&
          response.data.startsWith('wf')) {
        String data = response.data.toString().replaceFirst('wf=', '');
        config.userInfo.setPlayNameData(data);
        if (!isStrNullOrEmpty(data)) {
          result = data;
        }
      } else {
        result = await _getPlayTypeFromApi();
      }
    } catch (e) {
//      result = await _getPlayTypeFromApi();
        String lang = Translations.langCode;
        setPlayType(lang == AiLangType.cn ? playTypeLocal : playTypeLocalEn);
      }

    if (isStrNullOrEmpty(result)) {
      return null;
    }
    String filePath = _getFilePath();
    if (!isNullOrEmpty(filePath) && !isStrNullOrEmpty(result)) {
      _updateLocalData(filePath, result);
    }

    return _convert.jsonDecode(result);
  }

  //接口获取玩法
  Future _getPlayTypeFromApi() async {
    String rsp;
    try {
      Map res = await Net.get(Api.PlayGroupVersionFile) ?? {};
      String data = res['data'];
      if (!isStrNullOrEmpty(data) &&
          data.length > 20 &&
          data.indexOf('FT_OU') > 0) {
        rsp = data;
      }
    } catch (e) {
      return null;
    }
    return rsp;
  }

  ///更新本地玩法组数据
  void _updateLocalData(String filePath, String data) async {
    try {
      File file = File(filePath);
      file.writeAsStringSync(data, mode: FileMode.writeOnly);
      //print("file.lastModifiedSync():${file.lastModifiedSync()}");
      file.lastModifiedSync();
      //print("file length:${await file.length()}");
      //print("read:"+file.readAsStringSync());
      //print("file.lastModifiedSync():${file.lastModifiedSync()}");
    } catch (e) {
      print(e);
    }
  }

  ///文件路径
  String _getFilePath() {
    if (isNullOrEmpty(_playTypeDirName)) {
      return "";
    }
    return _playTypeDirName + '/playtype.json';
  }
}
