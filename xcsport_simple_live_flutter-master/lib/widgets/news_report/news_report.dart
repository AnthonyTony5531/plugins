import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';

class NewsReportCarousel extends StatefulWidget {
  NewsReportCarousel({
    Key key,
    this.itemHeight = 60,
    this.widgetList,
    this.showCount = 3,
    this.carouselTime = 3,
    this.isForbidGesture = true,
    this.isAutoScoll = true,
    this.onCurrentShowWiget,
    this.isAdjustWidth = false,
  }) : super(key: key);
  final double itemHeight;        // 子组件高(滚动距离)
  final int showCount;            // 窗口显示的数量
  final List<Widget> widgetList;  // 整个要显示的数量
  final int carouselTime;         // 轮播时间
  final bool isForbidGesture;     // 禁止手势
  final bool isAutoScoll;         // 是否自动滚动
  final ValueChanged<Widget> onCurrentShowWiget; // 当前显示的组件
  final bool isAdjustWidth;       // 详情心愿礼物


  @override
  _NewsReportCarouselState createState() => _NewsReportCarouselState();
}

class _NewsReportCarouselState extends State<NewsReportCarousel> {

  List<Widget> get widgetList {return widget?.widgetList ?? [];}
  ScrollController controller = ScrollController();
  bool loop = false;
  bool isScroll = false;

  @override
  void initState() {
    super.initState();
    if (widgetList.length > widget.showCount && widget.isAutoScoll) {
      startTimer();
    }
    controller.addListener((){});
  }

  @override
  void dispose() {
    super.dispose();
    loop = false;
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (_){
        return true;
      },
      child: Container(
        child: ListView.builder(
                controller: controller,
                itemBuilder: (BuildContext context,int index){
                  if (widgetList.length > index) {
                    if(widget.isAdjustWidth){
                      return Row(
                        children: [
                          widgetList[index],
                          Expanded(child: Container())
                        ],
                      );
                    }
                    return widgetList[index];
                }
                  return Container();
                },
                itemCount: widget.showCount + 1,
                physics: widget.isForbidGesture ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(),
              ),
      ),
    );
  }


startTimer() async {
  //无需定时器的一定停止
  if (loop) return;
  //开启定时器
  loop = true;
  while (loop) {
    await sleep(widget.carouselTime * 1000);
    isScroll = !isScroll;
    if (mounted) {
      if(isScroll){
        controller.animateTo(widget.itemHeight, duration: Duration(milliseconds: 250), curve: Curves.linear);
        //print('滚动');
      }
      else{
        //print('复位');
        Widget childWidget = widget.widgetList.first;
        widget.widgetList.removeAt(0);
        widget.widgetList.add(childWidget);
        setState(() {});
        controller.jumpTo(0);
        controller.animateTo(widget.itemHeight, duration: Duration(milliseconds: 250), curve: Curves.linear);
        if (widget?.onCurrentShowWiget != null) {
          if (widget.widgetList.length > 1) {
            widget?.onCurrentShowWiget(widget.widgetList[1]);
          }
        }
      }
    }
  }
  loop = false;
}
  
}