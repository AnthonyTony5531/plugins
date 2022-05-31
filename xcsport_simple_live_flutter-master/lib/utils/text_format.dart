import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class TextFormat extends TextInputFormatter {

  // 最大保留几位
  // 最大值
  TextFormat({this.decimalRange = 3,this.bigValue})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;
  final num bigValue;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    // 拿到录入后的字符
    String nValue = newValue.text;
    //当前所选择的文字区域
    TextSelection nSelection = newValue.selection;

//    Pattern p = RegExp(r'(\d+\.?)|(\.?\d+)|(\.?)');
//    nValue = p.allMatches(nValue)
//        .map<String>((Match match) => match.group(0))
//        .join();

    Pattern p = RegExp("[0-9]");
    nValue = p.allMatches(nValue).map<String>((Match match) => match.group(0))
        .join();

    if (nValue.startsWith('0') || nValue.length > decimalRange) {
      nValue = oldValue.text;
    }

//    else if (nValue.contains('.')) {
//      //来验证小数点位置
//      if (nValue.substring(nValue.indexOf('.') + 1).length > decimalRange) {
//        nValue = oldValue.text;
//      } else {
//        if (nValue.split('.').length > 2) { //多个小数点，去掉后面的
//          List<String> split = nValue.split('.');
//          nValue = split[0] + '.' + split[1];
//        }
//      }
//    }

    if (nValue != null && nValue.length > 0) {
      if (num.parse(nValue) > this.bigValue) {
        nValue = this.bigValue.toString();
      }
    }

    //使光标定位到最后一个字符后面
    nSelection = newValue.selection.copyWith(
      baseOffset: math.min(nValue.length, nValue.length + 1),
      extentOffset: math.min(nValue.length, nValue.length + 1),
    );

    return TextEditingValue(
        text: nValue,
        selection: nSelection,
        composing: TextRange.empty
    );
  }
}
