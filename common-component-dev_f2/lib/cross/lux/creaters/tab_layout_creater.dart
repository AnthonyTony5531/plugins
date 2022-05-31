import 'package:common_component/widget/sc_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lux_creater.dart';

enum TabMode {
  topLeft,
  topCenter,
  topRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

class TabLayout extends StatefulWidget {
  final List<TabGroup> tabs;
  final TabMode mode;
  final TextStyle labelStyle;
  final TextStyle unselectedLabelStyle;
  final Color labelColor;
  final Color unselectedLabelColor;
  final Color indicatorColor;
  final Color tabBarColor;
  final double indicatorWeight;
  final double paddingBottom;

  TabLayout({
    @required this.tabs,
    this.mode = TabMode.topCenter,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.labelColor,
    this.unselectedLabelColor,
    this.indicatorColor,
    this.tabBarColor,
    this.indicatorWeight,
    this.paddingBottom,
  });

  @override
  TabLayoutState createState() => TabLayoutState();
}

class TabLayoutState extends State<TabLayout> with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.tabs?.length ?? 0, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildTabBody();
  }

  Widget _buildTabBody() {
    TabMode mode = widget.mode ?? TabMode.topCenter;
    if (mode == TabMode.bottomLeft || mode == TabMode.bottomCenter || mode == TabMode.bottomRight) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildTabContent(),
          _buildTabBar(),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildTabBar(),
          _buildTabContent(),
        ],
      );
    }
  }

  Widget _buildTabBar() {
    Alignment _align = Alignment.center;
    TabMode mode = widget.mode ?? TabMode.topCenter;
    if (mode == TabMode.topLeft || mode == TabMode.bottomLeft) {
      _align = Alignment.centerLeft;
    } else if (mode == TabMode.topRight || mode == TabMode.bottomRight) {
      _align = Alignment.centerRight;
    }
    return Container(
      color: widget.tabBarColor ?? Colors.white,
      child: ScTabBar(
        controller: _controller,
        isScrollable: true,
        labelStyle: widget.labelStyle ?? TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        unselectedLabelStyle: widget.unselectedLabelStyle ?? TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        labelColor: widget.labelColor ?? Color(0xff202020),
        unselectedLabelColor: widget.unselectedLabelColor ?? Color(0xff888888),
        indicatorColor: widget.indicatorColor ?? Colors.transparent,
        indicatorWeight: widget.indicatorWeight ?? 0.1,
        tabAlignment: _align,
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        tabs: widget.tabs?.map((value) => value.head)?.toList() ?? [],
      ),
    );
  }

  Widget _buildTabContent() {
    return Expanded(
      child: TabBarView(
        controller: _controller,
        children: widget.tabs?.map((value) => value.body)?.toList() ?? [],
      ),
    );
  }
}

class TabGroup {
  final Widget head;
  final Widget body;

  TabGroup({@required this.head,@required this.body});
}

class TabGroupCreater extends LuxCreater {
  String get lux => "TabGroup";

  TabGroup create(BuildContext context, Map script) {
    return TabGroup(
      head: LuxCreater.createIns(context, script, "head"),
      body: LuxCreater.createIns(context, script, "body"),
    );
  }

  Map get sample => {
        "lux": "TabGroup",
      };
}

class TabLayoutCreater extends LuxCreater {
  String get lux => "TabLayout";

  @override
  bool get isWidget => true;

  Widget create(BuildContext context, Map script) {
    return TabLayout(
      tabs: LuxCreater.createInsList<TabGroup>(context, script, "tabs"),
      mode: LuxCreater.parseEnum(script, 'mode'),
      labelStyle: LuxCreater.parseTextStyle(script, 'labelStyle'),
      unselectedLabelStyle: LuxCreater.parseTextStyle(script, 'unselectedLabelStyle'),
      labelColor: LuxCreater.parseColor(script, 'labelColor'),
      unselectedLabelColor: LuxCreater.parseColor(script, 'unselectedLabelColor'),
      indicatorColor: LuxCreater.parseColor(script, 'indicatorColor'),
      indicatorWeight: LuxCreater.parseDouble(script, 'indicatorWeight'),
      paddingBottom: LuxCreater.parseDouble(script, 'paddingBottom'),
    );
  }

  Map get sample => {
        "lux": "TabLayout",
        'mode': 'TabMode.topLeft',
        "labelStyle": {
          'fontSize': '16.0',
          'fontWeight': 'FontWeight.bold',
        },
        "unselectedLabelStyle": {
          'fontSize': '12.0',
          'fontWeight': 'FontWeight.normal',
        },
        "labelColor": "0xFFFFFFFF",
        "unselectedLabelColor": "0xFF111111",
        "indicatorColor": "0x00000000",
        "indicatorWeight": "0.1",
        "paddingBottom": "0.0",
        "tabs": [
          {
            "lux": "TabGroup",
            "head": {
              "lux": "Container",
              "width": '80',
              "height": '50',
              "alignment": "Alignment.center",
              "color": "0xFFFF0000",
              "child": {
                "lux": "Text",
                "data": "Tab1",
              }
            },
            "body": {
              "lux": "Container",
              "color": "0xFFFF8888",
            },
          },
          {
            "lux": "TabGroup",
            "head": {
              "lux": "Container",
              "width": '80',
              "height": '50',
              "alignment": "Alignment.center",
              "color": "0xFFFF8800",
              "child": {
                "lux": "Text",
                "data": "Tab2",
              }
            },
            "body": {
              "lux": "Container",
              "color": "0xFFFFFF88",
            },
          },
          {
            "lux": "TabGroup",
            "head": {
              "lux": "Container",
              "width": '80',
              "height": '50',
              "alignment": "Alignment.center",
              "color": "0xFF00FF00",
              "child": {
                "lux": "Text",
                "data": "Tab3",
              }
            },
            "body": {
              "lux": "Container",
              "color": "0xFF00FF88",
            },
          },
        ],
      };
}
