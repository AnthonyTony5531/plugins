import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//sdk输入的widget
class SdkInputWidget extends StatefulWidget {
  //mine_customer_icon：我的 - 顶部客服icon
  //mine_wallet：我的 - 我的钱包
  //mine_advertSlider：我的 - 优惠活动
  //mine_menu：我的 - 菜单
  //inside_message：站内信
  final String widgetKey;
  final EdgeInsetsGeometry padding;
  SdkInputWidget({Key key, this.widgetKey, this.padding}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SdkInputWidget();
  }
}

class _SdkInputWidget extends State<SdkInputWidget> {
  bool offstage = true;

  EdgeInsetsGeometry get padding {
    return widget.padding != null
        ? widget.padding
        : EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget displayWidget;

  @override
  Widget build(BuildContext context) {
    if (config.isFastAiSdk) {
      dynamic widgets = config.fastAiSdkParams.widgets;
      String key = widget.widgetKey;
      if (widgets != null) {
        dynamic widgetFlag = widgets[key];
        if (widgetFlag is Widget) {
          displayWidget = widgetFlag;
          offstage = false;
        }
      }
    }
    return Offstage(
      offstage: offstage,
      child: Padding(padding: padding, child: displayWidget),
    );
  }
}
