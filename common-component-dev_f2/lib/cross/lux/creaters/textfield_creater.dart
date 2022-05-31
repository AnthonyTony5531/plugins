import 'package:flutter/material.dart';

import '../lux_creater.dart';


class TextFieldCreater extends LuxCreater {

  @override
  create(BuildContext context, Map script) {

    return TextField(
      controller: LuxCreater.createIns(context, script, 'controller'),
      autofocus: LuxCreater.parseBool(script, 'autofocus'),
      obscureText: LuxCreater.parseBool(script, 'obscureText'),
//      decoration: LuxCreater.createIns(context, script, 'decoration'),
      keyboardType: LuxCreater.parseEnum(script, 'keyboardType'),
      textAlign: LuxCreater.parseEnum(script, 'textAlign'),
      maxLength: LuxCreater.parseInt(script, 'maxLength'),
    );
  }

  @override
  bool get isWidget => true;

  @override
  String get lux => 'TextField';

  @override
  Map get sample =>
  {
    'lux': 'TextField',
    'controller': {
      'lux': 'TextEditingController',
      'text': 'default text'
    },
    'autofocus': 'true',
    'obscureText': 'false',
    'decoration' : {
      'lux': 'InputDecoration',
    },
    'keyboardType': 'TextInputType.number',
    'textAlign': 'TextAlign.left',
    'maxLength': '20',
  };

}





// const TextField({
//    Key key,
//    this.controller,
//    this.focusNode,
//    this.decoration = const InputDecoration(),
//    TextInputType keyboardType,
//    this.textInputAction,
//    this.textCapitalization = TextCapitalization.none,
//    this.style,
//    this.strutStyle,
//    this.textAlign = TextAlign.start,
//    this.textAlignVertical,
//    this.textDirection,
//    this.readOnly = false,
//    ToolbarOptions toolbarOptions,
//    this.showCursor,
//    this.autofocus = false,
//    this.obscureText = false,
//    this.autocorrect = true,
//    this.enableSuggestions = true,
//    this.maxLines = 1,
//    this.minLines,
//    this.expands = false,
//    this.maxLength,
//    this.maxLengthEnforced = true,
//    this.onChanged,
//    this.onEditingComplete,
//    this.onSubmitted,
//    this.inputFormatters,
//    this.enabled,
//    this.cursorWidth = 2.0,
//    this.cursorRadius,
//    this.cursorColor,
//    this.keyboardAppearance,
//    this.scrollPadding = const EdgeInsets.all(20.0),
//    this.dragStartBehavior = DragStartBehavior.start,
//    this.enableInteractiveSelection = true,
//    this.onTap,
//    this.buildCounter,
//    this.scrollController,
//    this.scrollPhysics,
//  }) : assert(textAlign != null),
//       assert(readOnly != null),
//       assert(autofocus != null),
//       assert(obscureText != null),
//       assert(autocorrect != null),
//       assert(enableSuggestions != null),
//       assert(enableInteractiveSelection != null),
//       assert(maxLengthEnforced != null),
//       assert(scrollPadding != null),
//       assert(dragStartBehavior != null),
//       assert(maxLines == null || maxLines > 0),
//       assert(minLines == null || minLines > 0),
//       assert(
//         (maxLines == null) || (minLines == null) || (maxLines >= minLines),
//         'minLines can\'t be greater than maxLines',
//       ),
//       assert(expands != null),
//       assert(
//         !expands || (maxLines == null && minLines == null),
//         'minLines and maxLines must be null when expands is true.',
//       ),
//       assert(!obscureText || maxLines == 1, 'Obscured fields cannot be multiline.'),
//       assert(maxLength == null || maxLength == TextField.noMaxLength || maxLength > 0),
//       keyboardType = keyboardType ?? (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
//       toolbarOptions = toolbarOptions ?? (obscureText ?
//         const ToolbarOptions(
//           selectAll: true,
//           paste: true,
//         ) :
//         const ToolbarOptions(
//           copy: true,
//           cut: true,
//           selectAll: true,
//           paste: true,
//         )),
//       super(key: key);