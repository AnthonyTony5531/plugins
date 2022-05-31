import 'package:common_component/component/route/route_table.dart';
import 'package:common_component/package/package.dart';
import 'package:common_component/theme/res.dart';

import 'package:fast_ai/package/res/ai_image_creator.dart';
import 'package:fast_ai/package/res/ai_res.dart';
import 'package:fast_ai/package/route/ai_route_table.dart';
//import 'package:fast_ai/module/common/package/common_xcsports_component_package.dart';
import 'package:fast_ai/package/service/fastai_service.dart';

import 'config/fastai_config.dart';
import 'cross/fastai_center_cross.dart';

/// @author king
/// @date 2021/6/1

final aiPackage = FastAiPackage();

TextCreator get aiPackageTextCreator => aiPackage.res.textCreator;

AiImageCreator get aiPackageImageCreator => aiPackage.res.imageCreator;

AiRes get aiPackageRes => aiPackage.res;

FastAiService get aiPackageService => aiPackage.service;

FastAiConfig get aiPackageConfig => aiPackage.config;

FastAiCenterCross get aiPackageCross => aiPackage.cross;

class FastAiPackage extends IPackage {
  FastAiConfig _centerConfig = FastAiConfig();

  FastAiService _centerService = new FastAiService();

  FastAiCenterCross _cross = new FastAiCenterCross();
  final AiRouteTable _table = AiRouteTable();

  @override
  IRouteTable get routeTable => _table;

  AiRes aiRes;

  @override
  FastAiConfig get config => _centerConfig;

  @override
  FastAiCenterCross get cross => _cross;

  @override
  Future<void> init() async {
    await super.init();
  }

  @override
  String get name => "fast_ai.FastAiPackage";

  @override
  FastAiService get service => _centerService;

  @override
  AiRes get res => aiRes ??= AiRes(this);
}
