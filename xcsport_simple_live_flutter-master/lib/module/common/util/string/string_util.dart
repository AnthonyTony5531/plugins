// 整数单位转换
import 'package:fast_ai/module/common/package/flutter_common_package.dart';

import '../empty_util.dart';

final String priceSymbol = '¥';

String integerUnitOfConversion(num value, {int fractionDigits = 0, int minSize = 5}) {
  final bool isNegative = value.isNegative;
  final absInt = value.abs();
  final intSize = absInt.toStringAsFixed(0).length;
  String res = absInt.toString();
  if (intSize >= 7 && 7 >= minSize) {
    res = '${(absInt / 1000000).toStringAsFixed(fractionDigits)}M';
  } else if (intSize >= 5 && 5 >= minSize) {
    res = '${(absInt / 10000).toStringAsFixed(fractionDigits)}W';
  } else if (intSize >= 4 && 4 >= minSize) {
    res = '${(absInt / 1000).toStringAsFixed(fractionDigits)}Q';
  }
  if (isNegative) {
    res = '-$res';
  }
  return res;
}

// 获取金额整数值,needChangeAmount:是否需要转换金额
String getPriceToAmount(String price, {bool needChangeAmount = false}) {
  int dotIndex = price.indexOf('.');
  if (dotIndex != -1) {
    String amount = price.substring(0, dotIndex);
    if (needChangeAmount) {
      //TODO
      return amount;
    }
    return amount;
  }
  return price;
}

// 获取金额小数值,needChangeAmount:是否需要转换金额
String getPriceToDecimal(String price, {bool needChangeAmount = false}) {
  if (needChangeAmount) return '';
  int dotIndex = price.indexOf('.');
  if (dotIndex != -1) {
    String amount = price.substring(dotIndex + 1);
    // 补零
    if (amount.length <= 1) {
      return '.${amount}0';
    } else if (amount.length >= 3) {
      return '.${amount.substring(0, 2)}';
    }
    return '.$amount';
  }
  return '.00';
}

String string(String value, {String defaultVal = ''}) {
  return !isEmpty(value) ? value : defaultVal;
}

String intStr(String data, {String defaultVal = ''}) {
  return string(data, defaultVal: defaultVal)
      .replaceAll(RegExp(r'[\.]+[0-9]+'), '')
      .replaceAll(RegExp(r'[A-Za-z]*'), '');
}

extension live188Utils on String {
  String toImageUrl() {
    String url = this;
    if (isNotEmpty(url) && !url.startsWith('http')) {
      String flash = '';
      if (!cmPackageConfig.serverUrlConfig.imgUrl.endsWith('/') && !url.startsWith('/')) flash = '/';
      else if(cmPackageConfig.serverUrlConfig.imgUrl.endsWith('/') && url.startsWith('/')) {
        flash = '';
        url = url.substring(1);
      }
      url = '${cmPackageConfig.serverUrlConfig.imgUrl}$flash$url';
    }
    return url;
  }
}
