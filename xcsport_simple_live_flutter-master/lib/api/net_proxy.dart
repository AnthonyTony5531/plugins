/*
 * @Author: your name
 * @Date: 2020-08-13 16:22:46
 * @LastEditTime: 2020-08-24 10:21:56
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \xcsport-sdk-pcg:\project\xcsports-sdk-flutter\lib\api\net_proxy.dart
 */ 

//**********************************************************************
//* author:Sam
//* date:2020-08-07
//**********************************************************************

//代理设置
import 'package:fast_ai/utils/string_util.dart';

class NetProxySetting {
  /// 是否打开代理
  static bool enable = false;

  /// 抓包端口号
  static String port = "8888";

  /// 个人电脑Ip地址(david)
  static String ip = "192.168.20.16";

  /// 发布模式是否支持抓包
  static bool releaseModelEnable = false;

  static String proxyUlr = '';

  static netProxyConfig() {
    print('00-aiSdkProxyConfig-ip=$ip, port=$port');
    if(!enable || isNotEmpty(proxyUlr)) return;

    List<String> ipList = ip.split(',');
    List<String> portList = port.split(',');
    if(ipList.length > 1) { // "PROXY host:port; PROXY host2:port2; DIRECT"
      for(int i = 0; i < ipList.length; i++) {
        proxyUlr = proxyUlr + 'PROXY ${ipList[i]}:${portList.length>i?portList[i]:portList.first}; ';
      }
      proxyUlr = proxyUlr + 'DIRECT';
    }
    else { // "PROXY host:port"
      proxyUlr = "PROXY ${ip.toString()}:${port.toString()}";
    }
  }
}