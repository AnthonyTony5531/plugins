
import 'package:fast_ai/performance/bean/port/i_kit.dart';
import 'package:fast_ai/performance/bean/port/i_storage.dart';
import 'package:fast_ai/performance/bean/storage/common_storage.dart';
import 'package:fast_ai/performance/manager/common_kit_manager.dart';
import 'package:fast_ai/performance/widget/query_kit_page.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function :  查询条件

class QueryKit extends IKit {
  static String queryStr;

  @override
  Widget createDisplayPage() => QueryKitPage();

  @override
  IStorage createStorage() => CommonStorage();

  @override
  void dispose() {}

  @override
  String getIcon() => '';

  @override
  String getKitName() => CommonKitName.KIT_QUERY;

  @override
  String getRouter() => CommonKitRouter.KIT_QUERY;

  @override
  void init() {}
}
