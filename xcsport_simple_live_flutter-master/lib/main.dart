import 'package:fast_ai/ai_app.dart';
import 'package:fast_ai/config/config.dart';
import 'package:common_component/package/common_component_package.dart';
//import 'package:fast_ai/module/live188/page/live188_app/live188_app_page.dart';
//import 'package:fast_ai/module/live188/page/live188_app/live188_app_page_view_model.dart';
import 'package:fast_ai/package/page/ai_app/ai_app_page.dart';
import 'package:fast_ai/package/page/ai_app/ai_app_page_view_model.dart';
import 'package:fast_ai/performance/kit_app.dart';
import 'package:fast_ai/performance/tool/system_log.dart';
//import 'package:fast_ai/sdk_api/vs_adapter.dart';
import 'package:fast_ai/services/sys_service.dart';
import 'package:fast_ai/widgets/default_views/match_empty.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  print('00-ai sports main start');
  WidgetsFlutterBinding.ensureInitialized();
  await ccPackage.init();
  SysService.ins.initSdkInfo();
  //await SysService.ins.queryMerchantType();
  if (kDebugMode && config.isApp) {
    // config.appType = AppType.Gbet;
  }
  //是否調試4.0
  bool debug4_0 = false;
  if(debug4_0){
    config.appInfo.versionName = "4.0.0";
    config.appInfo.iosVersion = "4.0.0";
  }
  print('11-ai sports initSdkInfo finished config.appType=${config.appType} aiBuildVersion=${config.aiBuildVersion}');
  Widget app;
  if (config.isAi) {
    if(config.aiBuildVersion >= 4.0){
      app = AiAppPage(model: AiAppPageViewModel(),);
    }else{
      app = AiApp();
    }
  } else if(config.isGbet) {
    print('');
//    app = Live188AppPage(model: Live188AppPageViewModel());
  }
  else if(config.isVs) {
    config.isVMSport = true;
//    app = await VSAdapter.showVSPage();
  }
  else if(config.is365) {}
  SystemLog.runApp(
    app: KitApp(app),
    redWidgetCallback: (error) {
      return Scaffold(
        body: MatchEmtpy(),
      );
    },
  );

//下面导致tab版本炸裂。显示不出投注单。

//   if (window.physicalSize.isEmpty) {
//     window.onMetricsChanged = () {
//       if (!window.physicalSize.isEmpty) {
//         window.onMetricsChanged = null;
//         if (gReleaseShowLog) {
//           runApp(KitApp(app));
//         } else {
//           //          Logs.runAppWidthLogs(KitApp(AiApp()));
//           SystemLog.runApp(
//             app: KitApp(app),
//             redWidgetCallback: (error) {
//               return Scaffold(
//                 body: MatchEmtpy(name: 'global_error', type: 'detail'),
//               );
//             },
//           );
//         }
//       }
//     };
//   } else {
//     if (gReleaseShowLog) {
//       runApp(KitApp(app));
//     } else {
// //      Logs.runAppWidthLogs(KitApp(AiApp()));
//       SystemLog.runApp(
//         app: KitApp(app),
//         redWidgetCallback: (error) {
//           return Scaffold(
//             body: MatchEmtpy(name: 'global_error', type: 'detail'),
//           );
//         },
//       );
//     }
//   }
}
