import 'dart:math';

import 'package:common_component/model/Imodel.dart';
import 'package:common_component/util/log.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:fast_ai/module/common/util/http/parser_adapter/parser_adapter.dart';
// import 'package:fast_ai/module/common/util/http/parser_adapter/parser_adapter.dart';

///@autho king
///@date 7/29/21
///
///


abstract class ProtocolModel extends IModel implements IParserAdapter {
  @override
  void parse(dynamic data) {
    bool hasError = true;
    try {
      onParse(data);
      hasError = false;
    } finally {
      if (hasError) {
        logger.error('ProtocolModel', ' $runtimeType 解析 出错');
      }
    }
  }

  @override
  void onParse(dynamic data);



}

List<T> parseList<T extends ProtocolModel>(List list,
    T  Function() itemBuilder) {
  if(isEmpty(list)){
    return [];
  }
  return list.map<T>((e) => itemBuilder.call()
    ..parse(e)).toList();
}