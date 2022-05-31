import 'package:common_component/theme/res.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

import 'cm_image_creator.dart';
import 'cm_text_creator.dart';

class CmRes extends Res {
  CmImageCreator _imageCreator;

  CmTextCreator _textCreator;
  CmRes(FlutterCommonPackage package) : super(packageName: package.name) {
    _imageCreator = new CmImageCreator(package);
    _textCreator = new CmTextCreator(package);
  }

  @override
  CmImageCreator get imageCreator => _imageCreator;

  @override
  CmTextCreator get textCreator => _textCreator;
}
