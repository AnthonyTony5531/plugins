import 'package:common_component/package/package.dart';
import 'package:common_component/theme/res.dart';
import 'package:fast_ai/module/common/config/flutter_common_centerconfig.dart';
import 'package:fast_ai/module/common/cross/flutter_common_cross.dart';
import 'package:fast_ai/module/common/package/res/cm_image_creator.dart';
import 'package:fast_ai/module/common/package/res/cm_res.dart';
import 'package:fast_ai/module/common/service/connectivity_service.dart';
import 'package:fast_ai/module/common/service/flutter_common_centerservice.dart';
import 'package:fast_ai/config/config.dart' as AiConfig;

final cmPackage = FlutterCommonPackage();

TextCreator get cmPackageTextCreator => cmPackage.res.textCreator;

CmImageCreator get cmPackageImageCreator => cmPackage.res.imageCreator;

CmRes get cmPackageRes => cmPackage.res;

FlutterCommonCenterService get cmPackageService => cmPackage.service;

FlutterCommonCenterConfig get cmPackageConfig => cmPackage.config;

FlutterCommontCenterCross get cmPackageCross => cmPackage.cross;

/// 网络状态
XYConnectivityResult get connectivityResult =>
    cmPackage.service.connectivityService.status;
bool get networkReachable => connectivityResult != XYConnectivityResult.none;

class FlutterCommonPackage extends IPackage {
  static final FlutterCommonPackage _ins = FlutterCommonPackage._();

  factory FlutterCommonPackage() {
    return _ins;
  }

  FlutterCommonPackage._();

  static FlutterCommonPackage get ins => _ins;

  final _config = FlutterCommonCenterConfig();
  final _service = FlutterCommonCenterService();
  final _cross = FlutterCommontCenterCross();

  CmRes _res;

  @override
  CmRes get res => _res ??= CmRes(this);

  @override
  FlutterCommonCenterConfig get config => _config;

  @override
  FlutterCommontCenterCross get cross => _cross;

  @override
  FlutterCommonCenterService get service => _service;

  @override
  Future<void> init() async {
    await super.init();
  }

  @override
  String get name => AiConfig.config.isFastAiSdk ? AiConfig.Config.ccPackage : null;//"flutter_pet_butler";
}
