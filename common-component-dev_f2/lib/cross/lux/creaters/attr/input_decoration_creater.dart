import 'package:flutter/material.dart';

import '../../lux_creater.dart';


class InputDecorationCreater extends LuxCreater {

  @override
  create(BuildContext context, Map script) {
    return InputDecoration();
  }

  @override
  String get lux => 'InputDecoration';

  @override
  Map get sample =>
  {
    'lux': 'InputDecoration',
  };

}



//const InputDecoration({
//    this.icon,
//    this.labelText,
//    this.labelStyle,
//    this.helperText,
//    this.helperStyle,
//    this.helperMaxLines,
//    this.hintText,
//    this.hintStyle,
//    this.hintMaxLines,
//    this.errorText,
//    this.errorStyle,
//    this.errorMaxLines,
//    this.hasFloatingPlaceholder = true,
//    this.isDense,
//    this.contentPadding,
//    this.prefixIcon,
//    this.prefix,
//    this.prefixText,
//    this.prefixStyle,
//    this.suffixIcon,
//    this.suffix,
//    this.suffixText,
//    this.suffixStyle,
//    this.counter,
//    this.counterText,
//    this.counterStyle,
//    this.filled,
//    this.fillColor,
//    this.focusColor,
//    this.hoverColor,
//    this.errorBorder,
//    this.focusedBorder,
//    this.focusedErrorBorder,
//    this.disabledBorder,
//    this.enabledBorder,
//    this.border,
//    this.enabled = true,
//    this.semanticCounterText,
//    this.alignLabelWithHint,
//  }) : assert(enabled != null),
//       assert(!(prefix != null && prefixText != null), 'Declaring both prefix and prefixText is not supported.'),
//       assert(!(suffix != null && suffixText != null), 'Declaring both suffix and suffixText is not supported.'),
//       isCollapsed = false;