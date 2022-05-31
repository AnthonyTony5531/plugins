import 'package:fast_ai/pages/bet/member_betting_blank.dart';
import 'package:fast_ai/pages/bet/member_betting_loading.dart';
import "package:fast_ai/utils/ai_image.dart";

import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/pages/member/betting/member_betting_blank.dart';
//import 'package:fast_ai/pages/member/betting/member_betting_loading.dart';
//import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/fresh_listview.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BetSearchPage extends StatefulWidget {

  final dynamic data;
  final Color bgColor;

  BetSearchPage({
    Key key,
    this.data,
    this.bgColor,
  }) : super(key : key);

  @override
  BetSearchPageState createState() => BetSearchPageState();
}

class BetSearchPageState extends State<BetSearchPage> {

  final TextEditingController _editingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool isClear = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      primary: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.0),
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          alignment: Alignment.bottomCenter,
          child: headerView(),
        ),
      ),
      body: GestureDetector(
        onTap: (){
          _focusNode.unfocus();
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: body(),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget headerView(){
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 44,
              margin: EdgeInsets.symmetric(vertical: 7,horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF5F5F5),width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InterValHelper.w(10),
                  AiSvgPicture.asset('assets/images/bet/icon_betlist_search_black.svg',width: 12,height: 12),
                  InterValHelper.w(10),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      //onSubmitted: onSubmitted,
                       onChanged: filterData,
                      // onEditingComplete: (){
                      //   print('onEditingComplete');
                      // },
                      controller: _editingController,
                      maxLines: 1,
                      focusNode: _focusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 17),
                        hintText: '',
                        hintStyle: AiTextStyle(
                          color: const Color(0xFFA3A8B1),
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                        ),
                        border: InputBorder.none,
                      ),
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(30),
                        // WhitelistingTextInputFormatter(RegExp(r"^[\u4e00-\u9fa5_a-zA-Z0-9]+")), //中文，英文，数字，下划线
                      ],
                      style: AiTextStyle(
                        //height: 1,
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: FontFamily.normal,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(left: 7,right: 25),
              alignment: Alignment.center,
              child: Text(config.langMap['baseLang']['cancel'],style: AiTextStyle(
                fontFamily: config.skin.fontFimaly.pingFang,
                fontWeight: config.skin.fontWeight.regular,
                color: Color(0xFF1B91FF),
                fontSize: config.skin.fontSize.h4,
              ),),
            ),
          ),
        ],
      ),
    );
  }

  ///
  void filterData(String text){

  }

  Future<ListResult> loadData(i,s)async{
    return ListResult();
  }

  ///
  void reloadData(event){
    if(mounted){
      setState(() {
        this.isClear = true;
      });
    }
  }

  ///
  Widget body(){
    return Container(
      color: widget.bgColor,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Expanded(
            child: FreshListView(
                isNoDateMagin: false,
                loadData: loadData,
                isClear: isClear,
                onClear: (v) => isClear = v,
                drawWidget: drawItemWidget,
                nonDataWidget: Container(color: Theme.of(context).backgroundColor,child: MemberBettingBlank(parentContext: context, height: 300,needPop: true,)),
                loadingWidget: MemberBettingLoading(),
                loadingListCount: 3,
                divider: Container(height: 10.0, decoration: BoxDecoration(color: Theme.of(context).backgroundColor))),
          ),
        ],
      ),
    );
  }

  ///
  Widget drawItemWidget(ListResult listResult, int index){
    return SizedBox();
  }
}
