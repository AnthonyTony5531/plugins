import 'package:common_component/util/ai_json.dart';
import 'package:common_component/util/log.dart';
import 'package:flutter/cupertino.dart';
import 'package:fast_ai/module/common/model/protocol_model.dart';
import 'package:fast_ai/module/common/model/page_result_model.dart';
import '../http_response_page_protocol.dart';
import 'parser_adapter.dart';

class DefaultPageParserAdapter<T extends ProtocolModel> extends IParserAdapter {
  final PageResultModel<T> pageData;

  final HttpResponsePageProtocol<T> pageProtocol;

  DefaultPageParserAdapter(
      {@required this.pageData, @required this.pageProtocol});

  @override
  void onParse(data) {
    AiJson aiJson = AiJson(data);
    pageData.pageNum = aiJson.getNum('pageNum');
    pageData.pageSize = aiJson.getNum('pageSize');
    pageData.totalPage = aiJson.getNum('totalPage');
    pageData.total = aiJson.getNum('total');
    pageData.checkNextPage();
    final listData = aiJson.getArray('list');
    if (listData != null && listData.length > 0) {
      listData.forEach((element) {
        pageData.items.add(pageProtocol.onItemParse(element));
      });
    }
  }

  @override
  void parse(data) {
    try {
      onParse(data);
    } catch (e) {
      pageData.state = PageState.Error;
      logger.error('ParserAdapter', '${this.runtimeType} 解析报错了 $e');
    }
  }
}
