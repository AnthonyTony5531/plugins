import 'package:fast_ai/module/common/model/protocol_model.dart';
import 'package:fast_ai/module/common/model/page_result_model.dart';
import 'package:fast_ai/module/common/util/http/http_response_protocol.dart';
import 'package:fast_ai/module/common/util/http/parser_adapter/default_page_parser_adapter.dart';

//
abstract class HttpResponsePageProtocol<T extends ProtocolModel>
    extends HttpResponseProtocol {
  PageResultModel<T> pageData = PageResultModel<T>();

  @override
  void onParse(dynamic data) {
    DefaultPageParserAdapter parserAdapter =
        DefaultPageParserAdapter(pageData: pageData, pageProtocol: this);
    parserAdapter.parse(data);
  }

  T onItemParse(dynamic itemJson);
}
