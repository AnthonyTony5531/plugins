import 'dart:async';

import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/protocols/chatroom/chatroom_history_list_protocol.dart';
import 'package:fast_ai/api/protocols/chatroom/room_info_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/module/common/util/date_util.dart';
import 'package:fast_ai/pages/detail/bottom_nav/share/default_msg_talk_lang.dart';
import 'package:fast_ai/pages/detail/chatroom/common/message_helper.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/ai_robot.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/chat_user.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/local_admin.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/message.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/input_chat_room_barrage_manager.dart';
import 'package:fast_ai/pages/detail/gift/gift_info_model.dart';
import 'package:fast_ai/pages/detail/gift/player/gift_play_server.dart';
import 'package:fast_ai/performance/manager/logger_kit_manager.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import 'package:fast_ai/utils/ai_json.dart';
//import 'package:fast_ai/utils/lang/lang_filed.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_client.dart';
import 'package:fast_ai/utils/xcstomp/xc_stomp_utils.dart';
import 'package:fast_ai/widgets/barrage/barrage_manager.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart' as _sync;

//聊天室bloc
class ChatRoomBloc {
  // 赛事播
  ChatRoomBloc({@required this.gidm, @required this.onMessage, @required this.systemId, @required this.updateReadCount, this.anchorId})
      : assert(gidm != null && gidm.isNotEmpty);
  // 自由播
  ChatRoomBloc.freeAnchor({@required this.liveId, @required this.onMessage, @required this.updateReadCount, this.anchorId,this.announcement})
      : assert(liveId != null);

  String gidm;
  String systemId;
  String anchorId;
  String liveId;      // 自由播房间号
  String announcement; // 后台配置消息公告
  final VoidCallback onMessage;
  final ValueChanged<int> updateReadCount;

  //会话消息模型数据控制
  ChatroomState state = ChatroomState.None;
  List<Message> _messages = [];
  List<Message> _historyMsg;

  static num bettingTotal = 0;
  static bool hasPermission2SendMessage = false;

  num bettingTotalObj = 0;
  bool hasPermission2SendMessageObj = false;
  bool hasNotBegun = false;

  String merChatId;
  int channelType;
  String roomSystemId = "";
  String roomNo = "";

  VoidCallback bindOnMessageCallback;
  VoidCallback bindOnLiveMessageCallback;
  VoidCallback bindOnFreeAnchorMessageCallback;
  ValueChanged<List<Message>> bindOnCallback;  // 详情竖屏大幕单独使用

  RoomInfoRspProtocol roomRsp;

  var _historyLock = _sync.Lock();

  /// 初始化时首先调用，或房间切换（如主播、视频源、动画播切换）时调用
  /// 切换时需要先设置anchorId再调用
  Future<RoomInfoRspProtocol> pullChatRoomMsg() async {
    setChatRoomWelcomeMsg();
    roomRsp = await pullChatRoomStatus();
    var statusMsg = _setChatRoomStatusMsg();
    int chatRoomStatusMsgLen = statusMsg?.length ?? 0;
    _messages.addAll(statusMsg ?? []);
    if (updateReadCount != null) {
      updateReadCount(chatRoomStatusMsgLen);
    }
    fireOnMessage();
    sleep(10, () async {
      var historyMsg = await pullHistoryMsg();
      int historyMsgLen = historyMsg?.length ?? 0;
//      print("historyMsg${historyMsg.length}");
      if (_messages.length > 2) {
        var list = <Message>[];
        list.addAll(_messages.sublist(0, 2));
        list.addAll(historyMsg ?? []);
        list.addAll(_messages.sublist(2));
        _messages = [];
        _messages.addAll(list);
      } else {
        _messages.addAll(historyMsg ?? []);
      }
      if (updateReadCount != null) {
        updateReadCount(historyMsgLen);
      }

      fireOnMessage();
    });

    return roomRsp;
  }

  /// 切换房间
  Future<RoomInfoRspProtocol> rePullChatRoomMsg({@required String newAnchorId}) async {
    //newAnchorId可以为null
    if (anchorId == newAnchorId) {
      return roomRsp;
    }
    anchorId = newAnchorId;
    _messages = [];
    _historyMsg = null;
    setChatRoomWelcomeMsg();
    return await pullChatRoomMsg();
  }

  ///优先使用新绑定的消息接收器
  int maxMsgTopLimit = 110;
  int maxMsgBottomLimit = 100;

  fireOnMessage() {
    if (_messages != null && _messages.length > maxMsgTopLimit) {
      List<Message> subMessages = [];
      int len = _messages.length;
      subMessages.addAll(_messages.sublist(0, 2));
      subMessages.addAll(_messages.sublist(len - (maxMsgBottomLimit - 2), len));

      _messages.clear();
      _messages.addAll(subMessages);
    }
    if (bindOnMessageCallback != null) {
      try {
        bindOnMessageCallback();
      } catch (e) {
        logError(e);
      }
    } else {
      if (onMessage != null) {
        try {
          onMessage();
        } catch (e) {
          logError(e);
        }
      }
    }
    bindOnCallback?.call(_messages);
    if (bindOnLiveMessageCallback != null) {
      try {
        bindOnLiveMessageCallback();
      } catch (e) {
        logError(e);
      }
    }
    if (bindOnFreeAnchorMessageCallback != null) {
      try {
        bindOnFreeAnchorMessageCallback();
      } catch (e) {
        logError(e);
      }
    }
  }

  bindOnMessage(VoidCallback onMessage) {
    this.bindOnMessageCallback = onMessage;
  }

  bindOnLiveMessage(VoidCallback onMessage) {
    this.bindOnLiveMessageCallback = onMessage;
  }

  bindOnFreeAnchorMessage(VoidCallback onMessage) {
    this.bindOnFreeAnchorMessageCallback = onMessage;
  }

  bindOnCallbackMessage(ValueChanged<List<Message>> onMessage) {
    this.bindOnCallback = onMessage;
  }

  List<Message> get messages {
    return _messages ?? [];
  }

  /// 拉取聊天室状态信息
  Future<RoomInfoRspProtocol> pullChatRoomStatus({bool isPullNewData = false}) async {
    var roomRsp = await IntoChatRoomStatus.ins
        .query(tag: "match_detail_bloc0", systemId: systemId, gidm: gidm, anchorId: anchorId, isPullNewData: isPullNewData, liveId: liveId);
    if (roomRsp.isSuccess) {
      bettingTotal = roomRsp?.bettingTotal;
      hasPermission2SendMessage = roomRsp?.hasPemission2sendMesage;
      bettingTotalObj = roomRsp?.bettingTotal ?? 0;
      hasPermission2SendMessageObj = roomRsp?.hasPemission2sendMesage;
      hasNotBegun = roomRsp?.hasNotBegun;
      channelType = roomRsp?.channelType;
      merChatId = await config.userInfo.loadMerchantId();
      roomSystemId = roomRsp?.systemId;
      roomNo = roomRsp?.roomNo;
      state = ChatroomState.Inited;
    } else {
      hasNotBegun = roomRsp?.hasNotBegun;
      state = ChatroomState.Locked;
    }
    fireOnMessage();
    return roomRsp;
  }

  /// 拉取聊天室状态信息
  List<Message> _setChatRoomStatusMsg() {
    List<Message> msgs = [];
    if (state == ChatroomState.Inited) {
      msgs.addAll(MessageHelper.convertString2Message(
        messageType: MessageType.system,
        chatUser: AiRobot(),
        messageBody: getChatroomMessage(code: roomRsp.code),
      ));
    } else {
      msgs.addAll(MessageHelper.convertString2Message(
        messageType: MessageType.system,
        chatUser: AiRobot(),
        messageBody: getChatroomMessage(code: roomRsp.code),
      ));
    }
    return msgs;
  }

  /// 拉取聊天室状态信息
  void setChatRoomWelcomeMsg() {
    List<Message> msgs = [];
    bool isHasAnnouncementMsg = announcement != null && announcement.length != 0;
    bool isLiveId = liveId !=null && liveId != 0;
    String message = config.langMap['baseLang']['detail']['chatroom']['welcomeMessage'];
    if(isHasAnnouncementMsg && isLiveId){
      message = announcement;
    }
    msgs.add(MessageHelper.convertString2Message(
      messageType: MessageType.localAdmin,
      chatUser: LocalAdmin(),
      messageBody: message,
    )[0]);
    _messages = [];
    _messages.addAll(msgs);
  }

  /// 拉取会话历史信息
  Future<List<Message>> pullHistoryMsg({String newAnchorId}) async {
    if (this.roomRsp == null) {
      this.roomRsp = await pullChatRoomStatus();
    }
    return _historyLock.synchronized(() async {
      var newRoomRsp =
          await IntoChatRoomStatus.ins.query(tag: "match_detail_bloc", systemId: systemId, gidm: gidm, anchorId: newAnchorId ?? anchorId, liveId: liveId);
      if (_historyMsg != null && roomSystemId == newRoomRsp.systemId && roomNo == newRoomRsp.roomNo) {
        return _historyMsg;
      }
      if (newRoomRsp.isSuccess) {
        var rsp = await ChatRoomHistoryListReqProtocol(roomNo: roomNo).request();
        _historyMsg = [];
        _historyMsg.addAll(rsp.histories);
      }
      return _historyMsg;
    });
  }

  void onSubscribe(Map<String, dynamic> message) async {
    List<dynamic> data = message['data'];
    String topic = message['topic'];
    if (!ChatRoomSubscribeTopicMgr.ins.hasTopic(roomNo, topic)) {
      XCStompClient.ins.unsubscribe(null, topic);
      return;
    }
    num action = message['action'];
    aiLog(tag: LogTag.pushMsg, message: '收到推送消息 action --> $action');
    if (action == 1026 || action == 10260) {
      int oldLen = _messages?.length ?? 0;
      data?.forEach((f) {
        var json = AiJson(f);
        aiLog(tag: LogTag.pushMsg, message: '收到推送消息 action(1026 | 10260) message --> $f');
        var playerId = json.getString("playerId");
        var giftImage = json.getString("giftImage");
        var roomNo = json.getString("roomNo");
        var headImg = json.getString("headImg");
        var nickName = json.getString("nickName");
        var level = json.getNum("level");
        var giftName = json.getString("giftName");
        var isGif = json.getNum("isGif");
        var buyTime = json.getString("buyTime") ?? '0';
        var merchantId = json.getString("merchantId");
        var price = json.getString("price") ?? '0';
        var pngImage = json.getString("pngImage");
        var buyCounts = json.getNum("buyCounts") ?? '1';
        var id = json.getString("id");
        var gidm = json.getString("gidm");
        var anchorName = json.getString('anchorName');
        var seasonLevel = json.getNum('seasonLevel');
        var seasonLevelName = json.getString('seasonLevelName');
        if (!giftImage.startsWith("http")) {
          if (giftImage.startsWith('/'))
            giftImage = "${Api.baseImgUrl}$giftImage";
          else
            giftImage = "${Api.baseImgUrl}/$giftImage";
        }
        // 不同聊天室都能收到消息
        if (action == 10260) {
          var giftInfoModel = GiftInfoModel(
              playerId: playerId,
              type: GiftType.gif,
              gif: giftImage,
              image: pngImage,
              isGif: isGif,
              pngImage: pngImage,
              giftImage: giftImage,
              nickName: nickName,
              giftName: giftName,
              count: buyCounts,
              msgTime: int.tryParse(buyTime),
              price: double.tryParse(price),
              anchorName: anchorName,
              seasonLevel: seasonLevel,
              seasonLevelName: seasonLevelName,
              headImg: headImg);
          GiftPlayServer.ins.addOverallGift(giftInfoModel);
          return;
        }
        if (playerId == config.userInfo.account.data.playerId) return;
        if (isGif == 1) {
          //gif
          GiftPlayServer.ins.addGift(GiftInfoModel(
            playerId: playerId,
            type: GiftType.gif,
            gif: giftImage,
            image: pngImage,
            isGif: isGif,
            pngImage: pngImage,
            giftImage: giftImage,
            nickName: nickName,
            giftName: giftName,
            count: buyCounts,
            msgTime: int.tryParse(buyTime),
            price: double.tryParse(price),
          ));
        } else {
          //svga
          GiftPlayServer.ins.addGift(GiftInfoModel(
            playerId: playerId,
            type: GiftType.svga,
            svga: giftImage,
            image: pngImage,
            isGif: isGif,
            pngImage: pngImage,
            giftImage: giftImage,
            nickName: nickName,
            giftName: giftName,
            count: buyCounts,
            msgTime: int.tryParse(buyTime),
            price: double.tryParse(price),
          ));
        }
        var chatUser = ChatUser(
          showName: nickName,
          chatId: playerId,
          headerUrl: headImg,
          level: level,
          playerType: json.getNum("playerType"),
        );
        _messages.addAll(
            MessageHelper.convertString2Message(chatUser: chatUser, createDate: json.getDate("createDate"), map: f, messageType: MessageType.gift));
      });

      int newLen = _messages?.length ?? 0;
      if (newLen > oldLen) {
        fireOnMessage();
      }
    } else if (action == 1011) {
      var tempMessages = <Map<String, dynamic>>[];
      int oldLen = _messages?.length ?? 0;
      await Future.forEach(data, (f) async {
        var json = AiJson(f);
        aiLog(tag: LogTag.pushMsg, message: '收到推送消息 action(1011) message --> $f');
        var playerId = json.getString("playerId");
        String headImage = json.getString("icon");
        String headerUrl = headImage;
        if (!headImage.startsWith('http')) {
          if (headImage.startsWith('/')) {
            headerUrl = "${Api.baseImgUrl}$headImage";
          } else {
            headerUrl = "${Api.baseImgUrl}/$headImage";
          }
        }
        String anchorId = json.getMap('extend')['anchorId'] ?? '';
        var chatUser = ChatUser(
            showName: json.getString("playerName"),
            chatId: playerId,
            headerUrl: headerUrl,
            playerType: json.getNum("playerType"),
            anchorId: anchorId,
            level: json.getNum("seasonLevel"));
        Map map = json.getArray("bettingData")[0];
        if (map != null) {
          map['walletId'] = json.getString("walletId");
        }
//        var langFiledMsgs = <LangFiled>[];
//        langFiledMsgs.add(LangFiled.from(
//          gidm: map["gidm"],
//          systemId: map["systemId"],
//          leagueShortName: map["leagueShortName"],
//          leagueName: map["leagueName"],
//          homeTeam: map["homeTeam"],
//          awayTeam: map["awayTeam"],
//        ));
//        map["leagueShortLangName"] = langFiledMsgs[0].leagueShortName;
//        map["leagueName"] = langFiledMsgs[0].leagueName;
//        map["homeTeam"] = langFiledMsgs[0].homeTeam;
//        map["awayTeam"] = langFiledMsgs[0].awayTeam;

        _messages.addAll(MessageHelper.convertString2Message(
            chatUser: chatUser,
            createDate: json.getDate("createDate"),
            messageBody: msgTalkLang(json.getString("talkMsg")),
            map: map,
            messageType: MessageType.shareBet));
      });
      int newLen = _messages?.length ?? 0;
      if (newLen > oldLen) {
        fireOnMessage();
      }

//      data?.forEach((f) {
//        var json = AiJson(f);
//        aiLog(LogTag.pushMsg,'大神注单分享 ===> $f');
//        var playerId = json.getString("playerId");
//        String headImage = json.getString("icon");
//        String headerUrl = headImage;
//        if (!headImage.startsWith('http')) {
//          if (headImage.startsWith('/')) {
//            headerUrl = "${Api.baseImgUrl}$headImage";
//          } else {
//            headerUrl = "${Api.baseImgUrl}/$headImage";
//          }
//        }
//        String anchorId = json.getMap('extend')['anchorId'] ?? '';
//        var chatUser = ChatUser(
//            showName: json.getString("playerName"),
//            chatId: playerId,
//            headerUrl: headerUrl,
//            playerType: json.getNum("playerType"),
//            anchorId: anchorId,
//            level: json.getNum("seasonLevel")
//        );
//        Map map = json.getArray("bettingData")[0];
//        if(map != null){
//          map['walletId'] = json.getString("walletId");
//        }
//        tempMessages.add({
//          "map": map,
//          "chatUser": chatUser,
//          "createDate": json.getDate("createDate"),
//          "messageBody": msgTalkLang(json.getString("talkMsg")),
//          "messageType": MessageType.shareBet,
//        });
//        //_messages.addAll();
//      });
//      var langFiledMsgs = <LangFiled>[];
//      tempMessages.forEach((element) {
//        langFiledMsgs.add(LangFiled.from(
//          gidm: element["map"]["gidm"],
//          systemId: element["map"]["systemId"],
//          leagueShortName: element["map"]["leagueShortName"],
//          leagueName: element["map"]["leagueName"],
//          homeTeam: element["map"]["homeTeam"],
//          awayTeam: element["map"]["awayTeam"],
//        ));
//      });
//      Future.delayed(Duration(microseconds: 1),() async {
//        await AiLangHandler.getLangFiledInfo(langFiledMsgs);
//        var msgs = <Message>[];
//        tempMessages.forEach((element) {
//          var lang = langFiledMsgs.firstWhere((la) => la.gidm == element["map"]["gidm"],orElse: ()=>null);
//          if(lang != null){
//            element["map"]["awayTeam"] = lang.awayTeam;
//            element["map"]["homeTeam"] = lang.homeTeam;
//            element["map"]["leagueName"] = lang.leagueName;
//            element["map"]["leagueShortName"] = lang.leagueShortName;
//            //element["map"][""] =
//          }
//          msgs.addAll(MessageHelper.convertString2Message(
//            chatUser: element["chatUser"] as ChatUser,
//            createDate: new AiJson(element).getDate("createDate"),
//            messageBody: element["messageBody"],
//            map: element["map"],
//            messageType: element['messageType'],
//          ));
//        });
//        int oldLen = _messages?.length ?? 0;
//        _messages.addAll(msgs);
//        int newLen = _messages?.length ?? 0;
//        if (newLen > oldLen) {
//          fireOnMessage();
//        }
//      });
    } else {
      int oldLen = _messages?.length ?? 0;
      data?.forEach((f) {
        var json = AiJson(f);
        aiLog(tag: LogTag.pushMsg, message: '收到推送消息 message contentType --> $f');
        var contentType = json.getString("contentType");
        var showName;
        if (contentType == "2003") {
          showName = json.getString("fromNickName");
        } else {
          showName = json.getString("nickName");
        }

        //过滤掉自己的消息
        var playerId = json.getString("playerId");
        //if (playerId == config.userInfo.account.data.playerId) return;
        if (contentType == "2003") {
          playerId = json.getString("fromPlayerId");
        }
        String headImage = json.getString("headImg");
        String headerUrl = headImage;
        if (!headImage.startsWith('http')) {
          if (headImage.startsWith('/')) {
            headerUrl = "${Api.baseImgUrl}$headImage";
          } else {
            headerUrl = "${Api.baseImgUrl}/$headImage";
          }
        }
        String anchorId = json.getMap('extend')['anchorId'] ?? '';
        var chatUser = ChatUser(
          showName: showName,
          chatId: playerId,
          headerUrl: headerUrl,
          playerType: json.getNum("playerType"),
          anchorId: anchorId,
          level: json.getNum("seasonLevel"),
        );

        var type;
        if (contentType == "2002") {
          type = MessageType.enterChatRoom;
        } else if (contentType == "2003") {
          type = MessageType.likeBetOrder;
        } else {
          type = MessageType.conversation_chatroom;
        }

        var map;
        if (contentType == "2003") {
          map = f;
        }

        if (contentType == "2002") {
          if (AiCache.get().getBool(AiCache.gift_play_mode_config) == true &&
              type == MessageType.enterChatRoom &&
              playerId != config.userInfo.account.data.playerId) {
          } else {
            AiJson extendJson = AiJson(json.getMap('extend'));
            // 消息频道
            final msgChannelType = extendJson.getNum('channelType', defaultValue: 0);
            // 如果当前app是世界频道,则取世界的排行榜
            if (config.merchantChannel == 1) {
              chatUser.rankType = extendJson.getNum('specialTypeWord', defaultValue: 0);
              chatUser.rankIndex = extendJson.getNum('specialCountWord', defaultValue: 0);
              chatUser.rankAnimationImg = extendJson.getString('speciaspecialUrllCountWord', defaultValue: "");
            } else {
              // 商户排行榜
              chatUser.rankType = extendJson.getNum('specialType', defaultValue: 0);
              chatUser.rankIndex = extendJson.getNum('specialCount', defaultValue: 0);
              chatUser.rankAnimationImg = extendJson.getString('speciaspecialUrllCount', defaultValue: "");
            }
            InputChatRoomBarrageManager.ins().addData(chatUser);
          }
        } else {
           if (string(message['topic']).contains('/topic/anchor')) {
            _messages.addAll(MessageHelper.convertString2Message(
              chatUser: chatUser,
              createDate: json.getDate("createDate"),
              messageBody: json.getString("content"),
              messageType: type,
              contentType: contentType,
              map: map,
            ));
            return;
          }
          // BUG-25043：1.自己分享的注单不显示点赞图标 2.点赞别人注单要显示点赞消息
          if (contentType != "2003" && playerId == config.userInfo.account.data.playerId) return;
//          if (playerId == config.userInfo.account.data.playerId) return;
          _messages.addAll(MessageHelper.convertString2Message(
            chatUser: chatUser,
            createDate: json.getDate("createDate"),
            messageBody: json.getString("content"),
            messageType: type,
            contentType: contentType,
            map: map,
          ));
        }
      });
      int newLen = _messages?.length ?? 0;
      if (newLen > oldLen) {
        fireOnMessage();
      }
    }
  }

  void onOwnSubscribe(String content) {
    var chatUser = ChatUser(
        showName: config.userInfo.account.data.nickName,
        chatId: config.userInfo.account.data.playerId,
        headerUrl: config.userInfo.account.data.headImg,
        level: roomRsp.level);
    _messages.addAll(MessageHelper.convertString2Message(
      chatUser: chatUser,
      createDate: DateTime.now().toString(),
      messageBody: content,
      messageType: MessageType.conversation_chatroom,
    ));
    fireOnMessage();
  }

  void onOwnGiftSubscribe(
    GiftInfoModel giftInfoModel,
  ) {
    var chatUser = ChatUser(
        showName: config.userInfo.account.data.nickName,
        chatId: config.userInfo.account.data.playerId,
        headerUrl: config.userInfo.account.data.headImg,
        level: roomRsp.level);
    _messages.addAll(MessageHelper.convertString2Message(
      chatUser: chatUser,
      createDate: DateTime.now().toString(),
      map: giftInfoModel.toMap(),
      messageType: MessageType.gift,
    ));
    fireOnMessage();
  }

  void addOwnMessageToBarrage(String content) {
    var chatUser = ChatUser(
        showName: config.userInfo.account.data.nickName,
        chatId: config.userInfo.account.data.playerId,
        headerUrl: config.userInfo.account.data.headImg,
        level: roomRsp.level);
    var convertString2BarrageData = MessageHelper.convertString2BarrageData(
      chatUser: chatUser,
      createDate: DateTime.now().toString(),
      messageBody: content,
      messageType: MessageType.conversation_chatroom,
    );
    BarrageManager.get().addAllRanderData(convertString2BarrageData);
  }

  //发送群聊消息
  void sendRoomMessage(BuildContext context, {String content}) async {
    if (null == content) {
      return;
    }

    var chatUser = ChatUser(
        showName: config.userInfo.account.data.nickName,
        chatId: config.userInfo.account.data.playerId,
        headerUrl: config.userInfo.headImg,
        anchorId: config.userInfo.account.data.anchorId,
        level: roomRsp.level);
    addOwnMessageToBarrage(content);
    _messages.addAll(MessageHelper.convertString2Message(
      chatUser: chatUser,
      createDate: DateTime.now().toString(),
      messageBody: content,
      messageType: MessageType.conversation_chatroom,
    ));
    fireOnMessage();
    XCStompClient.ins.sendMessage(
        "/chat/sendMsg",
        XCStompUtils.buildStompJson({
          'token': config?.userInfo?.token ?? "1",
          'msgType': '1',
          'roomNo': roomNo,
          'content': content,
          'playerId': config.userInfo.account.data.playerId,
        }));
  }
}

// 聊天消息
String createChatTopicId({@required String roomNo, @required int channelType}) {
  channelType = config.merchantChannel != 0 ? config.merchantChannel : channelType;
  String merchantId = config?.merchantAppConfig?.merchantId ?? '';
  if (merchantId.isEmpty) {
    merchantId = config?.userInfo?.account?.data?.merchantId;
  }
  if (channelType != 1) {
    return "/topic/1/$merchantId/$roomNo";
  } else {
    return "/topic/1/$roomNo";
  }
}

// 多语言聊天消息
String createChatLangTopicId({@required String roomNo, @required int channelType}) {
  channelType = config.merchantChannel != 0 ? config.merchantChannel : channelType;
  String merchantId = config?.merchantAppConfig?.merchantId ?? '';
  if (merchantId.isEmpty) {
    merchantId = config?.userInfo?.account?.data?.merchantId;
  }
  String dateStr = DateUtil.getCurrentYearMonthDay();
  return "/topic/1/$merchantId/$roomNo/$dateStr/${Translations.langCode}";
}

String createGiftTopicId({@required String roomNo, @required int channelType}) {
  channelType = config.merchantChannel != 0 ? config.merchantChannel : channelType;
  String merchantId = config?.merchantAppConfig?.merchantId ?? '';
  if (merchantId.isEmpty) {
    merchantId = config?.userInfo?.account?.data?.merchantId;
  }
  if (channelType != 1) {
    return "/topic/gift/$merchantId/$roomNo/";
  } else {
    return "/topic/gift/$roomNo/";
  }
}

// 不同直播间也可以收到大于100元的礼物消息
String createOverallGiftTopicId({@required int channelType}) {
  channelType = config.merchantChannel != 0 ? config.merchantChannel : channelType;
  String merchantId = config?.merchantAppConfig?.merchantId ?? '';
  if (merchantId.isEmpty) {
    merchantId = config?.userInfo?.account?.data?.merchantId;
  }
  if (channelType != 1) {
    return "/topic/gift/$merchantId/2/";
  } else {
    return "/topic/gift/2/";
  }
}

//用户进入聊天室消息
String createIntoChatRoomTopicId({@required String roomNo, @required int channelType}) {
  channelType = config.merchantChannel != 0 ? config.merchantChannel : channelType;
  String merchantId = config?.merchantAppConfig?.merchantId ?? '';
  if (merchantId.isEmpty) {
    merchantId = config?.userInfo?.account?.data?.merchantId;
  }
  if (channelType != 1) {
    return "/topic/intoRoom/$merchantId/$roomNo";
  } else {
    return "/topic/intoRoom/$roomNo";
  }
}

//聊天室注单点赞消息
String createLikeTopicId({@required String roomNo, @required int channelType}) {
  channelType = config.merchantChannel != 0 ? config.merchantChannel : channelType;
  String merchantId = config?.merchantAppConfig?.merchantId ?? '';
  if (merchantId.isEmpty) {
    merchantId = config?.userInfo?.account?.data?.merchantId;
  }
  if (channelType != 1) {
    return "/topic/like/$merchantId/$roomNo";
  } else {
    return "/topic/like/$roomNo";
  }
}

String createAnchorRoom({@required String roomNo, @required String anchorType}) {
  //config.userInfo.account.data.merchantId
  String merchantId = config?.merchantAppConfig?.merchantId ?? '';
  if (merchantId.isEmpty) {
    merchantId = config?.userInfo?.account?.data?.merchantId;
  }
  if (anchorType == RoomInfoRspProtocol.AnchorTypeMerchant) {
    return "/topic/anchor/$merchantId/$roomNo/";
  }
  return "/topic/anchor/$roomNo/";
}

//大神注单分享
String createBetShareTopicId({String gidm, String roomNo}) {
  //return "/topic/order/share/$gidm/";
  String merchantId = config?.merchantAppConfig?.merchantId ?? '';
  if (merchantId.isEmpty) {
    merchantId = config?.userInfo?.account?.data?.merchantId;
  }
  if (config.merchantChannel == 2) {
    return "/topic/order/share/$merchantId/$roomNo/";
  }
  return "/topic/order/share/$roomNo/";
}

//主播强制下线
String createAnchorOfflineTopicId({String gidm, String roomNo}) {
  //return "/topic/order/share/$gidm/";
  return "/topic/anchor/offline/$roomNo/";
}

//主播注单分享
String createAnchorBetShareTopicId({String gidm, String anchorId, String roomNo}) {
  //return "/topic/order/share/$gidm/$anchorId/";
  String merchantId = config?.merchantAppConfig?.merchantId ?? '';
  if (merchantId.isEmpty) {
    merchantId = config?.userInfo?.account?.data?.merchantId;
  }
  if (config.merchantChannel == 2) {
    return "/topic/order/share/$merchantId/$roomNo/";
  }
  return "/topic/order/share/$roomNo/";
}

//主播注单分享被跟投
String createAnchorBetShareFollowTopicId({String roomNo}) {
  //return "/topic/order/follow/$systemId/$anchorId/";
  String merchantId = config?.merchantAppConfig?.merchantId ?? '';
  if (merchantId.isEmpty) {
    merchantId = config?.userInfo?.account?.data?.merchantId;
  }
  if (config.merchantChannel == 2) {
    return "/topic/order/follow/$merchantId/$roomNo/";
  }
  return "/topic/order/follow/$roomNo/";
}

//自由播游戏弹窗
String createFreeAnchorGameTopicId({String roomNo}) {
  return "/topic/anchor/gamePopup/$roomNo/";
}

//开关盘订阅
String createDetailHandicapTopicId(String gidm) {
  return "/topic/swChange/detail/$gidm/";
}

//游戏订阅通知
String createGameNotifyTopicId(){
  return "/topic/minigame/";
}

enum ChatroomState {
  None,
  Locked,
  Inited,
}

Map get chatroomMessage => {
      202: config.langMap['baseLang']['detail']['chatroom']['chatroomMessage']["202"],
      203: config.langMap['baseLang']['detail']['chatroom']['chatroomMessage']["203"],
      204: config.langMap['baseLang']['detail']['chatroom']['chatroomMessage']["204"],
      200: config.langMap['baseLang']['detail']['chatroom']['chatroomMessage']["200"],
    };

String getChatroomMessage({int code}) {
  return string(chatroomMessage[code], defaultVal: config.langMap['baseLang']['detail']['chatroom']['chatroomMessage']["default"]);
}

///
/// 聊天室主题订阅管理
///
class ChatRoomSubscribeTopicMgr {
  ChatRoomSubscribeTopicMgr._();

  static ChatRoomSubscribeTopicMgr ins = ChatRoomSubscribeTopicMgr._();

  //key:roomNo,value:topics
  var roomSubscribeTopicMap = Map<String, Set<String>>();

  void saveTopic(String roomNo, String topic) {
    if (!roomSubscribeTopicMap.containsKey(roomNo)) {
      roomSubscribeTopicMap[roomNo] = Set<String>();
    }
    roomSubscribeTopicMap[roomNo].add(topic);
    print("roomNo:$roomNo   len:${roomSubscribeTopicMap?.length ?? 0}     topic:$topic    ");
  }

  bool hasTopic(String roomNo, String topic) {
    if (roomSubscribeTopicMap.containsKey(roomNo)) {
      return roomSubscribeTopicMap[roomNo]?.contains(topic) ?? false;
    }
    return false;
  }

  void clearTopic(String roomNo) {
    if (roomSubscribeTopicMap.containsKey(roomNo)) {
      roomSubscribeTopicMap.remove(roomNo);
    }
    print("roomNo:$roomNo    len:${roomSubscribeTopicMap?.length ?? 0}");
  }
}

class IntoChatRoomStatus {
  static IntoChatRoomStatus ins = IntoChatRoomStatus._();

  IntoChatRoomStatus._();

  var _autoChangeLock = _sync.Lock();

  RoomInfoRspProtocol roomRsp;

  String _systemId;
  String _gidm;
  String _anchorId;

  Set<dynamic> dislikeOrderIds = Set<dynamic>();
  Set<dynamic> likeOrderIds = Set<dynamic>();

  Future<RoomInfoRspProtocol> query({String tag, String systemId, String gidm, String anchorId, bool isPullNewData = false, String liveId}) async {
    return await queryStream(tag: tag, systemId: systemId, gidm: gidm, anchorId: anchorId, isPullNewData: isPullNewData, liveId: liveId).last;
  }

  Stream<RoomInfoRspProtocol> queryStream({String tag, String systemId, String gidm, String anchorId, bool isPullNewData = false, String liveId}) {
    StreamController<RoomInfoRspProtocol> streamController = StreamController<RoomInfoRspProtocol>();
    sleep(10, () async {
      await _autoChangeLock.synchronized(() async {
        if (isPullNewData) {
          roomRsp = await RoomInfoReqProtocol(systemId: systemId, gidm: gidm, anchorId: anchorId, liveId: liveId).request();
          streamController?.add(roomRsp);
          streamController?.close();
        } else {
          print("tag:$tag   systemId:$systemId    gidm:$gidm     anchorId:$anchorId");
          if (systemId != _systemId || gidm != _gidm || anchorId != _anchorId) {
            reset();
            _init(systemId: systemId, gidm: gidm, anchorId: anchorId);
          } else {
            if (roomRsp != null) {
              streamController.add(roomRsp);
              streamController.close();
              return;
            }
          }
          try {
            print("tag:$tag   systemId:$systemId    gidm:$gidm     anchorId:$anchorId>>>>>>>>>>>>>>>request");
            roomRsp = await RoomInfoReqProtocol(systemId: systemId, gidm: gidm, anchorId: anchorId, liveId: liveId).request();
            if (roomRsp != null) {
              Event.eventBus.fire(ChatRoomOpenStatus(isOpen: roomRsp.isSuccess));
            }
            dislikeOrderIds = roomRsp?.dislikeOrderIds?.toSet();
            likeOrderIds = roomRsp?.likeOrderIds?.toSet();
            streamController?.add(roomRsp);
            streamController?.close();
          } catch (e) {
            streamController?.addError(e);
            streamController?.close();
            print(e);
          }
        }
      });
    });

    return streamController.stream;
  }

  void _init({
    String systemId,
    String gidm,
    String anchorId,
  }) {
    roomRsp = null;
    _systemId = systemId;
    _gidm = gidm;
    _anchorId = anchorId;
    dislikeOrderIds = Set<dynamic>();
    likeOrderIds = Set<dynamic>();
  }

  void reset() {
    roomRsp = null;
    _systemId = null;
    _gidm = null;
    _anchorId = null;
    dislikeOrderIds = Set<dynamic>();
    likeOrderIds = Set<dynamic>();
  }
}

class ChatRoomBlocFactory {
  static ChatRoomBlocFactory ins = ChatRoomBlocFactory._();

  ChatRoomBlocFactory._();

  var _lock = _sync.Lock();

  int cacheBlocKey;
  ChatRoomBloc cacheBloc;
  StreamSubscription<ChatMessageEvent> chatMessageStreamSubscription;

  ///
  /// bloc缓存不与anchorId绑定关系，在一个比赛中多个主播或无主播切换，可修改bloc内部的
  /// anchorId，不重新创建bloc
  ///
  Future<ChatRoomBloc> getBloc({String gidm, String systemId, String anchorId, VoidCallback onMessage, ValueChanged<int> updateReadCount, String liveId,String announcement}) {
    return _lock.synchronized(() async {
      int key = '$gidm _ $systemId'.hashCode;
      if (cacheBlocKey == key && cacheBloc != null) {
        return cacheBloc;
      }
      clear();
      var bloc;
      // 自由播
      if(liveId != null){
        bloc = ChatRoomBloc.freeAnchor(
          liveId: liveId,
          anchorId: anchorId,
          onMessage: onMessage,
          updateReadCount: updateReadCount,
          announcement: announcement,
        );
      }
      // 赛事播
      else{
        bloc = ChatRoomBloc(
          gidm: gidm,
          systemId: systemId,
          anchorId: anchorId,
          onMessage: onMessage,
          updateReadCount: updateReadCount,
        );
      }
      cacheBloc = bloc;
      cacheBlocKey = key;
      aiLog(tag: LogTag.progress, message: '新增了聊天室消息监听');
      chatMessageStreamSubscription = Event.eventBus.on<ChatMessageEvent>().listen((event) {
        aiLog(tag: LogTag.pushMsg, message: '收到推送消息 ${event.comeFrom}');
        bloc.onSubscribe(event.data);
      });

      bloc.pullChatRoomMsg();
      bloc.pullHistoryMsg(newAnchorId: anchorId);
      return cacheBloc;
    });
  }

  ///
  void clear() {
    aiLog(tag: LogTag.progress, message: '移除了聊天室消息监听');
    chatMessageStreamSubscription?.cancel();
    chatMessageStreamSubscription = null;
    cacheBloc?.bindOnMessage(() {});
    cacheBloc?.bindOnLiveMessage(() {});
    cacheBloc?.bindOnFreeAnchorMessage(() { });
    cacheBlocKey = null;
    cacheBloc = null;
  }
}
