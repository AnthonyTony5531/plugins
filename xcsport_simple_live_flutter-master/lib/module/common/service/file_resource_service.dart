import 'dart:io';

import 'package:common_component/mvvm/model/service/service.dart';
import 'package:path_provider/path_provider.dart';

/// 资源下载路径
final String downloadPath = "download";

/// 资源图片下载路径
final String imagePath = "download/images";

/// 资源多媒体下载路径
final String multiMediaPath = "download/multi";

/// 图片保存地址
final String imageSavePath = "Pictures";

class FileResourceService extends IService {
  Map<String, String> _pathMaps = {};
  String _rootDir;
  // String _storageDir;

  @override
  Future<void> init() async {
    rootDirSync;
    // storageDirSync;
  }

  @override
  String get name => 'file_resource_service';

  Future<String> rootDir() async {
    return _rootDir = (await getApplicationDocumentsDirectory())?.path;
  }

  // Future<String> storageDir() async {
  //   return _storageDir = (await getExternalStorageDirectory())?.path;
  // }

  String get rootDirSync {
    if (_rootDir == null) rootDir().then((value) => _rootDir = value);
    return _rootDir;
  }

  // String get storageDirSync {
  //   if (_storageDir == null) storageDir().then((value) => _storageDir = value);
  //   return _storageDir;
  // }

  /// 文件下载统一下载路径
  Future<String> downloadRoute() async {
    if (_pathMaps.containsKey(downloadPath)) return _pathMaps[downloadPath];
    return await createRoute(rootDirSync, downloadPath);
  }

  /// 图片统一下载路径
  Future<String> imageRoute() async {
    if (_pathMaps.containsKey(imagePath)) return _pathMaps[imagePath];
    return await createRoute(rootDirSync, imagePath);
  }

  /// 多媒体统一下载路径
  Future<String> multiMediaRoute() async {
    if (_pathMaps.containsKey(multiMediaPath)) return _pathMaps[multiMediaPath];
    return await createRoute(rootDirSync, multiMediaPath);
  }

  // /// 图片统一保存路径
  // Future<String> imageSaveRoute() async {
  //   if (_pathMaps.containsKey(imageSavePath)) return _pathMaps[imageSavePath];
  //   return await createRoute(_storageDir, imageSavePath);
  // }

  /// 创建文件夹地址
  Future<String> createRoute(String rootPath, String dirPath) async {
    if (rootPath == null || rootPath.isEmpty) {
      rootPath = await rootDir();
    }
    Directory dir = Directory("$rootPath/$dirPath");
    if (!dir.existsSync()) dir.createSync(recursive: true);
    _pathMaps[dirPath] = dir.path;
    return dir.path;
  }
}
