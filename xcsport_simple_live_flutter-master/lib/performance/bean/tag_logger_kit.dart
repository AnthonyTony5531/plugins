import 'package:fast_ai/performance/bean/port/i_kit.dart';
import 'package:fast_ai/performance/bean/port/i_storage.dart';
import 'package:fast_ai/performance/bean/storage/tag_logger_storage.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:fast_ai/performance/widget/tag_logger_kit_page.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function :

class TagLoggerKit extends IKit {
  @override
  Widget createDisplayPage() => TagLoggerKitPage();

  @override
  IStorage createStorage() => TagLoggerStorage();

  @override
  void dispose() {}

  @override
  String getIcon() => KitIcon.KIT_LOGGER;

  @override
  String getKitName() => KitName.KIT_LOGGER;

  @override
  String getRouter() => KitRouter.KII_LOGGER;

  @override
  void init() {}
}
