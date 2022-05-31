
import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/sdk_api/sdk_assets.dart';
import 'package:fast_ai/sdk_api/sdk_assets_download_manager.dart';
import 'package:fast_ai/services/sys_service.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/permission_handler.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/alert/text_explain_alert.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class SDKAssetDownloadPage extends StatefulWidget {
  final VoidCallback complete;
  SDKAssetDownloadPage({Key key, @required this.complete}) : super(key: key);

  @override
  _SDKAssetDownloadPageState createState() => _SDKAssetDownloadPageState();
}

class _SDKAssetDownloadPageState extends State<SDKAssetDownloadPage> with SingleTickerProviderStateMixin {
  double _progress = 0;
  List<String>_remoteAssetsUrls = [];
  int _retryCount = 0;
  /// 广告图URL
  String _adUrl;
  StreamSubscription<RetryLoadAssetsEvent> _retryLoadAssetsEvent;
  StreamSubscription<NetworkStateEvent> _networkDidChangedEvent;

  bool _didShowAssetsErrorToast = false;

  /* ------ 不退出不杀App的断点续传 ------ */
  int _total  = 0;
  bool _didShowAlert = false;

  // 启动页文字动画
  int _titleIndex = 0;
  bool _didAnimate = false;
  Animation<double> _animation;
  AnimationController _controller;
  Timer _timer;
  bool _animationFinished = false;

  SDKAssetsDownloadManager _manager;

  @override
  void initState() {
    print('000-SDKAssetDownloadPage-initState');
    if(config.isTabSDK) {
      XcSdkApi.hideBottomBar(); // 隐藏tabbar
      print('111-SDKAssetDownloadPage-initState');
      if(config.sdkAssetsModel.sdkAssetsQuery) XcSdkApi.downloadAssets(progress: '0', isDownloadEnd: 'false', count: 0, total: 0); // 进页面先发消息给原生，展示0%进度
      print('222-SDKAssetDownloadPage-initState');
      _retryLoadAssetsEvent = Event.eventBus.on<RetryLoadAssetsEvent>().listen(_nativeNotifyFlutterRetryLoadAssets); // native通知flutter重新下载资源
      print('333-SDKAssetDownloadPage-initState');
    }
    else {
      // TAB_SDK在native壳中请求广告配置，ICON版在此请求
      try{
        _adUrl = config?.merchantAppConfig?.sdkLaunchUrl ?? AiCache.get().getString(AiCache.sdk_launch_url) ?? '';
      }
      catch(e){
        print('000-SDKAssetDownloadPage_adUrl=$_adUrl error=$e');
      }
      print('111-SDKAssetDownloadPage_adUrl=$_adUrl');

      _titleIndex = config.sdkParams.launchSubTitles.length > 1 ? Random().nextInt(config.sdkParams.launchSubTitles.length) : 0;
    }
    print('444-SDKAssetDownloadPage-initState');
    _networkDidChangedEvent = Event.eventBus.on<NetworkStateEvent>().listen(_networkDidChanged);
    _controller = AnimationController(duration: Duration(milliseconds: config.launchTitleAnimationDuration), vsync: this);
    if(config.sdkAssetsModel.assetsDownloadUrls.length != 0) _remoteAssetsUrls.addAll(config.sdkAssetsModel.assetsDownloadUrls);
    print('555-SDKAssetDownloadPage-initState');

    _loadSDKAssets();
    print('666-SDKAssetDownloadPage-initState');

    Future.delayed(Duration(seconds: 3), (){
      // 弱网络或没网，启动广告没配置 3秒后自动走后面流程
      print('77-SDKAssetDownloadPage-initState');
      onLaunchTitleAnimation();
    });
    super.initState();
  }

  @override
  void dispose() {
    print('000-SDKAssetDownloadPage-dispose');
    if(config.isTabSDK) {
      print('111-SDKAssetDownloadPage-dispose');
      XcSdkApi.showBottomBar(); // 显示 tabbar
      print('222-SDKAssetDownloadPage-dispose');
      _retryLoadAssetsEvent?.cancel();
    }
    print('333-SDKAssetDownloadPage-dispose');
    _networkDidChangedEvent?.cancel();
    _timer?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    //print('0000-SDKAssetDownloadPage-build w=${MediaQuery.of(context).size.width}, h=${MediaQuery.of(context).size.height} _adUrl=$_adUrl');
    if(_animation == null) {
      _animation = Tween(begin: MediaQuery.of(context).size.height, end: 110.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))..addListener((){
        if(mounted) setState(() {});
      });
    }

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AiImage.fromUrlHasSize(
                          _adUrl,
                          '', //'assets/images/launch/sdk_loading_default6.png',
                          fit: BoxFit.cover,
                          pFit: BoxFit.cover,
                          useLocalAsset: true,
                          imageBuilder: (BuildContext context, ImageProvider imageProvider) {
                            imageProvider.resolve(ImageConfiguration()).addListener(ImageStreamListener((ImageInfo image, bool synchronousCall){
                              print('00-imageBuilder-onImage');
                              onLaunchTitleAnimation();
                            }, onChunk: (ImageChunkEvent event){
                              print('00-imageBuilder-onChunk, total=${event.expectedTotalBytes}, count=${event.cumulativeBytesLoaded}');
                            }, onError: (_, __){
                              onLaunchTitleAnimation();
                              print('00-imageBuilder-onError');
                            }));

                            return Image(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            );
                          }
                        ),
                      )
                    ],
                  ),
                )
              ),
              config.isIconSDK ?
              Positioned(
                left: 0,
                top: MediaQuery.of(context).size.height-_animation.value,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: _animation.value,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('${config.sdkParams.launchTitle}', textAlign: TextAlign.center, style: AiTextStyle(
                        fontSize: 21,
                        fontWeight: config.skin.fontWeight.bold,
                        color: Color(0xFF000000),
                      ),),
                      h(12),
                      Text('${config.sdkParams.launchSubTitles[_titleIndex]}', textAlign: TextAlign.center, style: AiTextStyle(
                        fontSize: config.skin.fontSize.h5,
                        fontWeight: config.skin.fontWeight.regular,
                        color: config.skin.colors.fontColorDark70,
                      ),)
                    ],
                  ),
                )
              ) : Container(),
              Positioned( // 进度条
                top: MediaQuery.of(context).size.height-112,
                child: Offstage(
                  offstage: !_animationFinished,
                  child: Container(
                    child: SizedBox(
                      height: 4.0,
                      width: MediaQuery.of(context).size.width,
                      child: LinearProgressIndicator(
                        value: _progress,
                        backgroundColor: Color(0xFF222222),
                        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary)
                      ),
                    ),
                  ),
                )
              ),
//              Positioned( // 滚球动效
//                top: MediaQuery.of(context).size.height-107,
//                left: MediaQuery.of(context).size.width*_progress-6,
//                child: Offstage(
//                  offstage: !_animationFinished,
//                  child: Transform.rotate(
//                    angle: MediaQuery.of(context).size.width*_progress/2.25,//2*pi*MediaQuery.of(context).size.width*progress/(pi*36),
//                    child: AiSvgPicture.asset('assets/images/launch/icon_loading_soccer_yellow.svg', height: 12, width: 12, useLocalAsset: true),
//                  ),
//                )
//              ),
              Positioned( // 文字进度
                top: MediaQuery.of(context).size.height-108,
                child: Offstage(
                  offstage: !_animationFinished,
                  child: Container(
                    height: 18,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      '${config.langMap['baseLang']['sdkAPI']['schedule']}：${(100*_progress).toStringAsFixed(2)}%   ${config.langMap['baseLang']['sdkAPI']['resourceSize']}：${(_total/1024/1024).toStringAsFixed(2)}MB',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
//                        shadows: [
//                          BoxShadow(
//                            color: const Color(0xB2000000),
//                            offset: Offset(0.0, 2.0),
//                            blurRadius: 1.0,
//                            spreadRadius: 0.0
//                          )
//                        ],
//                        color: Colors.white,
                        color: Colors.black,
                        fontSize: 10,
                        decoration: TextDecoration.none,
                      )
                    ),
                  )
                )
              ),
            ]
          ),
        ),
      ),
    );
  }

  void onFinishLaunchTitleAnimation(){
    print('00-onFinishLaunchTitleAnimation');
    if(_animationFinished) return;
    print('11-onFinishLaunchTitleAnimation');
    _animationFinished = true;
    if(mounted) setState(() {});
  }

  void onLaunchTitleAnimation(){
    //print('00-onLaunchTitleAnimation');
    if(_didAnimate) return;
    _didAnimate = true;
    //print('11-onLaunchTitleAnimation');
    _controller.forward().then((_){
      print('00-SDKAssetDownloadPage-动画执行完毕');
      onFinishLaunchTitleAnimation();
    });

    // 定时更新副标题
    if(config.sdkParams.launchSubTitles.length < 2) return;
    _timer = Timer.periodic(Duration(seconds: 5), (timer){
      int index = 0;
      while (index == _titleIndex) {
        index = Random().nextInt(config.sdkParams.launchSubTitles.length);
      }
      _titleIndex = index;
      if(mounted) setState(() {});
    });
  }

  Future<void> _loadSDKAssets() async {
    print('sdkAssetsVersion=${config.sdkAssetsModel.sdkAssetsVersion} sdkAssetsDir=${config.sdkAssetsModel.sdkAssetsDir}');
    PermissionStatus permissionStatus;
    if(Platform.isAndroid && (config?.sdkParams?.useSdkPermissionCtrl ?? true)) {
      print('isAndroid sdk----tryInitStoragePermission-----');
      while(permissionStatus != PermissionStatus.granted) {
        print("Permission _loadSDKAssets  --------1");
        if(config.isTabSDK){
          permissionStatus =  await PermissionHandlerManager.tryInitStoragePermissionStatusForTab();
        } else {
          permissionStatus =  await PermissionHandlerManager.tryInitStoragePermissionStatus();
        }
        print("Permission _loadSDKAssets  --------1   $permissionStatus");
        if(permissionStatus == PermissionStatus.granted) break;
        else if(permissionStatus == PermissionStatus.denied || permissionStatus == PermissionStatus.permanentlyDenied) {
          Fluttertoast.showToast(msg: '应用存储权限已被禁止,请到设置-应用管理中打开', gravity: ToastGravity.BOTTOM);
          break;
        }
        await Future.delayed(Duration(milliseconds: 1000));
      }
    } else {
      permissionStatus = PermissionStatus.granted;
      print('is not Android sdk----tryInitStoragePermission-----');
    }
    print("Permission _loadSDKAssets  $permissionStatus");
    if(permissionStatus != PermissionStatus.granted) { // 读写权限
      await XcSdkApi.loginOut();
      return;
    }

    if(config.isNotConnect) { // 无网络
      print('sdk资源下载----手机无网络-----');
      _showNetErrorAlert();
      return;
    }

    try {
      print('00-sdk assets _remoteAssetsUrls.length=${_remoteAssetsUrls.length}, _retryCount=$_retryCount');
      String url = '';
      if(_remoteAssetsUrls.length > _retryCount){
        url = _remoteAssetsUrls[_retryCount];
      }
      else {
        _retryCount = 0;
        _showNetErrorAlert();
        return;
      }
      String path = AiFile.dir('assets.zip');
      _manager = SDKAssetsDownloadManager();
      _manager.download(url, path, isZip: true, onProgress: (count, total) {
        if (total <= 0) {
          print('00-_loadSDKAssets-下载异常-------');
          return;
        }
        //print('00-_loadSDKAssets-已下载：$count, 总共：$total, 进度：${(count / total * 100).toStringAsFixed(2)}%');
        _progress = count/total;
        _total = total;
        if (config.isTabSDK) { // TAB版回调给壳工程
          // 这里isDownloadEnd不能传true，会导致原生进度页面先移除，资源下载完成后还有一个资源的解压过程需要耗时处理
          XcSdkApi.downloadAssets(progress: _progress.toStringAsFixed(4), isDownloadEnd: 'false', count: count, total: total);
        } else { // ICON版更新本页面UI即可
          if(mounted) setState(() {});
        }
      }, onComplete: () async {
        print('00-assets download success');
        // 如果存在以前目录则删除
        Directory dir = Directory(AiFile.dir('assets'));
        try{
          bool hasOldDir = await dir.exists();
          if(hasOldDir) {
            await dir.delete(recursive:true);
            print('000-assets文件夹已删除');
          }
          else {
            print('000-没有assets文件夹');
          }
        }
        catch(e) {
          print('删除之前图片资源异常，error=$e');
          _checkRetry(false);
          return;
        }

        // 解压zip
        File sourceFile = File(path);
        bool s = await _unZipAssets(config.sdkAssetsModel.sdkAssetsDir);
        print('111-assets.zip已解压 success=$s');

        // 移除zip
        try{
          var ss = await _deleteFile(path);
          print('222-assets.zip已删除 success=$ss');
          print('333-exist1=${await sourceFile.exists()}, exist2=${await sourceFile.exists()}, exist3=${await dir.exists()}');
        }
        catch(e){
          print('移除zip 异常 error=$e');
          _checkRetry(false);
          return;
        }

        config.sdkAssetsModel.sdkAssetsQuery = false;
        AiCache.get().setString(AiCache.sdk_assets_version, config.sdkAssetsModel.sdkAssetsVersion); // 保存资源版本号
        AiCache.get().setString(AiCache.sdk_version, config.sdkAssetsModel.sdkVersion); // 保存SDK版本号
        if(config.isTabSDK) AiCache.get().setString(AiCache.app_version, config.appInfo.appVersion); // tab版在下载后才保存App版本号，避免资源没下载运营维护导致界面卡在下载页
        print('444-SDK资源版本已保存 version=${config.sdkAssetsModel.sdkAssetsVersion}');

        // 加载字体
        try {
          Directory fontsDir = Directory(AiFile.dir('assets/fonts'));
          bool hasFonts = await fontsDir.exists();
          if(TargetPlatform.iOS == defaultTargetPlatform){
            if(hasFonts) {
              Stream<FileSystemEntity>dirs = fontsDir.list();
              dirs.forEach((dir) async {
                print('dir.path=${dir.path}');
                if(dir.path.length > 0) await SDKFont.loadLocalFont(dir.path);
              });
            }
          }
          else {
            // 安卓因FlutterSDK bug不能使用动态字体，将字体保留本地，下载的字体给与删除操作
            await fontsDir.delete();
          }
        } catch (e) {
          print('字体加载失败e=$e');
        }

        print('666-准备展示主页');
        if(widget.complete != null) widget.complete();

        print('11-assets download success');
      }, onFailed: (e) async {
        print('00-_loadSDKAssets-下载失败：${ e.toString()}');
        if(e is DioError) {
          if(e.response.statusCode == 404) { // 移除访问不通的下载地址
            _remoteAssetsUrls.removeAt(_retryCount);
          }
          if(e.error is String && e.error.endsWith('application/zip') && !_didShowAssetsErrorToast) { // 资源包异常
            _didShowAssetsErrorToast = true;
            Fluttertoast.showToast(msg: '资源包异常，请联系运维处理~', gravity: ToastGravity.BOTTOM);
          }
        }
        print('00-_loadSDKAssets-下载失败');
        await _checkRetry();
        print('00-_loadSDKAssets-下载失败');
      });
    } catch (e) {
      print('000-dio error=$e');
      //if((e is DioError) && ((Platform.isAndroid && e.type == DioErrorType.RECEIVE_TIMEOUT) || e.type == DioErrorType.cancel)) return;
      //print('111-dio error=$e');
      await _checkRetry();
    }
  }

  Future<void> _checkRetry([bool increase=true]) async {
    if(increase) _retryCount++;
    
    if(_remoteAssetsUrls.length > _retryCount) {
      print("00-_retryCount=$_retryCount, _remoteAssetsUrls.length=${_remoteAssetsUrls.length}, 重试中....");
      await sleep(1*1000);
      await _loadSDKAssets();
    }
    else {
      // 网络异常，通知native层弹框反馈给用户
      print('11-_checkRetry');
      _retryCount = 0;
      _showNetErrorAlert();
    }
  }

  void _showNetErrorAlert() async {
    print('00-_showNetErrorAlert--_didShowAlert=$_didShowAlert');
    if(_didShowAlert) return;
    _didShowAlert = true;

    if(config.isTabSDK) {
      print('11-_showNetErrorAlert--isTabSDK');
      XcSdkApi.downloadAssetsError(); // 通知native弹框
      print('22-_showNetErrorAlert--isTabSDK');
    }
    else {
      print('11-_showNetErrorAlert--isIconSDK');
      TextAlert.of(context).showAlert(
        message: '${config.langMap['baseLang']['networkError']['networkErrorRetry3']}',
        buttonName: '${config.langMap['baseLang']['abort']}',
        rightButtonName: '${config.langMap['baseLang']['retry']}',
        isDismissible: false,
        onButton: (idx) async {
          _didShowAlert = false;

          print('22-_showNetErrorAlert-idx=$idx');
          if(idx == 0) { // 退出
            print('33-onButton-退出');
            await XcSdkApi.loginOut();
          }
          else { // 重试
            print('33-onButton-重试');
            await _loadSDKAssets();
          }
        }
      );
      print('44-_showNetErrorAlert--isIconSDK');
    }
  }

  void _nativeNotifyFlutterRetryLoadAssets(event) async { // TAB版，native通知flutter重新下载资源
    _didShowAlert = false;
    _retryCount = 0;
    await _loadSDKAssets();
    print('0000000-retryLoadAssets-重新加载资源包------');
  }

  void _networkDidChanged(NetworkStateEvent event) async {
    if(config.isNotConnect) {
      try{
        _manager.cancel();
        _manager = null;
        print('00-_networkDidChanged');
      }
      catch(e){
        print('00-_networkDidChanged-获取zip包大小异常,error=$e');
      }
      _showNetErrorAlert();
    }
  }

  Future<bool> _unZipAssets(String docsPath) async {
    String filePath = '$docsPath/assets.zip';
    try {
      final bytes = File(filePath).readAsBytesSync();
      final archive = ZipDecoder().decodeBytes(bytes);
      for (final file in archive) {
        final filename = file.name;
        final path = '$docsPath/' + filename;
        if (file.isFile) {
          final data = file.content as List<int>;
          File(path)
            ..createSync(recursive: true)
            ..writeAsBytesSync(data);
        } else {
          Directory(path)
            ..create(recursive: true);
        }
      }
      return true;
    } catch (e) {
      print('_unZipAssets e = $e');
    }
    return false;
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
}