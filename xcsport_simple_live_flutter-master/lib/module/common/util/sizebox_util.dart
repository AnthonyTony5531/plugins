import 'package:common_component/util/ai_measure.dart';
import 'package:flutter/widgets.dart';

///@autho king
///@date 8/4/21

SizedBox sw(double width) {
  return SizedBox(
    width: width,
  );
}

SizedBox sh(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox safeTop(BuildContext context) {
  return SizedBox(
    height: AiMeasure.bottomOffset(context),
  );
}
