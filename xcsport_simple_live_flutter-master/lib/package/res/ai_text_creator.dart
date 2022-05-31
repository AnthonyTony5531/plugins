import 'package:common_component/package/package.dart';
import 'package:common_component/theme/res.dart';
import 'package:flutter/widgets.dart';

import '../fastai_package.dart';

class AppTextCreator extends TextCreator {
  AppTextCreator(IPackage package) : super(packageName: package.name);
}
