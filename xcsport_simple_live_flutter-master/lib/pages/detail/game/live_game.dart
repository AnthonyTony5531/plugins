import 'package:fast_ai/api/exception/customize_exception.dart';
import 'package:fast_ai/api/protocols/aigames/ai_game_url_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
import 'package:fast_ai/module/common/widget/loading_dialog.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/service/popu_share_service.dart';
import 'package:fast_ai/pages/detail/chatroom/chatroom_game/game_common_page.dart';
import 'package:fast_ai/pages/new_user_course/new_user_course_page.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sdk_games/config/game_sdk_config.dart';
import 'package:flutter_sdk_games/page/game_main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LiveGame {
  static List<String> _openKey = [];

  static bool get isOpenGame => _openKey.isNotEmpty;

  static void openGamePan(
      {@required BuildContext context,
      @required String supplierId,
      @required String gameKey,
      String roomNo = '',
      String anchorId = '',
      String tableId,
      bool isInternalWeb = false, // 是否内部H5打开
      ValueChanged<bool> callBack}) async {
    if (supplierId == null || gameKey == null) {
      callBack?.call(false);
      return;
    }

    // 调路由打开网页
    if (isInternalWeb) {
      showMaterialPageRoute(
          context,
          GameCommonPage(
            supplierId: supplierId,
            gameKey: gameKey,
            roomNo: roomNo,
            anchorId: anchorId,
          )).then((value) => callBack?.call(true));
      return;
    }

    final loading = LoadingDialog.create('${config.langMap['baseLang']['virtual']['loadingContent']}...', cancel: false);
    try {
      // 已经打开了该游戏
      if (_openKey.contains(gameKey)) return;

      loading.show(context);
      await sleep(250); // 延迟150,避免没网络的请求快过弹窗
      var result = await GameURlNewReqProtocol(supplierId: supplierId, gameKey: gameKey).request();
      loading.dismiss();
      await sleep(250);
      if (result.isError) {
        showToas("${config.langMap['baseLang']['networkError']['networkErrorRetry4']}");
        callBack?.call(false);
        return;
      }
      Widget gameChild;
      String gameUrl = '${result.url}&roomNo=$roomNo&anchorId=$anchorId&game=$gameKey';
      if (tableId != null && tableId.isNotEmpty) {
        gameUrl = '$gameUrl&tableId=$tableId';
      }

      bool isSdkDownload = ModuleSwitch.getInstance().gameYxsdkxz();
      if (!isStrNullOrEmpty(supplierId) && supplierId == 'aigame' && isSdkDownload) {
        String res = await GameSDkConfig.ins.checkGameToDownload(context,
            gameUrl: gameUrl, downloadApi: result.downloadApi, sha256Api: result.sha256Api, httpSha256: result.sha256Code);
        if (res == 'hasGame') {
          gameChild = GameMainPage(showFullScreen: false, builder: GameSDKBuilder(gameUrl: gameUrl));
        } else if (res == 'goToWeb') {
          gameChild = NewUserCoursePage(
            isShowGameBgColor: true,
            isJointLang: false,
            url: gameUrl,
            isSystemRepair: true,
            usesGameWeb: true,
          );
        } else {
          callBack?.call(false);
        }
      } else {
        gameChild = NewUserCoursePage(
          isShowGameBgColor: true,
          isJointLang: false,
          url: gameUrl,
          isSystemRepair: true,
          usesGameWeb: true,
        );
      }
      if (gameChild == null) return;
      if (_openKey.contains(gameKey)) return;
      _openKey.add(gameKey);
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      //640 * 960适配(w*h)百家乐
      //375 * 474(w*h)龙虎斗
      double screenW = MediaQuery.of(context).size.width;
      double height = 474.0 * screenW / 375.0;
      if (gameKey == 'BAC') {
        height = 960.0 * screenW / 640.0;
      }
      PopupShareService.ins.pause('_liveGame');
      showModalBottomSheetRoute(context, enableDrag: true, isMiniGame: true, height: height, child: gameChild, barrierColor: Colors.transparent).then((v) {
        _openKey.remove(gameKey);
        callBack?.call(true);
        // 刷新钱包余额
//        config.userInfo.walletModel.getWalletList();
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        PopupShareService.ins.resume('_liveGame');
      });
    } catch (e) {
      String errorMsg;
      String toastMsg = config.baseLang['networkError']['networkNoNet'] ?? '好像网络出问题了，请检查网络后重试';
      if (e is CustomizeException) {
        errorMsg = e.message;
      }
      Fluttertoast.showToast(
        msg: errorMsg ?? toastMsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xB2000000),
        textColor: Colors.white,
        fontSize: 14.0,
      );

      debugPrint('e => $e');
    } finally {
      loading.dismiss();
    }
  }
}
