import 'package:common_component/theme/res.dart';
import 'package:flutter/widgets.dart';

import '../flutter_common_package.dart';

class CmTextCreator extends TextCreator {
  CmTextCreator(FlutterCommonPackage package)
      : super(packageName: package.name);
}
