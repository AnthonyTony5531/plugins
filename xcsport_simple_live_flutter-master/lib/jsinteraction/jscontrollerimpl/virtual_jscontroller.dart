//**********************************************************************
//* author:Sam
//* date:2020-04-18
//**********************************************************************

import '../controller/js_controller.dart';

typedef HeightCallback = void Function(double height);

class VirtualJsController extends JsController{

  final HeightCallback callback;

  VirtualJsController({this.callback});

  @override
  String get name => 'virtual_match';

  @override
  Future<JsResponseData> process(String method, Map<String,dynamic > params) async{
    if(method == 'updateVideoHeight'){
      String height = params['height'];
      if(callback != null){
        callback(double.tryParse(height) ?? 0);
      }
      return JsResponseData();
    }
    return null;
  }

}