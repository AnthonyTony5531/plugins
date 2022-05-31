import 'dart:async';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'loading_widget/loading_circular.dart';

enum WebLoadState {
  loading,
  show,
  error,
}

// Web错误最大次数
final int _errorCountMax = 20;
// web地址连接超时最大时间(秒)
final int _connectOutTimeMax = 120;
// web虚拟体育标签检索最大次数
final int _checkCountMax = 40;

/// 虚拟体育WebView
class AiVMSportWebView extends StatefulWidget {


  final String sportType;

  AiVMSportWebView({Key key, @required this.sportType}) : super(key: key);

  @override
  _AiWebViewState createState() => _AiWebViewState();
}

class _AiWebViewState extends State<AiVMSportWebView> {
  WebViewController _controller;

  String _url = '';

  WebLoadState _state = WebLoadState.loading;
  int _loadCount = 0;
  int _errorCount = 0;
  Timer _outTimer; // 超时定时器，避免url地址不对，长时间停留在主页
  Timer _timer;
  Timer _showTimer;

  @override
  void initState() {
    super.initState();
    String url = '${config.vmApiConfig.vmSportDetailHost}${config.vmApiConfig.vmSportDetailPath}';
    String clientId = config.vmApiConfig.clientId;
    String lang = config.vmApiConfig.lang;
    String id = config.vmApiConfig.id;
    _url = '$url?clientId=$clientId&lang=$lang&product=${widget.sportType}&id=$id';
//    _url = 'http://dev.admin-main.xc.com/#/login/';
    print('vm_sport Url => $_url');

    WidgetsBinding.instance.addPostFrameCallback((d) {
      startOutTime();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    _showTimer?.cancel();
    _showTimer = null;
    _outTimer?.cancel();
    _outTimer = null;
    _controller?.clearCache();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_state == WebLoadState.show) {
      _outTimer?.cancel();
    }
    return Container(
      child: Stack(
        children: [
          WebView(
            initialUrl: getWebUrl(_url),
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) => _controller = controller,
//            navigationDelegate: (delegate){
//              return NavigationDecision.navigate;
//            },
            onPageFinished: (url) {
              print('onPageFinished Url ===> $url');
              if (_state != WebLoadState.show) {
                if (_state != WebLoadState.loading) {
                  _state = WebLoadState.loading;
                  _uploadState();
                }
                _outTimer?.cancel();
                _loadCount = 0;
                startTimer();
              }
            },
            onWebResourceError: (_) {
              _errorCount++;
              if (_errorCount > _errorCountMax) {
                _errorCount = 0;
                _controller.reload();
              }
//              _timer.cancel();
//              _state = WebLoadState.error;
//              _uploadState();
            },
//            navigationDelegate: (navigation) {
//              print('AiVMSportWebView navigation ===> ${navigation.url}');
//              return NavigationDecision.navigate;
//            },
          ),
          _buildLoadingView(),
          _buildErrorView(),
        ],
      ),
    );
  }

  // 正在加载
  Widget _buildLoadingView() {
    if (_state == WebLoadState.loading) {
      return Positioned.fill(
        child: Container(
          color: Color(0xfff5f6fa),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${config.langMap['baseLang']['search']['loading']}'),
              SizedBox(height: 16.0),
              LoadingCircular(size: 30.0),
            ],
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }

  Widget _buildErrorView() {
    if (_state == WebLoadState.error) {
      String networkTitle = config.langMap['baseLang']['square']['networkTitle'];
      return Positioned.fill(
        child: GestureDetector(
          onTap: () {
            if (_state == WebLoadState.error) {
              startOutTime();
              _state = WebLoadState.loading;
              _loadCount = 0;
              _controller?.reload();
              _uploadState();
            }
          },
          child: Container(
            color: Color(0xfff5f6fa),
            child: Center(
              child: TextHelper.build(
                networkTitle,
                fontSize: 14.0,
                textColor: 0xff333333,
              ),
            ),
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }

  void startOutTime() {
    _outTimer?.cancel();
    _outTimer = Timer(Duration(seconds: _connectOutTimeMax), () {
      _state = WebLoadState.error;
      _uploadState();
    });
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 3000), (_) => _checkTypeElement());
  }

  void _uploadState() {
    if (mounted) setState(() {});
  }

  // 校验元素是否存在
  void _checkTypeElement() {
    try {
      if (_controller != null) {
        _controller.evaluateJavascript('document.querySelector("div[data-sport=${widget.sportType}]").textContent').then((value) {
          print('检索web textContent =========================> $value');
          if (value != null && value != '' && value != 'null') {
            _controller.evaluateJavascript('document.querySelector("div[data-sport=${widget.sportType}]").click()').then((value) {
              print('模拟 web 点击 click =========================>');
              _showWebView();
            });
          } else {
            _loadCount++;
          }
        });
      } else {
        _loadCount++;
      }
    } catch (e) {
      _loadCount++;
    }

    if (_loadCount >= _checkCountMax) {
      _timer?.cancel();
      _state = WebLoadState.error;
      _uploadState();
    }
  }

  void _showWebView() {
    if (_state == WebLoadState.show) return;
    _showTimer?.cancel();
    _showTimer = Timer(Duration(milliseconds: 1500), () {
      _timer?.cancel();
      _state = WebLoadState.show;
      _uploadState();
    });
  }
}
