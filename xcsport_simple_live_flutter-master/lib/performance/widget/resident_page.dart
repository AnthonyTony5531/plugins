import 'package:fast_ai/performance/manager/common_kit_manager.dart';
import 'package:fast_ai/performance/manager/kit_manager.dart';
import 'package:fast_ai/performance/widget/performance_page.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function :  调试工具渲染层

class ResidentPage extends StatefulWidget {
  static final GlobalKey<_ResidentPageState> residentKey = GlobalKey<_ResidentPageState>();

  static String tag = "/";

  ResidentPage() : super(key: residentKey);

  @override
  _ResidentPageState createState() => _ResidentPageState();
}

class _ResidentPageState extends State<ResidentPage> {
  Widget getPage() {
    Widget page;
    page ??= CommonKitManager.instance.getKit(router)?.createDisplayPage();
    page ??= KitManager.instance.getKit(router)?.createDisplayPage();
    page ??= PerformancePage();
    return page;
  }

  String getTitle() {
    String title;
    title ??= CommonKitManager.instance.getKit(router)?.getKitName();
    title ??= KitManager.instance.getKit(router)?.getKitName();
    title ??= '工具浮窗';
    return title;
  }

  String get router {
    final tag = ResidentPage.tag;
    if (tag == null || tag == '') return ResidentPage.tag = '/';
    if (tag.length > 1) {
      int index = tag.lastIndexOf('/');
      return tag.substring(index + 1);
    }
    return tag;
  }

  @override
  Widget build(BuildContext context) {
    print('tag => ${ResidentPage.tag}');
    var mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    final double width = size.width;
    final double height = size.height;
    final double topMargin = mediaQuery.orientation == Orientation.portrait ? 150.0 : 0.0;
    if (height == 0) return Container();
    return Positioned(
      child: Container(
        width: width,
        color: Color(0x88000000),
        height: height,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                top: topMargin,
                child: Container(
                  width: width,
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xfff6f6f7),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                  ),
                  child: Text(
                    getTitle(),
                    style: TextStyle(color: Color(0xff000000), fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: topMargin + 50.0,
                child: Container(
                  color: Colors.white,
                  width: width,
                  height: height - topMargin - 50,
                  child: getPage(),
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                top: topMargin + 50.0,
                child: Container(
                  color: Color(0xffeae6ea),
                  width: width,
                  height: 0.5,
                ),
              ),
              if (ResidentPage.tag != '/')
                Positioned(
                  top: topMargin,
                  left: 2.0,
                  child: GestureDetector(
                    onTap: () => onCallBack(),
                    behavior: HitTestBehavior.translucent,
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Icon(Icons.arrow_back, color: Color(0xff000000)),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void onCallBack() {
    if (ResidentPage.tag == '/') return;
    final int index = ResidentPage.tag.lastIndexOf('/');
    if (index == -1 && index == 0) return;
    if (mounted) {
      setState(() {
        ResidentPage.tag = ResidentPage.tag.substring(0, index);
      });
    }
  }
}
