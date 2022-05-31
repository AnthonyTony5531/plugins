import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'manager/performance_manager.dart';

/// @author grey
/// Function :  顶层控件

class KitApp extends StatefulWidget {
  // 放置应用App widget的容器
  static final GlobalKey appKey = GlobalKey();

  final Widget appView;

  KitApp(this.appView);

  @override
  State<StatefulWidget> createState() => KitAppState();
}

class KitAppState extends State<KitApp> {
  final List<Locale> supportedLocales = const <Locale>[Locale('en', 'us')];

  Iterable<LocalizationsDelegate<dynamic>> get _localizationsDelegates sync* {
    yield DefaultMaterialLocalizations.delegate;
    yield DefaultCupertinoLocalizations.delegate;
    yield DefaultWidgetsLocalizations.delegate;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          _KitWrapper(widget.appView),
          MediaQuery(
            data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
            child: Localizations(
              locale: supportedLocales.first,
              delegates: _localizationsDelegates.toList(),
              child: Overlay(key: PerformanceManager.instance.overlayKey),
            ),
          ),
        ],
      ),
    );
  }
}

// APP层view
class _KitWrapper extends StatelessWidget {
  _KitWrapper(this._origin) : super(key: KitApp.appKey);

  final Widget _origin;

  @override
  Widget build(BuildContext context) {
    return _origin;
  }
}
