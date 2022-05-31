import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:fast_ai/performance/widget/behavior/hide_scroll_behavior.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function :

AndroidDeviceInfo _androidDeviceInfo;
IosDeviceInfo _iosDeviceInfo;

class BaseInfoKitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BaseInfoState();
  }
}

class _BaseInfoState extends State<BaseInfoKitPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getPhoneInfo();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff5f6fa),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ScrollConfiguration(
        behavior: HideScrollBehavior(),
        child: SingleChildScrollView(
          child: _androidDeviceInfo != null
              ? _buildAndroidView()
              : _iosDeviceInfo != null
                  ? _buildIosView()
                  : SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _buildAndroidView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildItemView('Id', _androidDeviceInfo.androidId),
        _buildItemView('board', _androidDeviceInfo.board),
        _buildItemView('bootloader', _androidDeviceInfo.bootloader),
        _buildItemView('brand', _androidDeviceInfo.brand),
        _buildItemView('device', _androidDeviceInfo.device),
        _buildItemView('display', _androidDeviceInfo.display),
        _buildItemView('fingerprint', _androidDeviceInfo.fingerprint),
        _buildItemView('hardware', _androidDeviceInfo.hardware),
        _buildItemView('host', _androidDeviceInfo.host),
        _buildItemView('manufacturer', _androidDeviceInfo.manufacturer),
        _buildItemView('model', _androidDeviceInfo.model),
        _buildItemView('product', _androidDeviceInfo.product),
        _buildItemView('tags', _androidDeviceInfo.tags),
        _buildItemView('type', _androidDeviceInfo.type),
      ],
    );
  }

  Widget _buildIosView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildItemView('name', _iosDeviceInfo.name),
        _buildItemView('systemName', _iosDeviceInfo.systemName),
        _buildItemView('systemVersion', _iosDeviceInfo.systemVersion),
        _buildItemView('model', _iosDeviceInfo.model),
        _buildItemView('localizedModel', _iosDeviceInfo.localizedModel),
        _buildItemView('identifierForVendor', _iosDeviceInfo.identifierForVendor),
        _buildItemView('isPhysicalDevice', _iosDeviceInfo.isPhysicalDevice),
        _buildItemView('sysName', _iosDeviceInfo.utsname.sysname),
        _buildItemView('nodeName', _iosDeviceInfo.utsname.nodename),
        _buildItemView('release', _iosDeviceInfo.utsname.release),
        _buildItemView('version', _iosDeviceInfo.utsname.version),
        _buildItemView('machine', _iosDeviceInfo.utsname.machine),
      ],
    );
  }

  Widget _buildItemView(String title, dynamic info) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title : ',
            style: const TextStyle(color: Color(0xff333333), fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              '$info',
              style: const TextStyle(color: Color(0xff666666), fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }

  void getPhoneInfo() async {
    if (_androidDeviceInfo != null || _iosDeviceInfo != null) return;
    if (Platform.isAndroid) {
      _androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
    } else {
      _iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
    }
  }
}
