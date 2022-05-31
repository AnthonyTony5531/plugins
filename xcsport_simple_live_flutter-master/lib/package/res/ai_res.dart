import 'package:common_component/package/package.dart';
import 'package:common_component/theme/res.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/common/package/res/cm_image_creator.dart';
import 'package:fast_ai/module/common/package/res/cm_text_creator.dart';

import 'ai_image_creator.dart';
import 'ai_text_creator.dart';

class AiRes extends Res {
  AiImageCreator _imageCreator;

  AppTextCreator _textCreator;
  AiRes(IPackage package) : super(packageName: package.name) {
    _imageCreator = new AiImageCreator(package);
    _textCreator = new AppTextCreator(package);
  }

  @override
  AiImageCreator get imageCreator => _imageCreator;

  @override
  AppTextCreator get textCreator => _textCreator;
}
