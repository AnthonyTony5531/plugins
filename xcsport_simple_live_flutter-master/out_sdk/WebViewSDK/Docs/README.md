# AI WebViewSDK 说明文档

`此文档为引导H5接入SDK 调用SDK方法说明文档`

## 目录
##### [一、功能介绍及实现](#api-docs)
###### [1. Common类 Api 介绍](#api-docs)
>####### [1.1、获取网络状态（v1.0.0）](#api1)
>####### [1.2、获取用户信息（v1.0.0）](#api2)
>####### [1.3、关闭webview（v1.0.0）](#api3)

##### [二、H5接入说明](#h5-doc)
>> ###### [2.1、引入依赖包](#h5-lib)

##### [三、错误码说明](#error-code)
>> ###### [3.1、xcFlutterJSSDKCallback 错误码说明](#swift-start1)

##### [四、版本更新说明](#version-info)
>> ###### [4.1、版本更新记录](#edit-history)


>### <span id="api-docs" >一、功能介绍及实现</span>

>#### <span id="api1" >1.1、获取网络状态（v1.0.0）</span>
 ```
  function isApp() {
    return !!window.xcjsmanager
  }
  if (isApp()) {
    xcFlutterJsSDk.request(new XCJSRequestParam('common', 'netState', null, function (data) {
        // TODO
        console.log(data.state);
    }));
  }
```
 返回数据
 type NetState = 0 | 1 | 2;
 0: wifi
 1: 移动蜂窝流量
 2: 无网络
 
 
 
>#### <span id="api2" >1.2、获取用户信息（v1.0.0）</span>


 ```
  function isApp() {
    return !!window.xcjsmanager
  }
  if (isApp()) {
    xcFlutterJsSDk.request(new XCJSRequestParam('common', 'userinfo', null, function (data) {
      console.log(data.loginName);
    }));
  }

 ```
 
 
 获取App登录用户信息 含token用户名头像等...
 返回数据
 
 
 ```
 interface UserInfo {
    'loginName': String; // 用户名
    'playerId': String;  // playerId
    'token': String;     // token
    'nickName':  String; // 昵称
    'headImg': String;// 头像
 }
  ```
 
 >#### <span id="api3" >1.3、关闭webview（v1.0.0）</span>
  关闭webview 并返回App上一页
  ```
  function isApp() {
    return !!window.xcjsmanager
  }
  if (isApp()) {
    xcFlutterJsSDk.request(new XCJSRequestParam('common', 'close', null, function (response) {
      // TODO
    }));
  }
 n
 ```
 
 
>### <span id="h5-doc" >二、H5接入说明</span>

>#### <span id="h5-lib" >2.1 引入依赖包</span>
  ```
    <script src="./lib/base64.js" type="text/javascript" charset="utf-8"></script>
    <script src="./lib/ai_webview_sdk_v1.0.0.js" type="text/javascript" charset="utf-8"></script>
  ```
  具体使用请参考Demo


>### <span id="error-code" >三、错误码说明</span>

>#### <span id="h5-lib" >3.1 xcFlutterJSSDKCallback 错误码说明</span>

```
const ActionNotFoundErrorCode = 400; // Action传入错误 及  第一个参数 'common'
const MethodNotFountErrorCode = 404; // 找不到该方法 请注意使用版本是否支持该方法
const FlutterErrorCode = 505; // App 内错误 请联系管理员
const SuccessCode = 200; // App 内错误 请联系管理员
```

### <span id="version-info" >四、版本更新说明 </span>

>#### <span id="edit-history" >4.1 版本更新记录</span>

| 更改日期 | 版本 |更改人|版本说明|审核人|
|:------|:------:|:------:|:--------|:---:|
| 2020-05-21 | 1.0.0 | allen | 创建  | ricky |