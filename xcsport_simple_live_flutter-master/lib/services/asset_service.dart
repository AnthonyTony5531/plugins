import 'package:fast_ai/models/many_name/lang_type.dart';
import 'package:fast_ai/performance/manager/logger_kit_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

AssetManifest _assetManifest = AssetManifest();

// 电竞代码,临时引用
class AssetService {
  List<String> _imageAssets = [];
  bool _isLoading = false;

  // 该方法必须在,Main()启动之后调用
  // 否则,迁移代码到Main启动的第一次界面初始化
  Future<void> initAssent() async {
    if (_isLoading) return;
    _isLoading = true;
    DateTime inTime = DateTime.now();
    final assetManifestJson = await _assetManifest.json();

    _imageAssets.clear();
    _imageAssets.addAll(assetManifestJson.keys.toList());
    if(kReleaseMode){
      // 打印Asset资源是否存在
      int _count = 0;
      int _group = 0;
      _imageAssets.forEach((element) {
        aiLog(message: '${LogTag.assetsMsg}-$_group', stack: 'assets = $element');
        _count++;
        if(_count >= 255){
          _group++;
          _count=0;
        }
      });
      print("资源装载耗时 time = ${DateTime.now().millisecondsSinceEpoch - inTime.millisecondsSinceEpoch}");
    }
    _isLoading = false;
  }

  /// 组装App项目加载资源的实际路由,如果存在则返回
  /// 不存在返回空
  String getResAssetUri(String assets, String package) {
    if (_imageAssets.length == 0) {
      debugPrint("jsonAssent file is not init");
      initAssent();
      return '';
    }

    // 兼容AI,不存则表示当前工程项目打包
    if (package == null || package.isEmpty) return assets;

    // 检查Package是否存在资源文件
    String defAsset = 'packages/$package/$assets';
    if (_imageAssets.contains(defAsset)) return assets;

    // 本地不存在资源
    debugPrint("asset file is null assetName : $assets ,  package = $package");
    return "";
  }

  /// 只检查资源是否存在多语言图片,存在返回
  /// 否则,返回原路由
  String getLangResAssetUrl(String assets, String langCode, String package) {
    if (_imageAssets.length == 0) {
      debugPrint("jsonAssent file is not init");
      initAssent();
      return assets;
    }

    int dotIndex = assets.lastIndexOf('.');
    String suffix = assets.substring(dotIndex);
    String lgName = assets.substring(0, dotIndex) + '_${langCode?.toLowerCase()}' + suffix;
    String enUsName = assets.substring(0, dotIndex) + '_${AiLangType.en?.toLowerCase()}' + suffix;

    String defAsset;
    if (package == null || package.isEmpty) {
      defAsset = lgName;
    } else {
      defAsset = 'packages/$package/$lgName';
    }
    if (_imageAssets.contains(defAsset)) return lgName;

    // 否则使用英文默认
    if (package == null || package.isEmpty) {
      defAsset = enUsName;
    } else {
      defAsset = 'packages/$package/$enUsName';
    }

    if (_imageAssets.contains(defAsset)) return enUsName;
    return assets;
  }
}

class ScFontStyle {
  static final String pingFang = 'PingFang';
  static final String hyYaKuHei = 'HYYakuHei';
  static final String scoreBold = 'ScoreBold';
  static final String visByCFBold = 'VisbyCFBold';
  static final String youSheBiAo = 'YouSheBiao';
}

class AssetManifest {
  static Future<Map<String, List<String>>> _jsonFuture;

  final bool enableCache = true;

  Future<Map<String, List<String>>> json() {
    _jsonFuture ??= _loadAssetManifestJson();
    return _jsonFuture;
  }

  /// 获取AssetManifest.json配置文件数据,也就是项目assets配置路由
  Future<Map<String, List<String>>> _loadAssetManifestJson() async {
    try {
      final jsonString = await rootBundle.loadString('AssetManifest.json', cache: enableCache);
      print("Succes loading AssetMainfest.json");
      return _manifestParser(jsonString);
    } catch (e) {
      print('Error loading AssetManifest.json, e: $e');
      rootBundle.evict('AssetManifest.json');
    }
    return null;
  }

  static Future<Map<String, List<String>>> _manifestParser(String jsonData) {
    if (jsonData == null) {
      return SynchronousFuture(null);
    }
    final parsedJson = convert.json.decode(jsonData) as Map<String, dynamic>;
    final parsedManifest = parsedJson.map<String, List<String>>((key, value) {
//      print('parsedManifest key = $key');
      return MapEntry(key, (value as List<dynamic>).cast<String>());
    });
    return SynchronousFuture(parsedManifest);
  }

  @visibleForTesting
  static void reset() => _jsonFuture = null;
}
