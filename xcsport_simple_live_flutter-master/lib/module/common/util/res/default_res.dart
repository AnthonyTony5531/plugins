import 'package:common_component/theme/res.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';

import 'common_image_creator.dart';
import 'default_text_creator.dart';

class DefaultRes extends Res {
  CommonImageCreator _imageCreator;

  DefaultTextCreator _textCreator;
  DefaultRes() : super(packageName: null) {
    _imageCreator = new CommonImageCreator();
    _textCreator = new DefaultTextCreator();
  }

  @override
  CommonImageCreator get imageCreator => _imageCreator;

  @override
  DefaultTextCreator get textCreator => _textCreator;
}
