//**********************************************************************
//* author:Sam
//* date:2020-03-05
//**********************************************************************

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/migrate_plugins/flushbar/flushbar.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/base/panel_mixin.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_chatbar/live_chatbar.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/frequency_limit.dart';
import 'package:fast_ai/widgets/ai_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'live_hot_helper_common_expression.dart';
import 'live_hot_helper_emoji.dart';

//热词，表情包
class LiveHotHelper extends StatefulWidget {
  final HotHelperController controller;
  LiveHotHelper({@required this.controller, Key key}):super(key:key);
  @override
  LiveHotHelperState createState() => LiveHotHelperState();
}

class LiveHotHelperState extends State<LiveHotHelper>
    with TickerProviderStateMixin{
  TabController _tabController;
  AnimationController animationController;

  PageController pageController =new PageController();

  FrequencyLimit frequencyLimit = FrequencyLimit(gIntervalTime: 1000, syncLock: true);

  List<Widget> tabs = <Widget>[
    Tab(
      text: config.langMap['baseLang']['detail']['livePlayer']['commonExpression'],
    ),
    Tab(
      text: config.langMap['baseLang']['detail']['livePlayer']['emojiPackage'],
    ),
  ];

  Offset currentPosition;


  @override
  void initState() {
    animationController = new AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    this._tabController = new TabController(vsync: this, length: tabs.length);
    CurvedAnimation curvedAnimation  = new CurvedAnimation(parent: animationController, curve: Curves.easeInOut, reverseCurve: Curves.easeInOut);
    curvedAnimation.addListener((){
      setState(() {
        currentPosition = Offset(0,  MediaQuery.of(context).size.height/2+80 -(MediaQuery.of(context).size.height/2+80)*curvedAnimation.value);
      });
    });
    widget.controller.onPanel = onPanel;
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    widget.controller.onPanel = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.controller.toolPanel.bottomBar.model.screenDirection == ScreenDirection.TopDown) return Container();

    if(null == currentPosition){
      currentPosition =  Offset(0,MediaQuery.of(context).size.height/2+80);
    }
    return Container(
      width: 280,
      height: MediaQuery.of(context).size.height/2+80,
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: currentPosition,
            child: Container(
                padding: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: MediaQuery.of(context).size.height/2,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AiTabBar(
                            labelPadding: EdgeInsets.only(left: 10, right: 10),
                            labelColor: Colors.black,
                            indicatorColor: Colors.transparent,
                            unselectedLabelColor: Colors.black.withOpacity(0.5),
                            labelStyle: AiTextStyle(
                              fontSize: config.skin.fontSize.h5,

                            ),
                            unselectedLabelStyle: AiTextStyle(
                              fontSize: config.skin.fontSize.h5,
                              color: Colors.black.withOpacity(0.5),

                            ),
                            controller: _tabController,
                            onTap: (index){
                              pageController.jumpToPage(index);
                            },
                            tabs: tabs,
                            indicatorWeight: 2,
                            isScrollable: true,
                          ),
                          Expanded(
                            child:Container() ,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: _body(),
                    )
                  ],
                )),
          )
        ],
      )
    );
  }

  void onPanel(PanelActionModel action) {
    switch(action.type) {
      case PanelActionType.show : {
        show();
        break;
      }
      case PanelActionType.hide : {
        dismiss();
        break;
      }
      default : {
        break;
      }
    }
  }

  bool _isShow = false;
  void show(){
    _isShow = true;
    if(mounted && !animationController.isAnimating){
      animationController.forward();
    }
  }

  void dismiss(){

    if(mounted&& !animationController.isAnimating && _isShow){
      animationController.reverse();
    }
    _isShow = false;
  }


  Widget _body(){
    return PageView(
      controller: pageController,
      onPageChanged: (index){
        _tabController.index = index;
      },
      children: <Widget>[
        LiveHotHelperCommonExpression(onSelected: (expression){
          frequencyLimit.onTask(
            task: (){
              sendMessageInPanel(expression);
              dismiss();
            },
            taskDoFail: (){
              dismiss();
              Flushbar(
                title: config.langMap['baseLang']['hint'],
                message: config.langMap['baseLang']['detail']['chatroom']['timeSendLimitMessage'],
                duration: Duration(seconds: 1),
              ).show(context);
            }
          );

        }),
        LiveHotHelperEmoji(onEmojiSelectedListener: (s){
          frequencyLimit.onTask(
              task: (){
                sendMessageInPanel(s);
                dismiss();
              },
              taskDoFail: (){
                dismiss();
                Flushbar(
                  title: config.langMap['baseLang']['hint'],
                  message: config.langMap['baseLang']['detail']['chatroom']['timeSendLimitMessage'],
                  duration: Duration(seconds: 1),
                ).show(context);
              }
          );
        },),
      ],
    );
  }
}


