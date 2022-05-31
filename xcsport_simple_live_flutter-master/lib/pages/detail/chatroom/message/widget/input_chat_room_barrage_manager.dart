import 'package:fast_ai/performance/manager/logger_kit_manager.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/chat_user.dart';

///
/// 用户进入聊天室弹幕管理器
///
class InputChatRoomBarrageManager {
  static InputChatRoomBarrageManager _ins;

  InputChatRoomBarrageManager._();

  static InputChatRoomBarrageManager ins() {
    if (_ins == null) {
      return _ins = InputChatRoomBarrageManager._();
    }
    return _ins;
  }

  var _data = <ChatUser>[];

  /// 3秒后移除显示了才可再次添加
  void addData(ChatUser msg) {
    aiLog(tag: LogTag.inputChatUser, message: '新增 -> ${msg?.toString()}');
    if (_data == null) {
      _data = <ChatUser>[];
    }
    if(msg != null){
      final isHas = _data.where((element) => element.chatId == msg.chatId).length != 0;
      if(!isHas){
        _data.add(msg);
        notifyChange();
      }
    }
  }

  ///
  void removeData(ChatUser msg) {
    aiLog(tag: LogTag.inputChatUser, message: '移除 -> ${msg?.toString()}');
    _data.remove(msg);
    notifyChange();
  }

  ChatUser getFirst() {
    try {
      return _data.first;
    } catch (e) {
      return null;
    }
  }

  void clear() {
    _data?.clear();
  }

  var _barRangeChangeListener = <VoidCallback>[];

  void addBarRangeChangeListener(VoidCallback callback) {
    _barRangeChangeListener.add(callback);
  }

  void removeBarRangeChangeListener(VoidCallback callback) {
    _barRangeChangeListener.remove(callback);
  }

  void notifyChange() {
    if (_data != null && _data.length != 0) {
      _barRangeChangeListener.forEach((fun) => fun?.call());
    }
  }
}
