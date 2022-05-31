import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

enum SDKAssetsDownloadStatus {
  loading,
  pause,
  complete,
  cancel,
  error,
}

class SDKAssetsDownloadManager {
  factory SDKAssetsDownloadManager() => _getManager();
  static SDKAssetsDownloadManager _ins;
  SDKAssetsDownloadManager._();

  static SDKAssetsDownloadManager _getManager() {
    if (_ins == null) {
      _ins = SDKAssetsDownloadManager._();
    }
    return _ins;
  }

  StreamSubscription<List<int>> _subscription;
  CancelToken _cancelToken;
  /// 下载url
  String _url;
  /// 文件保存路径
  String _path;
  bool _isZip = false;

  ProgressCallback _onProgress;
  VoidCallback _onComplete;
  ValueChanged _onFailed;

  SDKAssetsDownloadStatus _status;
  SDKAssetsDownloadStatus get status => _status;
  bool get isLoading => _status == SDKAssetsDownloadStatus.loading;
  bool get isPause => _status == SDKAssetsDownloadStatus.pause;
  bool get canRestart => _status.index > SDKAssetsDownloadStatus.complete.index;
  //bool get canResume => _status != SDKAssetsDownloadStatus.loading || _status != SDKAssetsDownloadStatus.complete;

  void pause() {
    print('00-SDKAssetsDownloadManager-pause');
    //if(_subscription?.isPaused ?? false) return;
    if(isPause) return;
    print('11-SDKAssetsDownloadManager-pause');
    _status = SDKAssetsDownloadStatus.pause;
    _subscription?.pause();
  }

  void cancel() {
    print('00-SDKAssetsDownloadManager-cancel');
    if(_status == SDKAssetsDownloadStatus.cancel) return;
    print('11-SDKAssetsDownloadManager-cancel');
    _status = SDKAssetsDownloadStatus.cancel;

    if(_cancelToken == null || _subscription == null) return;
    try {
      _subscription?.cancel();
      _cancelToken?.cancel();
    }
    catch(e) {
      print('22-SDKAssetsDownloadManager-cancel error = $e');
    }
    finally {
      _cancelToken = null;
      _subscription = null;
    }
    print('33-SDKAssetsDownloadManager-cancel');
  }

  void resume() {
    print('00-SDKAssetsDownloadManager-resume');
    //if(_subscription?.isPaused == false) return;
    if(!isPause) return;
    print('11-SDKAssetsDownloadManager-resume');

    _status = SDKAssetsDownloadStatus.loading;
    try {
      _subscription?.resume();
    }
    catch(e) {
      print('22-SDKAssetsDownloadManager-resume error = $e');
    }
    print('33-SDKAssetsDownloadManager-resume');
  }

  void _reset() {
    print('00-SDKAssetsDownloadManager-_reset');
    _url = null;
    _path = null;
    _onFailed = null;
    _onComplete = null;
    _onProgress = null;
    print('11-SDKAssetsDownloadManager-_reset');
    if(_subscription != null) {
      _subscription?.cancel();
      _subscription = null;
    }
    print('22-SDKAssetsDownloadManager-_reset');
  }

  Future<bool> restart() async {
    print('00-SDKAssetsDownloadManager-restart');
    if(_path == null || _url == null) return false;
    print('11-SDKAssetsDownloadManager-restart');
    if(isPause) {
      print('22-SDKAssetsDownloadManager-restart-resume');
      resume();
    }
    else {
      cancel();
      print('22-SDKAssetsDownloadManager-restart-download');
      await download(_url, _path, isZip: _isZip, onProgress: _onProgress, onComplete: _onComplete, onFailed: _onFailed);
    }
    print('22-SDKAssetsDownloadManager-restart');
    return true;
  }

  Future download(
    String url,
    String path, {
      bool isZip = false,
      ProgressCallback onProgress,
      VoidCallback onComplete,
      ValueChanged onFailed,
      int downloadFileSize,
    }) async {
    _isZip = isZip ?? false;
    if(url == null || path == null || url.trim().length == 0 || path.trim().length == 0) {
      print("00-download-下载异常 url或path不能为空");
      cancel();
      _status = SDKAssetsDownloadStatus.error;

      if (onFailed != null) onFailed(DioError(error: 'url or path must not be null or empty'));
      return;
    }

    print('00-download-url=$url, path=$path');
    _url = url;
    _path = path;
    _onProgress = onProgress;
    _onComplete = onComplete;
    _onFailed = onFailed;
    _status = SDKAssetsDownloadStatus.loading;

    print("00-download");
    int start = 0;
    File file = File(path);
    if (await file.exists()) {
      start = file.lengthSync();
    }
    print("11-download-已下载字节：$start");

    var dio = Dio();
    //int fileSize = await _queryFileSize(dio, url);
    int fileSize = 0;
    try {
      if(downloadFileSize != null && downloadFileSize > 0){
        fileSize = downloadFileSize;
      } else {
        Response response = await dio.head(url);
        fileSize = int.parse(response.headers.value(Headers.contentLengthHeader));
        if(_isZip) {
          var contentType = response.headers.value(Headers.contentTypeHeader);
           if(contentType != 'application/zip') { // 类型不是zip
             cancel();
             if (onFailed != null) onFailed(DioError(error: 'link($url) response contentType is $contentType, not application/zip'));
             return;
           }
        }
      }
      if (onProgress != null) onProgress(start, fileSize);
    }
    catch (e) {
      print("22-download-下载失败，网络异常 error:" + e.toString());
      if(e is DioError) {
        DioError error = e;
        if(error?.response?.statusCode == 404) {
          // 移除访问不通的下载地址
        }
      }
      _status = SDKAssetsDownloadStatus.error;
      if(onFailed != null) onFailed(e);
      print('33-download-下载失败，网络异常');
      _reset();
      return;
    }

    print("44-download");
    if (start == fileSize) {//存在本地文件，命中缓存
      print('55-download-下载成功');
      _reset();
      _status = SDKAssetsDownloadStatus.complete;
      if(onComplete != null) onComplete();
      return;
    }

    print('66-download-文件总字节数 fileSize=$fileSize');
    _cancelToken = CancelToken();
    Future downloadFile(String url, int start) async {
      try {
        print('77-download-开始下载');
        dio.options.connectTimeout = 10 * 1000;
        dio.options.sendTimeout = 10 * 1000;
        dio.options.receiveTimeout = 15*60*1000;
        dio.options.followRedirects = false;
        dio.options.headers = {'range': 'bytes=$start-'};
        dio.options.responseType = ResponseType.stream;
        Response response = await dio.get(url, cancelToken: _cancelToken);
        /*
        Response response = await dio.get(
          url,
          cancelToken: _cancelToken,
          options: Options(
            responseType: ResponseType.stream,
            headers: {'range': 'bytes=$start-'},
            followRedirects: false,
            sendTimeout: 10000,
            receiveTimeout: 15*60*1000,
          ),
        );
        */
        print('88-download-开始下载');
        File file = File(path.toString());
        RandomAccessFile accessFile = file.openSync(mode: FileMode.append);

        int received = start;
        int total = fileSize;
        Stream<List<int>> stream = response.data.stream;
        Future asyncWrite;
        _subscription = stream.listen((data) {
          _subscription.pause();
          asyncWrite = accessFile.writeFrom(data).then((_) {
            received += data.length;
            if (onProgress != null) onProgress(received, total);

            if (_cancelToken == null || !_cancelToken.isCancelled) {
              _subscription.resume();
            }
          });
        },
          cancelOnError: true,
          onDone: () async {
            print('99-download-onDone');
            try {
              await asyncWrite;
              await accessFile.close();
              _status = SDKAssetsDownloadStatus.complete;

              if (onComplete != null) onComplete();
            } catch (e) {
              _status = SDKAssetsDownloadStatus.error;

              if (onFailed != null) onFailed(e);
            } finally {
              _reset();
            }
          },
          onError: (e) async {
            print('99-download-onError');
            try {
              await asyncWrite;
              await accessFile.close();
            } finally {
              cancel();
              //_reset();
              _status = SDKAssetsDownloadStatus.error;

              if (onFailed != null) onFailed(e);
            }
          });

//        _cancelToken?.whenCancel?.then((_) async {
//          print('00-SDKAssetsSDKAssetsDownloadManager-whenCancel');
//          reset();
//          _subscription?.cancel();
//
//          await asyncWrite;
//          await accessFile.close(); ///////////////// 多次关闭文件问题
//        });
      } catch (e) {
        print("10-download-下载异常 error=${e.toString()}");
        cancel();
        //_reset();
        _status = SDKAssetsDownloadStatus.error;

        if (onFailed != null) onFailed(e);
      }
    }
    print('11-download-start');
    await downloadFile(url, start);
  }
}

