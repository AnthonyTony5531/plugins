import 'js_protocol_const.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-09
 **********************************************************************
 */

//url 解析工具
class XCUrlParser {
  final String url;

  XCUrlParser(this.url);

  String _controllerName;

  //控制器名字
  String get controllerName {
    if (null == _controllerName) {
      try {
        int startPosition = (JsProtocolConst.WebViewProtocolName + '/').length;
        _controllerName =
            url.substring(startPosition, url.indexOf('/', startPosition + 1));
      } catch (e) {}
    }
    return _controllerName;
  }

  String _methodName;

  //方法名字
  String get methodName {
    if (null == _methodName) {
      try {
        int startPosition = (JsProtocolConst.WebViewProtocolName + '/').length +
                controllerName?.length ??
            0 + '/'.length;
        _methodName = url.substring(startPosition + 1,
            hasNotParams ? url.length : url.indexOf('?', startPosition + 1));
      } catch (e) {}
    }
    return _methodName;
  }

  bool get hasNotParams {
    return -1 == url.indexOf('?');
  }

  String _param;

  //调用参数
  String get params {
    int equalStrPosition =  url.indexOf('=');
    if (-1 ==equalStrPosition) {
      return null;
    }
    try {
      _param = url.substring(equalStrPosition+1, url.length);
    } catch (e) {}
    return _param;
  }
}
