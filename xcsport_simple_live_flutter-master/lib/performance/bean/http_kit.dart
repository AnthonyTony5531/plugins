import 'package:fast_ai/performance/bean/port/i_kit.dart';
import 'package:fast_ai/performance/bean/port/i_storage.dart';
import 'package:fast_ai/performance/bean/storage/http_info_storage.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:fast_ai/performance/widget/http_kit_page.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function : 网络请求工具

class HttpKit extends IKit {
  @override
  Widget createDisplayPage() => HttpKitPage();

  @override
  IStorage createStorage() => HttpInfoStorage();

  @override
  void dispose() {}

  @override
  String getIcon() => KitIcon.KIT_HTTP;

  @override
  String getKitName() => KitName.KIT_HTTP;

  @override
  String getRouter() => KitRouter.KIT_HTTP;

  @override
  void init() {}
}
