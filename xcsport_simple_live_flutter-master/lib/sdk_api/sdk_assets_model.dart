class SdkAssetsModel {
  /// SDK 版本号
  String sdkVersion = '';
  
  /// SDK 资源版本号
  String sdkAssetsVersion = '';

  /// SDK 资源路径
  String sdkAssetsDir = '';

  /// true-需要下载 false-不需要
  bool sdkAssetsQuery = false; 

  /// SDK资源下载路径
  List<String>assetsDownloadUrls=[];
}