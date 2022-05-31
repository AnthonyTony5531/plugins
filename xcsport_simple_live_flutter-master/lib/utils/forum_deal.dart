import 'package:dio/dio.dart';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/models/base_model.dart';
import 'dart:convert' as _convert;

import 'package:fast_ai/utils/ai_json.dart';

class ForumBbsLoginReqProtocol {

  String toPage = '';
  ForumBbsLoginReqProtocol({this.toPage = ''});

  Future<ForumBbsLoginRspProtocol> request() async {
    var url = "bbsLogin?toPage=$toPage&host=${Api.baseMainUrl}&newCfsUrl=${forumUrl()}/";
    var rst = await Net.get(url);
    var rstM = ForumBbsLoginRspProtocol();
    await rstM.parse(rst);
    if (rstM.code != 200 && rstM.code != 404) throw Exception("${rstM.msg}");
    return rstM;
  }

  String forumUrl(){
    String baseUrl = Api.baseMainUrl;
    List<String> list = baseUrl.split('//');
    String suffixUrl = list[1];
    List<String> listUrl = suffixUrl.split('.');
    if(listUrl.length == 4){
      listUrl[1] = 'nbbs-web';
    }
    else{
      listUrl[0] = 'nbbs-web';
  }
    String url = list[0] + '//';
    for(int i = 0; i < listUrl.length; i ++){
      String element = listUrl[i];
      url = url + element;
      if(i < listUrl.length - 1){
        url = url + '.';
      }
    }
    return url;
  }
}




class ForumBbsLoginRspProtocol extends BaseModel {
  String url = '';
  Future parse(Map<String, dynamic> map) async {
    super.fromMap(map);
    if(map == null || map.isEmpty) return;
    url = AiJson(map).getString('data');
  }
}