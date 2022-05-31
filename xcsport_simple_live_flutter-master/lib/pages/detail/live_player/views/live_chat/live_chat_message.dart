import 'dart:async';

import 'package:fast_ai/api/protocols/chatroom/room_info_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/extend_model.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/chatroom_bloc.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/conversation/chat_conversation_widget_factory.dart';
import 'package:fast_ai/pages/detail/detail_container/match_detail_container.dart';
import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'package:fast_ai/utils/xcstomp/xc_subcribecallback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveChatMessage extends StatefulWidget {

  final MatchDetailController swiperController;
  final ExtendModel extendModel;
  final MatchesDetailModel matchesDetailModel;
  final ToolPanelController toolPanelController;
  final DetailParams detailParams;
  LiveChatMessage({
    Key key,
    this.extendModel,
    this.matchesDetailModel,
    this.toolPanelController,
    this.swiperController,
    this.detailParams,
  }) : super(key: key);

  @override
  _LiveChatMessageState createState() => _LiveChatMessageState();
}

class _LiveChatMessageState extends State<LiveChatMessage> {

  final ScrollController controller = ScrollController();
  StreamSubscription<LiveChatMessageEvent> liveChatMessageEvent;
  StreamSubscription<DetailOrientationEvent> detailOrientationEvent;
  StreamSubscription<FreeAnchorEntryDetailEvent> freeAnchorEntryDetailEvent;
  StreamSubscription<RefreshFreeAnchorEvent> refreshFreeAnchorEvent;

  List<Message> messages = [];
  String anchorId = '';
  String showType = '';
  bool isHiddenMessage = false;
  double contentViewWidth = 150.0;
  String defaultAnchorId = 'live99909';
  String _topicLang;
  String _topic;
  String _anchorTopic;
  String roomNo;
  int filtersMsgNum = 0;
  int msgNum = 0;
  bool isFirstScroll = true;
  bool get isFreeAnchor => widget.detailParams?.isFreeAnchor ?? false;
  bool get isFreeAnchorListChatRoom => widget.detailParams?.isFreeAnchorListChatRoom ?? false; //自由播列表聊天室


  //聊天室开放状态
  ChatRoomOpenStatus chatRoomOpenStatus = ChatRoomOpenStatus();

  @override
  void initState() {
    initData();
    super.initState();
  }
  
  @override
  void dispose() {
    destroy();
    ChatRoomBlocFactory.ins?.cacheBloc?.bindOnCallbackMessage(null);
    super.dispose();
  }

  void initData(){
//    if(widget.isFreeAnchorListEntry){
      // 自由播
      if(isFreeAnchor){
        anchorId = widget.detailParams?.anchorId;
        if (isStrNullOrEmpty(anchorId)) {
          anchorId = defaultAnchorId;
        }
      }
      // 赛事播
      else {
        showType = widget?.extendModel?.data?.showType ?? '';
        String liveAnchorId = widget?.toolPanelController?.anchorSelectorFull?.model?.currentAnchor?.vid ?? '';
        anchorId = widget?.extendModel?.data?.anchorId ?? '';
        if (isStrNullOrEmpty(anchorId)) {
          anchorId = liveAnchorId;
        }
        if(isStrNullOrEmpty(anchorId)){
          anchorId = widget.detailParams.anchorId;
        }
        if(isStrNullOrEmpty(anchorId)){
          anchorId = defaultAnchorId;
        }
      }
      if(isFreeAnchorListChatRoom){
        bindEntryDetailEvent();
        loadData();
      }
      else{
        if(ChatRoomBlocFactory.ins.cacheBloc != null){
          List<Message> datas = ChatRoomBlocFactory.ins.cacheBloc.messages;
          onDetailMessage(datas);
          ChatRoomBlocFactory.ins.cacheBloc.bindOnCallbackMessage(onDetailMessage);
        }
      }
//    }
//    else{
//      widget?.swiperController?.addListener(() {
//        isHiddenMessage = false;
//        if(widget.swiperController?.index != 0){
//          isHiddenMessage = true;
//        }
//        if(!isHiddenMessage){
//          scrollListToBottom();
//        }
//        if(mounted)setState(() {});
//      });
//      bindEvent();
//    }
  }

  void destroy(){
    if(!isFreeAnchorListChatRoom) return;
      unbindEvent();
    unbindEntryDetailEvent();
    messages.clear();
//    if(widget.isFreeAnchorListEntry){
      unsubscribeChatMessages();
      IntoChatRoomStatus?.ins?.reset();
      ChatRoomBlocFactory?.ins?.clear();
      bloc = null;
//    }
  }
  
  @override
  Widget build(BuildContext context) {

    // 检查直播视频是否切换
    checkLiveStatus();
    if(messages.isEmpty){
      return SizedBox.shrink();
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          widget?.swiperController?.move(1);
        },
        child: Offstage(
          offstage: isHiddenMessage,
          child: Container(
            child: Stack(
              children: [
                  ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    itemCount: messages?.length ?? 0,
                    itemBuilder: (BuildContext itemContext, int index) {
                      if (index < messages.length) {
                        var message = messages[index];
                        var msgWidget = ChatConversationWidgetFactory.create(
                            message,
                            contentViewWidth,
                            anchorId,
                            isLiveMessage: isFreeAnchor ? false : true,
                            isFreeAnchorListMessage: isFreeAnchor,
                            isShowLeftMessage: DetailPage.currentPageIsDetailPage
                        );
                        if(index == messages.length - 1){
                          return Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            child: msgWidget,
                          );
                        }
                        return msgWidget;
                      } else {
                        return Container();
                      }
                    },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 检查主播列表直播是否有切换
  void checkLiveStatus() {
//    if(widget.isFreeAnchorListEntry){
      String bufferAnchorId = '';
      // 自由播
      if(isFreeAnchor){
        bufferAnchorId = widget.detailParams?.anchorId;
      }
      // 赛事播
      else{
        showType = widget?.extendModel?.data?.showType ?? '';
        String liveAnchorId = widget?.toolPanelController?.anchorSelectorFull?.model?.currentAnchor?.vid ?? '';
        bufferAnchorId = widget?.extendModel?.data?.anchorId ?? '';
        if(isStrNullOrEmpty(bufferAnchorId)){
          bufferAnchorId = liveAnchorId;
        }
      }
      if(!isStrNullOrEmpty(bufferAnchorId) && bufferAnchorId != anchorId){
        anchorId = bufferAnchorId;
        if(isFreeAnchorListChatRoom){
          destroy();
          Future.delayed(Duration(milliseconds: 300),(){
            initData();
          });
        }
      }
//    }
  }

  var bloc;
  void loadData() async{
    var roomRsp;
    String anchorId = widget.detailParams?.anchorId;
    String liveId = widget.detailParams?.liveId;
    if(isFreeAnchor){
      roomRsp = await IntoChatRoomStatus.ins.query(
          tag: "live_chat_message",
          anchorId: anchorId,
          liveId: liveId);
      bloc = await ChatRoomBlocFactory.ins.getBloc(
        anchorId: anchorId,
        liveId: liveId
      );
    }
    else{
      String systemId = widget?.matchesDetailModel?.data?.systemId ?? '';
      String liveAnchorId = anchorId != defaultAnchorId ? anchorId : '';
      String gidm = widget?.matchesDetailModel?.data?.gidm ?? '';
      roomRsp = await IntoChatRoomStatus.ins.query(
          tag: "live_chat_message",
          systemId: systemId,
          gidm: gidm,
          anchorId: liveAnchorId);
      bloc = await ChatRoomBlocFactory.ins.getBloc(
        gidm: gidm,
        systemId: systemId,
        anchorId: liveAnchorId,
      );
    }
    bloc?.bindOnFreeAnchorMessage(onMessage);
    resubscribeChatRoom(roomRsp);
    Future.delayed(Duration(seconds: 1), () {
      onMessage();
    });
    if(mounted)setState(() {});
  }

  void resubscribeChatRoom(RoomInfoRspProtocol roomRsp) {
    chatRoomOpenStatus = ChatRoomOpenStatus(isOpen: roomRsp.isSuccess);
    roomNo = roomRsp.roomNo;
    config.userInfo.chatRoomNo = roomRsp.roomNo;
    // 聊天室聊天内容订阅
    String topic = createChatTopicId(
      roomNo: roomRsp.roomNo,
      channelType: roomRsp.channelType,
    );
    if (_topic != topic) {
      XCStompClient.ins.unsubscribe(XCStompAction.Chat, _topic);
      _topic = topic;
      XCStompClient.ins.subscribe(XCStompAction.Chat, _topic, _onSubscribe2);
      ChatRoomSubscribeTopicMgr.ins.saveTopic(roomNo, _topic);
    }
    // 多语言聊天室聊天内容订阅
    String topicLang = createChatLangTopicId(
      roomNo: roomRsp.roomNo,
      channelType: roomRsp.channelType,
    );
    if (_topicLang != topicLang) {
      XCStompClient.ins.unsubscribe(XCStompAction.Chat, _topicLang);
      _topicLang = topicLang;
      XCStompClient.ins.subscribe(XCStompAction.Chat, _topicLang, _onLangSubscribe);
      ChatRoomSubscribeTopicMgr.ins.saveTopic(roomNo, _topicLang);
    }
    // 主播发言
    String anchorTopic = createAnchorRoom(
      roomNo: roomRsp.roomNo,
      anchorType: roomRsp.anchorType,
    );
    if (_anchorTopic != anchorTopic) {
      XCStompClient.ins.unsubscribe(XCStompAction.Chat, _anchorTopic);
      _anchorTopic = anchorTopic;
      XCStompClient.ins.subscribe(XCStompAction.Chat, _anchorTopic, _onSubscribe);
      ChatRoomSubscribeTopicMgr.ins.saveTopic(roomNo, _anchorTopic);
    }
  }

  void _onSubscribe2(Map<String, dynamic> message) {
    _onSubscribe(message);
  }

  void _onLangSubscribe(Map<String, dynamic> message) {
    _onSubscribe(message);
  }

  //弹幕接收器
  void _onSubscribe(Map<String, dynamic> message) {
//    if (this.isVirtual) return;
    if (!chatRoomOpenStatus.isOpen) return;
    Event.eventBus.fire(ChatMessageEvent(message,comeFrom: 'live_chat_message 266 _onSubscribe' ));
  }

  //取消订阅弹幕
  void unsubscribeChatMessages() async {
    ChatRoomSubscribeTopicMgr?.ins?.clearTopic(roomNo);
    XCStompClient?.ins?.unsubscribe(XCStompAction.Chat, _topic);
    XCStompClient?.ins?.unsubscribe(XCStompAction.Chat, _topicLang);
    XCStompClient?.ins?.unsubscribe(XCStompAction.Chat, _anchorTopic);
    _topic = null;
    _topicLang = null;
    _anchorTopic = null;
  }

  void bindEvent(){
    // 聊天消息
    liveChatMessageEvent = Event.eventBus.on<LiveChatMessageEvent>().listen(chatMessage);
    // 横竖屏
    detailOrientationEvent = Event.eventBus.on<DetailOrientationEvent>().listen((event) {
      Orientation orientation = event.orientation;
        isHiddenMessage = orientation == Orientation.landscape;
        if (mounted) setState(() {});
    });
  }

  void bindEntryDetailEvent(){
    // 主播列表进详情
    freeAnchorEntryDetailEvent = Event.eventBus.on<FreeAnchorEntryDetailEvent>().listen(freeAnchorEntryDetail);
    refreshFreeAnchorEvent = Event.eventBus.on<RefreshFreeAnchorEvent>().listen(refreshFreeAnchor);
  }

  void refreshFreeAnchor(event){
    if(event is RefreshFreeAnchorEvent){
      String gidmEvent = event.gidm;
      String liveAnchorId = widget?.toolPanelController?.anchorSelectorFull?.model?.currentAnchor?.vid ?? '';
      if((!isStrNullOrEmpty(liveAnchorId) && anchorId != liveAnchorId) ||
          (!isStrNullOrEmpty(gidmEvent) && gidmEvent != widget?.matchesDetailModel?.data?.gidm)){
        destroy();
        Future.delayed(Duration(milliseconds: 300),(){
          initData();
        });
      }

    }
  }

  void unbindEntryDetailEvent() {
    freeAnchorEntryDetailEvent?.cancel();
    refreshFreeAnchorEvent?.cancel();
  }

  void unbindEvent(){
    liveChatMessageEvent?.cancel();
    detailOrientationEvent?.cancel();
  }

  void onMessage() {
    // 投注页显示聊天消息
    if (bloc != null && (bloc?.messages ?? []).isNotEmpty) {
      receiveChatRoomMessage(bloc?.messages);
      Future.delayed(Duration(milliseconds: 20),(){
        scrollListToBottom();
      });
    }
  }

  void onDetailMessage(List<Message> datas) {
    receiveChatRoomMessage(datas);
    Future.delayed(Duration(milliseconds: 20),(){
      scrollListToBottom();
    });
  }

  void chatMessage(event){
    if(event is LiveChatMessageEvent){
      var list = event.messages ?? [];
      receiveChatRoomMessage(list);
    }
//    scrollListToBottom();
    Future.delayed(Duration(milliseconds: 20),(){
      scrollListToBottom();
    });
  }

  void freeAnchorEntryDetail(event){
    if(event is FreeAnchorEntryDetailEvent){
      unbindEvent();
//      if(widget.isFreeAnchorListEntry){
        unsubscribeChatMessages();
        IntoChatRoomStatus?.ins?.reset();
//      }
    }
  }

  void receiveChatRoomMessage(List<Message> list){
    var filters = list?.where((element) => element?.messageType == MessageType.conversation_chatroom && element?.messageBody?.messageBodyType == MessageBodyType.text)?.toList() ?? [];
    filtersMsgNum = filters.length;
    msgNum = messages.length;
    if(filtersMsgNum == msgNum){
      return;
    }
    if(filters != null && filters.isNotEmpty){
      messages.clear();
      messages.addAll(filters);
      if(mounted)setState(() {});
    }
  }

  void scrollListToBottom() async{

    double maxHeight =  controller.position.maxScrollExtent ?? 0.0;
    double screenHeight = MediaQuery.of(context).size.height;
    if(messages.isEmpty)return;
    if(isFirstScroll){
      isFirstScroll = false;
      if(maxHeight > screenHeight){
        maxHeight = maxHeight - screenHeight;
      }
    }
    controller.animateTo(maxHeight, duration: Duration(milliseconds: 200), curve: Curves.bounceInOut);
  }
}
