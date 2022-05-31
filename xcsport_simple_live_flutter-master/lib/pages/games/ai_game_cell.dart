//**********************************************************************
//* author:Sam
//* date:2020-05-11
//**********************************************************************

//import 'package:fast_ai/api/protocols/aigames/ai_game_url_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/loading_dialog.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ai_game_cell_model.dart';
import 'game_webview.dart';

class AiGameCell extends StatelessWidget {
  final AiGameCellModel model;
  VoidCallback onCallbackRefresh;
  AiGameCell({Key key, this.model, this.onCallbackRefresh}) : super(key: key);
  bool isSendRequest = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
//        if (Hooks.ins.isBlocked(HookName.EnterCq9Game, {})) return;
//        print(" protocol.url==${model.url}");
////        if (!isStrNullOrEmpty(model.url)) {
////          showMaterialPageRoute(context, GameWebView(initialUrl: model.url,)).then((f) {
////            SystemChrome.setPreferredOrientations([
////              DeviceOrientation.portraitDown,
////              DeviceOrientation.portraitUp,
////            ]).then((f){
////              print('00-url-GameWebView-setPreferredOrientations.then');
////            });
////            print('00-url-GameWebView');
////          });
////        } else {
//        if (isSendRequest) {
//          return;
//        }
//        isSendRequest = true;
//        // 阿布2021-1-11 要求进入时发请求，防止进游戏报错
//        final loading = LoadingDialog.create(
//            '${config.langMap['baseLang']['virtual']['loadingContent']}...');
//        loading.show(context);
//        var protocol = await GameURlNewReqProtocol(
//                supplierId: model.supplierId, gameKey: model.gameKey)
//            .request();
//        loading.dismiss();
//        await sleep(500);
//        if (protocol.isSuccess && !isStrNullOrEmpty(protocol.url)) {
//          isSendRequest = false;
//          model.url = protocol.url;
//          model.isShowLock = false;
//          if (onCallbackRefresh != null) {
//            onCallbackRefresh();
//          }
//          showMaterialPageRoute(
//              context,
//              GameWebView(
//                initialUrl: protocol.url,
//              )).then((f) {
//            SystemChrome.setPreferredOrientations([
//              DeviceOrientation.portraitDown,
//              DeviceOrientation.portraitUp,
//            ]);
//            print('00-GameWebView');
//          });
//        } else {
//          isSendRequest = false;
//          if (!protocol.isSuccess) {
//            showToas(
//                "${config.langMap['baseLang']['networkError']['networkErrorRetry4']}");
//          }
//          if (isStrNullOrEmpty(protocol.url)) {
//            model.isShowLock = true;
//            if (onCallbackRefresh != null) {
//              onCallbackRefresh();
//            }
//          }
//        }
////        }
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 16),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: <Widget>[
                AiImage.fromUrl(
                    string(model?.img),
                    'assets/images/aigame/gamelist_pic_loading.png',
                    BoxFit.fitWidth),
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Offstage(
//                      offstage: !isStrNullOrEmpty(model.url),
                      offstage: !model.isShowLock,
                      child: Container(
                        color: Color(0xFF161620).withOpacity(0.9),
                        child: Center(
                          child: AiImage.svgLogo(
                              'assets/images/aigame/icon_cq9_lock.svg',
                              size: 32.0),
                        ),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
