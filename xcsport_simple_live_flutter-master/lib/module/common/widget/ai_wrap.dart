import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:flutter/material.dart';

class AiWrap extends StatefulWidget {
  final BuildContext context;
  final Widget header;
  final Widget header2;
  final Widget tail;
  final Widget tail2;
  final List<ChildContent> childContent;
  final TextOverflow textOverflow;
  final double width;
  final double maxLines;
  final bool initWidthIsDynamic;
  final VerticalDirection verticalDirection;
  final double wrapWidth;
  final double headerWidth;
  final double header2Width;
  final double tailWidth;
  final double tailWidth2;

  AiWrap({
    Key key,
    this.context,
    this.header,
    this.header2,
    this.childContent,
    this.tail,
    this.tail2,
    this.textOverflow,
    this.width,
    this.maxLines,
    this.initWidthIsDynamic = true,
    this.verticalDirection = VerticalDirection.down,
    this.wrapWidth,
    this.headerWidth,
    this.header2Width,
    this.tailWidth,
    this.tailWidth2,
  }) : super(key: key);

  @override
  _AiWrapState createState() => _AiWrapState();
}

class _AiWrapState extends State<AiWrap> {
  double headerWidth = 0;
  double header2Width = 0;
  double tailWidth = 0;
  double tailWidth2 = 0;
  double wrapWidth;
  GlobalKey headerKey = GlobalKey();
  GlobalKey header2Key = GlobalKey();
  GlobalKey tailKey = GlobalKey();
  GlobalKey tailKey2 = GlobalKey();
  GlobalKey wrapKey = GlobalKey();
  bool isInited = false;
  @override
  void initState() {
    super.initState();
    if(widget.wrapWidth == null || widget.headerWidth == null || widget.header2Width == null || widget.tailWidth == null || widget.tailWidth2 == null){
      Future.delayed(Duration(milliseconds: 100), () {
        if (mounted) {
          isInited = true;
          setState(() {
            wrapWidth = wrapKey.currentContext.size.width;
            headerWidth = headerKey.currentContext.size.width;
            header2Width = header2Key.currentContext.size.width;
            tailWidth = tailKey.currentContext.size.width;
            tailWidth2 = tailKey2.currentContext.size.width;
          });
        }
      });
    } else {
      isInited = true;
      wrapWidth = widget?.wrapWidth ?? 0;
      headerWidth = widget?.headerWidth ?? 0;
      header2Width = widget?.header2Width ?? 0;
      tailWidth = widget?.tailWidth ?? 0;
      tailWidth2 = widget?.tailWidth2 ?? 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isInited?1:0,
      child: Container(

        child: Wrap(
//          crossAxisAlignment: WrapCrossAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          key: wrapKey,
          verticalDirection: widget.verticalDirection,
          children: []
            ..add(Container(
              key: headerKey,
              child: widget?.header ??
                  SizedBox(
                    width: 0,
                  ),
            ))
            ..add(Container(
              key: header2Key,
              child: widget?.header2 ??
                  SizedBox(
                    width: 0,
                  ),
            ))
            ..addAll(_getMiddleWidget())
            ..add(Container(
              key: tailKey,
              child: widget?.tail ??
                  SizedBox(
                    width: 0,
                  ),
            ))..add(Container(
              key: tailKey2,
              child: widget?.tail2 ??
                  SizedBox(
                    width: 0,
                  ),
            )),
        ),
      ),
    );
  }

  List<Widget> list = [];
  List<double> widths = [];
  double totalChildWidth = 0;
  List<Widget> _getMiddleWidget() {
    list.clear();
    widths.clear();
    totalChildWidth = 0;
    if ((widget?.childContent?.length ?? 0) >= 0 && list.length == 0) {
      widget.childContent.forEach((content) {
        double h = (AiMeasure.measureText("中文", content.style).height*MediaQuery.of(context).textScaleFactor );
        if (content.canSplit && isNotEmpty(content.text)) {
          var iterator = Runes(content.text).iterator;
          while(iterator.moveNext()){
            double w = (AiMeasure.measureText(iterator.currentAsString, content.style).width*MediaQuery.of(context).textScaleFactor );
            list.add(
              Container(
                color: content.color,
//                padding: content.padding ?? EdgeInsets.zero,
//                margin: content.margin ?? EdgeInsets.zero,
                height: h+(content.padding ?? EdgeInsets.zero).top+(content.padding ?? EdgeInsets.zero).bottom,
                width: w,
//                alignment: Alignment.bottomCenter,
                alignment: Alignment.center,
                child: Text(
                  iterator.currentAsString,
                  style: content.style,
                ),
              ),
            );

            widths.add(w);
            totalChildWidth += w;
          }
        } else {
          String str = content.text ?? '';
          double w = (AiMeasure.measureText(str, content.style).width*MediaQuery.of(context).textScaleFactor);
          list.add(
            Container(
              color: content.color,
              height: h+(content.padding ?? EdgeInsets.zero).top+(content.padding ?? EdgeInsets.zero).bottom,
              width: w,
              alignment: Alignment.center,
//              padding: content.padding,
//              margin: content.margin,
              child: Text(
                str,
                style: content.style,
              ),
            ),
          );
          widths.add(w);
          totalChildWidth += w;
        }

      });
    }

    if ((widget?.childContent?.length ?? 0) >= 0) {
      if (widget?.maxLines != null && wrapWidth != null) {
        double totalWidth = widget.maxLines * wrapWidth;
        double remainWith = totalWidth;
        remainWith -= headerWidth;
        remainWith -= header2Width;
        remainWith -= tailWidth;
        remainWith -= tailWidth2;


        double textOverflowWidth = AiMeasure.measureText('...', widget.childContent[widget.childContent.length - 1].style).width*MediaQuery.of(context).textScaleFactor;
        //总长度大于可用长度
        if (totalChildWidth > remainWith) {
          List<Widget> limits = [];
          for (int i = 0; i < list.length; i++) {
            double w = widths[i];
            if ((remainWith - textOverflowWidth) > w) {
              if (remainWith % wrapWidth >= w) {
                limits.add(list[i]);
                remainWith -= w;
              } else {
                //行剩下空间不足够放，总长度减掉剩下部分，然后从下一行开始放
                remainWith -= remainWith % wrapWidth;
                limits.add(Container(
                  width: remainWith % wrapWidth,
                ));
                if ((remainWith - textOverflowWidth) > w) {
                  limits.add(list[i]);
                  remainWith -= w;
                }
              }
            } else {
              limits.add(Text('...', style: widget.childContent[widget.childContent.length - 1].style));
              break;
            }
          }
          list.clear();
          list.addAll(limits);
        }
      }
      if(!widget.initWidthIsDynamic){
        if(wrapWidth == null){
          return [];
        }
      }
    }
    return list;
  }
}

class ChildContent {
  String text;
  bool canSplit;
  TextStyle style;
  EdgeInsets padding;
  EdgeInsets margin;
  Color color;
  ChildContent({
    this.text,
    this.style,
    this.canSplit = false,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.color,
  });
}
