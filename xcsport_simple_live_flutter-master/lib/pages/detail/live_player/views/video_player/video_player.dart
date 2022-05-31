/*
import 'dart:async';
import 'package:fast_ai/api/http.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/pages/detail/live_player/live_player_controller.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/model_controller_builder.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

typedef AiWebVideoPlayerStatusBuilder = Widget Function(dynamic state);
typedef AiWebVideoPlayerWebViewBuilder = Widget Function(AiWebVideoPlayerState state);

class AiWebVideoPlayer extends StatefulWidget {
  final String url;
  final AiWebVideoPlayerController controller;
  final AiVideoType videoFormat;
  final Size size;
  final bool autoRotate;
  final bool autoPlayer;
  final AiWebVideoPlayerStatusBuilder statusBuilder;
  final AiWebVideoPlayerWebViewBuilder webviewBuilder;
  AiWebVideoPlayer(
      {this.autoRotate = true,
        this.statusBuilder,
        this.webviewBuilder,
        Key key,
        this.autoPlayer = true,
        @required this.url,
        @required this.controller,
        this.videoFormat = AiVideoType.weburl,
        this.size})
      : super();

  @override
  _AiWebVideoPlayerState createState() => _AiWebVideoPlayerState();
}

class _AiWebVideoPlayerState extends State<AiWebVideoPlayer> {
  WebViewController webViewController;
  VideoPlayerController videoController;
  // TODO: ChewieController没用到 暂时注释
  //ChewieController chewieController;
  // IjkMediaController _ijkController;
  AiPlayerMode mode;

  AiFluxMode fluxMode;

  StreamSubscription<dynamic> _ijkStatusSubscription;

  Future<void> pauseOthers() async {
    // await _ijkController?.pauseOtherController();
  }

  void play() {
    //改为直接重新reload
    // reload();
    if (widget.controller.state == AiWebVideoPlayerState.Error) {
      reload();
    } else {
      if (mode == AiPlayerMode.WebView) {
        webViewController?.evaluateJavascript('iconPlay();');
      } else if (mode == AiPlayerMode.Stream) {
        videoController?.play();
      } else if (mode == AiPlayerMode.IjkStream) {
        _ijkController?.play();
      }
      // TODO: AiPlayerMode.Stream没用到 暂时注释
      // else if (mode == AiPlayerMode.Stream) {
      //   videoController?.play();
      // }
      else if (mode == AiPlayerMode.IjkStream) {
        // _ijkController?.play();
      }
      widget.controller.firePlayerStateChanged(AiWebVideoPlayerState.Playing);
    }
  }

  void resume() {
    if (widget.controller.state == AiWebVideoPlayerState.Error) {
      reload();
    } else {
      if (mode == AiPlayerMode.WebView) {
        webViewController?.evaluateJavascript('iconPlay();');
      }
      // TODO: AiPlayerMode.Stream没用到 暂时注释
      // else if (mode == AiPlayerMode.Stream) {
      //   videoController?.play();
      // }
      else if (mode == AiPlayerMode.IjkStream) {
        // _ijkController.playOrPause();
      }
      widget.controller
          .firePlayerStateChanged(AiWebVideoPlayerState.Playing);
    }
  }

  Future<void> stop() async {
    if (mode == AiPlayerMode.WebView) {
      webViewController?.evaluateJavascript('iconPause();');
    }
    // TODO: AiPlayerMode.Stream没用到 暂时注释
    // else if (mode == AiPlayerMode.Stream) {
    //   await videoController?.pause();
    // }
    else if (mode == AiPlayerMode.IjkStream) {
      // await _ijkController?.pause();
    }
    widget.controller.firePlayerStateChanged(AiWebVideoPlayerState.Stop);
  }

  Future<bool> _isLoading() async {
    try {
      if (mode == AiPlayerMode.WebView) {
        var ret = await webViewController?.evaluateJavascript('isLoading();');
        print('isLoading $ret');
        return ret == 'true';
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  bool loop = false;
  bool _checkLoading = false;
  DateTime _startCheckTime = DateTime.now();
  bool loop1 = false;

  void _checkNetworkVideoPalying() async {
    if (loop1) return;
    loop1 = true;
    if (config.userInfo.isNetworkVideoPalying) {
      return;
    }
  }

  void _startRunCheckLoading() async {
    if (loop) return;
    loop = true;
    while (loop) {
      await sleep(3000);
      await checkIjkStatus();

      if (mode != AiPlayerMode.WebView) {
        continue;
      }
      if (_checkLoading == false) continue;
      if (await _isLoading()) {
        var diff = DateTime.now().difference(_startCheckTime);
        if (diff.inSeconds > 30) {
          stopCheckLoading();
          closeAllPlayer();
          widget.controller.firePlayerStateChanged(AiWebVideoPlayerState.Error);
        }
      } else {
        //结束本次检测
        stopCheckLoading();
      }
    }
  }

  void stopCheckLoading() {
    logInfo('结束本次播放状态检测');
    _checkLoading = false;
  }

  void startCheckLoading() async {
    await sleep(3000);
    logInfo('开始播放状态检测');
    _checkLoading = true;
    _startCheckTime = DateTime.now();
  }

  double currentPosition = 0;
  DateTime dateTime;

  Future checkIjkStatus() async {
    // if (_ijkController == null) {
    //   currentPosition = 0;
    //   dateTime = null;
    //   return;
    // }
    // if (_ijkController.ijkStatus != IjkStatus.playing) {
    //   currentPosition = 0;
    //   dateTime = null;
    //   return;
    // }
    //
    // VideoInfo info = await _ijkController.getVideoInfo();
    // print(info);
    //
    // if (currentPosition != info.currentPosition) {
    //   currentPosition = info.currentPosition;
    //   dateTime = DateTime.now();
    // }
    // //说明卡住了
    // if (currentPosition != 0 &&
    //     dateTime != null &&
    //     currentPosition == info.currentPosition) {
    //   var diff = DateTime.now().difference(dateTime);
    //   logInfo("卡住 ${diff.inSeconds} 秒");
    //   //卡了30秒
    //   if (diff.inSeconds > 20) {
    //     //
    //     logInfo("卡住超时->重新播放");
    //     var ret = changeFloatWidgetOnly();
    //     if (ret == false) {
    //       _ijkController.reset();
    //       await _ijkController.setDataSource(
    //         DataSource.network(_url),
    //         autoPlay: widget.autoPlayer,
    //       );
    //     }
    //   }
    // }
  }

  void reload() {
    if (mounted) {
      setState(() {
        _url = "";
      });
    }
  }

  void mute() {
    setVolume(0);
  }

  void open() {
    setVolume(0.5);
  }

  Future<void> seekTo(double progress) async {
    if (mode == AiPlayerMode.IjkStream) {
      // VideoInfo info = await _ijkController.getVideoInfo();
      // await _ijkController.seekTo(progress * info.duration);
    }
  }

  Future<double> getProgress() async {
    if (mode == AiPlayerMode.IjkStream) {
      // if (_ijkController != null) {
      //   VideoInfo info = await _ijkController.getVideoInfo();
      //   return info.progress;
      // }
    }
    return 0;
  }

  Future<double> getDuration() async {
    if (mode == AiPlayerMode.IjkStream) {
      // if (_ijkController != null) {
      //   VideoInfo info = await _ijkController.getVideoInfo();
      //   return info.duration;
      // }
    }
    return 0;
  }

  void setVolume(double value) async {
    // if(defaultTargetPlatform == TargetPlatform.android){
    //   try {
    //     Volume.controlVolume(AudioManager.STREAM_MUSIC);
    //     var maxValue = await Volume.getMaxVol;
    //     await Volume.setVol((value * maxValue).toInt());
    //     return;
    //   } catch (e) {
    //     logError(e);
    //   }
    // }

    // TODO: AiPlayerMode.Stream没用到
    // if (mode == AiPlayerMode.Stream) {
    //   videoController?.setVolume(value);
    // }
    if (mode == AiPlayerMode.IjkStream) {
      // var currentValue = await _ijkController?.getSystemVolume();
      // _ijkController?.setSystemVolume(60);
      // _ijkController?.setSystemVolume(10000);
      // _ijkController?.setSystemVolume((value * 100).toInt());
    }
    if (value == 0) {
      if (mode == AiPlayerMode.WebView) {
        webViewController?.evaluateJavascript('iconMute2();');
        webViewController?.evaluateJavascript('iconMute();');
      }
    } else if (value > 0) {
      if (mode == AiPlayerMode.WebView) {
        webViewController?.evaluateJavascript('iconMute();');
      }
    }
  }

  @override
  void initState() {
    updateMode();
    _startRunCheckLoading();
    _checkNetworkVideoPalying();
    widget.controller?.vstate = this;
    super.initState();
  }

  @override
  void dispose() {
    loop = false;
    closeAllPlayer(true);
    widget.controller.firePlayerStateChanged(AiWebVideoPlayerState.None);
    widget.controller?.vstate = null;
    config.userInfo.isNetworkVideoPalying = true;
    _ijkStatusSubscription?.cancel();
    super.dispose();
  }

  closeAllPlayer([bool directed = false]) {
    try {
      if (videoController != null) {
        if (directed) {
          try {
            videoController?.dispose();
            //chewieController?.dispose();
          } catch (e) {
            logError(e);
          }
        } else {
          var vc1 = videoController;
          //var vc2 = chewieController;
          videoController = null;
          //chewieController = null;
          Future.delayed(Duration(seconds: 1), () {
            try {
              vc1?.dispose();
              //vc2?.dispose();
            } catch (e) {
              logError(e);
            }
          });
        }
      }
    } catch (e) {
      logError(e);
    }

    try {
      // if (_ijkController != null) {
      //   if (directed) {
      //     try {
      //       _ijkController?.dispose();
      //     } catch (e) {
      //       print(e);
      //     }
      //   } else {
      //     var vc1 = _ijkController;
      //     _ijkController = null;
      //     try {
      //       vc1?.dispose();
      //     } catch (e) {
      //       print(e);
      //     }
      //   }
      // }
    } catch (e) {
      logError(e);
    }

    if (this.webViewController != null) {
      try {
        this.webViewController?.loadUrl('about:blank');
      } catch (e) {}
      this.webViewController = null;
    }
  }

  bool needChangeUrl = false;

  updateMode() {
    needChangeUrl = false;
    if (widget.videoFormat == AiVideoType.weburl) {
      mode = AiPlayerMode.WebView;
    } else if (widget.videoFormat == AiVideoType.loadWeburl) {
      mode = AiPlayerMode.IjkStream;
      needChangeUrl = true;
    } else {
      mode = AiPlayerMode.IjkStream;
    }
  }

  String _url = "";
  int _keyCount = 0;

  updateUrl(String url) async {
    if (_url == url) return;
    _url = url;
    _keyCount++;

    closeAllPlayer();
    logInfo('video player playing url : $_url');
    if (mode == AiPlayerMode.IjkStream) {
      widget.controller.firePlayerStateChanged(AiWebVideoPlayerState.Loading);
      await createIjkPlayer();
    } else {
      widget.controller.firePlayerStateChanged(AiWebVideoPlayerState.PageLoading);
    }
    if (mounted) setState(() {});
  }

  // List<IjkMediaController> ijkList = [];

  createIjkPlayer() async {
    closeAllPlayer();
    // _ijkController = IjkMediaController(autoRotate: widget.autoRotate);
    // ijkList.add(_ijkController);
    // var ijk = _ijkController;

    // try {
    //   widget.controller
    //       .firePlayerStateChanged(mode, AiWebVideoPlayerState.Loading);
    //   var url = await getUrl();
    //   // url = url + "abc";
    //   //解决m3u8文件拖动问题 比如:一个3个多少小时的音频文件，开始播放几秒中，然后拖动到2小时左右的时间，要loading 10分钟
    //   var option1 = IjkOption(IjkOptionCategory.format, "fflags", "fastseek");
    //   //是否开启预缓冲，一般直播项目会开启，达到秒开的效果，不过带来了播放丢帧卡顿的体验
    //   var option2 = IjkOption(IjkOptionCategory.player, "packet-buffering", 1);
    //   //播放重连次数
    //   var option3 = IjkOption(IjkOptionCategory.player, "reconnect", 5);
    //   //跳帧处理,放CPU处理较慢时，进行跳帧处理，保证播放流程，画面和声音同步
    //   var option4 = IjkOption(IjkOptionCategory.player, "framedrop", 1);
    //   //设置之后，高码率m3u8的播放卡顿，声音画面不同步，或者只有画面，没有声音，或者声音画面不同步
    //   var option5 =
    //   IjkOption(IjkOptionCategory.player, "enable-accurate-seek", 1);
    //   //播放前的探测Size，默认是1M, 改小一点会出画面更快
    //   var option6 = IjkOption(IjkOptionCategory.player, "probesize", 1024 * 10);
    //   //设置播放前的探测时间 2,达到首屏秒开效果
    //   var option7 = IjkOption(IjkOptionCategory.format, "analyzeduration", 2);
    //
    //   //第一个map4视频是https开头，下一个http开头不能播放，反之也是，非首次播放时被还原问题
    //   var option8 = IjkOption(IjkOptionCategory.format, "dns_cache_clear", 1);
    //   // 最大探测时间
    //   var option9 =
    //   IjkOption(IjkOptionCategory.format, "analyzemaxduration", 5);
    //   //降低针绿
    //   var option10 = IjkOption(IjkOptionCategory.format, "max-fps", 30);
    //   //关闭环路过滤，降低画质开销
    //   var option11 = IjkOption(IjkOptionCategory.codec, "skip_loop_filter", 48);
    //   List<IjkOption> options = [
    //     option1,
    //     option2,
    //     option3,
    //     option4,
    //     option5,
    //     option6,
    //     option7,
    //     option8,
    //     option9,
    //     option10,
    //     option11,
    //   ];
    //   ijk.setIjkPlayerOptions(
    //     [TargetPlatform.iOS, TargetPlatform.android],
    //     options.toSet(),
    //   );
    //   // ijk.setSpeed(1.0);
    //   //停止其它的播放
    //   await ijk.setDataSource(
    //     DataSource.network(url),
    //     autoPlay: widget.autoPlayer,
    //   );
    // } catch (e) {
    //   widget.controller
    //       .firePlayerStateChanged(mode, AiWebVideoPlayerState.Error);
    // }
    //
    // try {
    //   if (ijk != _ijkController) {
    //     ijk.dispose();
    //   }
    // } catch (e) {
    //   logError(e);
    // }
  }

  onProgressChangingChanged() {
    if (widget.controller.progressChanging != null) {
      // widget.controller.progressChanging(_ijkController.videoInfo.progress);
    }
  }

  Future<String> getUrl() async {
    if (!needChangeUrl) return _url;
    var html = await HttpRequest.dget(_url);
    var pattern = RegExp("\"(https:\\\\.+?)\"");
    var matchs = pattern.allMatches(html);
    var urls = matchs
        .map((f) => f.group(1))
        .map((f) => f.replaceAll('\\/', '/'))
        .where((f) => f.indexOf('room') != -1)
        .toList();
    var flvurl = urls.where((f) => f.indexOf('.flv') != -1).toList();
    if (flvurl != null && flvurl.length > 0) {
      var hdidx = flvurl.indexWhere((f) => f.indexOf('hd') != -1);
      if (hdidx != -1) return flvurl.toList()[hdidx];
      return flvurl.first;
    }
    return _url;
  }

  videoStreamPlayerListener(int keyCount) {
    if (videoController?.value == null) return;
    if (keyCount != _keyCount) return;

    var initialized = videoController.value.isInitialized;
    var isPlaying = videoController.value.isPlaying;
    var isBuffering = videoController.value.isBuffering;

    if (initialized) {
      if (isPlaying) {
        widget.controller.firePlayerStateChanged(AiWebVideoPlayerState.Playing);
      } else {
        widget.controller.firePlayerStateChanged(AiWebVideoPlayerState.Stop);
      }
    } else if (initialized == false &&
        isPlaying == false &&
        isBuffering == false) {
      print('playing $isPlaying isBuffering:$isBuffering initialized:$initialized');
      widget.controller.firePlayerStateChanged(AiWebVideoPlayerState.Error);
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.controller?.vstate = this;
    updateMode();
    var url = '${widget.url}';
    if (url.contains('openbacksourcebtn')) {
      url =
      '${widget.url}&opendmcontrolbtn=false&backsourceurl=false&showloadinglogo=false&backsourceurl=false';
    }
    updateUrl(url);

    if (mode == AiPlayerMode.WebView) {
      return Stack(
        children: [
          WebView(
            key: Key('key_$_keyCount'),
            initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
            // initialUrl: 'https://smtv.io/embed_player/2323780.html?openbacksourcebtn=false&opendmcontrolbtn=false',
            initialUrl: isNullOrEmpty(_url) ? "about:blank" : _url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webc) {
              print('onWebViewCreated : $url');
              this.webViewController = webc;
              widget.controller.firePlayerStateChanged(AiWebVideoPlayerState.PageLoading);
            },
            onPageStarted: (url) {
              print('onPageStarted : $url');
            },
            onPageFinished: (url) async {
              print('onPageFinished : $url');
              if (webViewController == null) return;

              bool loadSuccessfull = await checkPlayWebViewSuccessful();
              print('onPageFinished loadSuccessfull : $loadSuccessfull');

              //如果播放失败
              if (!loadSuccessfull) {
                widget.controller.firePlayerStateChanged(AiWebVideoPlayerState.Error);
                if( widget.webviewBuilder !=  null){
                  if(mounted){
                    setState(() {

                    });
                  }
                }
                return;
              }
              webViewController.evaluateJavascript(
                  'function iconPlay(){\$(".icon-play3").click();}');
              webViewController.evaluateJavascript(
                  'function iconPause(){\$(".icon-pause2").click();}');
              webViewController.evaluateJavascript(
                  'function iconMute2(){\$(".icon-volume-mute2").click();}');
              webViewController.evaluateJavascript(
                  'function iconMute(){\$(".live-control-bar-icon-play3-area").click();}');

              webViewController.evaluateJavascript(
                  'function isPlaying(){return \$("#video-main-dplayer").attr("class").indexOf("dplayer-playing") != -1;}');
              webViewController.evaluateJavascript(
                  'function isPaused(){return \$("#video-main-dplayer").attr("class").indexOf("dplayer-paused") != -1;}');
              webViewController.evaluateJavascript(
                  'function isLoading(){return \$("#video-main-dplayer").attr("class").indexOf("dplayer-loading") != -1;}');

              //$("#video-main-dplayer").attr("class").indexOf("dplayer-playing") != -1
              //$("#video-main-dplayer").attr("class").indexOf("dplayer-paused") != -1
              //$("#video-main-dplayer").attr("class").indexOf("dplayer-loading") != -1

              // print("InAppWebViewController loaded finished ...");

              play();
              if( widget.webviewBuilder !=  null){
                if(mounted){
                  setState(() {

                  });
                }
              }
              //启动视频加载超时检测
              startCheckLoading();
            },
          ),
          if(widget.webviewBuilder != null)widget.webviewBuilder(widget.controller.state ?? AiWebVideoPlayerState.Loading)
        ],
      );
    }
    // TODO: AiPlayerMode.Stream没用到，暂时注释
    // else if (mode == AiPlayerMode.Stream) {
    //   if (chewieController != null) {
    //     // return Container();
    //     return Chewie(
    //       key: Key('key_$_keyCount'),
    //       controller: chewieController,
    //     );
    //   } else {
    //     return Container();
    //   }
    // }
    else if (mode == AiPlayerMode.IjkStream) {
      if (_ijkController != null) {
        var ijkPlayer = IjkPlayer(
          key: Key('key_$_keyCount'),
          mediaController: _ijkController,
          controllerWidgetBuilder: (mediaController) {
            return Container();
          },
          statusWidgetBuilder: (BuildContext context,
              IjkMediaController controller, IjkStatus status) {
            print('IjkStatus : $status');
            updateIjkStatus(status);

            if (status == IjkStatus.noDatasource) {
              widget.controller
                  .firePlayerStateChanged(mode, AiWebVideoPlayerState.Stop);
              if (null != widget.statusBuilder) {
                return widget.statusBuilder(status);
              }
              return Container();
            } else if (status == IjkStatus.preparing) {
              widget.controller
                  .firePlayerStateChanged(mode, AiWebVideoPlayerState.Loading);
              if (null != widget.statusBuilder) {
                return widget.statusBuilder(status);
              }
              return Container();
            } else if (status == IjkStatus.prepared) {
              widget.controller
                  .firePlayerStateChanged(mode, AiWebVideoPlayerState.Playing);
              if (null != widget.statusBuilder) {
                return widget.statusBuilder(status);
              }
              return Container();
            } else if (status == IjkStatus.complete) {
              widget.controller
                  .firePlayerStateChanged(mode, AiWebVideoPlayerState.Stop);
              if (null != widget.statusBuilder) {
                return widget.statusBuilder(status);
              }
              return Container();
            } else if (status == IjkStatus.error) {
              widget.controller
                  .firePlayerStateChanged(mode, AiWebVideoPlayerState.Error);
              if (null != widget.statusBuilder) {
                return widget.statusBuilder(status);
              }
              return Container();
            } else if (status == IjkStatus.pause) {
              widget.controller
                  .firePlayerStateChanged(mode, AiWebVideoPlayerState.Stop);
              if (null != widget.statusBuilder) {
                return widget.statusBuilder(status);
              }
              return Container();
            } else if (status == IjkStatus.playing) {
              widget.controller
                  .firePlayerStateChanged(mode, AiWebVideoPlayerState.Playing);
              if (null != widget.statusBuilder) {
                return widget.statusBuilder(status);
              }
            } else if (status == IjkStatus.complete) {
              widget.controller.firePlayerStateChanged(
                  mode, AiWebVideoPlayerState.completed);
              if (null != widget.statusBuilder) {
                return widget.statusBuilder(status);
              }
            } else {
              if (null != widget.statusBuilder) {
                return widget.statusBuilder(status);
              }
            }
            return IjkStatusWidget.buildStatusWidget(
                context, controller, status);
          },
        );
        _ijkStatusSubscription?.cancel();
        _ijkStatusSubscription = _ijkController.ijkStatusStream.listen((status) {
          if (status == IjkStatus.playing) {
            if(config.isTabSDK && Platform.isAndroid) config?.sdkApi?.videoStateChanged?.fire(AiWebVideoPlayerState.Playing);
          }
        });

        return ijkPlayer;
        // return ijkPlayer;
      } else {
        return Container();
      }
    }
    return Container();
  }

  //检测播放webview是否播放成功
  Future<bool> checkPlayWebViewSuccessful() async {
    String sourceType;
    try {
      sourceType = await webViewController?.evaluateJavascript('source_type');
    } catch (e) {
      sourceType = null;
    }
    print(' source_type is null-string : ${'null' == sourceType}');
    return null != sourceType && "null" != sourceType;
  }
}

class AiWebVideoPlayerController extends LivePlayerChildController {
  double progress = 0.0;

  _AiWebVideoPlayerState vstate;

  void dispose() {
    vstate?.closeAllPlayer(true);
  }

  Future<void> pauseOthers() async {
    await vstate?.pauseOthers();
  }

  void play() {
    // videoPlayerKey.currentState?.play();
    vstate?.reload();
  }

  bool get isPlaying => state == AiWebVideoPlayerState.Playing;
  bool get isPaused => state == AiWebVideoPlayerState.Stop;
  bool get isError =>  state == AiWebVideoPlayerState.Error ||  state == AiWebVideoPlayerState.completed ;

  void resume() {
    // videoPlayerKey.currentState?.play();
    vstate?.play();
  }

  Future<void> stop() async {
    await vstate?.stop();
  }

  void reload() {
    vstate?.reload();
  }

  // void setVolume(double value){
  //   videoPlayerKey.currentState?.setVolume(value);
  // }

  void mute() {
    vstate?.mute();
  }

  Future<void> seekTo(double progress) async {
    await vstate?.seekTo(progress);
  }

  void open() {
    vstate?.open();
  }

  AiWebVideoPlayerState state = AiWebVideoPlayerState.None;
  var playStateChanged = ValueChangedListener<AiWebVideoPlayerState>();

  firePlayerStateChanged(/*AiPlayerMode tag, 没用到注释了*/AiWebVideoPlayerState state) {
    if (this.state == state) return;

    this.state = state;
    //print('AiWebVideoPlayerState $tag $state');
    if(config.isTabSDK) config?.sdkApi?.videoStateChanged?.fire(state);
    playStateChanged.fire(state);
  }

  Future<double> getProgress() async {
    if (vstate != null) return await vstate.getProgress();
    return 0;
  }

  Future<double> getDuration() async {
    if (vstate != null) return await vstate.getDuration();
    return 0;
  }

  ValueChanged<double> progressChanging;
}


enum AiWebVideoPlayerState {
  None,
  Stop,
  PageLoading,
  Loading,
  Playing,
  completed,
  Error
}

enum AiFluxMode {
  OnlyWifi, //只允许wif
  ArrowMobile, //允许移动播放
}

enum AiPlayerMode {
  WebView,
  IjkStream,
}

enum AiVideoType {
  unknow,
  weburl,
  loadWeburl,
  flv,
  live,
  rtmp,
  m3u8,
}
 */
