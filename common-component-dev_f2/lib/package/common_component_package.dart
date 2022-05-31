import 'package:common_component/component/cache.dart';
import 'package:common_component/component/components.dart';
import 'package:common_component/component/route/route.dart';
import 'package:common_component/component/route/route_table.dart';
import 'package:common_component/config/common_component_config.dart';
import 'package:common_component/cross/common_component_cross.dart';
import 'package:common_component/package/package.dart';
import 'package:common_component/service/common_component_service.dart';
import 'package:common_component/theme/res.dart';

final ccPackage = CommonComponentPackage();
Components get ccPackageComponent => ccPackage.components;
XcRoute get ccRoute => ccPackage.components.route;
Cache get ccCache => ccPackage.components.cache;

//基础组件的Package
class CommonComponentPackage extends IPackage {
  static final CommonComponentPackage _ins = CommonComponentPackage._();

  factory CommonComponentPackage() {
    return _ins;
  }

  CommonComponentPackage._();

  static CommonComponentPackage get ins => _ins;

  final _config = CommonComponentConfig();

  final _service = CommonComponentService();

  final _cross = CommonComponentCross();

  @override
  CommonComponentConfig get config => _config;

  @override
  CommonComponentService get service => _service;

  final Components components = new Components();

  @override
  Future<void> init() async {
    await components.init();
    await super.init();
  }

  @override
  String get name => 'common_component';

  @override
  CommonComponentCross get cross => _cross;

  @override
  Res get res => null;
}
