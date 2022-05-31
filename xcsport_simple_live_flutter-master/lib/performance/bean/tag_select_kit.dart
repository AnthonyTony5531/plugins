import 'package:fast_ai/performance/bean/port/i_kit.dart';
import 'package:fast_ai/performance/bean/port/i_storage.dart';
import 'package:fast_ai/performance/bean/storage/common_storage.dart';
import 'package:fast_ai/performance/manager/common_kit_manager.dart';
import 'package:fast_ai/performance/widget/tag_select_kit_page.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function : 

class TagSelectKit extends IKit {

  static String selectTag;

  @override
  Widget createDisplayPage() => TagSelectKitPage();

  @override
  IStorage createStorage() => CommonStorage();

  @override
  void dispose() {}

  @override
  String getIcon() => '';

  @override
  String getKitName() => CommonKitName.KIT_LOGGER_TAG;

  @override
  String getRouter() => CommonKitRouter.KIT_LOGGER_TAG;

  @override
  void init() {}

}