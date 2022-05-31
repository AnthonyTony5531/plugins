import 'package:fast_ai/performance/bean/port/i_kit.dart';
import 'package:fast_ai/performance/bean/port/i_storage.dart';
import 'package:fast_ai/performance/bean/storage/common_storage.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:fast_ai/performance/widget/base_info_kit_page.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function :

class BaseInfoKit extends IKit {
  @override
  Widget createDisplayPage() => BaseInfoKitPage();

  @override
  IStorage createStorage() => CommonStorage();

  @override
  void dispose() {}

  @override
  String getIcon() => KitIcon.KIT_INFO;

  @override
  String getKitName() => KitName.KIT_INFO;

  @override
  String getRouter() => KitRouter.KIT_INFO;

  @override
  void init() {}
}
