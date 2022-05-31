import 'dart:io';
import 'dart:typed_data';

import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/sdk_params.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/sdk_api/version_getappversion_protocol.dart';
import 'package:fast_ai/services/sys_service.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:get_ip/get_ip.dart';
import 'package:path_provider/path_provider.dart';

Widget gLaunchImage(BuildContext context, [bool isSDK = false]) {
  // APP & ICON SDK启动页
  String path;
  try {
    path = config?.merchantAppConfig?.sdkLaunchUrl ??
        AiCache.get().getString(AiCache.sdk_launch_url) ??
        '';
  } catch (e) {
    print('000-isSDK=$isSDK gLaunchImage error=$e');
  }
  print(
      '000-isSDK=$isSDK gLaunchImage_url=$path, w=${MediaQuery.of(context).size.width}, h=${MediaQuery.of(context).size.height}');
  return Stack(
    children: <Widget>[
      Positioned.fill(
        child: AiImage.fromUrlHasSize(
          path,
          isSDK
              ? 'assets/images/launch/sdk_loading_default6.png'
              : 'assets/images/launch/LaunchImagePortrait~iphone.png',
          fit: BoxFit.cover,
          useLocalAsset: true,
          pFit: BoxFit.cover,
          //pSize: Size(284, 78),
        ),
      )
    ],
  );
}

Widget gLaunchImageData(BuildContext context, Uint8List data,
    [bool isSDK = false]) {
  // APP & ICON SDK启动页
  String path;
  try {
    path = config?.merchantAppConfig?.sdkLaunchUrl ??
        AiCache.get().getString(AiCache.sdk_launch_url) ??
        '';
  } catch (e) {
    print('000-isSDK=$isSDK gLaunchImage error=$e');
  }
  print(
      '000-isSDK=$isSDK gLaunchImage_url=$path, w=${MediaQuery.of(context).size.width}, h=${MediaQuery.of(context).size.height}');
  return Stack(
    children: <Widget>[
      Positioned.fill(
        child: Image.memory(
          data,
          fit: BoxFit.cover,
          //pSize: Size(284, 78),
        ),
      )
    ],
  );
}

// AiImage.assetImage(->gAssetImage(
ImageProvider gAssetImage(String assetName,
    {AssetBundle bundle, String package}) {
  if (config?.sdkAssetsModel?.sdkAssetsDir == null ||
      assetName.endsWith('.gif')) {
    return AssetImage(assetName, bundle: bundle, package: package);
  }
  if (Platform.isAndroid) {
    // return FileImage(File('${config.sdkAssetsDir}/$assetName'));
    return FileImage(File(AiFile.dir('$assetName')));
  }
  return AssetImage('${config?.sdkAssetsModel?.sdkAssetsDir}/$assetName',
      bundle: bundle, package: package);
}

// AiSvgPicture.asset(->GSvgPicture.asset(
class GSvgPicture {
  static SvgPicture asset(
    String assetName, {
    Key key,
    bool matchTextDirection = false,
    AssetBundle bundle,
    String package,
    double width,
    double height,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder placeholderBuilder,
    Color color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String semanticsLabel,
    bool excludeFromSemantics = false,
  }) {
    if (config?.sdkAssetsModel?.sdkAssetsDir == null) {
      return AiSvgPicture.asset(assetName,
          key: key,
          matchTextDirection: matchTextDirection,
          bundle: bundle,
          package: package,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
          placeholderBuilder: placeholderBuilder,
          color: color,
          colorBlendMode: colorBlendMode,
          semanticsLabel: semanticsLabel,
          excludeFromSemantics: excludeFromSemantics);
    }
    return SvgPicture.file(
        File('${config?.sdkAssetsModel?.sdkAssetsDir}/$assetName'),
        key: key,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        matchTextDirection: matchTextDirection,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        placeholderBuilder: placeholderBuilder,
        color: color,
        colorBlendMode: colorBlendMode,
        semanticsLabel: semanticsLabel,
        excludeFromSemantics: excludeFromSemantics);
  }
}

// AiImage.asset(->GImage.asset(
class GImage {
  static Image asset(
    String name, {
    Key key,
    AssetBundle bundle,
    ImageFrameBuilder frameBuilder,
    String semanticLabel,
    bool excludeFromSemantics = false,
    double scale,
    double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit,
    Alignment alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    String package,
    FilterQuality filterQuality = FilterQuality.low,
    int cacheWidth,
    int cacheHeight,
  }) {
    if (config?.sdkAssetsModel?.sdkAssetsDir == null) {
      return AiImage.asset(name,
          key: key,
          bundle: bundle,
          frameBuilder: frameBuilder,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          scale: scale,
          width: width,
          height: height,
          color: color,
          colorBlendMode: colorBlendMode,
          fit: fit,
          alignment: alignment,
          repeat: repeat,
          centerSlice: centerSlice,
          matchTextDirection: matchTextDirection,
          gaplessPlayback: gaplessPlayback,
          package: package,
          filterQuality: filterQuality,
          cacheWidth: cacheWidth,
          cacheHeight: cacheHeight);
    }
    return Image.file(File('${config?.sdkAssetsModel?.sdkAssetsDir}/$name'),
        key: key,
        scale: scale ?? 1.0,
        frameBuilder: frameBuilder,
        semanticLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
        width: width,
        height: height,
        color: color,
        colorBlendMode: colorBlendMode,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        centerSlice: centerSlice,
        matchTextDirection: matchTextDirection,
        gaplessPlayback: gaplessPlayback,
        filterQuality: filterQuality,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight);
  }
}

class SDKFont {
  static Future<void> loadFonts(List<String> fontPaths) async {
    fontPaths.forEach((path) async {
      await loadLocalFont(path);
    });
  }

  static Future<void> loadLocalFont(String fontPath) async {
    try {
      String fontName = fontPath.split('/').last;
      var sysFontFamily = {
        //"PingFang_Medium.ttf" : config.skin.fontFimaly.pingFang,//除下2项其他的所有字体样式
        "kabm.ttf": config.skin.fontFimaly.money,
        "Ratio_Black.otf": config.skin.fontFimaly.liGothicMed, //赔率；输赢金额专用
        "Score_Bold.ttf": config.skin.fontFimaly.dINCondensed, //比分专用
        "HYYakuHei-HEW.ttf": config.skin.fontFimaly.yakuHei,
        "VisbyCF_Bold.otf": config.skin.fontFimaly.visbyCF,
        "YouSheBiaoTiHei.ttf": config.skin.fontFimaly.youSheBiaoTiHei,
      };
      String name = sysFontFamily[fontName];
      final fontLoader = FontLoader(name);
      fontLoader.addFont(loadLocalFontBytes(fontPath));
      await fontLoader.load();
      print('00-字体加载成功-font=$name, fontNameKey=$fontName');
    } catch (e) {
      print('字体加载失败 fontPath=$fontPath, error=$e');
    }
  }

  static Future<ByteData> loadLocalFontBytes(String fontPath) async {
    return await rootBundle.load(fontPath);
  }
}

class SDKAsset {
  static Future getAppDocsDirPath() async {
    if (config.isApp) return;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    config.sdkAssetsModel.sdkAssetsDir = appDocDir.path;
    print('appDocDir=${appDocDir.path}');
  }

  static Future checkIfNeedUpdateSDKAssets() async {
    /*
      资源更新条件：
      1、SDK版本号大于老的版本号
      2、SDK版本号相同，配置资源版本号大于本地资源版本号且配置了强制更新
      3、资源不存在
    */
    if (!config.isApp) config.sdkAssetsModel.sdkVersion = await XcSdkApi.sdkVersion();

    if (config.isApp || config.sdkAssetsModel.sdkAssetsQuery || !gExportAssets) return;

    String curSdkVersion = config.sdkAssetsModel.sdkVersion;
    String preSdkVersion = '';
    String preAssetsVersion = '';
    try {
      preSdkVersion = AiCache.get().getString(AiCache.sdk_version) ?? '';
      preAssetsVersion =
          AiCache.get().getString(AiCache.sdk_assets_version) ?? '';
    } catch (e) {
      print('读取SDK版本信息异常 error=$e');
    }

    print(
        '00000000-preSdkVersion=$preSdkVersion, preAssetsVersion=$preAssetsVersion, currnetSdkVersion=$curSdkVersion');
    if (config.sdkParams.page == TabSdkPage.main ||
        config.sdkParams.sdkType == SdkParams.SDKTypeDefault) {
      // 只在主页面检查资源下载，以免在强制更新的时候下载多次
      print('00000000-获取SDK资源版本信息');
      bool assetsDirExist = false;
      try {
        Directory dir = Directory(AiFile.dir('assets'));
        assetsDirExist = await dir.exists();
      } catch (e) {
        print('判断资源是否存在异常 error=$e');
      }
      print('00000000 assetsDirExist=$assetsDirExist');

      print('sdk 资源版本比对');
      int curSdk = 0;
      int preSdk = 0;
      String curSdkVersionTemp = curSdkVersion;
      String preSdkVersionTemp = preSdkVersion;
      try {
        curSdkVersionTemp = curSdkVersionTemp?.replaceAll('.', '');
        preSdkVersionTemp = preSdkVersionTemp?.replaceAll('.', '');
        curSdk = curSdkVersionTemp.trim() == '' || curSdkVersionTemp == null
            ? 0
            : int.parse(curSdkVersionTemp);
        preSdk = preSdkVersionTemp.trim() == '' || preSdkVersionTemp == null
            ? 0
            : int.parse(preSdkVersionTemp);
        print('000-curSdk=$curSdk, preSdk=$preSdk');
      } catch (e) {
        print('sdk 资源版本比对异常 e=$e');
      }

      print('00000000-开始请求版本配置接口');
      bool needCheckVersion = true;
      AiVersionGetAppVersionModel model;
      try {
        //String ipAddress = await GetIp.ipAddress(config.netConnectStatus.index);
        String ipAddress = '192.168.50.110';
//        String ipAddress = await Net.queryUserIp();
//        if(isEmpty(ipAddress)) { // 异常或连接内网导致异常
//          ipAddress = '192.168.50.110';
//        }
        print('00-SDKAsset-userIp=$ipAddress');
        model = await AiVersionGetAppVersionReqProtocol(curSdkVersion, ip: '')
            .request();
        if (model.isSuccess) {
          print('00000-资源配置接口');
          needCheckVersion = false;
          if (isEmpty(model.sdkVersion) ||
              isEmpty(model.sourceVersion) ||
              model.assetsUrls.length == 0) {
            needCheckVersion = true; // 接口请求成功但后管平台未配置
            print('11111-资源接口未配置');
          } else {
            print('22222-资源配置接口');
            String netAssetsVersion = model.sourceVersion ?? '';
            print(
                '33333-资源配置接口 netSdkVersion=${model.sdkVersion}, netAssetsVersion=$netAssetsVersion');
            netAssetsVersion = netAssetsVersion?.replaceAll('.', '');
            preAssetsVersion = preAssetsVersion?.replaceAll('.', '');
            int netAssets =
                netAssetsVersion.trim() == '' || netAssetsVersion == null
                    ? 0
                    : int.parse(netAssetsVersion);
            int preAssets =
                preAssetsVersion.trim() == '' || preAssetsVersion == null
                    ? 0
                    : int.parse(preAssetsVersion);

            print(
                '44444-资源配置接口 curSdk=$curSdk, preSdk=$preSdk, netAssets=$netAssets, preAssets=$preAssets assetsDirExist=$assetsDirExist model.forceUpdate=${model.forceUpdate}');
            if (!assetsDirExist ||
                curSdk > preSdk ||
                (model.forceUpdate == 1 &&
                    netAssets > preAssets &&
                    curSdkVersion == preSdkVersion)) {
              config.sdkAssetsModel.sdkAssetsQuery = true; // 需要下载资源
              config.sdkAssetsModel.sdkAssetsVersion = netAssets > preAssets
                  ? model.sourceVersion
                  : curSdkVersion; // 资源版本号
              print(
                  '00000000-----需要下载资源 sdkAssetsVersion=${config.sdkAssetsModel.sdkAssetsVersion}');
            }
            print('55555-资源配置接口');
          }
        }
      } catch (e) {
        model = AiVersionGetAppVersionModel();
        print('AiVersionGetAppVersionReqProtocol 接口请求异常 e=$e');
      }

      print(
          'needCheckVersion=$needCheckVersion, assetsDirExist=$assetsDirExist');
      if (!config.sdkAssetsModel.sdkAssetsQuery) {
        // 后管平台没配置版本
        if (!assetsDirExist) {
          config.sdkAssetsModel.sdkAssetsQuery = true; // 需要下载资源
          config.sdkAssetsModel.sdkAssetsVersion = curSdkVersion; // 资源版本号
          print(
              '11111111-----需要下载资源 sdkAssetsVersion=${config.sdkAssetsModel.sdkAssetsVersion}');
        } else if (needCheckVersion) {
          // 版本更新
          print('111-curSdk=$curSdk, preSdk=$preSdk');
          if (curSdk > preSdk) {
            config.sdkAssetsModel.sdkAssetsQuery = true; // 需要下载资源
            config.sdkAssetsModel.sdkAssetsVersion = curSdkVersion; // 资源版本号
            print(
                '22222222222-----需要下载资源 sdkAssetsVersion=${config.sdkAssetsModel.sdkAssetsVersion}');
          }
        }
      }

      // 与XXL上资源URL合并
      try {
        if (config.sdkAssetsModel.sdkAssetsQuery) {
          await model.combineXxlAssetUrls();
          if (model.assetsUrls.length != 0) {
            config.sdkAssetsModel.assetsDownloadUrls.clear();
            config.sdkAssetsModel.assetsDownloadUrls.addAll(model.assetsUrls);
          }

          print(
              'finish assetsDownloadUrls=${config.sdkAssetsModel.assetsDownloadUrls.length}, assetsDownloadUrls=${config.sdkAssetsModel.assetsDownloadUrls.toString()}');
        }
      } catch (e) {
        print('与XXL上资源URL合并异常 error=$e');
      }
    }

    print('00-开始加载字体');
    // 加载字体
    try {
      Directory fontsDir = Directory(AiFile.dir('assets/fonts'));
      bool hasFonts = await fontsDir.exists();
      if (hasFonts) {
        if (Platform.isAndroid) {
          await fontsDir.delete(
              recursive:
                  true); // flutterSDK bug 安卓动态字体加载不成功(iOS是OK)，在1.9版本可以 现在暂时使用本地删除远端下载的
        } else {
          Stream<FileSystemEntity> dirs = fontsDir.list();
          dirs.forEach((dir) async {
            print('字体加载路径，dir.path=${dir.path}');
            if (dir.path.length > 0) await SDKFont.loadLocalFont(dir.path);
          });
        }
      }
    } catch (e) {
      print('字体加载失败e=$e');
    }
  }
}
