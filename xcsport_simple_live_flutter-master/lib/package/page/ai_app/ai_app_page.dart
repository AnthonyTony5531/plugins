import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/package/page/ai_laucher/ai_laucher_page.dart';
//import 'package:fast_ai/pages/login/token_overdue_page.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import 'package:fast_ai/utils/ai_navigator_observer.dart';
import 'package:fast_ai/utils/change_localizations.dart';
import 'package:fast_ai/utils/styles.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../../../ai_app.dart';
import '../../../router.dart';
import 'ai_app_page_style.dart';
import 'ai_app_page_view_model.dart';

///
/// Ai4.0的 APP 頁面
///
class AiAppPage extends StatefulView<AiAppPageStyle, AiAppPageViewModel> {
  final AiAppPageViewModel model;

  AiAppPage({Key key,  this.model }) : super(model: model, key: key);

  @override
  _AiAppPageState createState() => _AiAppPageState();
}

class _AiAppPageState extends ViewState<AiAppPageStyle, AiAppPageViewModel, AiAppPage> {
  AiAppPageViewModel _viewModel;
  @override
  AiAppPageViewModel get defaultModel {
    _viewModel ??= AiAppPageViewModel();
    return _viewModel;
  }

  @override
  Widget render(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CurrentLocale())],
      child: Consumer<CurrentLocale>(
        builder: (context, local, child) {
          return MaterialApp(
            initialRoute: '',
//            onGenerateRoute: (setting) {
//              if ("TokenOverduePage" == setting.name) {
//                return PageRouteBuilder(
//                    opaque: false,
//                    pageBuilder: (context, anmation, secondaryA) {
//                      if (!config.isApp) XcSdkApi.tokenTimeout();
////                      if (config.sdkParams.handledTimeout || config.isTabSDK) { // 商户外部处理Token失效 TAB版展示toast不弹框
////                        return LoginToast();
////                      }
//                      return TokenOverduePage();
//                    }
//                );
//              }
//              return null;
//            },
            debugShowCheckedModeBanner: false,
            theme: Styles.aiTheme,
            onGenerateTitle: config.isApp ? (context) => '${Config.appName}' : null,
            localizationsDelegates: [
              const TranslationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              //const Locale('en', 'US'),
              const Locale('zh', 'CN'),
              const Locale('zh', 'TW'),
            ],
            home: AiLauncherPage(),
            navigatorKey: ccRoute.navigatorStateKey,
            navigatorObservers: [AiNavigatorObserver.getInstance(),ccRoute],
            routes: AiRouter.routes,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget,
              );
            },
          );
        },
      ),
    );
  }
}