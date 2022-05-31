
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/player_share_record/share_filter_controller.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';



class ShareFilterWidget extends StatefulWidget {

  final double padding;
  final ShareFilterController controller;

  ShareFilterWidget({this.padding = 10, this.controller});

  @override
  _ShareFilterWidgetState createState() => _ShareFilterWidgetState();
}

class _ShareFilterWidgetState extends State<ShareFilterWidget> {

  String filterThisGameTxt = config.langMap['baseLang']['detail']['onlyThisMatch'];
  // String filterMyAttentionTxt = config.langMap['baseLang']['detail']['onlyFollowedMatch'];
  // List<String> filterItemList = [config.langMap['baseLang']['detail']['byWinRate'],config.langMap['baseLang']['detail']['byTime']];
  int filterItemPosition = 0;
  bool showFilterItemList = false;


  @override
  void initState() {
    widget.controller.addUiListener(_shareFilterUiChange);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeUiListener(_shareFilterUiChange);
    super.dispose();
  }

  void _shareFilterUiChange() async {
    if(mounted){
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        if(mounted){
          setState(() {
            showFilterItemList = false;
          });
        }
      },
      child: Container(
        child: filterHeader(),

        // Column(
        //   mainAxisSize: showFilterItemList ? MainAxisSize.max : MainAxisSize.min,
        //   children: <Widget>[
        //     filterHeader(),
        //     Row(children: <Widget>[
        //       _filterList(showFilterItemList, filterItemPosition, (position){
        //         if(mounted){
        //           setState(() {
        //             showFilterItemList = false;
        //             filterItemPosition = position;
        //             widget.controller?.setOrderBy(position);
        //           });
        //         }
        //       })
        //     ],)
        //     ,
        //   ],
        // ),
      ),
    );
  }


  Widget filterHeader(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Row(
        children: <Widget>[
          // InkWell(
          //   onTap: (){
          //     if(mounted){
          //       setState(() {
          //         showFilterItemList = !showFilterItemList;
          //       });
          //     }
          //   },
          //   child: Container(
          //     height: 24,
          //     width: 74,
          //     padding: EdgeInsets.only(left: 10.0, right: 5.0),
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(12.0),
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         Text('${filterItemList[filterItemPosition]}',textScaleFactor:0.9,style: AiTextStyle(
          //           fontFamily: config.skin.fontFimaly.pingFang,
          //           fontWeight: config.skin.fontWeight.regular,
          //           fontSize: config.skin.fontSize.h5,
          //           color: config.skin.colors.fontColorDark,
          //         ),),
          //         Icon(Icons.arrow_drop_down,size: 18,),
          //       ],
          //     ),
          //   ),
          // ),
          Expanded(
            child: SizedBox(),
          ),
          _switchWidget(filterThisGameTxt, !isNullOrEmpty(widget.controller.filterGidm),(status){
            if(mounted){
              setState(() {
                widget.controller?.setFilterGidm(isNullOrEmpty(widget.controller.filterGidm));
              });
            }
          }),
          // SizedBox(width: 20,),
          // _switchWidget(filterMyAttentionTxt, widget.controller.filterAttention == '1',(status){
          //   if(Hooks.ins.isBlocked(HookName.MatchDetailShareFilterAttention , {})) {
          //     return;
          //   }
          //   if(mounted){
          //     setState(() {
          //       widget.controller?.setFilterAttention(widget.controller.filterAttention != '1');
          //     });
          //   }
          // }),
        ],
      ),
    );
  }


  ///
  // Widget _filterList(bool show,List<String> list, int currentItem,ValueChanged<int> cb){

  //     if(!show){
  //     return Container(width: 0,height: 0,);
  //   }
  //   List<Widget> children = <Widget>[];
  //   double maxWidth = 0;
  //   list?.forEach((l){
  //     double width = AiMeasure.measureText('$l', style).width;
  //     if(width > maxWidth){
  //       maxWidth = width;
  //     }
  //   });
  //
  //   List.generate(list?.length ?? 0, (index){
  //     children.add(InkWell(
  //       onTap: (){
  //         cb(index);
  //       },
  //       child: Container(
  //         height: 39,
  //         alignment: Alignment.center,
  //         padding: EdgeInsets.symmetric(horizontal: 17),
  //         child: Text('${list[index]}', textScaleFactor:0.9,style: style.copyWith(
  //           color: currentItem == index ? config.skin.colors.fontColorDark : config.skin.colors.fontColorDark40
  //         ),),
  //       ),
  //     ));
  //     if(index != list.length -1){
  //       children.add(Container(height: 1,color: config.skin.colors.deviderColor, width: maxWidth+24.0,));
  //     }
  //   });
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(8.0),
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.1),
  //           offset: Offset(0, 2),
  //           blurRadius: 2.0,
  //           spreadRadius: 1.0,
  //         ),
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.01),
  //           offset: Offset(4, 0),
  //           blurRadius: 2.0,
  //           spreadRadius: 1.0,
  //         ),
  //       ],
  //     ),
  //     padding: EdgeInsets.symmetric(horizontal: 3),
  //     margin: EdgeInsets.symmetric(horizontal: widget.padding),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: children,
  //     ),
  //   );
  // }

  Widget _switchWidget(String text,bool switchStatus,ValueChanged<bool> changeCallback){
    return GestureDetector(
      onTap: () {
        changeCallback(!switchStatus);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('$text',style: AiTextStyle(
            fontFamily: config.skin.fontFimaly.pingFang,
            fontWeight: config.skin.fontWeight.regular,
            fontSize: config.skin.fontSize.h5,
            color: Color(0xFF404040),
          ),),
          SizedBox(width: 4,),
          AiSvgPicture.asset(switchStatus ? 'assets/images/form_switch_on.svg' : 'assets/images/form_switch_off.svg')
        ],
      ),
    );
  }

  TextStyle style = AiTextStyle(
    fontFamily: config.skin.fontFimaly.pingFang,
    fontWeight: config.skin.fontWeight.regular,
    fontSize: config.skin.fontSize.h5,
    color: config.skin.colors.fontColorDark,
  );
}
