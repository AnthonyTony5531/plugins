'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/**********************************************************************
 * web的js 和 flutter 的交互工具类
 * date:2019-12-11
 * 当前版本：1.0.0
 * 修改记录：
 * 版本    |   修改人  | 修改内容
 * 1.0.0       sam    提供具有与flutter交互基础能力.支持请求参数，响应结果。
 **********************************************************************
 */

var _xcjsRequestMap = new Map();

var Tag = 'xcFlutterJsSDk>>';

var XCJSResponseData = window.XCJSResponseData = function XCJSResponseData() {
  var code = arguments.length <= 0 || arguments[0] === undefined ? 0 : arguments[0];
  var message = arguments.length <= 1 || arguments[1] === undefined ? '' : arguments[1];
  var data = arguments.length <= 2 || arguments[2] === undefined ? '' : arguments[2];

  _classCallCheck(this, XCJSResponseData);

  this.code = code;
  this.message = message;
  this.data = data;
};

var XCJSRequestParam = window.XCJSRequestParam = function XCJSRequestParam() {
  var action = arguments.length <= 0 || arguments[0] === undefined ? '' : arguments[0];
  var method = arguments.length <= 1 || arguments[1] === undefined ? '' : arguments[1];
  var params = arguments[2];
  var callback = arguments[3];

  _classCallCheck(this, XCJSRequestParam);

  this.action = action;
  this.method = method;
  this.requestId = createRequestId(action, method);
  this.callback = callback;
  this.params = params;
  this.execute = function (data) {
    if (this.callback !== null) {
      return this.callback(data);
    }
  };
};

var XCFlutterJSSDK = function () {
  function XCFlutterJSSDK() {
    _classCallCheck(this, XCFlutterJSSDK);
  }

  _createClass(XCFlutterJSSDK, [{
    key: 'request',
    value: function request(_param) {
      var requestId = _param.requestId;
      _xcjsRequestMap.set(requestId, _param);
      var sendData = packageParam(_param);
      try {
        window.xcjsmanager.postMessage(sendData);
      } catch (e) {
        console.log(e);
      }
      return _param;
    }
  }]);

  return XCFlutterJSSDK;
}();

var xcFlutterJsSDk = window.xcFlutterJsSDk = new XCFlutterJSSDK();

function createRequestId(_action, _method) {
  return 'xc_requestId_$' + _action + '_$' + _method + '_$' + new Date().getTime();
}

function packageParam(_param) {
  var json = {
    'action': _param.action,
    'method': _param.method,
    'requestId': _param.requestId,
    'params': _param.params
  };
  var jsonStr = JSON.stringify(json);
  return encode(jsonStr);
}

function encode(text) {
  return window.Base64.encode(text);
}

// function decode (text) {
//   return window.Base64.decode(text)
// }

function xcFlutterJSSDKCallback(_data) {
  try {
    console.log(Tag + 'xcFlutterJSSDKCallback enter>>');
    // const json = JSON.parse(decode(_data))
    var json = _data;
    console.log(Tag + 'xcFlutterJSSDKCallback json>>' + JSON.stringify(json));
    // const code = json['code']
    // const message = json['message']
    // const data = json['data']
    var requestId = json['requestId'];
    var requestParam = _xcjsRequestMap.get(requestId);
    // if (requestParam !== null) {
    //   _xcjsRequestMap.delete(requestParam)
    //   requestParam.execute(new XCJSResponseData(code, message, data))
    // }
    if (requestParam !== null) {
      requestParam.execute(json);
    }
  } catch (e) {
    console.log(Tag + e);
  }
}
window.xcFlutterJSSDKCallback = xcFlutterJSSDKCallback;
function testJSExits() {
  window.location = 'http://dev.m.xc.com/';
}
window.testJSExits = testJSExits;