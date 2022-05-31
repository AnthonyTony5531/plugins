
import 'dart:async';
import 'dart:convert' as _convert;
import 'dart:io';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/base_protocol.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/api/net_host.dart';
import 'package:fast_ai/api/net_host_service.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/migrate_plugins/gbk2utf8/gbk2utf8.dart';
import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/utils/device_util.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:http/http.dart' as http;
import 'package:nettool/nettool.dart';
import 'package:synchronized/synchronized.dart' as _sync;

class NetIndexListenerServer{
  bool didStart = false;
  static NetIndexListenerServer ins = NetIndexListenerServer._();

  NetIndexListenerServer._();

  //最近监测上报时间间隔
  final int intervalTime = 600;
  //最近监测上报定时器
  Timer _listenTimer;

  var _autoChangeLock = _sync.Lock();

  ///
  void start() async {
    didStart = true;

    await _autoChangeLock.synchronized(() {
      if(_listenTimer != null){
        return;
      }
      uploadNetIndex();
      _listenTimer = Timer.periodic(Duration(seconds: intervalTime), (timer){
        uploadNetIndex();
      });
      print("1111-NetIndexListenerServer-start");
    });
  }

  ///
  void stop(){
    didStart = false;
    _listenTimer?.cancel();
    _listenTimer = null;
  }

  /// 上传网络指标
  void uploadNetIndex() {
    sleep(10,()async{
      if(config.userInfo.isAnonymousToken || isEmpty(config.userInfo.playerId) || isEmpty(config.userInfo.loginName) || isEmpty(config.merchantAppConfig.merchantId) || (isEmpty(config.merchantAppConfig.merchantName) && isEmpty(config.merchantAppConfig.name))) {
        print('uploadNetIndex-参数错误，playerId=${config.userInfo.playerId}, loginName=${config.userInfo.loginName}, merchantId=${config.merchantAppConfig.merchantId}, merchantName=${config.merchantAppConfig.merchantName} name=${config.merchantAppConfig.name}');
        return;
      }

      var index = await NetTool.getNetIndexMethod(Api.baseMainUrl, netState: config.netConnectStatus.index);
      index.clientVersion = config.isApp ? "App" : "SDK";
      var location = '-'; // 用户位置
      var deviceInfo = await DeviceUtil.getDeviceInfo(); // iOS
      var userIp = '-';
      try {
        location = await queryIpLocation();
      }
      catch(e) {
        print('位置获取异常 error=$e');
      }
      try {
        //print('00-netConnectStatus=${config.netConnectStatus.index}');
        //userIp = await GetIp.ipAddress(config.netConnectStatus.index);
        userIp = await Net.queryUserIp();
        print('00-NetIndexListenerServer-userIp=$userIp');
      }
      catch(e) {
        print('用户IP获取异常 error=$e');
      }
/*
{
    "userAccoutId": "xxx",//会员账号ID
    "userAccout": "richard", //会员账号
    "merchantId":"bbb",//商户ID
    "merchantName": "商户c",//商户名称
    "domainName": "http://6047179117",//域名
    "device": "redmi47v",//设备
    "remoteIp": "220.181.38.148",//相应ip
    "address": "广东 电信",//归属地
    "recordTimes":"2020-12-23 19:23:59",//记录时间
    "responseTimes": 22,//响应时长（网络超时：设置默认值为60000）
    "dnsTimes": 22,//dns解析时长
    "tcpTimes": 22,//tcp时长
    "networkTimes": 22//设备网络时长
    "networkType":"3g"//网络类型(wifi,3g,4g,5g)
   "deviceOS": //   设备系统（IOS14.1、android7.7
   "deviceSdkVersion": //安卓系统SDK版本
   "userIp": //用户IP
}
*/
      var map = Map<String,dynamic>();
      map["userAccoutId"] = config.userInfo.playerId;
      map["userAccout"] = isNotEmpty(config.userInfo.loginName) ? config.userInfo.loginName : '-';
      map["merchantId"] = config.merchantAppConfig.merchantId;
      map["merchantName"] = isNotEmpty(config.merchantAppConfig.merchantName) ? config.merchantAppConfig.merchantName : config.merchantAppConfig.name;
      map["domainName"] = NetHost.BASE_MAIN_URL;
      map["device"] = Platform.isAndroid ? index.device : deviceInfo['deviceName'];// 设备类型名
      map["remoteIp"] = index.rspIp ?? '-';
      map["address"] = location; // 通信地址，仅国内用户使用
      map["networkTimes"] = 0;
      map["networkType"] = index.networkType; // 设备网络类型
      //map["recordTimes"] = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      map["deviceOS"] = Platform.isAndroid ? index.sysVersion : '${deviceInfo['sysName']}${deviceInfo['sysVersion']}'; // 手机系统名+版本号
      map["deviceSdkVersion"] = index.sysSdkVersion ?? '-'; // 安卓系统名，iOS传空
      map["userIp"] = userIp ?? '-';
      var clientVersion = '';
      if(config.isApp){
        clientVersion = 'App:V${config.appInfo.appVersion}';
      }
      else {
        var ver = await XcSdkApi.sdkVersion();
        clientVersion = 'SDK:V$ver';
      }
      map["clientVersion"] = clientVersion; // app/sdk版本号
      print('11-uploadNetIndex-deviceInfo=${deviceInfo.toString()}');
      print('11-uploadNetIndex-map=${map.toString()}');
      int defaultTime = 60*1000; // 后端要排序，默认给1分钟
      int responseTimes = defaultTime;
      try{
        responseTimes = double.tryParse(index.rspTime).toInt();
      }catch(_){}
      map["responseTimes"] = responseTimes;

      int dnsTimes = defaultTime;
      try{
        dnsTimes = double.tryParse(index.dnsParseTime).toInt();
      }catch(_){}
      map["dnsTimes"] = dnsTimes;

      int tcpTimes = defaultTime;
      try{
        tcpTimes = double.tryParse(index.tcpTime).toInt();
      }catch(_){}
      map["tcpTimes"] = tcpTimes;
      print('22-uploadNetIndex， map=${map.toString()}');
      //var rsp = await Net.saveUserResponse(map);
      try{
        var rsp = await SaveUserResponseProtocol(map).request();
        print("saveUserResponse-msg=${rsp.msg}, code=${rsp.code}");
      }
      catch(e){
        print("saveUserResponse-error=$e");
      }

    });
  }


  ///
  /// 用户位置
  ///
  static Future<String> queryIpLocation({String ip = ""}) async {
    try{
      http.Response response = await http.get(Uri.parse("http://ip.ws.126.net/ipquery?ip=$ip"));
      // var lo="广东省", lc="深圳市"; var localAddress={city:"深圳市", province:"广东省"}
      String data = gbk.decode(response?.bodyBytes);
      if(!isNullOrEmpty(data) && data.contains("localAddress=")){
        String sub = data.substring(data.indexOf("{"),data.indexOf("}")+1);
        sub = sub?.replaceAll("city", "\"city\"")?.replaceAll("province", "\"province\"");
        var subObj = _convert.jsonDecode(sub);
        if(subObj != null){
          return subObj["province"]+" "+subObj["city"];
        }
      }
    }catch(e){
      print(e);
    }
    return "-";

  }

}



class SaveUserResponseProtocol extends BaseReqProtocol<BaseModel> {
  SaveUserResponseProtocol(Map params) {
    param = params;
  }

  @override
//  String get baseUrl => 'http://net-web-admin.xc.com/';
  String get baseUrl => NetHostService.ins.isDev ? 'http://192.168.30.154:31412/' : 'http://net-web-admin.aisport.io/';

  @override
  RequestMethodType get requestType => RequestMethodType.post;

  @override
  String get apiUrl => Api.SaveUserResponse;

  @override
  Future<BaseModel> result(Map<String, dynamic> map) async {
    return BaseModel.fromMap(map);
  }
}
