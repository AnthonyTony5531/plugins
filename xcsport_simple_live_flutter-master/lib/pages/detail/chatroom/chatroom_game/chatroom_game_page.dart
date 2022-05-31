import 'package:common_component/mvvm/view/stateful_view.dart';
import 'package:common_component/widget/sc_tabs.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/detail/chatroom/chatroom_game/chatroom_game_sub_page.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';

import 'chatroom_game_page_style.dart';
import 'chatroom_game_page_view_model.dart';

///
/// {notes}
///
class ChatroomGamePage extends StatefulView<ChatroomGamePageStyle, ChatroomGamePageViewModel> {
  final ChatroomGamePageViewModel model;
  final List<AiGameCellModel> games;
  final String roomNo;
  final String anchorId;
  final String selectGameKey;

  ChatroomGamePage({Key key,  this.model, this.games, this.roomNo, this.anchorId, this.selectGameKey}) : super(model: model, key: key);

  @override
  _ChatroomGamePageState createState() => _ChatroomGamePageState();
}

class _ChatroomGamePageState extends ViewState<ChatroomGamePageStyle, ChatroomGamePageViewModel, ChatroomGamePage> with TickerProviderStateMixin {
  ChatroomGamePageViewModel _viewModel;
  @override
  ChatroomGamePageViewModel get defaultModel {
    _viewModel ??= ChatroomGamePageViewModel();
    return _viewModel;
  }
  List<Widget> tabs = [];
  List<Widget> tabBarView = [];
  List<AiGameCellModel> gameList = [];
  TabController tabController;

  @override
  void initState() {
    gameList = widget.games;
    int index = 0;
    for(int i = 0; i < gameList.length; i ++){
      AiGameCellModel model = gameList[i];
      tabs.add(ScTab(text: model?.gameName ?? '',));
      tabBarView.add(
        Container(
          color: Color(0xFF0A2536),
          child: ChatroomGameSubPage(
            gameModel: model,
            roomNo: widget.roomNo,
            anchorId: widget.anchorId,
          )
        )
      );
      if(model.gameKey == widget.selectGameKey && !isStrNullOrEmpty(model.gameKey)){
        index = i;
      }
    }
    tabController = TabController(length: tabs.length, vsync: this, initialIndex: index);
    tabController.addListener(listener);
    super.initState();
  }

  @override
  void dispose (){
    tabController?.removeListener(listener);
    super.dispose();
  }

  void listener() {}

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A2536),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40.0,
                    child: ScTabBar(
                      isScrollable: true,
                      controller: tabController,
                      type: ScTabType.line,
                      unselectedLabelStyle: style.unselectedLabelStyle,
                      labelStyle: style.selectedLabelStyle,
                      labelColor: style.selectedLabelStyle.color,
                      tabAlignment: Alignment.center,
                      unselectedLabelColor:
                      style.unselectedLabelStyle.color,
                      tabs: tabs,
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              )
            ),
            Expanded(
                child: Container(
                  color: Color(0xFF0A2536),
                  child: TabBarView(
                      controller: tabController,
                      children: tabBarView,
//                      children: tabs.length == 2
//                          ? [
//                              Container(
//                                  color: Color(0xFF0A2536),
//                                  padding: EdgeInsets.only(left: 10, right: 10),
//                                  child: Show(
//                                      isShow: tabController?.index == 0,
//                                      child: ChatroomGameSubPage(
//                                        key: key1,
//                                        isShowGame: tabController?.index == 0,
//                                        gameModel: gameList?.first,
//                                        roomNo: widget.roomNo,
//                                        anchorId: widget.anchorId,
//                                      )
//                                  )
//                              ),
//                              MediaQuery.removePadding(
//                                context: context,
//                                removeTop: true,
//                                child: Container(
//                                    color: Color(0xFF0A2536),
//                                    child: Show(isShow: tabController?.index == 1,
//                                        child: ChatroomGameSubPage(
//                                          key: key2,
//                                          isShowGame: tabController?.index == 1,
//                                          gameModel: gameList?.last,
//                                          roomNo: widget.roomNo,
//                                          anchorId: widget.anchorId,
//                                        )
//                                    )
//                                ),
//                              ),
//                            ]
//                          : [
//                              Container(
//                                  color: Color(0xFF0A2536),
//                                  padding: EdgeInsets.only(left: 10, right: 10),
//                                  child: ChatroomGameSubPage(
//                                    key: key1,
//                                    isShowGame: tabController?.index == 0,
//                                    gameModel: gameList?.first,
//                                    roomNo: widget.roomNo,
//                                    anchorId: widget.anchorId,
//                                  )
//                              ),
//                            ]
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}