import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/xc_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class ExpansionLayout extends StatefulWidget {
  const ExpansionLayout({
    Key key,
    this.backgroundColor,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.isExpanded,
    this.milliseconds,
    this.onMoreVideo,
    this.horizontalDragCallBack,
    this.isListDetail = false,
  }) : super(key: key);

  final ValueChanged<bool> onExpansionChanged;
  final VoidCallback onMoreVideo;
  final List<Widget> children;

  final Color backgroundColor;
  //增加字段控制是否折叠
  final bool isExpanded;
  final int milliseconds;
  final Widget trailing;
  final HorizontalDragCallBack horizontalDragCallBack;
  final bool isListDetail;

  @override
  _ExpansionLayoutState createState() => _ExpansionLayoutState();
}

class _ExpansionLayoutState extends State<ExpansionLayout>
    with SingleTickerProviderStateMixin {
//折叠展开的动画，主要是控制height
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  AnimationController _controller;
  Animation<double> _heightFactor;

  bool _isExpanded;

  @override
  void initState() {
    super.initState();
    //初始化控制器以及出事状态
    _controller = AnimationController(duration:Duration(milliseconds: widget.milliseconds) , vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _isExpanded = widget.isExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = widget.isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
        });
      }
      //保存页面数据
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    
    //回调展开事件
    if (widget.onExpansionChanged != null)
      widget.onExpansionChanged(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRect(
                child: Align(
                  heightFactor: _heightFactor.value,
                  child: child,
                ),
              ),
              Positioned(
                top: 30.0,
                right:0.0,
                child: moreLiveWidget(),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget moreLiveWidget(){
    var baseLang = config.langMap['baseLang'];
    TextStyle textStyle = AiTextStyle(
      color: Colors.white.withOpacity(0.7),
      fontSize: config.skin.fontSize.h5,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
    );
    return (widget.isListDetail || !ModuleSwitch.getInstance().videoAndAnchor())
      ? SizedBox()
      : GestureDetector(
        behavior: HitTestBehavior.opaque,
  //      child: Container(
  //        height: 24.0,
  //        padding: EdgeInsets.only(left: 10.0,right: 6.0),
  //        decoration: BoxDecoration(
  //          color: Colors.black.withOpacity(0.2),
  //          borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0),bottomLeft: Radius.circular(12.0)),
  //        ),
  //        child: Row(
  //          mainAxisAlignment: MainAxisAlignment.center,
  //          children: <Widget>[
  //            Container(
  //              margin: EdgeInsets.only(right: 3.0),
  //              child: AiImage.svgLogo('assets/images/detail/more/icon_detail_video_enter.svg',size: 15.0),
  //            ),
  //            Text(baseLang['detail']['moreAnchor'],style: textStyle,)
  //          ],
  //        ),
  //      ),
        child: Container(
          width: 63.0,
          height: 28.0,
          child: AiImage.asset('assets/images/detail/more/enter_detail_more_live.png',width: 63.0,height: 28.0, userInternational: true),
        ),
        onTap: (){
//          ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailLiveMore);
          if(widget?.onMoreVideo != null){
            widget?.onMoreVideo();
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    //执行以下对应的Tap事件
    _handleTap();
    final bool closed = !_isExpanded && _controller.isDismissed;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: AnimatedBuilder(
        animation: _controller.view,
        builder: _buildChildren,
        child: closed ? null : Column(children: widget.children),
      ),
      onHorizontalDragStart: (details) {
        if(widget?.horizontalDragCallBack != null){
          widget?.horizontalDragCallBack(HorizontalDragType.start,details);
        }
      },
      onHorizontalDragUpdate: (details) {
        if(widget?.horizontalDragCallBack != null){
          widget?.horizontalDragCallBack(HorizontalDragType.update,details);
        }
      },
      onHorizontalDragEnd: (details) {
        if(widget?.horizontalDragCallBack != null){
          widget?.horizontalDragCallBack(HorizontalDragType.end,details);
        }
      },
      onHorizontalDragCancel: (){
        if(widget?.horizontalDragCallBack != null){
          widget?.horizontalDragCallBack(HorizontalDragType.cancel,null);
        }
      },
    );
  }
}
